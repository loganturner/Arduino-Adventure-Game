
private:
const int MAX_HEALTH = 5;
int enemyHealth;
int enemyDefense;

Public:
public void newEnemy()
{
  enemyHealth = MAX_HEALTH;
}

boolean enemyIsAlive()
{
  return enemyHealth > 0;
}

int enemyTurn()
{
  
  playerHealth -= (3 - playerDefense);
}

void receiveAttack(int power)
{
  if (power > enemyDefense)
    
  enemyHealth -= (power - ;
  
  if (enemyHealth < 0)
    enemyHealth = 0;
}

