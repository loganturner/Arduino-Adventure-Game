#include <Wire.h>
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 16, 2);

int numberOfEnemiesDefeated;

void setup()
{
  lcd.init();
  lcd.clear();
  lcd.backlight();
}

void loop() // New Game
{
  initLED();
  initBuzzer();
  
  startGameMessage();
  
  newPlayer();
  numberOfEnemiesDefeated = 0;
  
  while (playerIsAlive()) // Fight a new enemy
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
  
  endGameMessage();
  failureTone();
  endScoreMessage();
  lcd.clear();
  delay(2000);
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
  enemyIgnoredMessage();
}

boolean bothStillAlive()
{
  return (playerIsAlive() && enemyIsAlive());
}


