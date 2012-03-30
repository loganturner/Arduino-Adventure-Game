String enemyName = "";
int enemyHealth = 0;
int enemyMaxAttack = 0;
int enemyDefense = 0;

void newRandomEnemy()
{
  switch ((int)random(0, 2))
  {
    case 0:
      enemyName = "Dodo";
      enemyHealth = 2;
      enemyMaxAttack = 2;
      break;
    case 1:
      enemyName = "Kilzoid";
      enemyHealth = 5;
      enemyMaxAttack = 5;
      break;
  }
  
  findNewEnemyMessage(enemyName, enemyHealth);
}

boolean enemyIsAlive()
{
  return enemyHealth > 0;
}

void enemyTurn()
{
  enemyDefense = 0;
  int power = getEnemyAttack();
  playerDefend(power);
}

int getEnemyAttack()
{
  return (int)random(0, enemyMaxAttack + 1);
}

void enemyDefend(int power)
{
  int damage = power - enemyDefense;
  if (damage < 0)
    damage = 0;
  enemyHealth -= damage;
  if (enemyHealth < 0)
    enemyHealth = 0;
    
  enemyDamageMessage(damage);
  
  if (!enemyIsAlive())
    enemyDefeatedMessage();
  enemyDefense = 0;
}

