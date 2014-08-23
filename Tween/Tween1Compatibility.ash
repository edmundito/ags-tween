#ifdef __TWEEN_MODULE__

enum Tween1Timing {
  eLinearTween = eEaseLinearTween, 
  eEaseInTween = eEaseInSineTween,
  eEaseOutTween = eEaseOutSineTween,
  eEaseInEaseOutTween = eEaseInOutSineTween
};

/// (Tween 1 Compatibility) Deprecated: Use Tween.StopAll(result)
import function TweenStopAll(TweenStopResult result=D_TweenStopResult);

/// (Tween 1 Compatibility) Deprecated: Use Tween.WaitForAllToFinish()
import function WaitForTweensToStop();

/// (Tween 1 Compatibility) Deprecated: Use TweenSystemGamma
import int TweenGamma(float seconds, short toGamma, Tween1Timing timing=D_TweenEasingType, TweenStyle style=D_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenViewport
import int TweenViewportPosition(float seconds, short toX, short toY, Tween1Timing timing=D_TweenEasingType, TweenStyle style=D_TweenStyle);

import int TweenViewportPositionBySpeed(float speed, short toX, short toY, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTintRed
import int TweenTintR(this Region*, float seconds, short toR, Tween1Timing timing=D_TweenEasingType, TweenStyle style=D_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTintGreen
import int TweenTintG(this Region*, float seconds, short toG, Tween1Timing timing=D_TweenEasingType, TweenStyle style=D_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTintBlue
import int TweenTintB(this Region*, float seconds, short toB, Tween1Timing timing=D_TweenEasingType, TweenStyle style=D_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTintSaturation
import int TweenTintAmount(this Region*, float seconds, short toAmount, Tween1Timing timing=D_TweenEasingType, TweenStyle style=D_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTintToGrayscale
import int TweenTintBlackAndWhite(this Region*, float seconds, Tween1Timing timing=D_TweenEasingType, TweenStyle style=D_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorRed
import int TweenColorR(this Label*, float seconds, short toR, Tween1Timing timing=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorGreen
import int TweenColorG(this Label*, float seconds, short toG, Tween1Timing timing=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorBlue
import int TweenColorB(this Label*, float seconds, short toB, Tween1Timing timing=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorRed
import int TweenColorR(this Button*, float seconds, short toR, Tween1Timing timing=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorGreen
import int TweenColorG(this Button*, float seconds, short toG, Tween1Timing timing=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorBlue
import int TweenColorB(this Button*, float seconds, short toB, Tween1Timing timing=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenSelectedIndex
import int TweenSelectedItem(this ListBox*, float seconds, short toSelectedItem, Tween1Timing timing=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle);

import int TweenPositionBySpeed(this Character*, float speed, short toX, short toY, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle);
import int TweenPositionBySpeed(this Object*, float speed, short toX, short toY, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle);
import int TweenPositionBySpeed(this GUI*, float speed, short toX, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle);
import int TweenPositionBySpeed(this GUIControl*, float speed, short toX, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle);
import int TweenPositionBySpeed(this Label*, float speed, short toX, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle);
import int TweenPositionBySpeed(this Button*, float speed, short toX, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle);
import int TweenPositionBySpeed(this TextBox*, float speed, short toX, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle);
import int TweenPositionBySpeed(this ListBox*, float speed, short toX, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle);
import int TweenPositionBySpeed(this Slider*, float speed, short toX, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle);
import int TweenPositionBySpeed(this InvWindow*, float speed, short toX, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle);


#ifver 3.1
/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorRed
import int TweenColorR(this TextBox*, float seconds, short toR, Tween1Timing timing=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorGreen
import int TweenColorG(this TextBox*, float seconds, short toG, Tween1Timing timing=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorBlue
import int TweenColorB(this TextBox*, float seconds, short toB, Tween1Timing timing=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle);
#endif

#endif