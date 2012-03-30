int playerHealth = 0;
int playerDefense = 0;

void newPlayer()
{
  playerHealth = 10;
  welcomeMessage();
}

boolean playerIsAlive()
{
  return playerHealth > 0;
}

void playerTurn()
{
  playerDefense = 0;
  int power = getPlayerAttack();
  enemyDefend(power);
}

int getPlayerAttack()
{
  playerDefense = 0;
  playerAttackMessage();
  
  int p = getJoyStickPosition();
  
  playerAttackDescription(p);
  
    if (p == UP)
      return random(0, 6);
    if (p == DOWN) {
      playerDefense = 2;
      return 0; }
    if (p == LEFT)
      return random(0, 5);
    if (p == RIGHT)
      return random(0, 4);
}

void playerDefend(int power)
{
  int damage = power - playerDefense;
  if (damage < 0)
    damage = 0;
  playerHealth -= damage;
  if (playerHealth < 0)
    playerHealth = 0;
    
  playerDamageMessage(damage);
  
  if (!playerIsAlive())
  {
    playerDefeatedMessage();
    lossTone();
  }
  else
    playerHealthMessage(playerHealth);
  playerDefense = 0;
}


