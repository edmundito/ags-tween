## Viewport X and/or Y

    TweenViewportX(float timing, int toX, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    TweenViewportY(float timing, int toY, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    TweenViewport(float timing, int toX, int toY, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    StopTweenViewport(optional TweenStopResult)

Tweens the location of the Viewport on the X and/or Y coordinates from its current location to another.

    // Will tween the location of the viewport on the x axis from its current location to 100, and on the y axis from the current location to 20.
    TweenViewportY(3.0, 100);
    TweenViewportX(3.0, 100, 20);
    TweenViewport(3.0, 100, 20);

    // To Stop:
    StopTweenViewport();

## System Gamma

    TweenSystemGamma(float timing, int toGamma, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    StopTweenSystemGamma(optional TweenStopResult)

Tweens the screen's gamma level from its current value to another. Note that `System.SupportGammaControl` must return true in order for this method to have any effect. Range: 0 (black) - 200 (bright)

    // Will tween the screen gamma from its current value to 150 (which is 50% brighter than default).
    if (System.SupportsGammaControl) {
      TweenSystemGamma(3.0, 150);
    }

    // To Stop:
    StopTweenSystemGamma();

## Shake Screen

    TweenShakeScreen(float timing, int fromDelay, int toDelay, int fromAmount,  int toAmount, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    StopTweenShakeScreen(optional TweenStopResult)

Tweens the shake screen amount and delay from one value to another.

Ranges are Delay: from -2 to ... - Amount: from 1 to 30.


    // Will tween the shake screen amount from 1 to 15 with a constant delay of 2.
    TweenShakeScreen(3.0, 2, 2, 1, 15);

    // To Stop:
    StopTweenShakeScreen();
