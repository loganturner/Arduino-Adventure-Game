#define X_AXIS 0
#define Y_AXIS 1

// Full UP is y = 0
// Full DOWN is y = 1020
// Full LEFT is x = 0
// Full RIGHT is x = 1020

const int MID_VALUE = 510;
const int TILT_THRESHOLD = 250;

const int UP = 0;
const int DOWN = 1;
const int LEFT = 2;
const int RIGHT = 3;

boolean getApprovalFromUser()
{
  while (true)
  {
    int selected = getJoyStickPosition();
    if (selected == UP || selected == LEFT)
      return true;
    if (selected == DOWN || selected == RIGHT)
      return false;
  }
}

int getJoyStickPosition()
{
  while (true)
  {
    int highestDirection = 0;
    int highestAmount = 0;
    int thisAmount = 0;
    
    for (int i = 0; i < 4; i++)
    {
      thisAmount = getAmountTilt(i);
      if (thisAmount > highestAmount)
      {
        highestAmount = thisAmount;
        highestDirection = i;
      }
    }
    if (highestAmount > TILT_THRESHOLD)
      return highestDirection;
  }
}

int getAmountTilt(int arrow)
{
  if (arrow == UP)
    return -1 * getAmountTilt(DOWN);
  if (arrow == DOWN)
    return analogRead(Y_AXIS) - MID_VALUE;
  if (arrow == LEFT)
    return -1 * getAmountTilt(RIGHT);
  if (arrow == RIGHT)
    return analogRead(X_AXIS) - MID_VALUE;
  
  else 
    return 0;
}

