
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



void welcome()
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

void endGame()
{
  if (playerHealth > 0) // WIN!
  {
    
  }
  
  else // LOSE!
  {
    lcdOutput("   You died...  ", "   GAME OVER    ");
    delay(2000);
    lcdOutput("  You defeated  ", "   " + (String)numberOfEnemiesDefeated + " monsters.  ");
    delay(2000);
    getApprovalFromUser();
    lcd.clear();
    delay(2000);
  }
}

