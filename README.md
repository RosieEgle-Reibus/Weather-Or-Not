# Onramp iOS Take-Home Project 

## Weather Or Not created by Rose Egle

### Project Summary:

Weather Or Not is a weather app that uses the OpenWeather api to make a request based on what city the user types into the textfield and then presents the data that is sent back to the user.  It has an MVVM architecture, the Models represent simple data and are instantiated within the ViewModels.  The ViewModels do all of the networking, and data preparation for visual representation that will be used by the ViewController.  The ViewControllers present the data and control any UI changes and UI actions based on user interactions.

### Weather Icons Used
[Icon Finder](https://www.iconfinder.com/iconsets/weather-color-2)

## API used
[OpenWeather](https://openweathermap.org/current)

## Model

* CurrentWeatherData.swift -  This is used for parsing the JSON from the Current weather API
* CurrentWeatherModel.swift - This sets up the structure of the model that will be created by CurrentWeatherViewModel
* HourlyData.swift - This is used for parsing the JSON from the API
* HourlyModel.swift - This sets up the structure of the model that will be created by ViewModel
* HourlyArrayModel.swift - this groups the individual hourly models into one list based model that is in line with the data structure of the JSON object returned by the 3 hour/5day api

## ViewModel 

* CurrentWeatherViewModel.swift - responsible for all asyncchronous networking code, this is where the api call is actually made and the data is fetched back and then rendered from a JSON object into a model object that the ViewModel then passes to the ViewController so that it can be visually rendered
* HourlyViewModel.swift - responsible for all asyncchronous networking code, this viewModel makes a call to a 3 hour/5day api also made by open weather

## Views

* ViewController.swift - responsible for taking the user input and passing it to the ViewModel and then displaying the response from the api in the UI, also in control of navigation/segues to the other biew controllers through the use of buttons
* SecondViewController.swift - displays a table of mock hourly data
* ThirdViewController.swift - displays a table of mock daily data

## Data Persistence

* UserDefaults - I set them up within ViewController.swift so that the last city that was searched becomes the default, so that they return to the app it will be displaying that same city's information.  I did this based on the assumption that most people generally stay in their home cities and are not usually looking up the weather in places they do not live  

 

* Use of at least 3 [UIViewControllers](https://developer.apple.com/documentation/uikit/uiviewcontroller).
* Use of at least one [UIView](https://developer.apple.com/documentation/uikit/uiview). You can subclass UIView and add subviews to that class.
* The usage of the [MVVM](https://www.raywenderlich.com/34-design-patterns-by-tutorials-mvvm) architectural pattern.
* Use of a [REST API](https://medium.com/@arteko/the-best-way-to-use-rest-apis-in-swift-95e10696c980). We suggest using [Codable](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types) for handling JSON.
* Usage of at least 5 UIView/UIControl subclasses (UITableViews, UISegmentedControl, etc).
* The usage of data persistence - UserDefaults, NSKeyedArchiver, or what makes most sense to you. 







 







### Application Description

Each project submission must include a README file providing an overview of the iOS application and details the app's overall MVVM architecture as well as your design decisions. Screenshots of the iOS app taken from the Xcode simulator or your testing device are also required. This task assesses the critical competency of communicating and documenting technical concepts. See details in the submission information section below.


* A description of the overall iOS application
* A high level architectural overview of your iOS application. e.g. names, relationships and purposes of all UIViewControllers and UIViews
* Explanations for and descriptions of the design patterns you leveraged
* [Screenshots](https://stackoverflow.com/questions/7092613/take-screenshots-in-the-ios-simulator) of each View and descriptions of the overall user flow
(https://developer.apple.com/library/archive/referencelibrary/GettingStarted/DevelopiOSAppsSwift/PersistData.html)
* [Apple Developer App](https://apps.apple.com/us/app/apple-developer/id640199958)
* [WWDC Videos](https://developer.apple.com/videos/)
