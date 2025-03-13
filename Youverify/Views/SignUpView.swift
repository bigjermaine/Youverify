//
//  SignUpView.swift
//  Youverify
//
//  Created by Daniel Jermaine on 13/03/2025.
//



import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @AppStorage("onboarding") var isonBoardingViewActive:Bool = true
   
    @State var username:String = ""
    @State var password:String = ""
    @State var email:String = ""
    @State private var showAlertView: Bool = false
    @State private var signupToggle: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
   
         
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack(spacing:40) {
                  HStack{
                  Text("Sign Up")
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
                        .modifier(TextFieldModifier())
                        .foregroundColor(.black)
                        HStack{
                            Image(systemName: "key")
                            TextField("Password", text:$password)
                        }
                        .foregroundColor(.black)
                        .modifier(TextFieldModifier())
                        Button("Sign up") {
                            self.signup()
                        }
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .frame(width: 150,height: 50)
                        .background(Color.purple)
                        .cornerRadius(8)
                        
                     }
                     Spacer()
                    }
                  }
              .toolbar {
                ToolbarItem(placement:.automatic) {
                  NavigationLink("\(Image(systemName: "person.fill.checkmark"))", destination: SignInView()).font(.title2)
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
    func signup() {
     
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                guard error == nil else {
                    self.alertTitle = "Uh-oh!"
                    self.alertMessage = (error!.localizedDescription)
                    self.showAlertView.toggle()
                    return
                    
                }
                isonBoardingViewActive = false
                print("User signed up!")
                signupToggle = true
                UserDefaults.standard.set(email, forKey: "email")
            }
       
        }
        }
             
    


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
