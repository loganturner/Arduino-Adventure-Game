
private:

int playerHealth;
int playerDefense;

public:

void newPlayer()
{
  
}

boolean playerIsAlive()
{
  return playerHealth > 0;
}

void playerTurn()
{
  int power = getPlayerAttack();
  enemyDefend(power);
}

int getPlayerAttack()
{
  playerDefense = 0;
  
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
}

