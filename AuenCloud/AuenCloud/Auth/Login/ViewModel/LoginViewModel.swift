//
//  LoginViewModel.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation

class LoginViewModel: DefaultViewModelOutput {
    
    var error: Observable<String> = Observable("")
    var loading: Observable<Bool> = Observable(false)
    var profile: Observable<Rows?> = Observable(nil)
    var success : Observable<Int?> = Observable(nil)
    
   

    
    func getProfileData() {
        loading.value = true
        ParseManager.shared.getMethod(with: "songs") { (result: Rows?, error) in

            self.loading.value = false
            if let error = error {
                self.error.value = error
                return
            }
            guard let profile = result else { return }
            self.profile.value = profile
        }


        
        }
}
