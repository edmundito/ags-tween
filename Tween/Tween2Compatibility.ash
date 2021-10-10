// TERMS OF USE - AGS TWEEN MODULE (ags-tween)
//
// Copyright (c) 2009-present Edmundo Ruiz Ghanem
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

#ifdef SCRIPT_API_v350

/// (Tween 2 Compatibility) Deprecated: Use Game.Camera.TweenX
import int TweenViewportX(float timing, int toX, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);

/// (Tween 2 Compatibility) Deprecated: Use Game.Camera.TweenY
import int TweenViewportY(float timing, int toY, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);

/// (Tween 2 Compatibility) Deprecated: Use Game.Camera.TweenPosition
import int TweenViewport(float timing, int toX, int toY, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);

/// (Tween 2 Compatibility) Deprecated: Use Game.Camera.StopTweenPosition
import function StopTweenViewport(TweenStopResult result=Tween_STOP_RESULT);

#endif

/// (Tween 2 Compatibility) Deprecated: Use System.TweenGamma
import int TweenSystemGamma(float timing, int toGamma, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);

/// (Tween 2 Compatibility) Deprecated: Use System.StopTweenGamma
import function StopTweenSystemGamma(TweenStopResult result=Tween_STOP_RESULT);

/// (Tween 2 Compatibility) Deprecated: Use System.TweenVolume
import int TweenSystemVolume(float timing, int toVolume, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTimingType timingType=Tween_TIMING_AUDIO);

/// (Tween 2 Compatibility) Deprecated: Use System.StopTweenVolume
import function StopTweenSystemVolume(TweenStopResult result=Tween_STOP_RESULT);

#endif
