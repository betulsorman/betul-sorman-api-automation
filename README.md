# Pet Services Test Automation with Karate


# Tool Stack

* **Karate Framework** - Development Framework
* **Java/Javascript/Scala** - Development Language (For situations where it is necessary)
* **IntelliJ IDE** - Development IDE
* **Maven** - Package Management

# Running Tests

1. It can be run based on scenario or feature by pressing the green RUN button on the IDE.


2. Scenarios determined on the JUnit runner can be run again by pressing the green RUN button.


3. `Running it via CLI by giving 'Runner class' and 'tagname'.

   `mvn clean test -Dtest=RunnerName "-Dkarate.options=--tags @tagName"`
 

# Naming Convention

* `camelCase` is used for naming. New developments need to adhere to this convention. Only Java and Scala classes are named as `UpperCamelCase`.

Example: `myVar`, `dataPackage`, `contentCategory`, `Utils.Java`, `MyRunner.scala` etc.

# Tagging

* When tagging scenarios `snake_case` should be used.

```
@wip = A scenario/feature whose development is not complete
@smoke = A scenario/feature which is expected to run in the smoke scope
@excluded  = A scenario/feature that no longer exists on the application, but whose scenario has already been implemented
@bug_fix = A scenario/feature waiting for bug fix due to an existing bug on the application 
           It should be used with the bug_id tag like the example below.
           Example Usage: @bug_fix @bug_id_JIRA_ID 
@prod  = Scenarios to be run on prod environment
@regression  = Cases to be run during regression
@feature_tag = Tag name to be given to each feature file. Example: @feature_login
@scenario_tag = The unique tag to be given to each scenario. Example: @success_login
```

# Custom Method Development

* When there are custom requirements that cannot be developed using the Karate Framework, custom methods can be developed using Java and/or JS.
* Custom methods should be located under the `helpers` package.

<b>Utils class</b>

- This class holds functions commonly used within scenarios.
- The 'waitFor' function inside the class is used to pause the flow of the feature.
- The CommonUtils.java class should be invoked within the feature file as follows.

```
   * Java.type('helpers.Utils').waitFor(60)
```

# Feature Writing

* A package corresponding to the relevant service will be created in the Features folder, and feature files will be generated for each service individually.
* A separate feature file will be created for each microservice. If a microservice has multiple features, separate feature files will be generated for each of those features.
* Services that will be repeatedly invoked throughout the project will be added under the `callers` package.
* Required helper functions for scenarios will be developed using `Java`  under the `helpers` package.
* The `data` folder will hold the necessary request and response models for the services.

