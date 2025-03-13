//
//  SettingsView.swift
//  Youverify
//
//  Created by Daniel Jermaine on 13/03/2025.
//



import SwiftUI
import FirebaseAuth



struct SettingsView: View {
    @AppStorage("onboarding") var isonBoardingViewActive:Bool = true
   
    @AppStorage("UserName") var userName = "Username"
    @AppStorage("Twitter") var twitterHandle = "@TwitterHandle"
    @AppStorage("email") var eMailAdress = "user@domain.com"
    @AppStorage("Location") var location = "Location"
    @State private var  signoutToggle = false
    @State private var newUserName = ""
    @State private var newTwitterHandle = ""
    @State private var newEMail = ""
    @State private var newlocation = ""
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var showAlertView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Update user information:").font(.title2)
                HStack {
                    TextField("Username", text: $newUserName).textFieldStyle(.roundedBorder)
                    Button("Save") {
                        if newUserName.isEmpty == false {
                            userName = newUserName
                            newUserName = ""
                        }
                    }.buttonStyle(.bordered)
                }
                HStack {
                    TextField("Twitter", text: $newTwitterHandle).textFieldStyle(.roundedBorder)
                    Button("Save") {
                        if newTwitterHandle.isEmpty == false {
                            twitterHandle = newTwitterHandle
                            newTwitterHandle = ""
                        }
                    }.buttonStyle(.bordered)
                }
                HStack {
                    TextField("E-Mail", text: $newEMail).textFieldStyle(.roundedBorder).textInputAutocapitalization(.never)
                    Button("Save") {
                        if newEMail.isEmpty == false {
                            eMailAdress = newEMail
                            newEMail = ""
                        }
                    }.buttonStyle(.bordered)
                }
                HStack {
                    TextField("Loaction", text: $newlocation ).textFieldStyle(.roundedBorder).textInputAutocapitalization(.never)
                    Button("Save") {
                        if location.isEmpty == false {
                            location  =  newlocation
                            newlocation = ""
                        }
                    }.buttonStyle(.bordered)
                }
                
            }
            .alert(isPresented: $showAlertView) {
                Alert(title: Text(alertTitle),message:Text (alertMessage), dismissButton: .cancel())
            }
            .fullScreenCover(isPresented: $signoutToggle, content: {
               SignInView()
            })
            .navigationTitle(Text("Profile"))
            .toolbar {
                
                Button {
                    if  isonBoardingViewActive == false {
                    signout { sucess in
                        if  sucess  {
                     UserDefaults.standard.set(nil, forKey: "email")
                            
                        signoutToggle.toggle()
                        }else{
                            self.alertTitle = "Uh-oh!"
                            self.alertMessage = ("error signout")
                            self.showAlertView.toggle()
                            isonBoardingViewActive = true
                            return
                        }
                    }
                    }else {
                        signoutToggle.toggle()
                    }
                    
                    
                }label:{
                    Text("signout")
                }
            }
        }
    }
     func signout( completion: @escaping (Bool)-> Void ){
        
        do {
            try  Auth.auth().signOut()
            completion(true)
        }catch{
            completion(false)
        }
        
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
