`Tween` is a custom Tween object. You can use custom Tweens for advance use, or to have more manual control.

    Tween customTween;
    customTween.Init(5.0, 0, 100);
    while (customTween.IsPlaying()) {
      customTween.Update();
      player.x = customTween.Value;
      Wait(1);
    }

If you're advance scripter, `Tween` is actually extends the `TweenBase` struct. This is
shared between the internal tweens and the custom tweens. This documentation does not
distinguish `TweenBase`, however.

# Instance Properties

## Duration

    readonly float Tween.Duration;

## EasingType

    readonly TweenEasingType Tween.EasingType;

## Elapsed

    readonly float Tween.Elapsed;

## FromValue

    readonly float Tween.FromValue;

## StartDelay

    readonly float Tween.StartDelay;

## ToValue

    readonly float Tween.ToValue;

## Value

    readonly int Tween.Value;


# Instance Functions

## GetProgress

    import float GetProgress()

Returns the progress from 0.0 to 1.0.

## Init

    int Tween.Init(float amount, int fromValue, int toValue,
      optional TweenEasingType easingType, optional TweenStyle style,
      optional float startDelay, optional TweenTiming timing)

Initializes a tween. Returns the duration (in loops).

## IsPlaying

    bool Tween.IsPlaying()

Returns true if the tween is playing.

    Tween customTween;
    customTween.Init(5.0, 0, 100);
    while (customTween.IsPlaying()) {
      customTween.Update();
      player.x = customTween.Value;
      Wait(1);
    }


## Reverse

    function Tween.Reverse()

Reverses the direction of the tween.

    Tween customTween;
    customTween.Init(5.0, 0, 100);
    int reverseCount = 0;
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
    customTween.Init(5.0, 0, 100);
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

    function Tween.Stop(optional TweenStopResult result)

Stops the tween. By default, the `TweenStopResult` is to pause.

## Update

    bool Tween.Update()

Moves the tween forward in time.

    Tween customTween;
    customTween.Init(5.0, 0, 100);
    while (customTween.IsPlaying()) {

      // Without this, the tween will not advance
      // and it would get stuck in an infinite while loop:
      customTween.Update();

      player.x = customTween.Value;
      Wait(1);
    }


# Static Functions

## Tween.IncreaseGameSpeedOnBlock

    static function Tween.IncreaseGameSpeedOnBlock(bool value)

Increases the game speed when a blocking tween is playing.

## Tween.IncreaseGameSpeed
    static function Tween.IncreaseGameSpeed()

Increases the game speed to at least 60 for better tweening quality.


## Tween.RestoreGameSpeed

    static function Tween.RestoreGameSpeed()

Restores the game speed back to its original.


## Tween.StopAll

    static function Tween.StopAll(optional TweenStopResult result)

Stops all Tweens that are currently running.

## Tween.WaitForAllToFinish

  static function Tween.WaitForAllToFinish()

Waits until all non-looping Tweens are finished playing.
