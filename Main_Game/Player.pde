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
    if (p == UP)
      return 4;
    if (p == DOWN) {
      playerDefense = 2;
      return 0; }
    if (p == LEFT)
      return 2;
    if (p == RIGHT)
      return 2;
}

void playerDefend(int power)
{
  
}


