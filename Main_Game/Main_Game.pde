#define MAX_HEALTH 5
#define DEFAULT_LOCATION 0

#define DOWN 0;
#define LEFT 1;
#define RIGHT 2;
#define UP 3;

int playerHealth;
int enemyHealth;
int playerDefense;
int numberOfEnemiesDefeated;

void setup()
{
  
}

void loop() // New Game
{
  // New Player
  playerHealth = MAX_HEALTH;
  enemyHealth = MAX_HEALTH;
  numberOfEnemiesDefeated = 0;
  
  while (playerHealth > 0) // Fight a new enemy
  {
    // Create a new enemy
    String challengerMessage = " wild Thrak appears. UP for sword thrust, DOWN for parry, LEFT or RIGHT for slash.";
    if (numberOfEnemiesDefeated == 0)
      challengerMessage = "A" + challengerMessage;
    else
      challengerMessage = "Another" + challengerMessage;
    
    lcdOutput(challengerMessage);
    
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
  
  endGame();
}

void endGame()
{
  if (playerHealth > 0) // WIN!
  {
    lcdOutput("You have defeated all " + (String)numberOfEnemiesDefeated + " enemies!");
  }
  
  else // LOSE!
  {
    lcdOutput("You died--GAME OVER. " + (String)numberOfEnemiesDefeated + " enemies defeated.");
  }
}

int playerAttack()
{
  int joyStickPosition = getJoyStickPosition();
  
  if (joyStickPosition == UP)
    return 4;
  if (joyStickPosition == LEFT)
    return 2;
  if (joyStickPosition == RIGHT)
    return 3;
  else
  {
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

void lcdOutput(String message)
{
  // Not yet written
}
