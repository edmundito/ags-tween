# General

## Stop All Tweens

    Character.StopAllTweens(optional TweenStopResult)
    GUI.StopAllTweens(optional TweenStopResult)
    Object.StopAllTweens(optional TweenStopResult)
    Region.StopAllTweens(optional TweenStopResult)
    Label.StopAllTweens(optional TweenStopResult)
    Button.StopAllTweens(optional TweenStopResult)
    TextBox.StopAllTweens(optional TweenStopResult)
    ListBox.StopAllTweens(optional TweenStopResult)
    Slider.StopAllTweens(optional TweenStopResult)
    InvWindow.StopAllTweens(optional TweenStopResult)

Stops all the tweens currently playing on the a character, GUI, room object, etc.

    // Will stop all the tweens for cEgo, cIconbar, and oBluecup.
    cEgo.StopAllTweens();
    gIconbar.StopAllTweens();
    oBluecup.StopAllTweens();


## Position, X, or Y

    Character.TweenPosition(float timing, int toX, int toY, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    GUI.TweenPosition(float timing, int toX, int toY, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Object.TweenPosition(float timing, int toX, int toY, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Label.TweenPosition(float timing, int toX, int toY, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Button.TweenPosition(float timing, int toX, int toY, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    TextBox.TweenPosition(float timing, int toX, int toY, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    ListBox.TweenPosition(float timing, int toX, int toY, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Slider.TweenPosition(float timing, int toX, int toY, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    InvWindow.TweenPosition(float timing, int toX, int toY, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    Character.TweenX(float timing, int toX, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    GUI.TweenX(float timing, int toX, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Object.TweenX(float timing, int toX, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Label.TweenX(float timing, int toX, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Button.TweenX(float timing, int toX, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    TextBox.TweenX(float timing, int toX, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    ListBox.TweenX(float timing, int toX, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Slider.TweenX(float timing, int toX, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    InvWindow.TweenX(float timing, int toX, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    Character.TweenY(float timing, int toY, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    GUI.TweenY(float timing, int toY, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Object.TweenY(float timing, int toY, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Label.TweenY(float timing, int toY, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Button.TweenY(float timing, int toY, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    TextBox.TweenY(float timing, int toY, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    ListBox.TweenY(float timing, int toY, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Slider.TweenY(float timing, int toY, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    InvWindow.TweenY(float timing, int toY, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    Character.StopTweenPosition(optional TweenStopResult)
    GUI.StopTweenPosition(optional TweenStopResult)
    Object.StopTweenPosition(optional TweenStopResult)
    Label.StopTweenPosition(optional TweenStopResult)
    Button.StopTweenPosition(optional TweenStopResult)
    TextBox.StopTweenPosition(optional TweenStopResult)
    ListBox.StopTweenPosition(optional TweenStopResult)
    Slider.StopTweenPosition(optional TweenStopResult)
    InvWindow.StopTweenPosition(optional TweenStopResult)

Tweens the position of a character, GUI, object, etc. from its current position to another. Note that by default, GUI tweens are non-blocking unlike the character and object tweens.

Returns the tween duration (in loops) if the `TweenStyle` is non-blocking (`eNoBlockTween`).
For a repeat `TweenStyle` (`eRepeatTween` or `eRepeatReverseTween`) it returns the duration of one tween cycle. For blocking tweens, it returns `1`.

    // Will tween the position of the character from its current position to x 100, y 100 in 2.5 seconds.
    cEgo.TweenPosition(2.5, 100, 100);

## Size

    GUI.TweenSize(float timing, int toWidth, int toHeight, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Label.TweenSize(float timing, int toWidth, int toHeight, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Button.TweenSize(float timing, int toWidth, int toHeight, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    TextBox.TweenSize(float timing, int toWidth, int toHeight, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    ListBox.TweenSize(float timing, int toWidth, int toHeight, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Slider.TweenSize(float timing, int toWidth, int toHeight, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    InvWindow.TweenSize(float timing, int toWidth, int toHeight, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    Character.StopTweenSize(optional TweenStopResult)
    GUI.StopTweenSize(optional TweenStopResult)
    Object.StopTweenSize(optional TweenStopResult)
    Label.StopTweenSize(optional TweenStopResult)
    Button.StopTweenSize(optional TweenStopResult)
    TextBox.StopTweenSize(optional TweenStopResult)
    ListBox.StopTweenSize(optional TweenStopResult)
    Slider.StopTweenSize(optional TweenStopResult)
    InvWindow.StopTweenSize(optional TweenStopResult)

Tweens the size of a GUI, Label, Button etc.

Returns the tween duration (in loops) if the TweenStyle is non-blocking (`eNoBlockTween`). For a repeat TweenStyle (`eRepeatTween` or `eRepeatReverseTween`) it returns the duration of one tween cycle. For blocking tweens, it returns `1`.

    // Will tween the size the statusline GUI from its current size to 50x50 pixels in 1 second.
    gStatusline.TweenSize(1.0, 50, 50);

## Transparency, Fade In, Fade Out

    Character.TweenTransparency(float timing, int toTransparency, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    GUI.TweenTransparency(float timing, int toTransparency, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Object.TweenTransparency(float timing, int toTransparency, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    Character.TweenFadeIn(float timing, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    GUI.TweenFadeIn(float timing, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Object.TweenFadeIn(float timing, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    Character.TweenFadeOut(float timing, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    GUI.TweenFadeOut(float timing, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Object.TweenFadeOut(float timing, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    Character.StopTweenTransparency(optional TweenStopResult)
    GUI.StopTweenTransparency(optional TweenStopResult)
    Object.StopTweenTransparency(optional TweenStopResult)

Tweens the transparency of a character, GUI, or object from its current transparecy to another. Note that by default, GUI tweens are non-blocking unlike the character and object tweens.

Returns the tween duration (in loops) if the TweenStyle is non-blocking (`eNoBlockTween`). For a repeat TweenStyle (`eRepeatTween` or `eRepeatReverseTween`) it returns the duration of one tween cycle. For blocking tweens, it returns `1`.

    // Will tween the transparency of the room object Bluecup to from its current value to 100% (thus fading it out).
    oBluecup.TweenTransparency(3.0, 100);

    // Or you can also do the following:
    oBluecup.TweenFadeOut(3.0);

## Room Area Scaling

    TweenAreaScaling(float timing, int area, int fromMin, int toMin, int fromMax, int toMax, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    StopTweenAreaScaling(optional TweenStopResult)

Tweens the area scaling for a specific area from one min and max value to another. Range for min and max: 5 - 200.

    // Will tween the scaling for area 1 from 50-100 to 100-200.
    TweenAreaScaling(3.0, 1, 50, 100, 100, 200);


## Object Image

    Object.TweenImage(Object* tmpObjectRef, float timing,  int toSprite,  optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    Object.StopTweenImage(optional TweenStopResult)

Tweens the image of the object.

Note that this function currently requires the use of a second object for the transformation to take effect. Just create an invisible object in the room and pass it to the function (when AGS will support creating objects from code this won't be necessary).

    // Will tween the image of the BlueCup object from its current sprite to sprite 167.
    oBlueCup.TweenImage(oPinkPoster, 1.5, 167);

## Character Animation Speed

    Character.TweenAnimationSpeed(float timing, int toAnimationSpeed, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    Character.StopTweenAnimationSpeed(optional TweenStopResult)

Tweens the animation speed of the character.

    cEgo.TweenAnimationSpeed(1.5, -100);

## Character Scaling

    Character.TweenScaling(float timing, int toScale, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    Character.StopTweenScaling(optional TweenStopResult)

Returns the tween duration (in loops) if the TweenStyle is non-blocking (`eNoBlockTween`). For a repeat TweenStyle (`eRepeatTween` or `eRepeatReverseTween`) it returns the duration of one tween cycle. For blocking tweens, it returns a `1`.

    cEgo.TweenScaling(1.5, 200);

## Character Z

    Character.TweenZ(float timing, int toZ, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    Character.StopTweenZ(optional TweenStopResult)

Stops the a character Z position. From the AGS documentation: "This allows the character to levitate off the ground, whilst still retaining its normal Y co-ordinate for baseline calculations and regions.
Normally this is set to 0 (ground-level), but you can increase it to make the character float."

    cEgo.TweenZ(1.0, 100);

## GUI Z-Order

    GUI.TweenZOrder(float timing, int toZOrder, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    GUI.StopTweenZOrder(optional TweenStopResult)

Tweens the Z Order of the gui.

    // Will tween the Z order of the statusLine Gui from its current Z order to 100 (which is in the behind 100 other guis).
    gStatusLine.TweenZOrder(1.5, 100);

# Region Specific

## Region Light Level

    Region.TweenLightLevel(float timing, int toLightLevel, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    Region.StopTweenLightLevel(optional TweenStopResult)

Tweens the light level for the region. Range: -100 (very dark) to 100 (very bright)

    // Will tween the light level of the garden region from its current light level to 0 (which is very dark).
    rGarden.TweenLightLevel(1.5, 0);

## Region Tint Color, Saturation, and Grayscale

    Region.TweenTintRed(float timing, int toR, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Region.TweenTintGreen(float timing, int toG, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Region.TweenTintBlue(float timing, int toB, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    Region.TweenTintSaturation(float timing, int toAmount, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Region.TweenTintToGrayscale(float timing, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    Region.StopTweenTint(optional TweenStopResult)
    Region.StopTweenTintRed(optional TweenStopResult)
    Region.StopTweenTintGreen(optional TweenStopResult)
    Region.StopTweenTintBlue(optional TweenStopResult)
    Region.StopTweenTintSaturation(optional TweenStopResult)

Tweens the Red, Green, Blue, or Saturation portion for the region. Color Range: 0 to 255. Saturation Range: 0 to 100.

Note that to diminish the effect of the tint you need to set the LightLevel property for the region.

    rGarden.TweenTintB(1.5, 200);

# GUI Control Specific

## Text Color

    // AGS 3.1+
    TextBox.TweenTextColor(float timing, int toColor, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    TextBox.TweenTextColorRed(float timing, int toRed, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    TextBox.TweenTextColorGreen(float timing, int toGreen, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    TextBox.TweenTextColorBlue(float timing, int toBlue, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    TextBox.StopTweenTextColor(optonal TweenStopResult)
    TextBox.StopTweenTextColorRed(optonal TweenStopResult)
    TextBox.StopTweenTextColorGreen(optonal TweenStopResult)
    TextBox.StopTweenTextColorBlue(optonal TweenStopResult)

    // AGS 3.x
    Label.TweenTextColor(float timing, int toColor, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Label.TweenTextColorRed(float timing, int toRed, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Label.TweenTextColorGreen(float timing, int toGreen, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Label.TweenTextColorBlue(float timing, int toBlue, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Button.TweenTextColor(float timing, int toColor, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Button.TweenTextColorRed(float timing, int toRed, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Button.TweenTextColorGreen(float timing, int toGreen, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    Button.TweenTextColorBlue(float timing, int toBlue, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    Label.StopTweenTextColor(optonal TweenStopResult)
    Label.StopTweenTextColorRed(optonal TweenStopResult)
    Label.StopTweenTextColorGreen(optonal TweenStopResult)
    Label.StopTweenTextColorBlue(optonal TweenStopResult)
    Button.StopTweenTextColor(optonal TweenStopResult)
    Button.StopTweenTextColorRed(optonal TweenStopResult)
    Button.StopTweenTextColorGreen(optonal TweenStopResult)
    Button.StopTweenTextColorBlue(optonal TweenStopResult)

Tweens the red portion for the label, textbox or button. Range: 0 - 255

Note that to get a better result start with a color that is bigger than 30 (since 0 - 30 are reserved colors).

## Slider Value

    Slider.TweenValue(float timing, int toValue, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    Slider.StopTweenValue(optonal TweenStopResult)

Tweens the value of the slider.

Note that the value should be between the min and max values for the slider.

    // Will tween the value of the slider from the current value to 200.
    mySlider.TweenValue(1.5, 200);

## Slider HandleOffset

    // AGS 3.1+
    Slider.TweenHandleOffset(float timing, int toOffset, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    Slider.StopTweenHandleOffset(optonal TweenStopResult)

Tweens the offset of the slider handle.

    // AGS 3.1+
    // Will tween the handle offset of the slider from the current value to 20.
    mySlider.TweenHandleOffset(1.5, 20);

## ListBox Selected Index

    ListBox.TweenSelectedIndex(float timing, int toSelectedIndex, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    ListBox.StopTweenSelectedIndex(optonal TweenStopResult)

Tweens the selected index for the list box.

    // Will tween the selected index of the listbox from the current value to 20.
    myListBox.TweenSelectedIndex(1.5, 20);

## Top Item

    ListBox.TweenTopItem(float timing, int toTopItem, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    InvWindow.TweenTopItem(float timing, int toTopItem, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    ListBox.StopTweenTopItem(optonal TweenStopResult)
    InvWindow.StopTweenTopItem(optonal TweenStopResult)

Tweens the top item for the list box or inventory window.

    // Will tween the top item of the listbox and inventory window from the current value to 20.
    myListBox.TweenTopItem(1.5, 20);
    myInventory.TweenTopItem(1.5, 20);

# System Specific

## Viewport X and/or Y

    TweenViewportX(float timing, int toX, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    TweenViewportY(float timing, int toY, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)
    TweenViewport(float timing, int toX, int toY, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    StopTweenViewport(optional TweenStopResult)

Tweens the location of the viewport on the X and/or Y coordinates from its current location to another.

    // Will tween the location of the viewport on the x axis from its current location to 100, and on the y axis from the current location to 20.
    TweenViewportY(3.0, 100);
    TweenViewportX(3.0, 100, 20);
    TweenViewport(3.0, 100, 20);

## System Gamma

    TweenSystemGamma(float timing, int toGamma, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    StopTweenSystemGamma(optional TweenStopResult)

Tweens the screen gamma level from its current value to another. Note that `System.SupportGammaControl` must return true in order for this method to have any effect. Range: 0 (black) - 200 (bright)

    // Will tween the screen gamma from its current value to 150 (which is 50% brighter than default).
    if (System.SupportsGammaControl) {
      TweenSystemGamma(3.0, 150);
    }

## Shake Screen

    TweenShakeScreen(float timing, int fromDelay, int toDelay, int fromAmount,  int toAmount, optional TweenEasingType, optional TweenStyle, optional startDelay, optional timingType)

    StopTweenShakeScreen(optional TweenStopResult)

Tweens the shake screen amount and delay from one value to another. Range: Delay: from -2 to ... Amount: from 1 to 30.

    // Will tween the shake screen amount from 1 to 15 with a constant delay of 2.
    TweenShakeScreen(3.0, 2, 2, 1, 15);
