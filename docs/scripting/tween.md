`Tween` is a custom Tween object. You can use custom Tweens for advance use, or to have more manual control.

    Tween customTween;
    customTween.Init(5.0, 0, 100); // In 5 seconds, value goes from 0 to 100.
    while (customTween.IsPlaying()) {
      customTween.Update();
      player.x = customTween.Value;
      Wait(1);
    }

If you're a very advanced scripter, `Tween` actually extends a `TweenBase` struct. This is
shared between the internal tweens and the custom tweens. However, this documentation does not
distinguish between `Tween` and `TweenBase`.

# 1. Properties

## Duration

    readonly float Tween.Duration;

Returns the duration in loops. This can be set with the `Init` function.

## EasingType

    readonly TweenEasingType Tween.EasingType;

Returns the `TweenEasingType`. This can be set with the `Init` function.

## Elapsed

    readonly float Tween.Elapsed;

Returns the `Elapsed` loops.

## FromValue

    readonly float Tween.FromValue;

Returns the start value. This can be set with the `Init` function.

## StartDelay

    readonly float Tween.StartDelay;

Returns the start delay. This can be set with the `Init` function.

## Style

    readonly float Tween.Style;

Returns the `TweenStyle`. This can be set with the `Init` function.

## ToValue

    readonly float Tween.ToValue;

Returns the end value. This can be set with the `Init` function.

## Value

    readonly int Tween.Value;

Returns the current value as an integer. This is set primarily by the `Update` function.


# 2. Functions

## GetProgress

    import float Tween.GetProgress()

Returns the progress in a float value between 0.0 to 1.0.

## Init

    int Tween.Init(float timing, int fromValue, int toValue,
      optional TweenEasingType, optional TweenStyle,
      optional startDelay, optional TweenTimingType)

Initializes a tween. Returns the duration (in loops).

## IsPlaying

    bool Tween.IsPlaying()

Returns `true` if the tween is playing and needs more `Update` calls to finish.

    Tween customTween;
    customTween.Init(5.0, 0, 100); // In 5 seconds, value goes from 0 to 100.
    while (customTween.IsPlaying()) {
      customTween.Update();
      player.x = customTween.Value;
      Wait(1);
    }


## Reverse

    function Tween.Reverse()

Reverses the start and end of the tween.

    Tween customTween;
    customTween.Init(5.0, 0, 100); // In 5 seconds, value goes from 0 to 100.
    int reverseCount = 0;
    // Bounce the player back and forth 5 times.
    while (reverseCount < 5) {
      if (!customTween.IsPlaying()) {
        customTween.Reverse();
        reverseCount += 1;
      }
      customTween.Update();
      player.x = customTween.Value;
      Wait(1);
    }

## Restart

    function Tween.Restart()

Restarts the tween.

    Tween customTween;
    customTween.Init(5.0, 0, 100); // In 5 seconds, value goes from 0 to 100.
    int repeatCount = 0;
    while (repeatCount < 5) {
      if (!customTween.IsPlaying()) {
        customTween.Restart();
        repeatCount += 1;
      }
      customTween.Update();
      player.x = customTween.Value;
      Wait(1);
    }

## Stop

    function Tween.Stop(optional TweenStopResult)

Stops the tween. By default, the `TweenStopResult` is to pause (`ePauseTween`).

## Update

    bool Tween.Update()

Moves the tween forward in time by one loop.

    Tween customTween;
    customTween.Init(5.0, 0, 100); // In 5 seconds, value goes from 0 to 100.
    while (customTween.IsPlaying()) {

      // Without this, the tween will not advance
      // and it would get stuck in an infinite while loop:
      customTween.Update();

      player.x = customTween.Value;
      Wait(1);
    }
