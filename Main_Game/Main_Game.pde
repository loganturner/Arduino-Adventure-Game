#include <Wire.h>
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 16, 2);

int playerHealth;
int enemyHealth;
int playerDefense;
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
  playerHealth = MAX_HEALTH;
  enemyHealth = MAX_HEALTH;
  numberOfEnemiesDefeated = 0;
  
  welcome();
  
  while (playerHealth > 0) // Fight a new enemy
  {
    // Create a new enemy
    enemyHealth = MAX_HEALTH;
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
        playerDefense = 0;
      
        if (bothStillAlive())
          playerAttack(); // Player attacks
      
        if (bothStillAlive())
          enemyAttack(); // Enemy attacks
      
        if (enemyHealth <= 0)
          numberOfEnemiesDefeated++;
      }
    }
  }
  
  endGame();
}

boolean bothStillAlive()
{
  return ((playerHealth > 0) && (enemyHealth > 0));
}


