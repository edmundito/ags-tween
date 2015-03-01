The `TweenMaths` object adds additional functions that AGS's `Maths` object does not contain.
These functions are also used internally by the Tween module.

## Abs

    static float TweenMaths.Abs(float value)

Returns the absolute value of a float.

    float value = TweenMaths.Abs(1.0); // Returns 1.0
    value = TweenMaths.Abs(-1.0);      // Returns 1.0

## ClampFloat

    static float TweenMaths.ClampInt(float value, float min, float max)

Returns a float value between a min and max values.

    // Will return a value between 1.0 and 100.0:
    float value = TweenMaths.ClampFloat(someValue, 1.0, 100.0);

## ClampInt

    static int TweenMaths.ClampInt(int value, int min, int max)

Returns an int value between a min and max values.

    // Will return a value between 0 and the room's width:
    int value = TweenMaths.ClampInt(player.x, 0, Room.Width);

## GetDistance

    static float TweenMaths.GetDistance(int fromX, int fromY, int toX, int toY)

Returns the distance (as a float) between two points.

    float distance = TweenMaths.GetDistance(player.x, player.y, cFriend.x, cFriend.y);
    WaitSeconds(distance * 0.5);

## Lerp

    static int TweenMaths.Lerp(float from, float to, float t)

Interpolates from one float to another based on a decimal factor. Returns int.

    // Move the player from position 0 to 100 in 100 loops:
    float t = 0.0;
    while (t <= 1.0) {
      player.x = TweenMaths.Lerp(0.0, 100.0, t);
      Wait(1);
      t = t + 0.01;
    }

## MaxFloat

    static float TweenMaths.MaxFloat(float a, float b)

Returns the largest float value.

    static float value = TweenMaths.MaxFloat(1.0, 100.0); // Returns 100.0

## MaxInt

    static int TweenMaths.MaxInt(int a, int b)

Returns the largest int value.

    static int value = TweenMaths.MaxInt(1, 100); // Returns 100


## MinFloat

    static int TweenMaths.MinFloat(float a, float b)

Returns the smallest float value.

    float value = TweenMaths.MinFloat(1.0, 100.0); // Returns 1.0

## MinInt

    static int TweenMaths.MinInt(int a, int b)

Returns the smallest int value.

    int value = TweenMaths.MinInt(1, 100); // Returns 1
