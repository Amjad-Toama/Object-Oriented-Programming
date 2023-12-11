# Object-Oriented-Programming
This repository contains projects developed as part of an advanced Java programming course. The projects cover various aspects and principles of Object Oriented Programming

**Project Title: Object-Oriented Programming Shapes**

**Description:**
This project, implemented in the Smalltalk programming language, delves into Object-Oriented Programming principles through the creation of a hierarchy of geometric shapes. The foundational structure is provided by the abstract class `MyShape`, acting as the cornerstone for specific shape implementations.

**Key Components:**

1. **MyShape Abstract Class:**
   - The central abstraction in the project, defining fundamental properties and methods shared by all shapes.
   - Serves as the blueprint for subclasses to inherit and implement shape-specific details.

2. **MyRectangle, MyTriangle, MySquare Classes:**
   - Concrete classes inheriting from `MyShape`.
   - Each class encapsulates the distinctive characteristics and behavior of its respective geometric shape.
   - Implements methods to calculate area, perimeter, and any other shape-specific operations.

3. **MyShapeTest Class:**
   - A dedicated unit testing class ensuring the accuracy and dependability of the implemented shape classes.
   - Utilizes Smalltalk's testing framework to create test cases covering various scenarios for each shape.
   - Validates the functionality of inherited methods and ensures proper encapsulation of shape-specific behaviors.

**Key Features:**

- **Inheritance and Abstraction:**
  - Demonstrates the use of inheritance to create a hierarchy of interconnected classes.
  - Leverages abstraction to establish a common interface through the abstract base class.

- **Polymorphism:**
  - Explores polymorphic behavior by allowing different shapes to share a common interface while providing shape-specific implementations.

- **Unit Testing:**
  - Prioritizes code quality by incorporating unit tests within the `MyShapeTest` class.
  - Ensures the reliability of each class's methods and overall integrity of the geometric shapes implementation.

**How to Use:**
1. Download or clone the Smalltalk project.
2. Add ShapeCategory.st file into Squeak environment.
3. Dive into the source code to explore the implementation of `MyShape`, `MyRectangle`, `MyTriangle`, and `MySquare` classes.
4. Execute the tests within the `MyShapeTest` class to validate the correctness of the implemented functionality.
5. Into the Workspace create instance as you wish.

**Contributing:**
Contributions and feedback are highly encouraged! Feel free to open issues, propose enhancements, or submit pull requests to improve the project.

**Acknowledgments:**
This project is a result of dedicated work during an Object-Oriented Programming course in Smalltalk, showcasing the practical application of OOP principles in creating a robust and extensible system of geometric shapes.
