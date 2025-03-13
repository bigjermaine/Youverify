//
//  SignInView.swift
//  Youverify
//
//  Created by Daniel Jermaine on 13/03/2025.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignInView: View {
    @AppStorage("onboarding") var isonBoardingViewActive:Bool = true
    @State var username:String = ""
    @State private var showAlertView: Bool = false
    @State var password:String = ""
    @State var email:String = ""
    @State var signupToggle:Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
 
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack(spacing:40) {
                    HStack{
                        Text("Sign In")
                            .font(.system(size: 50))
                            .foregroundStyle(
                                LinearGradient(colors: [.pink,.purple,.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                    }
                    Spacer()
                    VStack(spacing:40) {
                        HStack{
                            Image(systemName: "person.badge.key")
                            TextField("Email", text:$email)
                        }
                        .foregroundColor(.black)
                        .modifier(TextFieldModifier())
                        
                        HStack{
                            Image(systemName: "key")
                            TextField("Password", text:$password)
                        }
                        .foregroundColor(.black)
                        .modifier(TextFieldModifier())
                        Button("Sign in") {
                            self.signin()
                        }
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .frame(width: 150,height: 50)
                        .background(Color.purple)
                        .cornerRadius(8)
                        
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing:20){
                        Button{
                            self.forgotpassword()
                        }label:{
                            Text("password recovery")
                        }
                        Button{
                            signupToggle = true
                        }label:{
                            Text("Dont have an account can still go right in 🍰")
                            
                        }
                        
                    }
                    .frame(maxWidth:.infinity,alignment: .topLeading)
                    .padding(.leading)
                    
                }
                
                
            }
            .toolbar {
                ToolbarItem(placement:.automatic) {
                    NavigationLink("\(Image(systemName: "folder.fill.badge.person.crop"))", destination: SignUpView()).font(.title2)
                }
                
            }
            
            .alert(isPresented: $showAlertView) {
                Alert(title: Text(alertTitle),message:Text (alertMessage), dismissButton: .cancel())
            }
            .fullScreenCover(isPresented: $signupToggle, content: {
                TabBar()
                
            })
            
            
        }
    }
      func signin() {
 
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            guard error == nil else {
                
                alertTitle = "Uh-oh!"
                alertMessage = (error!.localizedDescription)
                showAlertView.toggle()
                return
            }
            UserDefaults.standard.set(email, forKey: "email")
                    
               isonBoardingViewActive = false
                signupToggle = true
                print("User signed up!")
            }
        
    }
    func forgotpassword() {
        
        Auth.auth().sendPasswordReset(withEmail:email) { error in
        guard error == nil else {
            alertTitle = "Uh-oh!"
            alertMessage = (error!.localizedDescription)
            showAlertView.toggle()
            return
        }
        alertTitle = "passwordsent"
        alertMessage =  "check your email box"
        showAlertView.toggle()
      }
    }
    
}

struct SignupScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
