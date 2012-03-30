#include <Wire.h>
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 16, 2);

int numberOfEnemiesDefeated;

void setup()
{
  lcd.init();
  lcd.clear();
  lcd.backlight();
  lcd.print("Initializing...");
}

void loop() // New Game
{
  // New Player
  newPlayer();
  numberOfEnemiesDefeated = 0;
  
  welcome();
  
  while (playerIsAlive) // Fight a new enemy
  {
    // Create a new enemy
    newRandomEnemy();
    if (getApprovalFromUser())
    {
      fightRound();
    }
    else
    ignoreEnemy();
  }
  
  endGame();
}

void fightRound()
{
   while (bothStillAlive())
   {
     if (bothStillAlive())
       playerTurn(); // Player attacks
      
     if (bothStillAlive())
       enemyTurn(); // Enemy attacks
      
     if (!enemyIsAlive())
       numberOfEnemiesDefeated++;
   }
}

void ignoreEnemy()
{
  ignoreEnemyMessage();
}

boolean bothStillAlive()
{
  return (playerIsAlive() && enemyIsAlive());
}


