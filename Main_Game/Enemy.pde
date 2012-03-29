int enemyHealth;
int enemyDefense;

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
