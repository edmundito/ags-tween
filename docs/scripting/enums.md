## TweenEasingType

Used to set the easing of the tween, whether it's just a linear interpolation,
one that only accelerates when it starts, one that only decelerates when it ends,
or whether the curve is a sine, quad, cubic, etc.

You can see a demo of these each type at [easings.net](http://easings.net/).

    enum TweenEasingType {
      eEaseLinearTween,

      eEaseInSineTween,
      eEaseOutSineTween,
      eEaseInOutSineTween,

      eEaseInQuadTween,
      eEaseOutQuadTween,
      eEaseInOutQuadTween,

      eEaseInCubicTween,
      eEaseOutCubicTween,
      eEaseInOutCubicTween,

      eEaseInQuartTween,
      eEaseOutQuartTween,
      eEaseInOutQuartTween,

      eEaseInQuintTween,
      eEaseOutQuintTween,
      eEaseInOutQuintTween,

      eEaseInCircTween,
      eEaseOutCircTween,
      eEaseInOutCircTween,

      eEaseInExpoTween,
      eEaseOutExpoTween,
      eEaseInOutExpoTween,

      eEaseInBackTween,
      eEaseOutBackTween,
      eEaseInOutBackTween,

      eEaseInElasticTween,
      eEaseOutElasticTween,
      eEaseInOutElasticTween,

      eEaseInBounceTween,
      eEaseOutBounceTween,
      eEaseInOutBounceTween
    };  

## TweenStyle

Used to set the style of the tween, whether is blocking, non-blocking, repeating,
or repeating with reverse (where at the end of the tween cycle and repeats, it reverses
the direction of the tween).

    enum TweenStyle {
      eBlockTween,
      eNoBlockTween,
      eRepeatTween,
      eReverseRepeatTween
    };

## TweenTiming

Used to indicate if the tween is timed by seconds or by speed. When timed by speed,
the duration is seconds is computed based on the start and end distance.

    enum TweenTiming {
      eTweenSeconds,
      eTweenSpeed,
    };

## TweenStopResult

Used to set how a tween should stop when any of the stop tween functions are called,
whether it should stay where it is (pause), complete the tween immediately (finish),
or go back to where it started (reset).

    enum TweenStopResult {
      ePauseTween,
      eResetTween,
      eFinishTween
    };
