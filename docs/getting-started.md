

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

To start, let's tween a Character.

## Example

We're going to use the `player` Character. You can tween its Y position by using the `TweenY` function.

The first parameter is the **Amount**, in this case measure in seconds, and the second is the Y destination:

    player.TweenY(0.5, player.y - 50);

In half a second, the Tween will move the player Character from its current Y to 50 pixels up.

That is the most basic Tween you can create. This will create a very boring movement from start to end,
but you can also make it a bit more dynamic by adding an **Easing**:

    player.TweenY(0.5, player.y - 50, eEaseInElasticTween);

This will move the character up again, but this time around it will use an Elastic Ease In.
This creates an effect where the character springs down (The Elastic effect) and then quickly moves
up to ts final position. The elastic effect happens in the beginning because it's an ease **in**.

There are also options to ease out, or to both ease in and ease out. You can see more of these
Easing types at [easings.net](http://easings.net).

By default, Character Tweens are *Blocking*. If you would like to do a non-blocking Tween,
then you can control this with the next argument, the **Style**:

    player.TweenY(0.5, player.y - 50, eEaseInElasticTween, eNoBlockTween);

The next parameter is the **Start Delay**. This allows you to start the Tween a few seconds later
instead of immediately:

    player.TweenY(0.5, player.y - 50, eEaseInElasticTween, eNoBlockTween, 1.0);

This will start the Tween 1 second after this line of code is run by the AGS engine.

The last parameter is the **Timing**. By default, all Character Tweens are
set to be timed in seconds, but you can also set it to speed, which is roughly measured as pixels/second:

    player.TweenY(100.0, player.y - 50, eEaseInElasticTween, eNoBlockTween, 1.0, eTweenSpeed);

This will start the same tween, but instead of lasting half a second, it is based on how long
it takes the character from its position to 50 pixels above at a 100 pixels/second speed.

Finally, you can immediately **Stop** all the Tweens affecting the player character:

    player.StopAllTweens();

By default, it will stop the Character wherever its at. You can also determine the
**Result** of how the Tweens are stopped:

    player.StopAllTweens(eFinishTween);

This will set the Character to the end of the Tween instead. You can also use `eResetTween`, which
will reset the Character Y back to the start of the Tween.

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
