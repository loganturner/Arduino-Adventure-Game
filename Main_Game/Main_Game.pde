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
    newEnemy();
    lcdOutput("Finding ememy...", "");
    for(int i = 0; i < 16; i++)
    {
      lcd.setCursor(i, 1);
      lcd.print("*");
      delay(175);
    }
    
    lcdOutput("Found: ");
    delay(1000);
    lcd.print("Killzoid.");
    delay(2000);
    lcd.setCursor(0,1);
    lcd.print(" Engage?  ");
    delay(500);
    lcd.print("(Y/N) ");
    if (getApprovalFromUser())
    {
      // Fight one round
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
  }
  
  endGame();
}

boolean bothStillAlive()
{
  return (playerIsAlive() && enemyIsAlive());
}


