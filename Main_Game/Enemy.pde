const int KILLZOID = 0;
const int KILLZOID_HEALTH = 5;
const String KILLZOID_NAME = "Killzoid";

const int DODO = 1;
const int DODO_HEALTH = 2;
const String DODO_NAME = "Dodo";

String enemyName = "";
int enemyHealth = 0;
int enemyDefense = 0;

void newRandomEnemy()
{
  enemyHealth = MAX_HEALTH;
}

boolean enemyIsAlive()
{
  return enemyHealth > 0;
}

int enemyTurn()
{
  int power = getEnemyAttack();
  playerDefend(power);
}

void receiveAttack(int power)
{
  if (power > enemyDefense)
    
  enemyHealth -= (power - ;
  
  if (enemyHealth < 0)
    enemyHealth = 0;
}

