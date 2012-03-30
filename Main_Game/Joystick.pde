#define X_AXIS 0
#define Y_AXIS 1

// Full UP is y = 0
// Full DOWN is y = 1020
// Full LEFT is x = 0
// Full RIGHT is x = 1020

const int MID_VALUE = 510;
const double TILT_THRESHOLD = 0.5;

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
    double highestPercent = 0.0;
    double thisPercent = 0.0;
    
    for (int i = 0; i < 4; i++)
    {
      thisPercent = getPercentTilt(i);
      if (thisPercent > highestPercent)
      {
        highestPercent = thisPercent;
        highestDirection = i;
      }
    }
    if (highestPercent > TILT_THRESHOLD)
      return highestDirection;
  }
}

double getPercentTilt(int arrow)
{
  if (arrow == UP)
    return -1 * getPercentTilt(DOWN);
  if (arrow == DOWN)
    return (analogRead(Y_AXIS) - MID_VALUE) / MID_VALUE;
  if (arrow == LEFT)
    return -1 * getPercentTilt(RIGHT);
  if (arrow == RIGHT)
    return (analogRead(X_AXIS) - MID_VALUE) / MID_VALUE;
  
  else 
    return 0.0;
}

