# LDSDirectory

## Approach
The app has been developed usinf SwiftUI, with a MVVM base as design pattern, trying to keep thinkg simple the app performs the expected functions given the original challenge.

## View Model
The viewModel is used for 2 main propouses, the first one is to retrieve data from the API, and the second is to store and retrieve data from CoreData Entity

### Enhancements
For sake of the exercise the current flow for retrieve and store data is:
1) Check if local data exist
2) If exists, parse the local entity to the model and populates de list
3) If no local data is found, API is called.
4) Retrieved data from API is stored in Core Data

Some comements I have regarding this functionality are as follows, we have few ways to check wether we want or not to save the upcoming data, currently as stated before, as long as we have data locally stored we are not going to pull anything else even if the contents of the web service are different than the ones contained in the local storage, we can talk about different solutions:
1) Everytime make the API call and SELECT from CoreData each one of the results to validate if that object "id" exist and then proceed to save or skip, using a predicate like:
```swift 
fetchRequest.predicate = NSPredicate(format: "id == %@", entity.id)
```
3) Everytime make the API call and retrieve ALL the id's, then with the contains method for array check for each one if should proceed or skip
```swift 
let idCoreDataArray = individuals.map { $0.id ?? 0 }
idArray.contains(individual.id)
```
5) Implement a refresh button, only when it gets tapped any of the previous scenarios can be triggered

##ProfileImageView.swift
This class was created in order to retrieve the image from the URL and assign a custom View into the ContentView element for image, however for the sake of the test i rather use the SDWebImageSwiftUI library that handles cache, still leave this class here just so we can take a look at the first approach

##The force is strong with this one
Hold on! once a character from the list is selected, if the forceSensitive property is true, a small animation will appear before the character details are shown, it will notice if their force is dark side or light. For those characters with a false value, the details card will show immediately

##Testing
For this exercise i choose to create a few BDD UI Automation tests, for the Unit Tests, the helper class functions are being tested, for color, string and date values

##Frameworks and Libraries
