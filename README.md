 

MVVM Architecture in Flutter 

 

Model–View–ViewModel (MVVM) is a very established architectural pattern when it’s come to software development. What is so special about MVVM?. 

                              We need one architecture to be placed in the application which communicates between UI and business logic. MVVM is one of them which is able to segregate business logic from UI, this looks easy job to do, but my friend believe me if you missed something in architecture or doing anything inaccurate then be ready for big trouble at a later stage of application development, and eventually you will end up having some code hack in application to do your job. 

Here I am going to explain MVVM with a simple example that will give you enough knowledge to implement in your application. 

MVVM is useful to move business logic from view to ViewModel and Model. ViewModel is the mediator between View and Model which carry all user events and return back the result. 

The key benefit is allowing true separation between the View and Model and the efficiency that you gain from having that. What it means in real terms is that when your model needs to change, it can be changed easily without the view needing to and vice-versa. 

There are three key things that flow out of applying MVVM − 

Maintainability:- The presentation layer and the logic are loosely coupled, due to this code is easily maintainable and reusable. As the code base will increase over the course of time, this will help you to distinguish between them. 

Testability:- The ViewModel is easier to unit test than code-behind or event-driven code. Thanks to separation logic MVVM have  

Extensibility:- This architecture gives you assurance which enables code to get extensible over the period of time. but keep in mind it’s also over job to keep component reusable. 

So, let's go through each component individually and try to understand the purpose. Please see the diagram while referring to the below points, you will have a clear understanding of flow. 

Folder Structure will be as follow: 

  

Model 

The model represents a single source of truth that carries the real-time fetch data or database-related queries. 

This layer can contain business logic, code validation, etc. This layer interacts with ViewModel for local data or for real-time. Data are given in response to ViewModel. 

ViewModel 

ViewModel is the mediator between View and Model, which accept all the user events and request that to Model for data. Once the Model has data then it returns to ViewModel and then ViewModel notify that data to View. 

ViewModel can be used by multiple views, which means a single ViewModel can provide data to more than one View. 

 

View 

The view is where the user is interacting with Widgets that are shown on the screen. These user events request some actions which navigate to ViewModel, and the rest of ViewModel does the job. Once ViewModel has the required data then it updates View. 

Now, we will go through the example which will demonstrate MVVM architecture, for notifying data we will use the Provider state mechanism. 



 

 
