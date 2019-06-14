## Tween.IncreaseGameSpeedOnBlock

    static function Tween.IncreaseGameSpeedOnBlock(bool value)

If `true`, then it automatically increases the game speed when a blocking tween is playing.
It will restore the game speed back to its original speed when the blocking tween stops playing.

## Tween.IncreaseGameSpeed

    static function Tween.IncreaseGameSpeed()

Increases the game speed to at least 60 loops per second (unless your game is set to a faster game speed than that). This produces improved tween quality.


## Tween.RestoreGameSpeed

    static function Tween.RestoreGameSpeed()

Restores the game speed back to the previous speed before `IncreaseGameSpeed` was called.


## Tween.StopAll

    static function Tween.StopAll(optional TweenStopResult)

Stops all Tweens that are currently running.

## Tween.WaitForAllToFinish

    static function Tween.WaitForAllToFinish()

Waits until all non-looping and non-blocking Tweens are finished playing.
