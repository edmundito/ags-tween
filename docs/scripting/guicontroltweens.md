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
