#define MAX_HEALTH 5
#define DEFAULT_LOCATION 0

void setup()
{
  int playerHealth;
  int enemyHealth;
  
}

void loop() // New Game
{
  /* Reset Player's and Enemy's health */
  playerHealth = MAX_HEALTH;
  enemyHealth = getRandomEnemyHealth();
  
  lcdOutput("A wild Thrak appears. UP for sword thrust, DOWN for parry, LEFT or RIGHT for slash.");
  
  
}
