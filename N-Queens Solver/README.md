**Project Title: N-Queens Solver in Smalltalk**

**Description:**

Welcome to the N-Queens Solver project implemented in Smalltalk! This solution is built around three key classes: `Board`, `Queen`, and `QueenTerminator`. Each class plays a crucial role in creating and solving the N-Queens puzzle.

**Classes:**

1. **Board Class:**
   - Responsible for initializing the chessboard size and placing queens on it.
   - Provides methods to customize the board size and solve the N-Queens problem.
   - Default initialization is set to 8 queens, but it can be easily modified for different configurations.

2. **Queen Class:**
   - Represents the queens on the chessboard.
   - Communicates with other queens using messages to determine if their positions are in a threatening situation.
   - Essential for the backtracking algorithm to explore safe queen placements.

3. **QueenTerminator Class:**
   - Represents a degenerate queen that doesn't pose a threat to other queens.
   - Plays a specific role in the solution, aiding in identifying valid solutions during the exploration process.

**Getting Started:**

1. **Load the Project:**
   - Load the project into your Smalltalk environment.

3. **Explore and Modify:**
   - Dive into the classes to understand their responsibilities and interactions.
   - Modify the `Board` class to customize the board size and solve the N-Queens problem for different configurations.

**Example Usage:**

```smalltalk
| board |
board := Board new.
board solve. "Solves the N-Queens problem with the default size (8 queens)"

"Customize the board size and solve again"
board initialize: 12.
board solve.
```

**Contributing:**
Contributions are encouraged! Whether you want to enhance the algorithm, improve documentation, or add features, please feel free to open issues and submit pull requests.
