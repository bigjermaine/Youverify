//
//  ProfileView.swift
//  Youverify
//
//  Created by Daniel Jermaine on 13/03/2025.
//



import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @AppStorage("onboarding") var isonBoardingViewActive:Bool = true
    @AppStorage("UserName") var userName = "Username"
    @AppStorage("Twitter") var twitterHandle = "twitterHandle"
    @AppStorage("email") var eMailAdress = "user@domain.com"
    @AppStorage("Location") var location = "Location"
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var showAlertView: Bool = false
    @State private var  signoutToggle = false
    @State private var updateUserIsPresented = false
    
    var body: some View {
        NavigationView{
        List{
            VStack(alignment:.center){
                Button {
                    updateUserIsPresented = true
                    
                } label: {
                    Image(systemName:"person.circle.fill")
                          .font(.system(size: 50))
                }
            }.popover(isPresented: $updateUserIsPresented) {
              SettingsView()
            }
            .frame(maxWidth:.infinity, maxHeight:50,alignment:.center)
           
            HStack {
                Text("Name:")
                Spacer()
                Text("\(userName)")
            }
            HStack {
                Text("Twitter:")
                Spacer()
                Text("@\(twitterHandle)")
            }
            HStack {
                Text("E-Mail:")
                Spacer()
                Text("\(eMailAdress)")
            }
            HStack {
                Text("Location")
                Spacer()
                Text(("\(location)"))
            }
 
        }.navigationBarTitle("Profile")
        .fullScreenCover(isPresented: $signoutToggle, content: {
                   SignInView()
                })
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                VStack {
                    Text("(Tap the icon at the top to update your information)").font(.footnote)
                }
            }
            
        }
        .alert(isPresented: $showAlertView) {
            Alert(title: Text(alertTitle),message:Text (alertMessage), dismissButton: .cancel())
        }
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

    struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
