//
//  Extensions.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit
import SVProgressHUD

enum AlertMessageType: String {
    case error = "Ошибка"
    case none = "Внимание"
}


extension UIViewController {
    func showErrorMessage(messageType: AlertMessageType, _ message: String, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: messageType.rawValue, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                if let completionHandler = completion {
                    self.dismiss(animated: true, completion: nil)
                    completionHandler()
                }
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    func hideLoader() {
        SVProgressHUD.dismiss()
    }
    func showLoader() {
        SVProgressHUD.setBorderColor(.mainColor)
        SVProgressHUD.setBorderWidth(0.8)
        SVProgressHUD.setForegroundColor(.mainColor)
        SVProgressHUD.setRingThickness(3)
        SVProgressHUD.show()
    }
    static let navBarHeight = UINavigationController().navigationBar.bounds.height
//    static let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
//    static let statusBarFrame = UIApplication.shared.statusBarFrame
    
    func addSubview(_ view: UIView) -> Void {
        self.view.addSubview(view)
    }

    
    func getStatusBarFrame() -> CGRect {
        var statusBarFrame: CGRect
        
        if #available(iOS 13.0, *) {
             statusBarFrame = UIApplication.shared.keyWindow!.windowScene?.statusBarManager?.statusBarFrame ?? .zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }

        return statusBarFrame
    }
    
    func inNavigation() -> UIViewController {
        return UINavigationController(rootViewController: self)
    }

    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    

    func showErrorMessage(_ message: String) {
        SVProgressHUD.showError(withStatus: message)
    }
    
    func showSuccess(_ message: String? = nil) {
        SVProgressHUD.showSuccess(withStatus: message)
        SVProgressHUD.dismiss(withDelay: 1)
        
    }

    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    func showAlertWithAction(title: String, message: String, completion: @escaping (()->())) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let cancelAction = UIAlertAction(title: "Назад", style: .cancel, handler: nil)
        let yesAction = UIAlertAction(title: "Да", style: .destructive) { (action) in
            completion()
        }
        
        alert.addAction(cancelAction)
        alert.addAction(yesAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }

    func showErrorAlert(title: String, message: String, completion: @escaping(() -> ())) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let cancelAction = UIAlertAction(title: "Назад", style: .cancel) { (action) in
            completion()
        }
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }

    func setNavigationBarTransparent(title: String?, shadowImage: Bool) -> Void {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = .blue
        if !shadowImage {
            self.navigationController?.navigationBar.shadowImage = UIImage()
        }
        if title == nil {
            self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "Лого"))
            self.navigationItem.titleView?.contentMode = .scaleAspectFill
        } else {
            self.navigationController?.title = title
        }
        
        //        self.navigationController?.navigationBar.
    }

    func getShare(url: String) -> UIActivityViewController {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        UIGraphicsEndImageContext()
        
        let objectsToShare = [url] as [Any]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)

        //Excluded Activities
        activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
        //

        return activityVC
    }
    func presentOnRoot(`with` viewController : UIViewController){
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            self.present(navigationController, animated: false, completion: nil)
    }

    
    
}

//MARK: - UIColor
extension UIColor {
    static let mainColor = #colorLiteral(red: 0.5808190107, green: 0.0884276256, blue: 0.3186392188, alpha: 1)
    static let anotherWhite = #colorLiteral(red: 0.1254901961, green: 0.05490196078, blue: 0.1960784314, alpha: 0.04963077911)
    static let notMainColor = #colorLiteral(red: 0.1254901961, green: 0.05490196078, blue: 0.1960784314, alpha: 0.04963077911)
    static let inputViewColor = #colorLiteral(red: 0.4784313725, green: 0.6941176471, blue: 0.862745098, alpha: 1)
    static let darkColor = #colorLiteral(red: 0.1176470588, green: 0.1568627451, blue: 0.262745098, alpha: 1)
    static let anotherBlue = #colorLiteral(red: 0.631372549, green: 0.7215686275, blue: 0.8117647059, alpha: 1)
    static let lightColor = #colorLiteral(red: 0.6470588235, green: 0.662745098, blue: 0.7058823529, alpha: 1)
    static let lineColor = #colorLiteral(red: 0.8431372549, green: 0.8470588235, blue: 0.8509803922, alpha: 1)
    static let backColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8195881623)
    
}


extension UIView {
    func round(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: radians)
        self.transform = rotation
    }
    func addSubviews(views: [UIView]) -> Void {
        views.forEach({addSubview($0)})
    }
}
//MARK: - String

extension String {
    var serverUrlString: String {
        return "http://185.20.227.109" + self
    }
    
    var url: URL {
        return URL(string: self)!
    }
    
    func setData(for dateType: String, isArticle: Bool = false) -> String {
        let date = DateFormatConfiguration.shared.dateStringSplit(date: String(self.prefix(10)))
        let monthIndex = DateFormatConfiguration.shared.getMonthIndex(index: date[1])
        let monthString = DateFormatConfiguration.shared.getMonthInShortString(index: monthIndex)
        let time = isArticle ? self.setTimeTerm() : ""
        
        return "\(dateType) \(date[2]) \(monthString) \(date[0]) \(time)"
    }
    
    func setDataTerm(isArticle: Bool = false) -> String {
        let date = DateFormatConfiguration.shared.dateStringSplit(date: String(self.prefix(10)))
        let monthIndex = DateFormatConfiguration.shared.getMonthIndex(index: date[1])
        let monthString = DateFormatConfiguration.shared.getMonthInShortString(index: monthIndex)
        let time = isArticle ? self.setTimeTerm() : ""

        return "\(date[2]) \(monthString) \(date[0]) \(time)"
    }

    func setTimeTerm() -> String {
        let timeString = self.prefix(16)
        let time = timeString.suffix(5)
        
        return String(time)
    }
    
    func getByType() -> (day: String, month: String, year: String) {
        let date = DateFormatConfiguration.shared.dateStringSplit(date: String(self.prefix(10)))
        return ("\(date[2])", "\(date[1])", "\(date[0])")
    }

    
    var hexColor: UIColor {
        let hex = trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            return .clear
        }
        return UIColor(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }


}
