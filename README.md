# Weekly-Programming-Challenges-2023
Project for MoureDev Weekly Programming Challenges 2023


The complete project is made with MVVM pattern and SwiftUI.

- 0  - 26/12/22 | "FIZZ BUZZ"
- 1  - 02/01/23 | "Hacker languaje"
- 2  - 09/01/23 | "Tennis game"
- 3  - 16/01/23 | "Password generator"
- 4  - 23/01/23 | "Prime, Fibonacci and Pair"
- 5  - 30/01/23 | "Hello world"
- 6  - 06/02/23 | "Stone, Paper, Scissors, Lizard, Spock"
- 7  - 13/02/23 | "Sorting hat"
- 8  - 20/02/23 | "Pseudorandom"
- 9  - 27/02/23 | "Hetero, Iso, Pan Grama"
- 10 - 06/03/23 | "API"

### FIZZ BUZZ

Write a program that displays the numbers from 1 to 100 (both included in a column), substituting the following:
  - Multiples of 3 for the word "fizz".
  - Multiples of 5 for the word "buzz".
  - Multiples of 3 and 5 at the same time for the word "fizzbuzz".
  
### Hacker languaje

Write a program that receives a text and transforms natural language into "hacker language" (actually known as "leet" or "1337"). This language is characterized by substituting alphanumeric characters.
   - Use this table (https://www.gamehouse.com/blog/leet-speak-cheat-sheet/)
with the alphabet and numbers in "leet".
 
### Tennis game

Write a program that shows how a tennis game takes place and who has won it.
 The program will receive a sequence made up of "P1" (Player 1) or "P2" (Player 2), depending on who wins each point in the game.
 
 - The scores of a game are "Love" (zero), 15, 30, 40, "Deuce" (tie), advantage.
 - Given the sequence [P1, P1, P2, P2, P1, P2, P1, P1], the program would show the following:
   - 15 - Love
   - 30 - Love
   - 30 - 15
   - 30 - 30
   - 40 - 30
   -deuce
   - Advantage P1
   - Has won P1
 - If you want, you can control errors in data entry.
 - Consult the rules of the game if you have doubts about the point system.

### Password generator

Write a program that is capable of randomly generating passwords.
You can configure to generate passwords with the following parameters:
- Length: Between 8 and 16.
- With or without capital letters.
- With or without numbers.
- With or without symbols.

(Being able to combine all these parameters between them)

### Prime, Fibonacci and Pair

Write a program that, given a number, checks and returns whether it is prime, fibonacci, and even.

Examples:
 - With the number 2, it will tell us: "2 is prime, fibonacci and is even"
 - With the number 7, it will tell us: "7 is prime, it is not fibonacci and it is odd"

### Hello world

### Stone, Paper, Scissors, Lizard, Spock

Create a program that calculates who wins the most games of rock, paper, scissors, lizard, spock.
 - The result can be: "Player 1", "Player 2", "Tie" (tie)
 - The function receives a list containing pairs, representing each play.
 - The pair can contain combinations of "🗿" (stone), "📄" (paper),
   "✂️" (scissors), "🦎" (lizard) or "🖖" (spock).
 - Example. Input: [("🗿","✂️"), ("✂️","🗿"), ("📄","✂️")]. Result: "Player 2."
 - You must look for information on how to play with these 5 possibilities.

### Sorting hat

Create a program that simulates the behavior of the sorting hat from the magical universe of Harry Potter.
 - If possible, ask 5 questions (at least) through the terminal.
 - Each question will have 4 possible answers (you can also select one through the terminal).
 - Based on the answers to the 5 questions, you must design an algorithm that places the student in one of the 4 Hogwarts houses (Gryffindor, Slytherin, Hufflepuff and Ravenclaw)
 - Take into account the features of each house to ask the questions and create the selection algorithm.
   - For example, in Slytherin ambition and cunning are rewarded.

### Pseudorandom

Creates a pseudorandom number generator between 0 and 100.
 - You cannot use any "random" (or similar) function of the selected programming language.

### Hetero, Iso, Pan Grama

Validate if a string of text is a heterogram, an isogram, or a pangram.
  - You must look for the definition of each of these terms.

### API

Calling an API is one of the most common tasks in programming.

 - Implement an HTTP call to an API (the one you want) and show its result through the terminal. For example: Pokemon, Marvel...
 - Here is a list of possible APIs: https://github.com/public-apis/public-apis
