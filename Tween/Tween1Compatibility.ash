#ifdef __TWEEN_MODULE__

enum TweenTiming {
  eLinearTween = eEaseLinearTween, 
  eEaseInTween = eEaseInSineTween,
  eEaseOutTween = eEaseOutSineTween,
  eEaseInEaseOutTween = eEaseInOutSineTween
};

/// (Tween 1 Compatibility) Deprecated: Use Tween.StopAll(result)
import function TweenStopAll(TweenStopResult result=DEFAULT_TweenStopResult);

/// (Tween 1 Compatibility) Deprecated: Use Tween.WaitForAllToFinish()
import function WaitForTweensToStop();

/// (Tween 1 Compatibility) Deprecated: Use TweenSystemGamma
import int TweenGamma(float seconds, short toGamma, TweenTiming timing=DEFAULT_TweenEasingType, TweenStyle style=DEFAULT_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenSystemGamma
import int TweenViewportPosition(float seconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenEasingType, TweenStyle style=DEFAULT_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTintRed
import int TweenTintR(this Region*, float seconds, short toR, TweenTiming timing=DEFAULT_TweenEasingType, TweenStyle style=DEFAULT_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTintGreen
import int TweenTintG(this Region*, float seconds, short toG, TweenTiming timing=DEFAULT_TweenEasingType, TweenStyle style=DEFAULT_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTintBlue
import int TweenTintB(this Region*, float seconds, short toB, TweenTiming timing=DEFAULT_TweenEasingType, TweenStyle style=DEFAULT_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTintSaturation
import int TweenTintAmount(this Region*, float seconds, short toAmount, TweenTiming timing=DEFAULT_TweenEasingType, TweenStyle style=DEFAULT_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTintToGrayscale
import int TweenTintBlackAndWhite(this Region*, float seconds, TweenTiming timing=DEFAULT_TweenEasingType, TweenStyle style=DEFAULT_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorRed
import int TweenColorR(this Label*, float seconds, short toR, TweenTiming timing=DEFAULT_GUI_TweenEasingType, TweenStyle style=DEFAULT_GUI_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorGreen
import int TweenColorG(this Label*, float seconds, short toG, TweenTiming timing=DEFAULT_GUI_TweenEasingType, TweenStyle style=DEFAULT_GUI_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorBlue
import int TweenColorB(this Label*, float seconds, short toB, TweenTiming timing=DEFAULT_GUI_TweenEasingType, TweenStyle style=DEFAULT_GUI_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorRed
import int TweenColorR(this Button*, float seconds, short toR, TweenTiming timing=DEFAULT_GUI_TweenEasingType, TweenStyle style=DEFAULT_GUI_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorGreen
import int TweenColorG(this Button*, float seconds, short toG, TweenTiming timing=DEFAULT_GUI_TweenEasingType, TweenStyle style=DEFAULT_GUI_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorBlue
import int TweenColorB(this Button*, float seconds, short toB, TweenTiming timing=DEFAULT_GUI_TweenEasingType, TweenStyle style=DEFAULT_GUI_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenSelectedIndex
import int TweenSelectedItem(this ListBox*, float seconds, short toSelectedItem, TweenTiming timing=DEFAULT_GUI_TweenEasingType, TweenStyle style=DEFAULT_GUI_TweenStyle);

#ifver 3.1
/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorRed
import int TweenColorR(this TextBox*, float seconds, short toR, TweenTiming timing=DEFAULT_GUI_TweenEasingType, TweenStyle style=DEFAULT_GUI_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorGreen
import int TweenColorG(this TextBox*, float seconds, short toG, TweenTiming timing=DEFAULT_GUI_TweenEasingType, TweenStyle style=DEFAULT_GUI_TweenStyle);

/// (Tween 1 Compatibility) Deprecated: Use TweenTextColorBlue
import int TweenColorB(this TextBox*, float seconds, short toB, TweenTiming timing=DEFAULT_GUI_TweenEasingType, TweenStyle style=DEFAULT_GUI_TweenStyle);
#endif

#endif