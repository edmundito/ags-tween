

# Writing your First Tween

Tweens are supporting in all kinds of entities within AGS:

* Characters
* GUI
* GUI Controls
* Room Objects
* Audio
* Viewports
* etc.

Depending on the type of properties can be tweened. This can include position, scaling,
transparency, size, etc.

To start, let's tween a GUI!

## Example

We're going to use the `gIconbar` GUI that comes with the default game. You can tween its Y position by using the `TweenY` function.

The first parameter is the **Amount**, in this case measure in seconds, and the second is the Y destination:

    gIconbar.TweenY(0.5, -gIconbar.Width);

In half a second, the Tween will move the GUI from its current Y to vertically off the screen.

That is the most basic Tween you can create. This will create a very boring movement from start to end,
but you can also make it a bit more dynamic by adding an **Easing**:

    gIconbar.TweenY(0.5, -gIconbar.Width, eEaseInBackTween);

This will move the GUI up, but this time around it will use an Back Ease In.
This will first move the GUI down a bit (it goes *back* first), then move it up to its final Y position.
The back part happens in the beginning because it's an ease **in**.

There are also options to ease out, or to both ease in and ease out. You can see more of these
Easing types at [easings.net](http://easings.net).

By default, GUI Tweens are *Not Blocking*. If you would like to do a blocking Tween,
then you can control this with the next argument, the **Style**:

    gIconbar.TweenY(0.5, -gIconbar.Width, eEaseInBackTween, eBlockTween);

The next parameter is the **Start Delay**. This allows you to start the Tween a few seconds later
instead of immediately:

    gIconbar.TweenY(0.5, -gIconbar.Width, eEaseInBackTween, eBlockTween, 1.0);

This will start the Tween 1 second after this line of code is run by the AGS engine.

The last parameter is the **Timing**. By default, all Tweens are
set to be timed in seconds, but you can also set it to speed, which is roughly measured as pixels/second:

    gIconbar.TweenY(
      100.0,
      -gIconbar.Width,
      eEaseInBackTween,
      eBlockTween,
      1.0,
      eTweenSpeed
    );

This will start the same tween, but instead of lasting half a second regardless of where the GUI is located,
it is based on how long it takes the GUI to move from its Y to off screen at a 100 pixels/second speed.

Finally, you can immediately **Stop** the position Tweens affecting the `gIconbar`:

    gIconbar.StopTweenPosition();

By default, it will stop the GUI wherever its at. You can also direct the
**Result** of how the Tweens are stopped:

    gIconbar.StopTweenPosition(eFinishTween);

This will set the GUI Y to the end of the Tween immediately. You can also use `eResetTween`, which
will reset the GUI Y back to the start of the Tween.

## Recap

You can create Tweens that are simple or fairly complex. The arguments you can add to the tween include:

1. Amount (seconds or speed depending on what Timing is)
2. End Location (this could be more than one argument depending on the tween)
3. Easing (optional)
4. Style (optional: Blocking, No Blocking, Repeat, and Reverse Repeat)
5. Start Delay (optional, in seconds)
6. Timing (optional: is the first Amount seconds or speed?)

You can stop all the Tweens applied to an instance using the `StopAllTweens` function. You can stop it
in its current form, set it to the end of the Tween, or reset it back to the start of the Tween.
