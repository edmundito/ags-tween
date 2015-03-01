## SecondsToLoops

    int SecondsToLoops(float seconds)

Converts number of seconds to number of game loops.

    Wait(SecondsToLoops(5.0)); // Waits 5 seconds

## LoopsToSeconds

    float LoopsToSeconds(int loops)

Converts number of loops to number seconds.

    float seconds = LoopsToSeconds(40); // If the game speed is 40, then it returns 1.0

## WaitSeconds

    WaitSeconds(float seconds)

Waits a number of seconds.

    WaitSeconds(5.5); // Same as: Wait(FloatToInt(IntToFloat(GetGameSpeed()) * 5.5, eRoundNearest));

## WaitForLongest

    WaitForLongest(int timerID, int duration1, int duration2, optional int duration3,
                   optional int duration4, optional int duration5, optional int duration6)

Waits for the longest duration (based on game loops). Supports up to 6 durations.

    // Will start both Tweens at once, but wait until the longest one ends:
    WaitForLongest(
        gIconbar.TweenX(5.0, 100, eEaseLinearTween),
        gIconbar.TweenY(15.0, 50, eEaseLinearTween),  // Will wait 15 seconds!
        gIconbar.TweenFadeOut(10.0)
    );

## SetTimerWithSeconds

    SetTimerWithSeconds(int timerID, float seconds)

Sets a Timer using seconds instead of game loops.

    SetTimerWithSeconds(1, 10.0); // Timer 1 is set to 10 seconds

## SetTimerForLongest

    SetTimerForLongest(int timerID, int timeout1, int timeout2, optional int timeout3,
                       optional int timeout4, optional int timeout5, optional int timeout6)

Sets the timer for the longest timeout (based on game loops). Supports up to 6 timeouts.

    // Will set the timer 1 duration based on the longest tween:
    SetTimerForLongest(
        1,
        gIconbar.TweenX(5.0, 100, eEaseLinearTween),
        gIconbar.TweenY(15.0, 50, eEaseLinearTween), // Sets the timer to 15 seconds!
        gIconbar.TweenFadeOut(10.0)
    );
