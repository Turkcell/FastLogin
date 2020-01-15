# FastLogin
 
FastLogin provides integration to Turkcell login  systems. We have developed an SDK that is highly robust, secure, lightweight, configurable and very simple to embed.
 
The FastLogin IOS SDK is compatible with IOS 9.0 and above. Swift 5.0 and above
 
## Getting Started
 
### Installation
 
Add to your pod file following
 
```ruby
pod 'FastLogin', :git => 'https://github.com/Turkcell/FastLogin.git', :branch => 'v2.0'
```

#### Login Coordinator
 
Before starting the Login process you should provide following parameters,
 
-appID: Application id which assigned to each app by FastLogin admin
 
-language: Language of SDK default is TR
 
-environment: using DGEnvironment test, prp or prod servers
 
-disableCellLogin: if true, cellular login functionality won’t work.
 
-autoLoginOnly: if true, only cellular login and remember me will work
 
-disableAutoLogin: if true, login process is forced to user.
 
-accessGroup: Keychain access group of applications if any,
 
 
```swift
class ViewController: UIViewController {
    // Setup Login Coordinator
    var loginCoordinator: DGLoginCoordinator!
 
    private func setupLoginCoordinator() {
        loginCoordinator = DGLoginCoordinator(self)
        loginCoordinator.appID = "APP_ID"
        loginCoordinator.language = "TR"
        loginCoordinator.environment = DGEnvironment.test
        loginCoordinator.disableCell = false
        loginCoordinator.autoLoginOnly = false
        loginCoordinator.disableAutoLogin = false
        loginCoordinator.coordinatorDelegate = self
    }
 
    ...
}
```
 
Afterwards call start on the coordinator. That's it!
```swift
    private func start() {
        loginCoordinator.start(dgFlow: DGFlow.login)
    }
```
 
### Login Coordinator Delegate
 
Login Coordinator Delegate methods to handle what happens after the user tries to login,
 
Here you would call your own API.
 
```swift
extension ViewController: LoginCoordinatorDelegate {
    func dgLoginToken(_ token: String) {
        print("TOKEN \(token)")
    }
   
    func dgLoginFailure(_ reason: String, errorMessage: String) {
        if reason == dgKSessionTimeout as String {
            print(errorMessage)
        } else if reason == dgKUserExit as String {
            print(errorMessage)
        } else if reason == dgKNotLoginToLoginSDK as String {
            print(errorMessage)
        } else {
            print(errorMessage)
        }
    }
   
    func dgConfigurationFailure(configError: String) {
       
    }
}
```
 
### Logout
 
You can call the logout() method to logout from SDK.
```swift
    private func logOut() {
        loginCoordinator.logout()
    }
```