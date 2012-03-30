#define X_AXIS A0;
#define Y_AXIS A1;

const int MID_VALUE = 512;
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
    
    thisPercent = getPercent(UP);
    for (i = 0; i < 4; i++)
    {
      if (thisPercent > highestPercent)
      {
        highestPercent = thisPercent;
        highestDirection = i;
      }
    }
  }
}

double getPercentTilt(int arrow)
{
  if (arrow == UP)
    return (analogRead(Y_AXIS) - MID_VALUE) / MID_VALUE;
  if (arrow == DOWN)
    return -1 * getPercentTilt(UP);
  if (arrow == LEFT)
    return (analogRead(X_AXIS) - MID_VALUE) / MID_VALUE;
  if (arrow == RIGHT)
    return -1 * getPercentTilt(LEFT);
  
  else return 0;
}

