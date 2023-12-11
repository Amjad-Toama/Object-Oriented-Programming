**Project Title: N-Queens Solver with Interactive GUI in Smalltalk**

**Description:**

Experience the N-Queens Solver project in Smalltalk, now featuring an engaging GUI for visualizing queen positions on the chessboard. The implementation revolves around three key classes: `Board`, `Queen`, and `QueenTerminator`. Explore the solutions interactively by customizing the number of queens, adjusting the simulation speed, and ensure that "QueenPiece.png" is located in the root directory (...\Contents\Resources).

**Classes:**

1. **Board Class:**
   - Initializes and manages the chessboard size, placing queens on it.
   - Provides a dynamic GUI interface for real-time visualization of queen positions.
   - Easily configurable to modify the board size and solve the N-Queens problem for various scenarios.

2. **Queen Class:**
   - Represents the queens on the chessboard.
   - Communicates with other queens through messages to detect threatening positions.
   - Crucial for the backtracking algorithm for exploring safe queen placements.

3. **QueenTerminator Class:**
   - Represents a degenerate queen that poses no threat to others.
   - Plays a specific role in identifying valid solutions during the exploration process.

**Interactive Usage:**

- **Default Configuration (8 Queens):**
  ```smalltalk
  | board |
  board := Board new.
  [board solve] fork.
  ```

- **Customizing the Number of Queens (e.g., 5 Queens):**
  ```smalltalk
  | board |
  board := Board new initialize: 5.
  [board solve] fork.
  ```

- **Adjusting Simulation Speed:**
  ```smalltalk
  | board |
  board := Board new.
  board animationSpeedRatio: 0.5. "Increase speed"
  [board solve] fork.
  ```

**QueenPiece.png Placement:**

Ensure that the "QueenPiece.png" file is located in the root directory (...\Contents\Resources).

**Getting Started:**

1. **Load the Project:**
   - Load the project into your Smalltalk environment.

2. **Interactive Exploration:**
   - Customize the number of queens and simulation speed using the provided examples.
   - Confirm that "QueenPiece.png" is in the root directory for visualizing queens on the chessboard.

**Contributing:**

Contributions are encouraged! Enhance the GUI, improve documentation, or add features to make the solver more interactive. Feel free to open issues and submit pull requests.
