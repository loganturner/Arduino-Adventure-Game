#include <Wire.h>
#include <LiquidCrystal_I2C.h>

#define MAX_HEALTH 5
#define DEFAULT_LOCATION 0

#define DOWN 0;
#define LEFT 1;
#define RIGHT 2;
#define UP 3;

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

void welcome()
{
  lcdOutput("    Welcome!    ", " -------------- ");
  delay(3000);
  lcdOutput(" Push stick UP, ", " LEFT, or RIGHT ");
  delay(2000);
  lcdOutput("to attack. Push", "DOWN to defend.");
  delay(3000);
  lcd.clear();
  delay(2000);
}

void endGame()
{
  if (playerHealth > 0) // WIN!
  {
    
  }
  
  else // LOSE!
  {
    lcdOutput("   You died...  ", "   GAME OVER    ");
    delay(2000);
    lcdOutput("  You defeated  ", "   " + (String)numberOfEnemiesDefeated + " monsters.  ");
  }
}

int playerAttack()
{
  switch (getJoyStickPosition())
  {
    case 3:
      return 4;
    case 0:
      playerDefense = 4;
      return 0;
  }
}

int enemyAttack()
{
  // Not yet written
}

boolean bothStillAlive()
{
  return ((playerHealth > 0) && (enemyHealth > 0));
}

int getJoyStickPosition()
{
  // Wait for joystick to be moved
}

boolean getApprovalFromUser()
{
  return true;
}

void lcdOutput(String line)
{
  lcd.clear();
  lcd.setCursor(0,0);
  lcd.print(line);
}

void lcdOutput(String firstLine, String secondLine)
{
  lcd.clear();
  lcd.setCursor(0,0);
  lcd.print(firstLine);
  lcd.setCursor(0,1);
  lcd.print(secondLine);
}
