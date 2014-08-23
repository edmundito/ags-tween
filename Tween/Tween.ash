// Script header for module 'Tween'
//
// Authors: Edmundo Ruiz (edmundito [netmonkey]) and Tzach Shabtay (tzachs)
//  Please use the messaging function in the AGS forums to contact
//  us about problems or questions.
//
// Revision History:
//  (See CHANGES.TXT for more detailed information)
//  1.5   Mar 4 2012  Added support for 3.2+ strict audio
//                    Added Position tweens by speed
//                    Various GUI Control tweens have been merged
//                    Internal module cleanup and improvements
//  1.22  Aug 14 2010 Compatible with AGS 2.72 and 3.0 again!
//  1.21  Jun 12 2010 Compatible with AGS 3.2
//  1.2   Jun 5 2010  Better control over stopping tweens
//                    Settings for default TweenTiming and TweenStyle
//  1.1   Feb 17 2010 added ~30 new tweens
//  1.0L  Jul 9 2009  added license
//  1.0   Jun 13 2009 created
//
// --------
//
// License (MIT):
//
// Copyright (c) 2009-2011 Edmundo Ruiz (http://www.edmundito.com/)
//
// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use,
// copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following
// conditions:
//
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
// OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
// OTHER DEALINGS IN THE SOFTWARE.
//
// --------
//
// That said, you are most welcome but not obliged to give us
// credit in your game or the AGS Games Page as such:
//
// In the Game Credits:
// Special Thanks
// Edmundo Ruiz
// Tzach Shabtay
//
// OR if you prefer something along these lines:
// Tween Module by Edmundo Ruiz and Tzach Shabtay
//
// AND/OR In the AGS Games page:
// netmonkey Tween Module
// tzachs Tween Module
#ifndef __TWEEN_MODULE__
#define __TWEEN_MODULE__
#define __TWEEN2__

///////////////////////////////////////////////////////////////////////////////
// SETTINGS - Feel free to change this for your game!
///////////////////////////////////////////////////////////////////////////////

// Max number of simultaneous tweens that this module can play
// Feel free to change this number, but the higher it is, the slower it might be
// So just increase or decrease it to however many you need.
#define MAX_TWEENS 64

// Default TweenEasingType
#define D_TweenEasingType eEaseLinearTween // All Tweens Except GUI and GUI element Tweens
#define D_GUI_TweenEasingType eEaseLinearTween // For GUI and GUI element Tweens Only
#define D_Audio_TweenEasingType eEaseLinearTween // For Audio Tweens Only

// Default TweenStyle
#define D_TweenStyle eBlockTween // All Tweens Except GUI and GUI element Tweens
#define D_GUI_TweenStyle eBlockTween // For GUI and GUI element Tweens Only
#define D_Audio_TweenStyle eNoBlockTween // For Audio Tweens only

// Default TweenStopResult
#define D_TweenStopResult ePauseTween // The expected behavior for stopping all tweens

// Default startDelay
#define D_startDelay 0
#define D_GUI_startDelay 0
#define D_Audio_startDelay 0

// Default TweenTiming
#define D_TweenTiming eTweenSeconds
#define D_GUI_TweenTiming eTweenSeconds
#define D_Audio_TweenTiming eTweenSeconds

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
// HANDY-DANDY UTILITY FUNCTIONS
///////////////////////////////////////////////////////////////////////////////

/// Converts number of seconds to number of game loops. (Part of the Tween module)
import int SecondsToLoops(float seconds);

/// Waits a number of seconds. (Part of the Tween module)
import function WaitSeconds(float seconds);

/// Waits for the longest duration (based on game loops). Supports up to 6 durations. (Part of the Tween module)
import function WaitForLongest(int duration1, int duration2, int duration3=0, int duration4=0, int duration5=0, int duration6=0);

/// Sets a Timer using seconds instead of game loops.  (Part of the Tween module)
import function SetTimerWithSeconds(int timerID, float seconds);

/// Sets the timer for the longest timeout (based on game loops). Supports up to 6 timeouts. (Part of the Tween module)
import function SetTimerForLongest(int timerID, int timeout1, int timeout2, int timeout3=0, int timeout4=0, int timeout5=0, int timeout6=0);

/// Gets the distance between two points. (Part of the Tween module)
import float GetDistance(int fromX, int fromY, int toX, int toY);

///////////////////////////////////////////////////////////////////////////////
// TWEENS
///////////////////////////////////////////////////////////////////////////////

struct Tween {
  /// Stops all Tweens that are currently running.
  import static function StopAll(TweenStopResult result=D_TweenStopResult);
  
  /// Waits until all non-looping Tweens are finished playing.
  import static function WaitForAllToFinish();
};

import int TweenViewportX(float amount, short toX, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);
import int TweenViewportY(float amount, short toY, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);
import int TweenViewport(float amount, short toX, short toY, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);

import int TweenSystemGamma(float amount, short toGamma, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);
import int TweenShakeScreen(float amount, short fromDelay, short toDelay, short fromAmount, short toAmount, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);
import int TweenAreaScaling(float amount, int area, short fromMin, short toMin, short fromMax, short toMax, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);

import int TweenSpeechVolume(float amount, short fromVolume, short toVolume, TweenEasingType easingType=D_Audio_TweenEasingType, TweenStyle style=D_Audio_TweenStyle, float startDelay=D_Audio_startDelay, TweenTiming timing=D_Audio_TweenTiming);
#ifndef STRICT_AUDIO
// These apply to AGS 3.2 and above when the Strict Audio setting is enabled
import int TweenMusicMasterVolume(float amount, short fromVolume, short toVolume, TweenEasingType easingType=D_Audio_TweenEasingType, TweenStyle style=D_Audio_TweenStyle, float startDelay=D_Audio_startDelay, TweenTiming timing=D_Audio_TweenTiming);
import int TweenDigitalMasterVolume(float amount, short fromVolume, short toVolume, TweenEasingType easingType=D_Audio_TweenEasingType, TweenStyle style=D_Audio_TweenStyle, float startDelay=D_Audio_startDelay, TweenTiming timing=D_Audio_TweenTiming);
import int TweenSoundVolume(float amount, short fromVolume, short toVolume, TweenEasingType easingType=D_Audio_TweenEasingType, TweenStyle style=D_Audio_TweenStyle, float startDelay=D_Audio_startDelay, TweenTiming timing=D_Audio_TweenTiming);
import int TweenChannelVolume(float amount, int channel, short fromVolume, short toVolume, TweenEasingType easingType=D_Audio_TweenEasingType, TweenStyle style=D_Audio_TweenStyle, float startDelay=D_Audio_startDelay, TweenTiming timing=D_Audio_TweenTiming);
#endif

import int TweenX(this Character*, float amount, short toX, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);
import int TweenY(this Character*, float amount, short toY, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);
import int TweenX(this Object*, float amount, short toX, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);
import int TweenY(this Object*, float amount, short toY, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);
import int TweenX(this GUI*, float amount, short toX, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenY(this GUI*, float amount, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenX(this GUIControl*, float amount, short toX, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenY(this GUIControl*, float amount, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenX(this Label*, float amount, short toX, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenY(this Label*, float amount, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenX(this Button*, float amount, short toX, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenY(this Button*, float amount, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenX(this TextBox*, float amount, short toX, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenY(this TextBox*, float amount, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenX(this ListBox*, float amount, short toX, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenY(this ListBox*, float amount, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenX(this Slider*, float amount, short toX, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenY(this Slider*, float amount, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenX(this InvWindow*, float amount, short toX, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenY(this InvWindow*, float amount, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);

import int TweenPosition(this Character*, float amount, short toX, short toY, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);
import int TweenPosition(this Object*, float amount, short toX, short toY, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);
import int TweenPosition(this GUI*, float amount, short toX, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenPosition(this GUIControl*, float amount, short toX, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenPosition(this Label*, float amount, short toX, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenPosition(this Button*, float amount, short toX, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenPosition(this TextBox*, float amount, short toX, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenPosition(this ListBox*, float amount, short toX, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenPosition(this Slider*, float amount, short toX, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenPosition(this InvWindow*, float amount, short toX, short toY, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);

import int TweenTransparency(this GUI*, float amount, short toTransparency, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenTransparency(this Object*, float amount, short toTransparency, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);
import int TweenTransparency(this Character*, float amount, short toTransparency, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);

import int TweenZOrder(this GUI*, float amount, short toZOrder, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);

import int TweenSize(this GUI*, float amount, short toWidth, short toHeight, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenSize(this GUIControl*, float amount, short toWidth, short toHeight, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenSize(this Label*, float amount, short toWidth, short toHeight, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenSize(this Button*, float amount, short toWidth, short toHeight, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenSize(this TextBox*, float amount, short toWidth, short toHeight, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenSize(this ListBox*, float amount, short toWidth, short toHeight, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenSize(this Slider*, float amount, short toWidth, short toHeight, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenSize(this InvWindow*, float amount, short toWidth, short toHeight, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);

import int TweenScaling(this Character*, float amount, short toScaling, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);

import int TweenImage(this Object*, Object* objectRef, float amount, short toSprite, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);

import int TweenAnimationSpeed(this Character*, float amount, short toAnimationSpeed, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);

import int TweenLightLevel(this Region*, float amount, short toLightLevel, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);
import int TweenTintRed(this Region*, float amount, short toRed, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);
import int TweenTintGreen(this Region*, float amount, short toGreen, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);
import int TweenTintBlue(this Region*, float amount, short toBlue, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);
import int TweenTintSaturation(this Region*, float amount, short toSaturation, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);
import int TweenTint(this Region*, float amount, short toRed, short toGreen, short toBlue, short toSaturation, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);
import int TweenTintToGrayscale(this Region*, float amount, TweenEasingType easingType=D_TweenEasingType, TweenStyle style=D_TweenStyle, float startDelay=D_startDelay, TweenTiming timing=D_TweenTiming);

import int TweenTextColor(this Label*, float amount, short toColor, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenTextColorRed(this Label*, float amount, short toRed, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenTextColorGreen(this Label*, float amount, short toGreen, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenTextColorBlue(this Label*, float amount, short toBlue, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenTextColor(this Button*, float amount, short toColor, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenTextColorRed(this Button*, float amount, short toRed, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenTextColorGreen(this Button*, float amount, short toGreen, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenTextColorBlue(this Button*, float amount, short toBlue, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);

import int TweenValue(this Slider*, float amount, short toValue, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);

import int TweenSelectedIndex(this ListBox*, float amount, short toSelectedIndex, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);

import int TweenTopItem(this ListBox*, float amount, short toTopItem, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenTopItem(this InvWindow*, float amount, short toTopItem, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);

import function StopAllTweens(this GUI*, TweenStopResult result=D_TweenStopResult);
import function StopAllTweens(this Object*, TweenStopResult result=D_TweenStopResult);
import function StopAllTweens(this Character*, TweenStopResult result=D_TweenStopResult);
import function StopAllTweens(this Region*, TweenStopResult result=D_TweenStopResult);
import function StopAllTweens(this GUIControl*, TweenStopResult result=D_TweenStopResult);
import function StopAllTweens(this Label*, TweenStopResult result=D_TweenStopResult);
import function StopAllTweens(this Button*, TweenStopResult result=D_TweenStopResult);
import function StopAllTweens(this TextBox*, TweenStopResult result=D_TweenStopResult);
import function StopAllTweens(this ListBox*, TweenStopResult result=D_TweenStopResult);
import function StopAllTweens(this Slider*, TweenStopResult result=D_TweenStopResult);
import function StopAllTweens(this InvWindow*, TweenStopResult result=D_TweenStopResult);

#ifver 3.1
// These apply to AGS 3.1 and above
import int TweenTextColor(this TextBox*, float amount, short toColor, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenTextColorRed(this TextBox*, float amount, short toRed, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenTextColorGreen(this TextBox*, float amount, short toGreen, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
import int TweenTextColorBlue(this TextBox*, float amount, short toBlue, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);

import int TweenHandleOffset(this Slider*, float amount, short toOffset, TweenEasingType easingType=D_GUI_TweenEasingType, TweenStyle style=D_GUI_TweenStyle, float startDelay=D_GUI_startDelay, TweenTiming timing=D_GUI_TweenTiming);
#endif

#ifdef STRICT_AUDIO
// These apply to AGS 3.2 and above when the Strict Audio setting is enabled
import int TweenSystemVolume(float amount, short toVolume, TweenEasingType easingType=D_Audio_TweenEasingType, TweenStyle style=D_Audio_TweenStyle, float startDelay=D_Audio_startDelay, TweenTiming timing=D_Audio_TweenTiming);

import int TweenPanning(this AudioChannel*,  float amount, short toPanning, TweenEasingType easingType=D_Audio_TweenEasingType, TweenStyle style=D_Audio_TweenStyle, float startDelay=D_Audio_startDelay, TweenTiming timing=D_Audio_TweenTiming);
import int TweenVolume(this AudioChannel*,  float amount, short toVolume, TweenEasingType easingType=D_Audio_TweenEasingType, TweenStyle style=D_Audio_TweenStyle, float startDelay=D_Audio_startDelay, TweenTiming timing=D_Audio_TweenTiming);
import int TweenRoomLocation(this AudioChannel*,  float amount, short toX, short toY, short fromX, short fromY, TweenEasingType easingType=D_Audio_TweenEasingType, TweenStyle style=D_Audio_TweenStyle, float startDelay=D_Audio_startDelay, TweenTiming timing=D_Audio_TweenTiming);
import function StopAllTweens(this AudioChannel*, TweenStopResult result=D_TweenStopResult);
#endif

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
  
  /// For power users: This is where the easing amount of the Tween is computed.
  import static float GetAmount(float elapsed, float duration, TweenEasingType easingType);
};








///////////////////////////////////////////////////////////////////////////////
// INTENDED FOR INTERNAL USE BY THIS MODULE ONLY
///////////////////////////////////////////////////////////////////////////////

enum _TweenReferenceType {
  _eTweenReferenceGUI,
  _eTweenReferenceObject,
  _eTweenReferenceCharacter,
  _eTweenReferenceRegion,
  _eTweenReferenceGUIControl, 
  _eTweenReferenceMisc,
#ifdef STRICT_AUDIO
  _eTweenReferenceAudioChannel,
#endif
};

enum _TweenType {
  _eTweenGUIPosition,
  _eTweenGUITransparency,
  _eTweenGUISize,
  _eTweenGUIZOrder,
  _eTweenObjectPosition,
  _eTweenObjectTransparency,
  _eTweenCharacterPosition,
  _eTweenCharacterScaling,
  _eTweenCharacterTransparency,
  _eTweenCharacterAnimationSpeed,
  _eTweenRegionLightLevel, 
  _eTweenRegionTintRed,
  _eTweenRegionTintGreen,
  _eTweenRegionTintBlue,
  _eTweenRegionTintSaturation,
  _eTweenLabelTextColor,
  _eTweenLabelTextColorRed,
  _eTweenLabelTextColorGreen,
  _eTweenLabelTextColorBlue,
  _eTweenGUIControlPosition, 
  _eTweenGUIControlSize,
  _eTweenButtonTextColor,
  _eTweenButtonTextColorRed,
  _eTweenButtonTextColorGreen,
  _eTweenButtonTextColorBlue,
  _eTweenSliderValue,
  _eTweenListBoxSelectedIndex,
  _eTweenListBoxTopItem,
  _eTweenInvWindowTopItem,
  _eTweenViewport,
  _eTweenSystemGamma,
  _eTweenShakeScreen,
  _eTweenAreaScaling,
  _eTweenSpeechVolume,
#ifver 3.1
  _eTweenTextBoxTextColor, 
  _eTweenTextBoxTextColorRed,
  _eTweenTextBoxTextColorGreen,
  _eTweenTextBoxTextColorBlue,
  _eTweenSliderHandleOffset,
#endif
#ifndef STRICT_AUDIO
  _eTweenMusicMasterVolume,
  _eTweenDigitalMasterVolume,
  _eTweenSoundVolume,
  _eTweenChannelVolume,
#endif
#ifdef STRICT_AUDIO
  _eTweenSystemVolume, 
  _eTweenAudioChannelVolume,  
  _eTweenAudioChannelRoomLocation,
  _eTweenAudioChannelPanning, 
#endif
};

struct _TweenObject {
  _TweenType type;
  _TweenReferenceType refType;
  TweenEasingType easingType;
  TweenStyle style;
  GUIControl* guiControlRef;
  
  int refID;
  float duration;
  float elapsed;
  float toX;
  float toY;
  float fromX;
  float fromY;
  
  import function Step(float amount);
};

#endif