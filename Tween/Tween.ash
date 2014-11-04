// ags-tween is open source under the MIT License.
// Uses Robert Penner's easing equestions which are under the BSD License.
//
// TERMS OF USE - AGS TWEEN MODULE (ags-tween)
//
// Copyright (c) 2009, 2014 Edmundo Ruiz
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
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#ifndef __TWEEN_MODULE__
#define __TWEEN_MODULE__
#define Tween_020000

///////////////////////////////////////////////////////////////////////////////
// SETTINGS - Feel free to change this for your game!
///////////////////////////////////////////////////////////////////////////////

// Max number of simultaneous tweens that this module can play
// Feel free to change this number, but the higher it is, the slower it might be
// So just increase or decrease it to however many you need.
#define Tween_MAX_INSTANCES 64

// Default TweenEasingType
#define Tween_EASING_TYPE eEaseLinearTween // All Tweens Except GUI and GUI element Tweens
#define Tween_EASING_TYPE_GUI eEaseLinearTween // For GUI and GUI element Tweens Only
#define Tween_EASING_TYPE_AUDIO eEaseLinearTween // For Audio Tweens Only

// Default TweenStyle
#define Tween_STYLE eBlockTween // All Tweens Except GUI and GUI element Tweens
#define Tween_STYLE_GUI eBlockTween // For GUI and GUI element Tweens Only
#define Tween_STYLE_AUDIO eNoBlockTween // For Audio Tweens only

// Default TweenStopResult
#define Tween_STOP_RESULT ePauseTween // The expected behavior for stopping all tweens

// Default startDelay
#define Tween_START_DELAY 0
#define Tween_START_DELAY_GUI 0
#define Tween_START_DELAY_AUDIO 0

// Default TweenTiming
#define Tween_TIMING eTweenSeconds
#define Tween_TIMING_GUI eTweenSeconds
#define Tween_TIMING_AUDIO eTweenSeconds

///////////////////////////////////////////////////////////////////////////////
// ENUMERATIONS
///////////////////////////////////////////////////////////////////////////////

enum TweenTiming {
  eTweenSeconds,
  eTweenSpeed, 
};

enum TweenEasingType {
  eEaseLinearTween,
  eEaseInSineTween,
  eEaseOutSineTween, 
  eEaseInOutSineTween, 
  eEaseInQuadTween, 
  eEaseOutQuadTween, 
  eEaseInOutQuadTween, 
  eEaseInCubicTween, 
  eEaseOutCubicTween,
  eEaseInOutCubicTween, 
  eEaseInQuartTween, 
  eEaseOutQuartTween, 
  eEaseInOutQuartTween,
  eEaseInQuintTween, 
  eEaseOutQuintTween, 
  eEaseInOutQuintTween, 
  eEaseInCircTween, 
  eEaseOutCircTween, 
  eEaseInOutCircTween,
  eEaseInExpoTween, 
  eEaseOutExpoTween, 
  eEaseInOutExpoTween,
  eEaseInBackTween, 
  eEaseOutBackTween, 
  eEaseInOutBackTween, 
  eEaseInElasticTween, 
  eEaseOutElasticTween, 
  eEaseInOutElasticTween, 
  eEaseInBounceTween, 
  eEaseOutBounceTween, 
  eEaseInOutBounceTween
};

enum TweenStyle {
  eBlockTween,
  eNoBlockTween,
  eRepeatTween,
  eReverseRepeatTween
};

enum TweenStopResult {
  ePauseTween,
  eResetTween,
  eFinishTween
};

///////////////////////////////////////////////////////////////////////////////
// TWEENS
///////////////////////////////////////////////////////////////////////////////

struct TweenBase {
  writeprotected TweenEasingType easingType;
  writeprotected TweenStyle style;
  
  writeprotected float duration;
  writeprotected float elapsed;
  writeprotected float toX;
  writeprotected float toY;
  writeprotected float fromX;
  writeprotected float fromY;
  writeprotected float startDelay;
  
  /// Reverses the direction of the tween.
  import function Reverse();
  
  /// Restarts the twen.
  import function Restart();
  
  /// Returns true if the tween is playing.
  import bool IsPlaying();
  
  /// Initializes a tween.
  import int Init(float amount, short fromX, short fromY, short toX, short toY, TweenEasingType easingType=eEaseLinearTween, TweenStyle style=eBlockTween, float startDelay=0, TweenTiming timing=eTweenSeconds);
};

struct Tween extends TweenBase {
  /// Tweened x value (read only)
  writeprotected int X;
  
  /// Tweened y value (read only)
  writeprotected int Y;
  
  /// Moves the tween forward in time.
  import bool Update();
  
  /// Stops the tween.
  import function Stop(TweenStopResult result=ePauseTween);
  
  /// Returns the progress from 0.0 to 1.0.
  import float GetProgress();
  
  // STATIC FUNCTIONS:
  
  /// Increases the game speed to at least 60 for better tweening quality.
  import static function IncreaseGameSpeed();
  
  /// Restores the game speed back to its original.
  import static function RestoreGameSpeed();
  
  /// Increases the game speed when a blocking tween is playing.
  import static function AlwaysIncreaseGameSpeedOnBlockingTweens(bool value);
  
  /// Stops all Tweens that are currently running.
  import static function StopAll(TweenStopResult result=Tween_STOP_RESULT);
  
  /// Waits until all non-looping Tweens are finished playing.
  import static function WaitForAllToFinish();
};

import int TweenViewportX(float amount, short toX, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);
import int TweenViewportY(float amount, short toY, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);
import int TweenViewport(float amount, short toX, short toY, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);

import int TweenSystemGamma(float amount, short toGamma, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);
import int TweenShakeScreen(float amount, short fromDelay, short toDelay, short fromAmount, short toAmount, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);
import int TweenAreaScaling(float amount, int area, short fromMin, short toMin, short fromMax, short toMax, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);

import int TweenSpeechVolume(float amount, short fromVolume, short toVolume, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTiming timing=Tween_TIMING_AUDIO);
#ifndef STRICT_AUDIO
// These apply to AGS 3.2 and above only if the Strict Audio setting is NOT enabled
import int TweenMusicMasterVolume(float amount, short fromVolume, short toVolume, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTiming timing=Tween_TIMING_AUDIO);
import int TweenDigitalMasterVolume(float amount, short fromVolume, short toVolume, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTiming timing=Tween_TIMING_AUDIO);
import int TweenSoundVolume(float amount, short fromVolume, short toVolume, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTiming timing=Tween_TIMING_AUDIO);
import int TweenChannelVolume(float amount, int channel, short fromVolume, short toVolume, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTiming timing=Tween_TIMING_AUDIO);
import int TweenChannelFadeOut(float amount, int channel, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTiming timing=Tween_TIMING_AUDIO);
import int TweenChannelFadeIn(float amount, int channel, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTiming timing=Tween_TIMING_AUDIO);
import int TweenMusicVolume(float amount, short fromVolume, short toVolume, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTiming timing=Tween_TIMING_AUDIO);
import int TweenMusicFadeOut(float amount, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTiming timing=Tween_TIMING_AUDIO);
import int TweenMusicFadeIn(float amount, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTiming timing=Tween_TIMING_AUDIO);
#endif

import int TweenX(this Character*, float amount, short toX, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);
import int TweenY(this Character*, float amount, short toY, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);
import int TweenX(this Object*, float amount, short toX, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);
import int TweenY(this Object*, float amount, short toY, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);
import int TweenX(this GUI*, float amount, short toX, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenY(this GUI*, float amount, short toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenX(this GUIControl*, float amount, short toX, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenY(this GUIControl*, float amount, short toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenX(this Label*, float amount, short toX, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenY(this Label*, float amount, short toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenX(this Button*, float amount, short toX, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenY(this Button*, float amount, short toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenX(this TextBox*, float amount, short toX, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenY(this TextBox*, float amount, short toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenX(this ListBox*, float amount, short toX, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenY(this ListBox*, float amount, short toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenX(this Slider*, float amount, short toX, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenY(this Slider*, float amount, short toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenX(this InvWindow*, float amount, short toX, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenY(this InvWindow*, float amount, short toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);

import int TweenPosition(this Character*, float amount, short toX, short toY, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);
import int TweenPosition(this Object*, float amount, short toX, short toY, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);
import int TweenPosition(this GUI*, float amount, short toX, short toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenPosition(this GUIControl*, float amount, short toX, short toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenPosition(this Label*, float amount, short toX, short toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenPosition(this Button*, float amount, short toX, short toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenPosition(this TextBox*, float amount, short toX, short toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenPosition(this ListBox*, float amount, short toX, short toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenPosition(this Slider*, float amount, short toX, short toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenPosition(this InvWindow*, float amount, short toX, short toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);

import int TweenTransparency(this GUI*, float amount, short toTransparency, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenTransparency(this Object*, float amount, short toTransparency, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);
import int TweenTransparency(this Character*, float amount, short toTransparency, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);

import int TweenFadeOut(this GUI*, float amount, short toTransparency, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenFadeIn(this GUI*, float amount, short toTransparency, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenFadeOut(this Object*, float amount, short toTransparency, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);
import int TweenFadeIn(this Object*, float amount, short toTransparency, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);
import int TweenFadeOut(this Character*, float amount, short toTransparency, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);
import int TweenFadeIn(this Character*, float amount, short toTransparency, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);

import int TweenZOrder(this GUI*, float amount, short toZOrder, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);

import int TweenSize(this GUI*, float amount, short toWidth, short toHeight, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenSize(this GUIControl*, float amount, short toWidth, short toHeight, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenSize(this Label*, float amount, short toWidth, short toHeight, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenSize(this Button*, float amount, short toWidth, short toHeight, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenSize(this TextBox*, float amount, short toWidth, short toHeight, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenSize(this ListBox*, float amount, short toWidth, short toHeight, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenSize(this Slider*, float amount, short toWidth, short toHeight, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenSize(this InvWindow*, float amount, short toWidth, short toHeight, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);

import int TweenScaling(this Character*, float amount, short toScaling, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);

import int TweenImage(this Object*, Object* objectRef, float amount, short toSprite, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);

import int TweenAnimationSpeed(this Character*, float amount, short toAnimationSpeed, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);

import int TweenLightLevel(this Region*, float amount, short toLightLevel, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);
import int TweenTintRed(this Region*, float amount, short toRed, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);
import int TweenTintGreen(this Region*, float amount, short toGreen, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);
import int TweenTintBlue(this Region*, float amount, short toBlue, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);
import int TweenTintSaturation(this Region*, float amount, short toSaturation, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);
import int TweenTint(this Region*, float amount, short toRed, short toGreen, short toBlue, short toSaturation, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);
import int TweenTintToGrayscale(this Region*, float amount, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTiming timing=Tween_TIMING);

import int TweenTextColor(this Label*, float amount, short toColor, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenTextColorRed(this Label*, float amount, short toRed, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenTextColorGreen(this Label*, float amount, short toGreen, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenTextColorBlue(this Label*, float amount, short toBlue, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenTextColor(this Button*, float amount, short toColor, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenTextColorRed(this Button*, float amount, short toRed, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenTextColorGreen(this Button*, float amount, short toGreen, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenTextColorBlue(this Button*, float amount, short toBlue, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);

import int TweenValue(this Slider*, float amount, short toValue, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);

import int TweenSelectedIndex(this ListBox*, float amount, short toSelectedIndex, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);

import int TweenTopItem(this ListBox*, float amount, short toTopItem, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenTopItem(this InvWindow*, float amount, short toTopItem, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);

import function StopAllTweens(this GUI*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this Object*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this Character*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this Region*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this GUIControl*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this Label*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this Button*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this TextBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this ListBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this Slider*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this InvWindow*, TweenStopResult result=Tween_STOP_RESULT);

#ifver 3.1
// These apply to AGS 3.1 and above
import int TweenTextColor(this TextBox*, float amount, short toColor, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenTextColorRed(this TextBox*, float amount, short toRed, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenTextColorGreen(this TextBox*, float amount, short toGreen, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
import int TweenTextColorBlue(this TextBox*, float amount, short toBlue, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);

import int TweenHandleOffset(this Slider*, float amount, short toOffset, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTiming timing=Tween_TIMING_GUI);
#endif

#ifdef STRICT_AUDIO
// These apply to AGS 3.2 and above when the Strict Audio setting is enabled
import int TweenSystemVolume(float amount, short toVolume, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTiming timing=Tween_TIMING_AUDIO);

import int TweenPanning(this AudioChannel*, float amount, short toPanning, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTiming timing=Tween_TIMING_AUDIO);
import int TweenVolume(this AudioChannel*, float amount, short toVolume, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTiming timing=Tween_TIMING_AUDIO);
import int TweenFadeOut(this AudioChannel*, float amount, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTiming timing=Tween_TIMING_AUDIO);
import int TweenFadeIn(this AudioChannel*, float amount, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTiming timing=Tween_TIMING_AUDIO);
import int TweenRoomLocation(this AudioChannel*, float amount, short toX, short toY, short fromX, short fromY, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTiming timing=Tween_TIMING_AUDIO);
import function StopAllTweens(this AudioChannel*, TweenStopResult result=Tween_STOP_RESULT);
#endif


///////////////////////////////////////////////////////////////////////////////
// ADVANCED USERS: HANDY-DANDY UTILITY FUNCTIONS
///////////////////////////////////////////////////////////////////////////////

struct TweenGame {
  /// Returns the red value from a colour number.
  import static int GetRFromColor(int color);
  
  /// Returns the greb value from a colour number.
  import static int GetGFromColor(int color);
  
  /// Returns the blue value from a colour number.
  import static int GetBFromColor(int color);
};

struct TweenMaths {
  /// Returns the absolute value.
  import static float Abs(float value);
  
  /// Returns the distance (as a float) between two points.
  import static float GetDistance(int fromX, int fromY, int toX, int toY);
  
  /// Interpolates from one float to another based on a decimal factor. Returns int.
  import static int Lerp(float from, float to, float amount);
  
  /// Returns the smallest int value.
  import static int MinInt(int a, int b);
  
  /// Returns the largest int value.
  import static int MaxInt(int a, int b);
  
  /// Returns an int between a min and max values
  import static int ClampInt(int value, int min, int max);
};

/// Converts number of seconds to number of game loops. (Part of the Tween module)
import int SecondsToLoops(float seconds);

/// Converts number of loops to number seconds. (Part of the Tween module)
import float LoopsToSeconds(int loops);

/// Waits a number of seconds. (Part of the Tween module)
import function WaitSeconds(float amount);

/// Waits for the longest duration (based on game loops). Supports up to 6 durations. (Part of the Tween module)
import function WaitForLongest(int duration1, int duration2, int duration3=0, int duration4=0, int duration5=0, int duration6=0);

/// Sets a Timer using seconds instead of game loops.  (Part of the Tween module)
import function SetTimerWithSeconds(int timerID, float amount);

/// Sets the timer for the longest timeout (based on game loops). Supports up to 6 timeouts. (Part of the Tween module)
import function SetTimerForLongest(int timerID, int timeout1, int timeout2, int timeout3=0, int timeout4=0, int timeout5=0, int timeout6=0);

///////////////////////////////////////////////////////////////////////////////
// ADVANCED USERS: TWEEN EASING EQUATIONS
///////////////////////////////////////////////////////////////////////////////

// TERMS OF USE - EASING EQUATIONS
//
// Open source under the BSD License.
//
// Copyright (c) 2001 Robert Penner
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:
// 
//  * Redistributions of source code must retain the above copyright notice, this
//    list of conditions and the following disclaimer.
//  * Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//  * Neither the name of the author nor the names of contributors may be used to
//    endorse or promote products derived from this software without
//    specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
// ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
// ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

struct TweenEasing {
  import static float EaseLinear(float t, float d);
  import static float EaseInSine(float t, float b, float c, float d);
  import static float EaseOutSine(float t, float b, float c, float d);
  import static float EaseInOutSine(float t, float b, float c, float d);
  import static float EaseInQuad(float t, float b, float c, float d);
  import static float EaseOutQuad(float t, float b, float c, float d);
  import static float EaseInOutQuad(float t, float b, float c, float d);
  import static float EaseInPower(float t, float b, float c, float d, float power);
  import static float EaseOutPower(float t, float b, float c, float d, float power);
  import static float EaseInOutPower(float t, float b, float c, float d, float power);
  import static float EaseInExpo(float t, float b, float c, float d);
  import static float EaseOutExpo(float t, float b, float c, float d);
  import static float EaseInOutExpo(float t, float b, float c, float d);
  import static float EaseInCirc(float t, float b, float c, float d);
  import static float EaseOutCirc(float t, float b, float c, float d);
  import static float EaseInOutCirc(float t, float b, float c, float d);
  import static float EaseInBack(float t, float b, float c, float d);
  import static float EaseOutBack(float t, float b, float c, float d);
  import static float EaseInOutBack(float t, float b, float c, float d);
  import static float EaseInElastic(float t, float b, float c, float d);
  import static float EaseOutElastic(float t, float b, float c, float d);
  import static float EaseInOutElastic(float t, float b, float c, float d);
  import static float EaseInBounce(float t, float b, float c, float d);
  import static float EaseOutBounce(float t, float b, float c, float d);
  import static float EaseInOutBounce(float t, float b, float c, float d);
  
  /// Returns the amouns for calculations based on the TweenEasingType
  import static float GetAmount(float elapsed, float duration, TweenEasingType easingType);
};

// END BSD LICENSE

#endif