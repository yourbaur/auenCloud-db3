//
//  PlaylistViewController.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import UIKit
import AVFoundation
import Kingfisher

class MusicPlayerViewController: UIViewController {
    
    //    MARK: - Properties

    var player:AVPlayer?
    var playerItem:AVPlayerItem?
    var url: URL?
    var position: Int
    var selectedTimerIndex = -1
    var recordList: [Record]
    var timerTest : Timer?


    var secs = Int()
    var fullsec = Int()

    lazy var musicImageView: MusicImageView = {
        let view = MusicImageView()
        view.getToFavourite = {
            self.getToFavourite(id: self.recordList[self.position].id)
        }
        
        return view
    }()
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        button.tintColor = .mainColor
        button.imageView?.contentMode = .scaleAspectFit

        return button
    }()
    lazy var musicTitleView = MusicTitleView()
    lazy var soundSliderView = SoundSliderView()
    lazy var controllView = PlayerControllView()
    lazy var volumeView: UISlider = {
        let slider = UISlider()
        let circleImage = ViewMaker.shared.makeCircleWith(size: CGSize(width: 16, height: 16),
                                         backgroundColor: .mainColor)

        
        slider.maximumTrackTintColor = #colorLiteral(red: 0.973, green: 0.98, blue: 0.988, alpha: 1)
        slider.maximumValue = 100
        slider.value = 100
        slider.thumbTintColor = .mainColor
        slider.setThumbImage(circleImage, for: .normal)
        slider.setThumbImage(circleImage, for: .highlighted)
        slider.maximumValueImage = #imageLiteral(resourceName: "up_volume")
        slider.minimumValueImage = #imageLiteral(resourceName: "down_volume")
        slider.layer.cornerRadius = 3
        slider.layer.masksToBounds = true
        slider.minimumTrackTintColor = .mainColor
        player?.volume = slider.value/100.0

        return slider
    }()
    lazy var sleepTimerView = SleepTimerView()
    
//    MARK: - Initialization
    
    init(recordList: [Record], position: Int) {
        self.recordList = recordList
        self.position = position
        super.init(nibName: nil, bundle: nil)
        setupRecord(record: recordList[position])
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        player?.volume = 1.0
        setupView()
        setupActions()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        playerConfiguration()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopPlayer()
        stopTimerTest()
        self.hideLoader()

    }
    

    //    MARK: - Setup functions
    
    private func setupView() -> Void {
       
        view.addSubview(sleepTimerView)
        sleepTimerView.snp.makeConstraints { (make) in
            make.bottom.lessThanOrEqualTo(-10.0)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            //            make.height.equalTo(48)
        }
        view.addSubview(volumeView)
        volumeView.snp.makeConstraints { (make) in
            make.bottom.equalTo(sleepTimerView.snp.top).offset(-28)
            make.left.equalTo(25)
            make.right.equalTo(-25)
            //            make.height.equalTo(48)
        }
        view.addSubview(controllView)
        controllView.snp.makeConstraints { (make) in
            make.bottom.equalTo(volumeView.snp.top).offset(-28)
            make.left.right.equalTo(volumeView)
            //            make.height.equalTo(48)
        }
        view.addSubview(soundSliderView)
        soundSliderView.snp.makeConstraints { (make) in
            make.bottom.equalTo(controllView.snp.top).offset(-28)
            make.left.right.equalTo(volumeView)
        }
        
        view.addSubview(musicTitleView)
        musicTitleView.snp.makeConstraints { (make) in
            make.bottom.equalTo(soundSliderView.snp.top).offset(-21)
            make.left.right.equalTo(volumeView)

        }
        musicImageView.layer.masksToBounds = true
        view.addSubview(musicImageView)
        musicImageView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(15)//UIViewController.navBarHeight+UIViewController().getStatusBarFrame().height)
            make.bottom.equalTo(musicTitleView.snp.top).offset(-15)
        }
        
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.top.equalTo(musicImageView)
            make.height.width.equalTo(40)//UIViewController.navBarHeight+UIViewController().getStatusBarFrame().height)
        }
    }
    
    private func setupActions() -> Void {
        self.controllView.playView.addTarget(self, action: #selector(playAction), for: .touchUpInside)
        self.volumeView.addTarget(self, action: #selector(volumeChangeAction(sender:)), for: .touchUpInside)
        self.soundSliderView.sliderView.addTarget(self, action: #selector(musicTimeChangeAction(sender:)), for: .touchUpInside)
        self.controllView.fifteenToBack.addTarget(self, action: #selector(changeToFifteen(sender:)), for: .touchUpInside)
        self.controllView.fifteenToFwrd.addTarget(self, action: #selector(changeToFifteen(sender:)), for: .touchUpInside)
        self.controllView.toNext.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
        self.controllView.toPrevious.addTarget(self, action: #selector(previousAction), for: .touchUpInside)
        self.sleepTimerView.fiveMinButton.button.addTarget(self, action: #selector(getTimer(sender:)), for: .touchUpInside)
        self.sleepTimerView.fifteenMinButton.button.addTarget(self, action: #selector(getTimer(sender:)), for: .touchUpInside)
        self.sleepTimerView.thirtyMinButton.button.addTarget(self, action: #selector(getTimer(sender:)), for: .touchUpInside)
        self.sleepTimerView.sixtyMinButton.button.addTarget(self, action: #selector(getTimer(sender:)), for: .touchUpInside)
        self.closeButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
    }
    
    //    MARK: - Simple functions

    private func stopPlayer() -> Void {
        player?.pause()
        self.player?.seek(to: CMTime.zero)
        controllView.playView.setImage(#imageLiteral(resourceName: "play"), for: .normal)
    }
    
    private func setupRecord(record: Record) -> Void {
        if let url = record.url {
            self.url = url.serverUrlString.url
        }
        self.musicTitleView.titleLabel.text = record.title
        try! AVAudioSession.sharedInstance().setCategory(.playback, options: [])
        player = nil
        self.showLoader()
        playerConfiguration()
        player!.play()
        controllView.playView.setImage(#imageLiteral(resourceName: "pause-symbol"), for: .normal)
        controllView.playView.tintColor = .mainColor

//        player?.play()
        if let image = recordList[position].image {
            musicImageView.musicImage.kf.setImage(with: image.serverUrlString.url)
        }
        
//        self.musicImageView.saveImageView.actionImage.image = record.in_favourite! ? #imageLiteral(resourceName: "favselect") : #imageLiteral(resourceName: "save")

    }
    
    private func playerConfiguration() -> Void {
        playerItem = AVPlayerItem(url: url!)
        player = AVPlayer(playerItem: playerItem)
        self.showLoader()
        self.player?.addPeriodicTimeObserver(forInterval: CMTimeMakeWithSeconds(1, preferredTimescale: 1), queue: DispatchQueue.main, using: { (time) in
            if self.player!.currentItem?.status == .readyToPlay {
                self.hideLoader()
                let currentTime = CMTimeGetSeconds(self.player!.currentTime())
                let fullTime = CMTimeGetSeconds(self.player!.currentItem!.duration)
                
                self.secs = Int(currentTime)
                self.fullsec = Int(fullTime)
                self.soundSliderView.currentTime.text = String(format: "%02d:%02d", self.secs/60, self.secs%60)
                self.soundSliderView.sliderView.value = Float(self.secs*100/self.fullsec)
                self.soundSliderView.fullTime.text = String(format: "%02d:%02d", self.fullsec/60, self.fullsec%60)
                if self.secs == self.fullsec {
                    self.player?.seek(to: CMTime.zero)
                    self.player?.play()
                }
            }
        })

    }
    func getToFavourite(id: Int) -> Void {
        
    }

    func stopTimerTest() {
      timerTest?.invalidate()
      timerTest = nil
    }

    func getTimerButtonList() -> [UIButton] {
        let timerButtonList = [sleepTimerView.fiveMinButton.button, sleepTimerView.fifteenMinButton.button, sleepTimerView.thirtyMinButton.button, sleepTimerView.sixtyMinButton.button]
        
        return timerButtonList

    }
    //    MARK: - Objc functions
    
    @objc func dismissAction() -> Void {
        self.dismiss(animated: true) {
            self.hideLoader()
        }
    }

    @objc func playAction() -> Void {
        
        if player?.rate == 0 {
            player!.play()
            self.showLoader()
            controllView.playView.setImage(#imageLiteral(resourceName: "pause-symbol"), for: .normal)
            controllView.playView.tintColor = .mainColor
        } else {
            player!.pause()
            self.hideLoader()
            controllView.playView.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        }
    }
    
    @objc func volumeChangeAction(sender: UISlider) -> Void {
        player?.volume = sender.value/100.0
    }
    
    @objc func musicTimeChangeAction(sender: UISlider) -> Void {
        let myTime = CMTime(seconds: Double(Int(sender.value)*fullsec/100), preferredTimescale: 60000)

        player?.seek(to: myTime, toleranceBefore: .zero, toleranceAfter: .zero)

    }
    
    @objc func changeToFifteen(sender: UIButton) -> Void {
        let myTime = CMTime(seconds: Double(secs+(sender.tag == 0 ? (-15) : 15)), preferredTimescale: 60000)
        player?.seek(to: myTime, toleranceBefore: .zero, toleranceAfter: .zero)
    }
    
    @objc func nextAction() -> Void {
        if position < recordList.count - 1 {
            position += 1
            setupRecord(record: recordList[position])

        }
    }
    
    @objc func previousAction() -> Void {
        if position > 0 {
            position -= 1
            setupRecord(record: recordList[position])

        }

    }
    
    @objc func getTimer(sender: UIButton) -> Void {
        stopTimerTest()
        guard selectedTimerIndex != sender.tag else {
            stopTimerTest()
            selectedTimerIndex = -1
            for button in getTimerButtonList() {
                button.setTitleColor(#colorLiteral(red: 0.478, green: 0.694, blue: 0.863, alpha: 1), for: .normal)
                button.backgroundColor = .clear
            }
            
            return
        }
        guard timerTest == nil else { return }
        let timeList = [5, 15, 30, 60]
        selectedTimerIndex = sender.tag
        timerTest = Timer.scheduledTimer(timeInterval: TimeInterval(timeList[sender.tag]*60), target: self, selector: #selector(updateTimer), userInfo: nil, repeats: false)

    }
    
    @objc func updateTimer() -> Void {
        stopPlayer()
        selectedTimerIndex = -1
        for button in getTimerButtonList() {
            button.setTitleColor(#colorLiteral(red: 0.478, green: 0.694, blue: 0.863, alpha: 1), for: .normal)
            button.backgroundColor = .clear
        }
    }
}
