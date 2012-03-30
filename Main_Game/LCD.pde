
void lcdOutput(String line)
{
  lcd.clear();
  lcd.setCursor(0,0);
  lcd.print(line);
}

void lcdOutput(String firstLine, String secondLine)
{
  lcd.clear();
  lcd.setCursor(0,0);
  lcd.print(firstLine);
  lcd.setCursor(0,1);
  lcd.print(secondLine);
}

void startGameMessage()
{
  lcdOutput("(tilt the stick)");
  delay(500);
  getApprovalFromUser();
}

void findNewEnemyMessage(String name, int health)
{
    lcdOutput("Finding enemy...", "");
    for(int i = 0; i < 16; i++)
    {
      lcd.setCursor(i, 1);
      lcd.print("*");
      delay(80);
    }
    
    lcdOutput("");
    delay(1000);
    lcd.print("Lv. " + (String)health + " \"" + name + "\"");
    newEnemyTone();
    lcd.setCursor(0,1);
    lcd.print("Engage?   ");
    lcd.print("(Y/N) ");
}

void enemyIgnoredMessage()
{
  lcdOutput("   You ignore   ", "    that one.   ");
  delay(1000);
}

void playerAttackDescription(int arrow)
{
  switch (arrow)
  {
    case 0:
      lcdOutput("You thrust your ", "sword into it-- ");
      break;
    case 1:
      lcdOutput("You raise your ", "sword to parry--");
      break;
    case 2:
      lcdOutput("   You strike   ", "  backhanded--  ");
      break;
    case 3:
      lcdOutput("   You strike   ", "  forehanded--  ");
      break;
  }
  delay(2000);
}

void playerAttackMessage()
{
  lcdOutput("Attack!   (U)   ", "       (L)(D)(R)");
  delay(500);
}

void playerDamageMessage(int damage)
{
  lcdOutput((String)enemyName + " deals", "you " + (String)damage + " damage.");
  delay(2000);
}

void playerHealthMessage(int health)
{
  lcdOutput("Now your", "health is " + (String)health + ". ");
  delay(2000);
  lcd.clear();
  delay(1000);
}

void playerDefeatedMessage()
{
  lcdOutput("    Oh noes--   ", "    You die!   ");
}

void enemyDamageMessage(int damage)
{
  lcdOutput(enemyName + " takes ", (String)damage + " damage.");
  delay(2000);
}

void enemyDefeatedMessage()
{
  lcdOutput("This " + enemyName, "is dead.");
}

void welcomeMessage()
{
  lcdOutput("    Welcome!    ", " -------------- ");
  openingTone();
  delay(500);
  lcdOutput(" Tilt stick UP, ", " LEFT, or RIGHT ");
  delay(2000);
  lcdOutput("to attack. Tilt", "DOWN to defend.");
  delay(2000);
  lcd.clear();
  delay(1000);
}

void endGameMessage()
{
  lcdOutput("      GAME      ");
  delay(750);
  lcd.setCursor(0,1);
  lcd.print("      OVER      ");
}

void endScoreMessage()
{
  lcdOutput("  You defeated  ", "   " + (String)numberOfEnemiesDefeated + " enemies.");
  delay(5000);
}

