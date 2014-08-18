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
#define MAX_TWEENS 16

// Default TweenTiming
#define DEFAULT_TweenTiming eEaseLinearTween // All Tweens Except GUI and GUI element Tweens
#define DEFAULT_GUI_TweenTiming eEaseLinearTween // For GUI and GUI element Tweens Only
#define DEFAULT_Audio_TweenTiming eEaseLinearTween // For Audio Tweens Only

// Default TweenStyle
#define DEFAULT_TweenStyle eBlockTween // All Tweens Except GUI and GUI element Tweens
#define DEFAULT_GUI_TweenStyle eBlockTween // For GUI and GUI element Tweens Only
#define DEFAULT_Audio_TweenStyle eNoBlockTween // For Audio Tweens only

// Default TweenStopResult
#define DEFAULT_TweenStopResult ePauseTween // The expected behavior for stopping all tweens

///////////////////////////////////////////////////////////////////////////////
// ENUMERATIONS
///////////////////////////////////////////////////////////////////////////////

enum TweenTiming {
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
  eReverseRepeatTween,
};

enum TweenStopResult {
  ePauseTween,
  eResetTween,
  eFinishTween,
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
  import static function StopAll(TweenStopResult result=DEFAULT_TweenStopResult);
  
  /// Waits until all non-looping Tweens are finished playing.
  import static function WaitForAllToFinish();
};

import int TweenViewportX(float seconds, short toX, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenViewportXBySpeed(float speed, short toX, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenViewportY(float seconds, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenViewportYBySpeed(float speed, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenViewport(float seconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenViewportBySpeed(float speed, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);

import int TweenSystemGamma(float seconds, short toGamma, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenShakeScreen(float seconds, short fromDelay, short toDelay, short fromAmount, short toAmount, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenAreaScaling(float seconds, int area, short fromMin, short toMin, short fromMax, short toMax, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);

import int TweenSpeechVolume(float seconds, short fromVolume, short toVolume, TweenTiming timing=DEFAULT_Audio_TweenTiming, TweenStyle style=DEFAULT_Audio_TweenStyle);
#ifndef STRICT_AUDIO
// These apply to AGS 3.2 and above when the Strict Audio setting is enabled
import int TweenMusicMasterVolume(float seconds, short fromVolume, short toVolume, TweenTiming timing=DEFAULT_Audio_TweenTiming, TweenStyle style=DEFAULT_Audio_TweenStyle);
import int TweenDigitalMasterVolume(float seconds, short fromVolume, short toVolume, TweenTiming timing=DEFAULT_Audio_TweenTiming, TweenStyle style=DEFAULT_Audio_TweenStyle);
import int TweenSoundVolume(float seconds, short fromVolume, short toVolume, TweenTiming timing=DEFAULT_Audio_TweenTiming, TweenStyle style=DEFAULT_Audio_TweenStyle);
import int TweenChannelVolume(float seconds, int channel, short fromVolume, short toVolume, TweenTiming timing=DEFAULT_Audio_TweenTiming, TweenStyle style=DEFAULT_Audio_TweenStyle);
#endif

import int TweenX(this Character*, float seconds, short toX, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenY(this Character*, float seconds, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenX(this Object*, float seconds, short toX, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenY(this Object*, float seconds, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenX(this GUI*, float seconds, short toX, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenY(this GUI*, float seconds, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenX(this GUIControl*, float seconds, short toX, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenY(this GUIControl*, float seconds, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenX(this Label*, float seconds, short toX, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenY(this Label*, float seconds, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenX(this Button*, float seconds, short toX, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenY(this Button*, float seconds, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenX(this TextBox*, float seconds, short toX, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenY(this TextBox*, float seconds, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenX(this ListBox*, float seconds, short toX, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenY(this ListBox*, float seconds, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenX(this Slider*, float seconds, short toX, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenY(this Slider*, float seconds, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenX(this InvWindow*, float seconds, short toX, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenY(this InvWindow*, float seconds, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);

import int TweenXBySpeed(this Character*, float speed, short toX, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenYBySpeed(this Character*, float speed, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenXBySpeed(this Object*, float speed, short toX, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenYBySpeed(this Object*, float speed, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenXBySpeed(this GUI*, float speed, short toX, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenYBySpeed(this GUI*, float speed, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenXBySpeed(this GUIControl*, float speed, short toX, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenYBySpeed(this GUIControl*, float speed, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenXBySpeed(this Label*, float speed, short toX, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenYBySpeed(this Label*, float speed, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenXBySpeed(this Button*, float speed, short toX, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenYBySpeed(this Button*, float speed, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenXBySpeed(this TextBox*, float speed, short toX, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenYBySpeed(this TextBox*, float speed, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenXBySpeed(this ListBox*, float speed, short toX, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenYBySpeed(this ListBox*, float speed, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenXBySpeed(this Slider*, float speed, short toX, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenYBySpeed(this Slider*, float speed, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenXBySpeed(this InvWindow*, float speed, short toX, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenYBySpeed(this InvWindow*, float speed, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);

import int TweenPosition(this Character*, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenPosition(this Object*, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenPosition(this GUI*, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenPosition(this GUIControl*, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenPosition(this Label*, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenPosition(this Button*, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenPosition(this TextBox*, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenPosition(this ListBox*, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenPosition(this Slider*, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenPosition(this InvWindow*, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);

import int TweenPositionBySpeed(this Character*, float speed, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenPositionBySpeed(this Object*, float speed, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenPositionBySpeed(this GUI*, float speed, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenPositionBySpeed(this GUIControl*, float speed, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenPositionBySpeed(this Label*, float speed, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenPositionBySpeed(this Button*, float speed, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenPositionBySpeed(this TextBox*, float speed, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenPositionBySpeed(this ListBox*, float speed, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenPositionBySpeed(this Slider*, float speed, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenPositionBySpeed(this InvWindow*, float speed, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);

import int TweenTransparency(this GUI*, float seconds, short toTransparency, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenTransparency(this Object*, float seconds, short toTransparency, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenTransparency(this Character*, float seconds, short toTransparency, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);

import int TweenZOrder(this GUI*, float seconds, short toZOrder, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);

import int TweenSize(this GUI*, float seconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenSize(this GUIControl*, float seconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenSize(this Label*, float seconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenSize(this Button*, float seconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenSize(this TextBox*, float seconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenSize(this ListBox*, float seconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenSize(this Slider*, float seconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenSize(this InvWindow*, float seconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);

import int TweenScaling(this Character*, float seconds, short toScaling, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);

import int TweenImage(this Object*, Object* objectRef, float seconds, short toSprite, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);

import int TweenAnimationSpeed(this Character*, float seconds, short toAnimationSpeed, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);

import int TweenLightLevel(this Region*, float seconds, short toLightLevel, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenTintRed(this Region*, float seconds, short toRed, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenTintGreen(this Region*, float seconds, short toGreen, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenTintBlue(this Region*, float seconds, short toBlue, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenTintSaturation(this Region*, float seconds, short toSaturation, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenTint(this Region*, float seconds, short toRed, short toGreen, short toBlue, short toSaturation, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenTintToGrayscale(this Region*, float seconds, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);

import int TweenTextColor(this Label*, float seconds, short toColor, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenTextColorRed(this Label*, float seconds, short toRed, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenTextColorGreen(this Label*, float seconds, short toGreen, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenTextColorBlue(this Label*, float seconds, short toBlue, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenTextColor(this Button*, float seconds, short toColor, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenTextColorRed(this Button*, float seconds, short toRed, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenTextColorGreen(this Button*, float seconds, short toGreen, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenTextColorBlue(this Button*, float seconds, short toBlue, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);

import int TweenValue(this Slider*, float seconds, short toValue, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);

import int TweenSelectedIndex(this ListBox*, float seconds, short toSelectedIndex, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);

import int TweenTopItem(this ListBox*, float seconds, short toTopItem, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenTopItem(this InvWindow*, float seconds, short toTopItem, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);

import function StopAllTweens(this GUI*, TweenStopResult result=DEFAULT_TweenStopResult);
import function StopAllTweens(this Object*, TweenStopResult result=DEFAULT_TweenStopResult);
import function StopAllTweens(this Character*, TweenStopResult result=DEFAULT_TweenStopResult);
import function StopAllTweens(this Region*, TweenStopResult result=DEFAULT_TweenStopResult);
import function StopAllTweens(this GUIControl*, TweenStopResult result=DEFAULT_TweenStopResult);
import function StopAllTweens(this Label*, TweenStopResult result=DEFAULT_TweenStopResult);
import function StopAllTweens(this Button*, TweenStopResult result=DEFAULT_TweenStopResult);
import function StopAllTweens(this TextBox*, TweenStopResult result=DEFAULT_TweenStopResult);
import function StopAllTweens(this ListBox*, TweenStopResult result=DEFAULT_TweenStopResult);
import function StopAllTweens(this Slider*, TweenStopResult result=DEFAULT_TweenStopResult);
import function StopAllTweens(this InvWindow*, TweenStopResult result=DEFAULT_TweenStopResult);

#ifver 3.1
// These apply to AGS 3.1 and above
import int TweenTextColor(this TextBox*, float seconds, short toColor, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenTextColorRed(this TextBox*, float seconds, short toRed, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenTextColorGreen(this TextBox*, float seconds, short toGreen, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenTextColorBlue(this TextBox*, float seconds, short toBlue, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);

import int TweenHandleOffset(this Slider*, float seconds, short toOffset, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
#endif

#ifdef STRICT_AUDIO
// These apply to AGS 3.2 and above when the Strict Audio setting is enabled
import int TweenSystemVolume(float seconds, short toVolume, TweenTiming timing=DEFAULT_Audio_TweenTiming, TweenStyle style=DEFAULT_Audio_TweenStyle);

import int TweenPanning(this AudioChannel*,  float seconds, short toPanning, TweenTiming timing=DEFAULT_Audio_TweenTiming, TweenStyle style=DEFAULT_Audio_TweenStyle);
import int TweenVolume(this AudioChannel*,  float seconds, short toVolume, TweenTiming timing=DEFAULT_Audio_TweenTiming, TweenStyle style=DEFAULT_Audio_TweenStyle);
import int TweenRoomLocation(this AudioChannel*,  float seconds, short toX, short toY, short fromX, short fromY, TweenTiming timing=DEFAULT_Audio_TweenTiming, TweenStyle style=DEFAULT_Audio_TweenStyle);
import function StopAllTweens(this AudioChannel*, TweenStopResult result=DEFAULT_TweenStopResult);
#endif








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
  int refID;
  
  TweenTiming timing;
  TweenStyle style;

  float duration;
  float frameCount;
  float toX;
  float toY;
  float fromX;
  float fromY;
  
  GUIControl* guiControlRef;

  import function Step(float amount);
};

#endif