**Project Title: War Game Simulation**

**Description:**

Immerse yourself in the strategic world of the War Game Simulation, a Smalltalk project that allows 2 to 4 players to engage in an exciting card battle. The project is thoughtfully structured with classes like `WarPlayer`, `WarGame`, `PlayingTable`, `Card`, `Cards`, and `PlayingCards`, each playing a crucial role in creating a dynamic and interactive gaming experience.

**Key Classes:**

1. **WarPlayer:**
   - Holds essential player properties such as ID, cards, and position on the table.
   - Implements methods for basic player functions, including dealing cards.

2. **WarGame:**
   - Encompasses the core logic of the War game.
   - Manages the flow of the game, orchestrating player actions and resolving battles.

3. **PlayingTable:**
   - A Morph class responsible for the GUI representation of the gaming table.
   - Communicates seamlessly with the `WarGame` class to provide an interactive and visual gaming experience.

4. **Card:**
   - A Morph class creating the GUI representation of a single card, including its value.
   - Integral to the visual aspect of the game.

5. **Cards:**
   - A Deck class inheriting from the `Card` class.
   - Represents a collection of cards and manages their distribution during the game.

6. **PlayingCards:**
   - The complete deck of playing cards.
   - Ensures the availability of a full deck for the War game.

**Usage:**

Ensure that the required image folder exists in the root directory (...\Contents\Resources).

```smalltalk
| game |
game := PlayingTable new.
[game initialize: <players_amount>; play] fork.
```

**Getting Started:**

1. **Clone the Repository**

2. **Load the Project:**
   - Load the project into your Smalltalk environment.
   - Attach the `img` folder to the root directory (...\Contents\Resources).

3. **Interactive Gaming:**
   - Initialize the `PlayingTable` to set up the gaming environment.
   - Customize the number of players and begin the game using the provided usage example.

**Contributing:**

Contributions are welcome! Enhance the game logic, improve the GUI, or add features to make the War Game Simulation even more engaging. Feel free to open issues and submit pull requests.
