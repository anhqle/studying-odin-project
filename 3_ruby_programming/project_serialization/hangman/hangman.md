**How to play**

* Run `irb -r ./hangman.rb` to load the file
* Run `Game.new.start` to start game and follow instructions
* Saved games are stored in `./saved/`

**Notes on Program Design**

* Class `Player` contains all the guessed letters
* Class `Word` contains the answer. It also has a method to print out its `#current_state` based on what letters the player has guessed
* Class `Board` takes in a player and a word and prints out the game board (also keeps track of the count)
* Class `Session` opens a game session (either a new game or a loaded game)
* Class `Game` opens a new game (which then branches into either a new game or a loaded game)
