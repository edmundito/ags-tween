// TERMS OF USE - AGS TWEEN MODULE (ags-tween)
//
// Copyright (c) 2009-present Edmundo Ruiz
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE

#ifdef __TWEEN_MODULE__

enum Tween1Timing {
  eLinearTween = eEaseLinearTween, 
  eEaseInTween = eEaseInSineTween,
  eEaseOutTween = eEaseOutSineTween,
  eEaseInEaseOutTween = eEaseInOutSineTween
};

/// (Tween 1 Compatibility) Deprecated: Use TweenMaths.GetDistance
import float GetDistance(int fromX, int fromY, int toX, int toY);

/// (Tween 1 Compatibility) Deprecated: Use Tween.StopAll
import function TweenStopAll(TweenStopResult result=Tween_STOP_RESULT);

/// (Tween 1 Compatibility) Deprecated: Use Tween.WaitForAllToFinish
import function WaitForTweensToStop();

/// (Tween 1 Compatibility) Deprecated: Use TweenSystemGamma
import int TweenGamma(float seconds, short toGamma, Tween1Timing timing=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE);

/// (Tween 1 Compatibility) Deprecated: Use TweenViewport
import int TweenViewportPosition(float seconds, short toX, short toY, Tween1Timing timing=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE);

/// (Tween 1 Compatibility) Deprecated: Use TweenViewport(speed, ..., eTweenSpeed)
import int TweenViewportPositionBySpeed(float speed, short toX, short toY, Tween1Timing timing=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE);

/// (Tween 1 Compatibility) Deprecated: Use TweenTintRed
import int TweenTintR(this Region*, float seconds, short toR, Tween1Timing timing=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE);

/// (Tween 1 Compatibility) Deprecated: Use TweenTintGreen
import int TweenTintG(this Region*, float seconds, short toG, Tween1Timing timing=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE);

/// (Tween 1 Compatibility) Deprecated: Use TweenTintBlue
import int TweenTintB(this Region*, float seconds, short toB, Tween1Timing timing=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE);

/// (Tween 1 Compatibility) Deprecated: Use TweenTintSaturation
import int TweenTintAmount(this Region*, float seconds, short toAmount, Tween1Timing timing=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE);

/// (Tween 1 Compatibility) Deprecated: Use TweenTintToGrayscale
import int TweenTintBlackAndWhite(this Region*, float seconds, Tween1Timing timing=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorRed
import int TweenColorR(this Label*, float seconds, short toR, Tween1Timing timing=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorGreen
import int TweenColorG(this Label*, float seconds, short toG, Tween1Timing timing=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorBlue
import int TweenColorB(this Label*, float seconds, short toB, Tween1Timing timing=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorRed
import int TweenColorR(this Button*, float seconds, short toR, Tween1Timing timing=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorGreen
import int TweenColorG(this Button*, float seconds, short toG, Tween1Timing timing=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorBlue
import int TweenColorB(this Button*, float seconds, short toB, Tween1Timing timing=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI);

/// (Tween 1 Compatibility) Deprecated: Use TweenSelectedIndex
import int TweenSelectedItem(this ListBox*, float seconds, short toSelectedItem, Tween1Timing timing=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI);

/// (Tween 1 Compatibility) Deprecated: Use TweenPosition(speed, ..., eTweenSpeed)
import int TweenPositionBySpeed(this Character*, float speed, short toX, short toY, Tween1Timing timing=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE);

/// (Tween 1 Compatibility) Deprecated: Use TweenPosition(speed, ..., eTweenSpeed)
import int TweenPositionBySpeed(this Object*, float speed, short toX, short toY, Tween1Timing timing=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE);

/// (Tween 1 Compatibility) Deprecated: Use TweenPosition(speed, ..., eTweenSpeed)
import int TweenPositionBySpeed(this GUI*, float speed, short toX, short toY, Tween1Timing timing=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI);

/// (Tween 1 Compatibility) Deprecated: Use TweenPosition(speed, ..., eTweenSpeed)
import int TweenPositionBySpeed(this GUIControl*, float speed, short toX, short toY, Tween1Timing timing=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI);

/// (Tween 1 Compatibility) Deprecated: Use TweenPosition(speed, ..., eTweenSpeed)
import int TweenPositionBySpeed(this Label*, float speed, short toX, short toY, Tween1Timing timing=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI);

/// (Tween 1 Compatibility) Deprecated: Use TweenPosition(speed, ..., eTweenSpeed)
import int TweenPositionBySpeed(this Button*, float speed, short toX, short toY, Tween1Timing timing=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI);

/// (Tween 1 Compatibility) Deprecated: Use TweenPosition(speed, ..., eTweenSpeed)
import int TweenPositionBySpeed(this TextBox*, float speed, short toX, short toY, Tween1Timing timing=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI);

/// (Tween 1 Compatibility) Deprecated: Use TweenPosition(speed, ..., eTweenSpeed)
import int TweenPositionBySpeed(this ListBox*, float speed, short toX, short toY, Tween1Timing timing=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI);

/// (Tween 1 Compatibility) Deprecated: Use TweenPosition(speed, ..., eTweenSpeed)
import int TweenPositionBySpeed(this Slider*, float speed, short toX, short toY, Tween1Timing timing=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI);

/// (Tween 1 Compatibility) Deprecated: Use TweenPosition(speed, ..., eTweenSpeed)
import int TweenPositionBySpeed(this InvWindow*, float speed, short toX, short toY, Tween1Timing timing=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI);


#ifver 3.1
/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorRed
import int TweenColorR(this TextBox*, float seconds, short toR, Tween1Timing timing=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorGreen
import int TweenColorG(this TextBox*, float seconds, short toG, Tween1Timing timing=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorBlue
import int TweenColorB(this TextBox*, float seconds, short toB, Tween1Timing timing=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI);
#endif

#endif