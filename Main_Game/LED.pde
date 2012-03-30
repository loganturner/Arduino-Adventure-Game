#define LED 3

void initLED()
{
  digitalWrite(LED, false);
}

void healthWarning(int health)
{
  if (health < 4)
    digitalWrite(LED, true);
  else
    digitalWrite(LED, false);
}
