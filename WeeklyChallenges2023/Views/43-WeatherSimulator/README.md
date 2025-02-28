# Challenge 43 - Weather simulator

Write a function that simulates the weather conditions (temperature and probability of rain) of a fictitious location over a specific number of days according to these rules:

- The initial temperature and the % probability of rain are defined by the user.
- Every day that passes:
  - 10% chance that the temperature will increase or decrease by 2 degrees.
  - If the temperature exceeds 25 degrees, the probability of rain the next day increases by 20%.
  - If the temperature drops below 5 degrees, the probability of rain the next day decreases by 20%.
  - If it rains (100%), the next day's temperature decreases by 1 degree.
- The function receives the number of days of the prediction and shows the temperature and whether it rains during all those days.
- It will also show the maximum and minimum temperature of that period and how many days it will rain.
 
<img src="/ChallengesImages/Challenge%2043_1.png" width="300" height="620">

<img src="/ChallengesImages/Challenge%2043_2.png" width="300" height="620">
