
⚠️ Important
If for some reason when you are reviewing this project you get 402 status code, it means that where have reach the maximum request per day, so you need to create and account
in spoonacular website https://spoonacular.com/food-api/console#Dashboard
After you have created the account please follow this steps:
1) click on MY CONSOLE button, is the big and green button that is located on the top right of your screen.
2) after, click on my profile button, it is located on the left of your screen, below API CONSOLE text
3) after, you will see the API KEY, to reveal your API KEY, just click on the button SHOW / HIDE API KEY
4) Copy that API KEY and open xcode
5) once you are in Xcode, select the main project, go to build settings, scroll down until you find USER-DEFINED section, search for APIToken property and paste your API KEY

onces you finish the steps, you will be able to run the project and see it working, in other case, please contact juandavidl2011.jdll@gmail.com or 311 417 99 13
thank you.

# RecipeBook
This is an app where user is able to see a list of food recipes, to do that, this app is going to use the API spoonacular  https://spoonacular.com/food-api/console#Dashboard

# Project Architecture
so the project is using the Architure Desing MVVM-C that is Architure Desing of Clean Architecture, so as you can see, that all our features Home, Favorite, Search and Detail, has been splited into MVVM-C folders,
so we have the:
View folder - Here you will find all UIElements of each feature
ViewModel Folder - Here you will find all the business logic of each feature
ViewController - As I dont like a pollute ViewController with things that are not it responsibility, so we have a specific folder for viewcontrollers, in that way the view can be splited of ViewController and make the SOLID concept be applied
API - Here you will find all the logic related to the request
Model - Here you will find all the models where we can hold and handle the data
Coordinator -  Here will find all the logic related to the app navigation


Also our project containt 2 very important modules, Design System and APIManager

## Desing System
This module help us to store all the logic related to UI Elements, so we can reuse components like LoadView that is used to show a loader into the app, it means we dont need to create the same component each time we need it
and if for some reason another develop join to the same project, so it make the new develop can use the LoadView pretty easy, he just need to call in his ViewController the 
function  showLoading() or  hideLoading()

also I have created styles of button, Labels and Views, that means that our app will have a consistent design, it is pretty good when we are working in a big project or with many developers
because you dont need to configure each Label each time you need to use it, you just call yourLabel.applyStyle() function, pass the style you need and just it!

this Module containt Unit test

## APIManager
This module help us wiht all the request logic without the needs to use a third library, for example, I think that use Alamofire is not necessary because we have all we need to do the same and in a native way, it means 
that our project has one less dependency, and between less dependencies... better.
So, our APIManager is using the URLSession to make all the calls that are needed, also it handle of Decode the JSON into a object you have passed and say to the develop if a error had happened.
Also our APIManager log all the requests information and and all the responses information, so the develop can see in his console what is happening with the request, if it was successful or not, which http status he got and etc.


IMPORTANT to say that the project contain unit test, contain favorite section, contain data persistence with Realm, contain splash screen with a short animation, contain depedency inyection and all the things was requested in the test.

## How to use the app
Is pretty simple, just run the app in xcode, the app will show you the splash screen with a short animation, and after you will be able to see the recipe food list,
you have the possibility to add each recipe to favorite, just need to tap the heart icon that is located on the top right of each card, if you have at least 1 favorite recipe, so you wil be able to tap the button favorite section and see all you favorite recipes,
in the main screen (recipe food list) you can see a button called "Ver mas", if you tap that button, the app takes you into the detail screen, the datail screen has a button to add the recipe to favorite,
and finaly in the main screen (recipe food list), you will find a search button, that is located in the top right of the screen, if you tap that button, app takes you into the search screen where you will be able to search a recipes you like.

I hope you like what I dot and if you have any question, please, feel free to reach out me, my email is juandavidl2011.jdll@gmail.com and my mobile number is 311 417 99 13

Thank you.
