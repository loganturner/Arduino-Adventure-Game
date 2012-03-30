
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

void findNewEnemyMessage(String name, int health)
{
    lcdOutput("Finding ememy...", "");
    for(int i = 0; i < 16; i++)
    {
      lcd.setCursor(i, 1);
      lcd.print("*");
      delay(175);
    }
    
    lcdOutput("Found ");
    delay(1000);
    lcd.print("Lv" + (String)health + " " + name);
    delay(2000);
    lcd.setCursor(0,1);
    lcd.print(" Engage?  ");
    delay(500);
    lcd.print("(Y/N) ");
}

void enemyIgnoredMessage()
{
  lcdOutput("  You ignored   ", "    that one.   ");
  delay(2000);
}

void playerAttackMessage()
{
  lcdOutput("Attack!   (U)   ", "       (L)(D)(R)");
  delay(500);
}

void enemyDamageMessage(int damage)
{
  lcdOutput(" The enemy took ", "   " + (String)damage + " damage.   ");
  delay(2000);
}

void enemyDefeatedMessage()
{
  lcdOutput(" This " + enemyName, "    is dead.    ");
  delay(2000);
}

void welcomeMessage()
{
  lcdOutput("    Welcome!    ", "  ------------  ");
  delay(3000);
  lcdOutput(" Push stick UP, ", " LEFT, or RIGHT ");
  delay(2000);
  lcdOutput("to attack. Push", "DOWN to defend.");
  delay(3000);
  lcd.clear();
  delay(2000);
}

void endGameMessage(number)
{
    lcdOutput("   You died...  ", "   GAME OVER    ");
    delay(2000);
    lcdOutput("  You defeated  ", "   " + (String)number + " monsters.  ");
    delay(2000);
    getApprovalFromUser();
    lcd.clear();
    delay(2000);
}

