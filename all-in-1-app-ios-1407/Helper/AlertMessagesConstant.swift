/**
*
*@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
*@author     : Shiv Charan Panjeta < shiv@toxsl.com >
*
* All Rights Reserved.
* Proprietary and confidential :  All information contained herein is, and remains
* the property of ToXSL Technologies Pvt. Ltd. and its partners.
* Unauthorized copying of this file, via any medium is strictly prohibited.
*/

enum AlertMessage {
    
    static let email = "Please enter email address"
    static let validEmail = "Please enter valid email address"
    static let newEmail = "Please enter current email address"
    static let newValidEmail = "Please enter valid current email address"
    static let selectCountry = "Please select country"
    static let address = "Please enter address"
    static let enterLicenceNo = "Please enter your license number"
    static let enterInsuranceNo = "Please enter your insurance number"
    static let enterVehicleNo = "Please enter your vehicle number"
    static let city = "Please enter city"
    static let gender = "Please select gender"
    static let state = "Please enter state"
    static let zipCode = "Please enter zip code"
    static let birthDay = "Please enter birth of date"
    static let selectCountryCode = "Please enter country code"
    static let mobileNumber = "Please enter mobile number"
    static let businessName = "Please enter business name"
    static let validBusinessName = "Please enter valid business name"
    static let websiteAddress = "Please enter website address"
    static let websiteAddressValid = "Please enter valid Website address"
    static let typeMessageHere = "Type your message here"

    static let correctMobile = "Mobile number must be 5-15 digits"
    static let password = "Please enter password"
    static let enterMessage = "Please enter your message"
    static let passwordNew = "Please enter new password"
    static let minimumPassword = "Password should be minimum 8 characters"
    static let firstName = "Please enter first name"
    static let fullName = "Please enter name"
    static let lastName = "Please enter last name"
    static let selectOpenTime = "Please select open time"
    static let selectCloseTime = "Please select close time"
    static let selectAgeGroup = "Please select age group"
    static let selectUnderAge = "Please select under age status"
    static let selectMartialStatus = "Please select martial status"
    static let uploadProfilePic = "Please upload your photo"
    static let yetToImplement = "Yet to implement"
    static let checkCameraPerMission = "Please check your camera permission in phone settings"
    static let validFirstName = "Please enter valid first name"
     static let validName = "Please enter name"
    static let validLastName = "Please enter valid last name"
    static let profileUdatedSuccess = "Profile updated successfully"

    static let checkEmail = "Please check your email to reset your password"
    static let login = "Login successfully"
    static let businessImgDelete  = "Business photo deleted successfully"
    static let passwordChangeSuccss = "Password changed successfully"
    static let emailChangeSuccss = "Email address changed successfully"
    static let confirmPassword = "Please enter confirm password"
    static let passwordMatch = "Password does not match"
    static let pleaseAcceptTerms = "You can’t use the app unless you say you agree to these."
   
    static let areYouSureLogout = "Are you sure you want to logout?"
    static let areYouSureDeleteImage = "Are you sure you want to delete this image?"
    static let serverError =  "Server error, Please try again.."
    static let urlNotExist = "URL does not exists : 404"
    static let checkUrl = "Please check the URL : 400"
    static let unableToEncodeJson =  "Error: Unable to encode json response"
    static let logoutSuccess = "Logged out successfully"
    static let ratingAddedSuccess = "Rating added successfully"
    static let BusinessPhotosAdded = "Business photos added successfully"

    static let unableToGetRespose = "Error: Unable to get response from server"
    static let sessionLoggedOut = "Session Logged out"
    static let pleaseReviewYourNetworkSettings = "Please review your network settings"
    static let userSignUpSuccess = "User registered successfully"
    static let driverSignUpSuccess = "Driver registered successfully"
    static let pointsAdded = "Points added"
     static let certainFunctionality = "Certain functionality may not be available. You can configure these permissions in your settings to enable"
   
    static let logout = "Are you sure, you want to logout?"
}

enum TitleMessage {
    static let alreadyHaveAccount =  "Already have an account? Sign In"
    static let signIn =  " Sign In"
    static let alreadyAccount = "Already have an account?"
   
    static let demoExpired = "Demo Expired"
    static let contactWithTeam = "Please contact the team"
    static let search =  "Search"
    static let reviews = "Reviews"
    static let dismiss = "Dismiss"
    static let settings = "Settings"
    static let takePhoto = "Take Photo"
    static let choosePhoto = "Choose Photo"
    static let deletePhoto = "Delete Photo"
    static let cancelSmall = "Cancel"
    static let alert = "Alert"
    static let ok = "OK"
    static let yes = "Yes"
    static let no = "No"
    static let cameraNotSupport = "Camera is not supported"
    static let cookiePolicy = "Privacy Notice"
    static let termsOfService = "Terms of Use"
    static let connectionProblem = "Connection Problem"
    static let bySigning = "By signing up you agree to our "
    static let clickHere = "Click here "
    static let wearable = "to see how you can use a wearable instead"
    static let pointEarned = "Points can either be earned or purchased. Need to purchase more?"
   static let goStore = " Go to store"
    static let permission = "Permission"
    static let locationServiceEnable =  "Location services are not able to determine your location"
    static let trackRide = "To check direction, you must turn on location services from settings"
    static let locationServiceOff =  "Location services are off"
    static let internetConnection = "Please check your internet connection"
    static let connection = "Internet Connection"
    
    
    static let cancelMembership = "Cancel Membership"
    static let teamForHelp = "You can cancel your membership iTunes > Subscriptions > Manage Subscriptions. You can also message our team for help"
    static let contactSupport = "Contact Support"
    static let resetSent = "Password Reset Sent"
    static let resetPassword = "An email to reset your password is on its way. Follow the instaructions to get back into your account"
    static let close = "Close"
    
    
    
    
    static let gender = "What's your gender?"
    static let weather = "What's your weather?"
    static let describeSelf = "Describe your self as?"
    static let feeling = "How yours feeling?"
    static let oraganized = "How oraganized you are?"
    static let resend = "Resend Code"
}


enum WebServiceMessage {
    static let success = "Success"
    static let error = "Error"
    static let unableToEncodeJson = "Error: Unable to encode json response"
    static let sessionExpired = "Session expired"
    static let checkUrl =  "Please check the URL : 400"
    static let urlDoesntExit = "URL does not exists : 404"
    static let serverErrrorTryAgain = "Server error, Please try again.."
}
