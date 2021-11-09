## Game flow

1. the user makes a choice
2. the computer makes a choice
3. the winner is displayed

## Approach to OOP

1. Write a textual description of the problem or exercise.

  RPS is a 2-player game with a series of rounds. 
  Each round, each player chooses rock, paper, or scissors
  Rock defeats scissors, scissors defeats paper, paper defeats rock
  The same move results in a tie
  The players might play best of three or five.

2. Extract the major nouns and verbs from the description.

  Major nouns
  players
  rounds
  move

  Major verbs
  choose
  compare

3. Organize and associate the verbs with the nouns.
  Player
    choose
  Move
  Rule

    -compare
  
4. The nouns are the classes and the verbs are the behaviors or methods.

* Note: the flow of the game comes after the OOP approach, in the "engine" where the procedural flow is housed.