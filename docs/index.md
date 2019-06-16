# Tween Module for Adventure Game Studio

[The Tween Module](https://github.com/edmundito/ags-tween/) is a script module for [Adventure Game Studio (AGS)](http://www.adventuregamestudio.co.uk) that can be
used to script "inbetweening". The module allows you to control many properties in
GUIs, GUI controls, Room Objects, Characters, Region, Audio, and more. It allows these
inbetweens to be blocking, non blocking, or to loop them, and it features acceleration/deceleration
easing functions.

See [Getting Started](getting-started.md) for the basics.

## Example Usage

    function _tweenDisplay(int transparency, int toX, int toY, int toWidth, int toHeight, TweenEasingType easing) {
      float delay = 0.0;
      if(transparency > 50) {
        delay = 0.4;
      }
      gDisplay.StopAllTweens();
      WaitForLongest(
        gDisplay.TweenTransparency(0.1, transparency, eEaseLinearTween, eNoBlockTween, delay),
        gDisplay.TweenPosition(0.5, toX, toY, easing, eNoBlockTween),
        gDisplay.TweenSize(0.5, toWidth, toHeight, easing, eNoBlockTween)
        );
    }

## Installation

1. Download the module from [here](https://github.com/edmundito/ags-tween/releases).
1. Open the AGS Editor and your game.
2. Remove the existing Tween module from the AGS Editor: Right-click on it and select "Delete".
3. Import `Tween.scm`: Right-click in Scripts and select "Import..."
4. Make sure that the Tween module is at the top or close to the top of the script list:
  In AGS 3.3 or above you can drag the script.
  In earlier versions, you can right-click and select "Move Up" until it's at the top.
5. If you were using Tween 1.x, then you can also import `Tween1Compatiblity.scm`.
  Make sure that it is placed right below the Tween script module.

## Support

You can [reply to the Tween thread](https://www.adventuregamestudio.co.uk/forums/index.php?board=10.0) in the Modules & Plugins AGS forum.

You can also [ask in #tween_module_support](https://discord.gg/vmuCyWX) in the AGS Discord server.
