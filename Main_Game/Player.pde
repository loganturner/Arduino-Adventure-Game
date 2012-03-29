
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
  
}

int playerAttack()
{
  playerDefense = 0;
  
  lcdOutput("Your turn!(U)   ", "       (L)(D)(R)");
  delay(500);
  switch (getJoyStickPosition())
  {
    case 0:
      enemyHealth -= 4;
      break;
    case 1:
      playerDefense = 2;
      break;
    case 2:
      enemyHealth -= 2;
    case 3:
      enemyHealth -= 2;
  }
}

