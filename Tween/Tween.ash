// ags-tween is open source under the MIT License.
// Uses Robert Penner's easing equestions which are under the BSD License.
//
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
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#ifndef __TWEEN_MODULE__
#define __TWEEN_MODULE__
#define Tween_020300

///////////////////////////////////////////////////////////////////////////////
// SETTINGS - Feel free to change this for your game!
///////////////////////////////////////////////////////////////////////////////

// Max number of simultaneous tweens that this module can play
// Feel free to change this number, but the higher it is, the slower it might be
// So just increase or decrease it to however many you need.
#define Tween_MAX_INSTANCES 64

// If true, it stops all tweens upon leaving the room
// If false, it stops most tweens except Audio, GUI, and some screen-related tweens.
#define Tween_STOP_ALL_ON_LEAVE_ROOM false

// Default TweenEasingType
#define Tween_EASING_TYPE eEaseLinearTween // All Tweens Except GUI and GUI element Tweens
#define Tween_EASING_TYPE_GUI eEaseLinearTween // For GUI and GUI element Tweens Only
#define Tween_EASING_TYPE_AUDIO eEaseLinearTween // For Audio Tweens Only

// Default TweenStyle
#define Tween_STYLE eBlockTween // All Tweens Except GUI and GUI element Tweens
#define Tween_STYLE_GUI eBlockTween // For GUI and GUI element Tweens Only
#define Tween_STYLE_AUDIO eNoBlockTween // For Audio Tweens only
#define Tween_STYLE_PROPERTY eNoBlockTween // For Property Tweening only

// Default TweenStopResult
#define Tween_STOP_RESULT ePauseTween // The expected behavior for stopping all tweens

// Default startDelay
#define Tween_START_DELAY 0
#define Tween_START_DELAY_GUI 0
#define Tween_START_DELAY_AUDIO 0

// Default TweenTimingType
#define Tween_TIMING eTweenSeconds
#define Tween_TIMING_GUI eTweenSeconds
#define Tween_TIMING_AUDIO eTweenSeconds

///////////////////////////////////////////////////////////////////////////////
// ENUMERATIONS
///////////////////////////////////////////////////////////////////////////////

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
  eBlockTween = eBlock,
  eNoBlockTween = eNoBlock,
  eRepeatTween = eRepeat,
  eReverseRepeatTween = 7002
};

enum TweenTimingType {
  eTweenSeconds,
  eTweenSpeed,
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
  writeprotected TweenEasingType EasingType;
  writeprotected TweenStyle Style;
  writeprotected float Duration;
  writeprotected float Elapsed;
  writeprotected float FromValue;
  writeprotected float ToValue;
  writeprotected float StartDelay;

  /// Reverses the direction of the tween.
  import function Reverse();

  /// Restarts the tween.
  import function Restart();

  /// Returns true if the tween is playing.
  import bool IsPlaying();

  /// Initializes a tween.
  import int Init(float timing, int fromValue, int toValue, TweenEasingType easingType=eEaseLinearTween, TweenStyle style=eNoBlockTween, float startDelay=0, TweenTimingType timingType=eTweenSeconds);
};

struct Tween extends TweenBase {
  /// Tweened Value (read only)
  writeprotected int Value;

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
  import static function IncreaseGameSpeedOnBlock(bool value);

  /// Stops all Tweens that are currently running.
  import static function StopAll(TweenStopResult result=Tween_STOP_RESULT);

  /// Waits until all non-looping Tweens are finished playing.
  import static function WaitForAllToFinish();
};

#ifdef SCRIPT_API_v3507
import int TweenX(this Viewport*, float timing, int toX, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenY(this Viewport*, float timing, int toY, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenWidth(this Viewport*, float timing, int toWidth, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenHeight(this Viewport*, float timing, int toHeight, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenPosition(this Viewport*, float timing, int toX, int toY, int toWidth, int toHeight, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import function StopTweenPosition(this Viewport*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this Viewport*, TweenStopResult result=Tween_STOP_RESULT);

import int TweenX(this Camera*, float timing, int toX, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenY(this Camera*, float timing, int toY, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenWidth(this Camera*, float timing, int toWidth, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenHeight(this Camera*, float timing, int toHeight, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenPosition(this Camera*, float timing, int toX, int toY, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenSize(this Camera*, float timing, int toWidth, int toHeight, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import function StopTweenPosition(this Camera*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenSize(this Camera*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this Camera*, TweenStopResult result=Tween_STOP_RESULT);

import int TweenPosition(this Point*, float timing, int toX, int toY, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenX(this Point*, float timing, int toX, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenY(this Point*, float timing, int toY, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import function StopTweenPosition(this Point*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this Point*, TweenStopResult result=Tween_STOP_RESULT);
#endif
#ifndef SCRIPT_API_v3507
import int TweenViewportX(float timing, int toX, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenViewportY(float timing, int toY, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenViewport(float timing, int toX, int toY, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import function StopTweenViewport(TweenStopResult result=Tween_STOP_RESULT);
#endif

import int TweenShakeScreen(float timing, int fromDelay, int toDelay, int fromAmount, int toAmount, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import function StopTweenShakeScreen(TweenStopResult result=Tween_STOP_RESULT);

import int TweenAreaScaling(float timing, int area, int fromMin, int toMin, int fromMax, int toMax, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import function StopTweenAreaScaling(int area, TweenStopResult result=Tween_STOP_RESULT);

import int TweenSpeechVolume(float timing, int fromVolume, int toVolume, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTimingType timingType=Tween_TIMING_AUDIO);
import function StopTweenSpeechVolume(TweenStopResult result=Tween_STOP_RESULT);
#ifndef STRICT_AUDIO
// These apply to AGS 3.2 and above only if the Strict Audio setting is NOT enabled
import int TweenMusicMasterVolume(float timing, int fromVolume, int toVolume, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTimingType timingType=Tween_TIMING_AUDIO);
import int TweenDigitalMasterVolume(float timing, int fromVolume, int toVolume, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTimingType timingType=Tween_TIMING_AUDIO);
import int TweenSoundVolume(float timing, int fromVolume, int toVolume, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTimingType timingType=Tween_TIMING_AUDIO);
import int TweenChannelVolume(float timing, int channel, int fromVolume, int toVolume, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTimingType timingType=Tween_TIMING_AUDIO);
import int TweenChannelFadeOut(float timing, int channel, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTimingType timingType=Tween_TIMING_AUDIO);
import int TweenChannelFadeIn(float timing, int channel, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTimingType timingType=Tween_TIMING_AUDIO);
import int TweenMusicVolume(float timing, int fromVolume, int toVolume, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTimingType timingType=Tween_TIMING_AUDIO);
import int TweenMusicFadeOut(float timing, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTimingType timingType=Tween_TIMING_AUDIO);
import int TweenMusicFadeIn(float timing, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTimingType timingType=Tween_TIMING_AUDIO);
import function StopTweenMusicMasterVolume(TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenDigitalMasterVolume(TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenSoundVolume(TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenChannelVolume(int channel, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenMusicVolume(TweenStopResult result=Tween_STOP_RESULT);
#endif

#ifdef STRICT_AUDIO
import int TweenSpeed(this AudioChannel*, float timing, int toSpeed, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTimingType timingType=Tween_TIMING_AUDIO);
import function StopTweenSpeed(this AudioChannel*, TweenStopResult result=Tween_STOP_RESULT);

import int TweenVolume(static System, float timing, int toVolume, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTimingType timingType=Tween_TIMING_AUDIO);
import function StopTweenVolume(static System, TweenStopResult result=Tween_STOP_RESULT);

import int TweenPosition(this AudioChannel*, float timing, int toPosition, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTimingType timingType=Tween_TIMING_AUDIO);
import int TweenPanning(this AudioChannel*, float timing, int toPanning, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTimingType timingType=Tween_TIMING_AUDIO);
import int TweenVolume(this AudioChannel*, float timing, int toVolume, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTimingType timingType=Tween_TIMING_AUDIO);
import int TweenFadeOut(this AudioChannel*, float timing, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTimingType timingType=Tween_TIMING_AUDIO);
import int TweenFadeIn(this AudioChannel*, float timing, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTimingType timingType=Tween_TIMING_AUDIO);
import int TweenRoomLocation(this AudioChannel*, float timing, int toX, int toY, int fromX, int fromY, TweenEasingType easingType=Tween_EASING_TYPE_AUDIO, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY_AUDIO, TweenTimingType timingType=Tween_TIMING_AUDIO);
import function StopTweenPosition(this AudioChannel*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenPanning(this AudioChannel*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenVolume(this AudioChannel*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenRoomLocation(this AudioChannel*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this AudioChannel*, TweenStopResult result=Tween_STOP_RESULT);
#endif

import int TweenX(this Character*, float timing, int toX, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenY(this Character*, float timing, int toY, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenX(this Object*, float timing, int toX, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenY(this Object*, float timing, int toY, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenX(this Overlay*, float timing, int toX, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenY(this Overlay*, float timing, int toY, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenX(this GUI*, float timing, int toX, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenY(this GUI*, float timing, int toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenX(this GUIControl*, float timing, int toX, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenY(this GUIControl*, float timing, int toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenX(this Label*, float timing, int toX, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenY(this Label*, float timing, int toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenX(this Button*, float timing, int toX, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenY(this Button*, float timing, int toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenX(this TextBox*, float timing, int toX, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenY(this TextBox*, float timing, int toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenX(this ListBox*, float timing, int toX, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenY(this ListBox*, float timing, int toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenX(this Slider*, float timing, int toX, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenY(this Slider*, float timing, int toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenX(this InvWindow*, float timing, int toX, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenY(this InvWindow*, float timing, int toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenPosition(this Character*, float timing, int toX, int toY, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenPosition(this Object*, float timing, int toX, int toY, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenPosition(this Overlay*, float timing, int toX, int toY, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenPosition(this GUI*, float timing, int toX, int toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenPosition(this GUIControl*, float timing, int toX, int toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenPosition(this Label*, float timing, int toX, int toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenPosition(this Button*, float timing, int toX, int toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenPosition(this TextBox*, float timing, int toX, int toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenPosition(this ListBox*, float timing, int toX, int toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenPosition(this Slider*, float timing, int toX, int toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenPosition(this InvWindow*, float timing, int toX, int toY, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import function StopTweenPosition(this Character*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenPosition(this Object*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenPosition(this Overlay*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenPosition(this GUI*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenPosition(this GUIControl*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenPosition(this Label*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenPosition(this Button*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenPosition(this TextBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenPosition(this ListBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenPosition(this Slider*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenPosition(this InvWindow*, TweenStopResult result=Tween_STOP_RESULT);

import int TweenZ(this Character*, float timing, int toZ, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import function StopTweenZ(this Character*, TweenStopResult result=Tween_STOP_RESULT);

#ifdef SCRIPT_API_v360
import int TweenWidth(this Overlay*, float timing, int toWidth, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenHeight(this Overlay*, float timing, int toHeight, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenSize(this Overlay*, float timing, int toWidth, int toHeight, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import function StopTweenSize(this Overlay*, TweenStopResult result=Tween_STOP_RESULT);

import int TweenTransparency(this Overlay*, float timing, int toTransparency, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenFadeIn(this Overlay*, float timing, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenFadeOut(this Overlay*, float timing, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import function StopTweenTransparency(this Overlay*, TweenStopResult result=Tween_STOP_RESULT);
#endif

/// Tweens the Transparency property. Note: This will update the Visible property if Transparency starts or ends at 100.
import int TweenTransparency(this GUI*, float timing, int toTransparency, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
/// Tweens the Transparency property. Note: This will update the Visible property if Transparency starts or ends at 100.
import int TweenTransparency(this Object*, float timing, int toTransparency, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenTransparency(this Character*, float timing, int toTransparency, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
/// Tweens the Transparency property to 100. Note: This will set the Visible property to false when the tween finishes playing.
import int TweenFadeOut(this GUI*, float timing, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
/// Tweens the Transparency property to 0. Note: This will set the Visible property to true if Transparency starts at 100.
import int TweenFadeIn(this GUI*, float timing, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
/// Tweens the Transparency property to 100. Note: This will set the Visible property to false when the tween finishes playing.
import int TweenFadeOut(this Object*, float timing, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
/// Tweens the Transparency property to 0. Note: This will set the Visible property to true if Transparency starts at 100.
import int TweenFadeIn(this Object*, float timing, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenFadeOut(this Character*, float timing, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenFadeIn(this Character*, float timing, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import function StopTweenTransparency(this Character*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTransparency(this Object*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTransparency(this GUI*, TweenStopResult result=Tween_STOP_RESULT);
#ifdef SCRIPT_API_v360
/// Tweens the Transparency property. Note: This will update the Visible property if Transparency starts or ends at 100.
import int TweenTransparency(this GUIControl*, float timing, int toTransparency, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
/// Tweens the Transparency property to 100. This will set the Visible property to false when the tween finishes playing.
import int TweenFadeOut(this GUIControl*, float timing, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
/// Tweens the Transparency property to 0. Note: This will set the Visible property to true if Transparency starts at 100.
import int TweenFadeIn(this GUIControl*, float timing, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import function StopTweenTransparency(this GUIControl*, TweenStopResult result=Tween_STOP_RESULT);
#endif

import int TweenZOrder(this GUI*, float timing, int toZOrder, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import function StopTweenZOrder(this GUI*, TweenStopResult result=Tween_STOP_RESULT);

import int TweenSize(this GUI*, float timing, int toWidth, int toHeight, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenSize(this GUIControl*, float timing, int toWidth, int toHeight, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenSize(this Label*, float timing, int toWidth, int toHeight, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenSize(this Button*, float timing, int toWidth, int toHeight, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenSize(this TextBox*, float timing, int toWidth, int toHeight, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenSize(this ListBox*, float timing, int toWidth, int toHeight, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenSize(this Slider*, float timing, int toWidth, int toHeight, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenSize(this InvWindow*, float timing, int toWidth, int toHeight, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import function StopTweenSize(this GUI*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenSize(this GUIControl*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenSize(this Label*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenSize(this Button*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenSize(this TextBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenSize(this ListBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenSize(this Slider*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenSize(this InvWindow*, TweenStopResult result=Tween_STOP_RESULT);
#ifdef SCRIPT_API_v350
import int TweenBackgroundColorRed(this GUI*, float timing, int toRed, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenBackgroundColorGreen(this GUI*, float timing, int toGreen, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenBackgroundColorBlue(this GUI*, float timing, int toBlue, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenBackgroundColorRGB(this GUI*, float timing, int toRed, int toGreen, int toBlue, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenBackgroundColor(this GUI*, float timing, int toBackgroundColor, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import function StopTweenBackgroundColorRed(this GUI*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenBackgroundColorGreen(this GUI*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenBackgroundColorBlue(this GUI*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenBackgroundColorRGB(this GUI*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenBackgroundColor(this GUI*, TweenStopResult result=Tween_STOP_RESULT);

import int TweenBorderColorRed(this GUI*, float timing, int toRed, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenBorderColorGreen(this GUI*, float timing, int toGreen, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenBorderColorBlue(this GUI*, float timing, int toBlue, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenBorderColorRGB(this GUI*, float timing, int toRed, int toGreen, int toBlue, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenBorderColor(this GUI*, float timing, int toBorderColor, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import function StopTweenBorderColorRed(this GUI*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenBorderColorGreen(this GUI*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenBorderColorBlue(this GUI*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenBorderColorRGB(this GUI*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenBorderColor(this GUI*, TweenStopResult result=Tween_STOP_RESULT);

import int TweenSelectedBackColorRed(this ListBox*, float timing, int toRed, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenSelectedBackColorGreen(this ListBox*, float timing, int toGreen, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenSelectedBackColorBlue(this ListBox*, float timing, int toBlue, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenSelectedBackColorRGB(this ListBox*, float timing, int toRed, int toGreen, int toBlue, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenSelectedBackColor(this ListBox*, float timing, int toSelectedBackColor, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import function StopTweenSelectedBackColorRed(this ListBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenSelectedBackColorGreen(this ListBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenSelectedBackColorBlue(this ListBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenSelectedBackColorRGB(this ListBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenSelectedBackColor(this ListBox*, TweenStopResult result=Tween_STOP_RESULT);

import int TweenSelectedTextColorRed(this ListBox*, float timing, int toRed, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenSelectedTextColorGreen(this ListBox*, float timing, int toGreen, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenSelectedTextColorBlue(this ListBox*, float timing, int toBlue, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenSelectedTextColorRGB(this ListBox*, float timing, int toRed, int toGreen, int toBlue, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenSelectedTextColor(this ListBox*, float timing, int toSelectedTextColor, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import function StopTweenSelectedTextColorRed(this ListBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenSelectedTextColorGreen(this ListBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenSelectedTextColorBlue(this ListBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenSelectedTextColorRGB(this ListBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenSelectedTextColor(this ListBox*, TweenStopResult result=Tween_STOP_RESULT);

import int TweenTextColorRed(this ListBox*, float timing, int toRed, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenTextColorGreen(this ListBox*, float timing, int toGreen, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenTextColorBlue(this ListBox*, float timing, int toBlue, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenTextColorRGB(this ListBox*, float timing, int toRed, int toGreen, int toBlue, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenTextColor(this ListBox*, float timing, int toTextColor, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import function StopTweenTextColorRed(this ListBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTextColorGreen(this ListBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTextColorBlue(this ListBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTextColorRGB(this ListBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTextColor(this ListBox*, TweenStopResult result=Tween_STOP_RESULT);
#endif

/// Tweens the Scaling property. Note: This will set the ManualScaling property to true.
import int TweenScaling(this Character*, float timing, int toScaling, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import function StopTweenScaling(this Character*, TweenStopResult result=Tween_STOP_RESULT);
#ifdef SCRIPT_API_v360
/// Tweens the Scaling property. Note: This will set the ManualScaling property to true.
import int TweenScaling(this Object*, float timing, int toScaling, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import function StopTweenScaling(this Object*, TweenStopResult result=Tween_STOP_RESULT);
#endif

// Cross-fades the Graphic from one Sprite to another. Requires an extra dummy object to perform the transition. Note: This will set the Visible property to true.
import int TweenImage(this Object*, Object* objectRef, float timing, int toSprite, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);

import int TweenAnimationSpeed(this Character*, float timing, int toAnimationSpeed, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import function StopTweenAnimationSpeed(this Character*, TweenStopResult result=Tween_STOP_RESULT);
#ifdef SCRIPT_API_v360
import int TweenAnimationVolume(this Character*, float timing, int toAnimationVolume, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE_AUDIO, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import function StopTweenAnimationVolume(this Character*, TweenStopResult result=Tween_STOP_RESULT);
#endif

#ifdef SCRIPT_API_v341
import int TweenTintRed(this Character*, float timing, int toRed, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenTintGreen(this Character*, float timing, int toGreen, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenTintBlue(this Character*, float timing, int toBlue, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenTintSaturation(this Character*, float timing, int toSaturation, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenTintLuminance(this Character*, float timing, int toLuminance, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenTint(this Character*, float timing, int toRed, int toGreen, int toBlue, int toSaturation, int toLuminance, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import function StopTweenTintRed(this Character*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTintGreen(this Character*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTintBlue(this Character*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTintSaturation(this Character*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTintLuminance(this Character*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTint(this Character*, TweenStopResult result=Tween_STOP_RESULT);

import int TweenTintRed(this Object*, float timing, int toRed, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenTintGreen(this Object*, float timing, int toGreen, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenTintBlue(this Object*, float timing, int toBlue, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenTintSaturation(this Object*, float timing, int toSaturation, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenTintLuminance(this Object*, float timing, int toLuminance, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenTint(this Object*, float timing, int toRed, int toGreen, int toBlue, int toSaturation, int toLuminance, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import function StopTweenTintRed(this Object*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTintGreen(this Object*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTintBlue(this Object*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTintSaturation(this Object*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTintLuminance(this Object*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTint(this Object*, TweenStopResult result=Tween_STOP_RESULT);
#endif

import int TweenLightLevel(this Region*, float timing, int toLightLevel, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenTintRed(this Region*, float timing, int toRed, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenTintGreen(this Region*, float timing, int toGreen, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenTintBlue(this Region*, float timing, int toBlue, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenTintSaturation(this Region*, float timing, int toSaturation, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenTintLuminance(this Region*, float timing, int toLuminance, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenTint(this Region*, float timing, int toRed, int toGreen, int toBlue, int toSaturation, int toLuminance, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import function StopTweenLightLevel(this Region*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTintRed(this Region*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTintGreen(this Region*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTintBlue(this Region*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTintSaturation(this Region*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTintLuminance(this Region*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTint(this Region*, TweenStopResult result=Tween_STOP_RESULT);

import int TweenTextColor(this Label*, float timing, int toColor, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenTextColorRGB(this Label*, float timing, int toRed, int toGreen, int toBlue, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenTextColorRed(this Label*, float timing, int toRed, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenTextColorGreen(this Label*, float timing, int toGreen, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenTextColorBlue(this Label*, float timing, int toBlue, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenTextColor(this Button*, float timing, int toColor, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenTextColorRGB(this Button*, float timing, int toRed, int toGreen, int toBlue, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenTextColorRed(this Button*, float timing, int toRed, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenTextColorGreen(this Button*, float timing, int toGreen, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenTextColorBlue(this Button*, float timing, int toBlue, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import function StopTweenTextColor(this Label*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTextColorRGB(this Label*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTextColorRed(this Label*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTextColorGreen(this Label*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTextColorBlue(this Label*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTextColor(this Button*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTextColorRGB(this Button*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTextColorRed(this Button*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTextColorGreen(this Button*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTextColorBlue(this Button*, TweenStopResult result=Tween_STOP_RESULT);

import int TweenValue(this Slider*, float timing, int toValue, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import function StopTweenValue(this Slider*, TweenStopResult result=Tween_STOP_RESULT);

import int TweenSelectedIndex(this ListBox*, float timing, int toSelectedIndex, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import function StopTweenSelectedIndex(this ListBox*, TweenStopResult result=Tween_STOP_RESULT);

import int TweenTopItem(this ListBox*, float timing, int toTopItem, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenTopItem(this InvWindow*, float timing, int toTopItem, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import function StopTweenTopItem(this ListBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTopItem(this InvWindow*, TweenStopResult result=Tween_STOP_RESULT);

import function StopAllTweens(this GUI*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this Object*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this Character*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this Overlay*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this Region*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this GUIControl*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this Label*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this Button*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this TextBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this ListBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this Slider*, TweenStopResult result=Tween_STOP_RESULT);
import function StopAllTweens(this InvWindow*, TweenStopResult result=Tween_STOP_RESULT);

import int TweenTextColor(this TextBox*, float timing, int toColor, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenTextColorRGB(this TextBox*, float timing, int toRed, int toGreen, int toBlue, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenTextColorRed(this TextBox*, float timing, int toRed, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenTextColorGreen(this TextBox*, float timing, int toGreen, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import int TweenTextColorBlue(this TextBox*, float timing, int toBlue, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import function StopTweenTextColor(this TextBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTextColorRGB(this TextBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTextColorRed(this TextBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTextColorGreen(this TextBox*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenTextColorBlue(this TextBox*, TweenStopResult result=Tween_STOP_RESULT);

import int TweenHandleOffset(this Slider*, float timing, int toOffset, TweenEasingType easingType=Tween_EASING_TYPE_GUI, TweenStyle style=Tween_STYLE_GUI, float startDelay=Tween_START_DELAY_GUI, TweenTimingType timingType=Tween_TIMING_GUI);
import function StopTweenHandleOffset(this Slider*, TweenStopResult result=Tween_STOP_RESULT);

import int TweenLightLevel(this Character*, float timing, int fromLightLevel, int toLightLevel, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenLightLevel(this Object*, float timing, int fromLightLevel, int toLightLevel, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import function StopTweenLightLevel(this Character*, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenLightLevel(this Object*, TweenStopResult result=Tween_STOP_RESULT);

import int TweenAmbientLightLevel(float timing, int fromLightLevel, int toLightLevel, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import function StopTweenAmbientLightLevel(TweenStopResult result=Tween_STOP_RESULT);

import int TweenGamma(static System, float timing, int toGamma, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import function StopTweenGamma(static System, TweenStopResult result=Tween_STOP_RESULT);

import int TweenProperty(this Character*, float timing, String property, int toValue, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE_PROPERTY, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenProperty(this Hotspot*, float timing, String property, int toValue, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE_PROPERTY, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenProperty(this InventoryItem*, float timing, String property, int toValue, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE_PROPERTY, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenProperty(this Object*, float timing, String property, int toValue, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE_PROPERTY, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import int TweenProperty(static Room, float timing, String property, int toValue, TweenEasingType easingType=Tween_EASING_TYPE, TweenStyle style=Tween_STYLE_PROPERTY, float startDelay=Tween_START_DELAY, TweenTimingType timingType=Tween_TIMING);
import function StopTweenProperty(this Character*, String property, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenProperty(this Hotspot*, String property, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenProperty(this InventoryItem*, String property, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenProperty(this Object*, String property, TweenStopResult result=Tween_STOP_RESULT);
import function StopTweenProperty(static Room, String property, TweenStopResult result=Tween_STOP_RESULT);


///////////////////////////////////////////////////////////////////////////////
// ADVANCED USERS: HANDY-DANDY UTILITY FUNCTIONS
///////////////////////////////////////////////////////////////////////////////

struct TweenGame {
  /// Returns the red value from a colour number.
  import static int GetRFromColor(int color);

  /// Returns the green value from a colour number.
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
  import static int Lerp(float from, float to, float t);

  /// Returns the smallest int value.
  import static int MinInt(int a, int b);

  /// Returns the largest int value.
  import static int MaxInt(int a, int b);

  /// Returns an int between a min and max values.
  import static int ClampInt(int value, int min, int max);

  /// Returns the largest float value.
  import static float MaxFloat(float a, float b);

  /// Returns the largest float value.
  import static float MinFloat(float a, float b);

  /// Returns a float between a min and max values.
  import static float ClampFloat(float value, float min, float max);
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

  /// Returns the value at elapsed over duration based on the TweenEasingType
  import static float GetValue(float elapsed, float duration, TweenEasingType easingType);
};

// END BSD LICENSE

#endif
