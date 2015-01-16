# TweenMaths

The `TweenMaths` object adds additional functions that AGS's `Maths` object does not contain.
These functions are also used internally by the Tween module.

## Abs

`float TweenMaths.Abs(float value)`

Returns the absolute value of a float.

float value = TweenMaths.Abs(1.0); // Returns 1.0
value = TweenMaths.Abs(-1.0);      // Returns 1.0

## GetDistance

`float TweenMaths.GetDistance(int fromX, int fromY, int toX, int toY)`

Returns the distance (as a float) between two points.

float distance = TweenMaths.GetDistance(0, 0, 5, 10);
WaitSeconds(distance * 0.5);

## Lerp

`int TweenMaths.Lerp(float from, float to, float amount)`

Interpolates from one float to another based on a decimal factor. Returns int.

// Move the player from position 0 to 100 in 100 loops:
float amount = 0.0;
while (amount <= 1.0) {
  player.x = TweenMaths.Lerp(0.0, 100.0, amount);
  Wait(1);
  amount = amount + 0.01;
}

## MinInt

`int TweenMaths.MinInt(int a, int b)`

Returns the smallest int value.

int value = TweenMaths.MinInt(1, 100); // Returns 1

## MaxInt

`int TweenMaths.MaxInt(int a, int b)`

Returns the largest int value.

int value = TweenMaths.MaxInt(1, 100); // Returns 100

## ClampInt

`int TweenMaths.ClampInt(int value, int min, int max)`

Returns an int between a min and max values.

// Will return a value between 0 and the room's width:
int value = TweenMaths.ClampInt(player.x, 0, Room.Width);
