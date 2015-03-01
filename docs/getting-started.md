

# Writing your First Tween

Tweens are supported in all kinds of objects:

* Characters
* GUI
* GUI Controls
* Room Objects
* Audio
* Regions
* Viewport
* etc.

Many of each object's properties have a tween function. These properties include position, scaling,
transparency, size, etc.

To start, let's tween a GUI!

## Example

We're going to tween the `gIconbar` GUI that comes with an AGS default game. You can tween the GUI's Y coordinate by using the `TweenY` function.

The first parameter is the **Timing**, in this case measured in seconds, and the second parameter is the Y target:

    gIconbar.TweenY(0.5, -gIconbar.Height);

In half a second, the GUI will move from its current Y coordinate to minus its heights, placing the GUI vertically off the screen.

This is one the most basic Tweens that you can create. This will result in a very boring linear movement from start to end,
but you can make it more exciting by adding an optional **Easing Type**:

    gIconbar.TweenY(0.5, -gIconbar.Height, eEaseInBackTween);

This will move the GUI up as before, but this time around it will use an Ease In of type "Back".
This will first move the GUI down a bit (it goes *back* first), then move it up towards its final Y coordinate.
The back part happens in the beginning because it's an ease **In**.

There are also options to ease **Out**, or to both ease In and ease Out. You can visually see what all the
Easing types will do at [easings.net](http://easings.net).

By default, GUI Tweens are *Blocking*. If you would like to do a non-blocking Tween,
then you can control this with the next optional parameter, the **Style**:

    gIconbar.TweenY(0.5, -gIconbar.Height, eEaseInBackTween, eNoBlockTween);

Other Styles include blocking, repeat, and reverse repeat (goes in one direction first, then goes back, then it repeats).

The next optional parameter is the **Start Delay**. This allows you to start the Tween a few seconds later
instead of immediately:

    gIconbar.TweenY(0.5, -gIconbar.Height, eEaseInBackTween, eNoBlockTween, 1.0);

This will wait 1 second, then start the Tween. The tween will complete at 1.5 seconds
(0.5 duration + 1.0 delay) from the time this function was called in the script.

The last optional parameter is the **Timing Type**. By default, all Tweens are
set to be timed in seconds, but you can also set it to *speed*, which can roughly measured as pixels/second:

    gIconbar.TweenY(
      100.0,
      -gIconbar.Height,
      eEaseInBackTween,
      eNoBlockTween,
      1.0,
      eTweenSpeed
    );

This will start the same tween as before, but instead of lasting half a second regardless of where the GUI is located,
it is based on how long it takes the GUI to move from its current Y coordinate to off screen at a speed of 100 pixels per second.

Finally, you can immediately **Stop** all position Tweens affecting the `gIconbar`:

    gIconbar.StopTweenPosition();

By default, it will stop the GUI wherever it is located. You can optionally determine the
**Result** of how the Tween is stopped:

    gIconbar.StopTweenPosition(eFinishTween);

This will set the GUI's Y coordinate to the end of the Tween immediately. You can also use `eResetTween`, which
will reset the GUI's Y coordinate back to the start of the Tween.

## Recap

You can create Tweens that are very simple or fairly complex. The parameters you can add to any tween function include:

1. Timing (seconds or speed depending on what Timing is)
2. End Location (this could be more than one parameter depending on the tween)
3. Easing Type (optional)
4. Style (optional: Blocking, No Blocking, Repeat, and Reverse Repeat)
5. Start Delay (optional, in seconds only)
6. Timing Type (optional: to determine if the timing is in seconds or speed)

You can stop all the Tweens applied to an object using a `StopTween*` function. You can stop it
in at its current location, set it to the end of the Tween, or reset it back to the start of the Tween.
