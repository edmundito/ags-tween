// Script header for module 'Tween'
//
// Author: Edmundo Ruiz (edmundito, netmonkey)
// Contributors: Tzach Shabtay (tzachs)
//  Please use the messaging function in the AGS forums to contact
//  us about problems or questions.
//
// Revision History:
//  (See CHANGES.TXT for more detailed information)
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
// Copyright (c) 2009 Edmundo Ruiz (http://www.edmundito.com/)
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
// credit in your game or the AGS Games Page such as:
//
// Game:
// Special Thanks
// Edmundo Ruiz
// Tzach Shabtay
//
// AGS Games page:
// netmonkey Tween Module
// tzachs Tween Module


///////////////////////////////////////////////////////////////////////////////
// SETTINGS - Feel free to change this for your game!
///////////////////////////////////////////////////////////////////////////////

// Max number of simultaneous tweens that this module can play
// Feel free to change this number, but the higher it is, the slower it might be
// So just increase or decrease it to however many you need.
#define MAX_TWEENS 10

// Default TweenTiming
#define DEFAULT_TweenTiming eLinearTween // All Tweens Except GUI and GUI element Tweens
#define DEFAULT_GUI_TweenTiming eLinearTween // For GUI and GUI element Tweens Only

// Default TweenStyle
#define DEFAULT_TweenStyle eBlockTween // All Tweens Except GUI and GUI element Tweens
#define DEFAULT_GUI_TweenStyle eBlockTween // For GUI and GUI element Tweens Only

// Default TweenStopResult
#define DEFAULT_TweenStopResult ePauseTween // The expected behavior for stopping all tweens

// Settings for AGS 3 and ABOVE:
#ifdef AGS_SUPPORTS_IFVER
#ifver 3.0

// Comment this line out if you would like to support AGS 2.x style Tween function calls in AGS 3.0+:
#define NO_VER_2_TWEENS

#endif
#endif

///////////////////////////////////////////////////////////////////////////////
// ENUMERATIONS
///////////////////////////////////////////////////////////////////////////////

enum TweenTiming {
  eLinearTween,
  eEaseInTween,
  eEaseOutTween,
  eEaseInEaseOutTween
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

///////////////////////////////////////////////////////////////////////////////
// TWEENS
///////////////////////////////////////////////////////////////////////////////

import function TweenStopAll(TweenStopResult result=DEFAULT_TweenStopResult);

import int TweenViewportX(float seconds, short toX, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenViewportY(float seconds, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenViewportXY(float seconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);

import int TweenGamma(float seconds, short toGamma, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenShakeScreen(float seconds, short fromDelay, short toDelay, short fromAmount, short toAmount, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenAreaScaling(float seconds, short area, short fromMin, short toMin, short fromMax, short toMax, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);

import int TweenSpeechVolume(float seconds, short fromVolume, short toVolume, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
#ifndef STRICT_AUDIO
import int TweenMusicMasterVolume(float seconds, short fromVolume, short toVolume, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenDigitalMasterVolume(float seconds, short fromVolume, short toVolume, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenSoundVolume(float seconds, short fromVolume, short toVolume, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenChannelVolume(float seconds, short channel, short fromVolume, short toVolume, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
#endif
// Sorry, no new-style audio support in AGS 3.2+ yet!


// FOR AGS 3.0 OR LATER ONLY:
#ifdef AGS_SUPPORTS_IFVER
#ifver 3.0
import int TweenPosition(this GUI*, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenPosition(this Character*, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenPosition(this Object*, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenPosition(this Label*, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenPosition(this Button*, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenPosition(this TextBox*, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenPosition(this ListBox*, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenPosition(this Slider*, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenPosition(this InvWindow*, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);

import int TweenTransparency(this GUI*, float seconds, short toTransparency, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenTransparency(this Object*, float seconds, short toTransparency, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenTransparency(this Character*, float seconds, short toTransparency, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);

import int TweenZOrder(this GUI*, float seconds, short toZOrder, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);

import int TweenSize(this GUI*, float seconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
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
import int TweenTintR(this Region*, float seconds, short toR, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenTintG(this Region*, float seconds, short toG, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenTintB(this Region*, float seconds, short toB, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenTintAmount(this Region*, float seconds, short toAmount, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenTintBlackAndWhite(this Region*, float seconds, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);

import int TweenColorR(this Label*, float seconds, short toR, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenColorG(this Label*, float seconds, short toG, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenColorB(this Label*, float seconds, short toB, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenColorR(this Button*, float seconds, short toR, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenColorG(this Button*, float seconds, short toG, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenColorB(this Button*, float seconds, short toB, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenColorR(this TextBox*, float seconds, short toR, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenColorG(this TextBox*, float seconds, short toG, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenColorB(this TextBox*, float seconds, short toB, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);

import int TweenValue(this Slider*, float seconds, short toValue, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenHandleOffset(this Slider*, float seconds, short toOffset, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);

import int TweenSelectedItem(this ListBox*, float seconds, short toSelectedItem, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);

import int TweenTopItem(this ListBox*, float seconds, short toTopItem, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenTopItem(this InvWindow*, float seconds, short toTopItem, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);

import function StopAllTweens(this GUI*, TweenStopResult result=DEFAULT_TweenStopResult);
import function StopAllTweens(this Object*, TweenStopResult result=DEFAULT_TweenStopResult);
import function StopAllTweens(this Character*, TweenStopResult result=DEFAULT_TweenStopResult);
import function StopAllTweens(this Region*, TweenStopResult result=DEFAULT_TweenStopResult);
import function StopAllTweens(this Label*, TweenStopResult result=DEFAULT_TweenStopResult);
import function StopAllTweens(this Button*, TweenStopResult result=DEFAULT_TweenStopResult);
import function StopAllTweens(this TextBox*, TweenStopResult result=DEFAULT_TweenStopResult);
import function StopAllTweens(this ListBox*, TweenStopResult result=DEFAULT_TweenStopResult);
import function StopAllTweens(this Slider*, TweenStopResult result=DEFAULT_TweenStopResult);
import function StopAllTweens(this InvWindow*, TweenStopResult result=DEFAULT_TweenStopResult);
#endif
#endif

// FOR AGS 2.x AND LATER:
#ifndef NO_VER_2_TWEENS
import int TweenGUIPosition(GUI* guiRef, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenGUITransparency(GUI* guiRef, float seconds, short toTransparency, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenGUISize(GUI* guiRef, float seconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenGUIZOrder(GUI* guiRef, float seconds, short toZOrder, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import function TweenStopAllForGUI(GUI* guiRef, TweenStopResult result=DEFAULT_TweenStopResult);

import int TweenObjectPosition(Object* objectRef, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenObjectTransparency(Object* objectRef, float seconds, short toTransparency, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenObjectImage(Object* objectRef, Object* tmpObjectRef, float seconds, short toSprite, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import function TweenStopAllForObject(Object* objectRef, TweenStopResult result=DEFAULT_TweenStopResult);

import int TweenCharacterPosition(Character* characterRef, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenCharacterScaling(Character* characterRef, float seconds, short toScaling, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenCharacterTransparency(Character* characterRef, float seconds, short toTransparency, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenCharacterAnimationSpeed(Character* characterRef, float seconds, short toAnimationSpeed, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import function TweenStopAllForCharacter(Character* characterRef, TweenStopResult result=DEFAULT_TweenStopResult);

import int TweenRegionLightLevel(Region* regionRef, float seconds, short toLightLevel, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenRegionTintR(Region* regionRef, float seconds, short toR, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenRegionTintG(Region* regionRef, float seconds, short toG, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenRegionTintB(Region* regionRef, float seconds, short toB, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenRegionTintAmount(Region* regionRef, float seconds, short toAmount, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenRegionTintBlackAndWhite(Region* regionRef, float seconds, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import function TweenStopAllForRegion(Region* guiRef, TweenStopResult result=DEFAULT_TweenStopResult);

import int TweenLabelSize(Label* labelRef, float seconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenLabelPosition(Label* labelRef, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenLabelColorR(Label* labelRef, float seconds, short toR, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenLabelColorG(Label* labelRef, float seconds, short toG, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenLabelColorB(Label* labelRef, float seconds, short toB, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import function TweenStopAllForLabel(Label* guiRef, TweenStopResult result=DEFAULT_TweenStopResult);

import int TweenButtonSize(Button* buttonRef, float seconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenButtonPosition(Button* buttonRef, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenButtonColorR(Button* buttonRef, float seconds, short toR, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenButtonColorG(Button* buttonRef, float seconds, short toG, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenButtonColorB(Button* buttonRef, float seconds, short toB, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import function TweenStopAllForButton(Button* guiRef, TweenStopResult result=DEFAULT_TweenStopResult);

import int TweenTextBoxSize(TextBox* textBoxRef, float seconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenTextBoxPosition(TextBox* textBoxRef, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import function TweenStopAllForTextBox(TextBox* guiRef, TweenStopResult result=DEFAULT_TweenStopResult);

import int TweenListBoxSize(ListBox* listBoxRef, float seconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenListBoxPosition(ListBox* listBoxRef, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenListBoxSelectedItem(ListBox* listBoxRef, float seconds, short toSelectedItem, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenListBoxTopItem(ListBox* listBoxRef, float seconds, short toTopItem, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import function TweenStopAllForListBox(ListBox* guiRef, TweenStopResult result=DEFAULT_TweenStopResult);

import int TweenSliderSize(Slider* sliderRef, float seconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenSliderPosition(Slider* sliderRef, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenSliderValue(Slider* sliderRef, float seconds, short toValue, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenSliderHandleOffset(Slider* sliderRef, float seconds, short toOffset, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import function TweenStopAllForSlider(Slider* guiRef, TweenStopResult result=DEFAULT_TweenStopResult);

import int TweenInvWindowSize(InvWindow* invWindowRef, float seconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenInvWindowPosition(InvWindow* invWindowRef, float seconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenInvWindowTopItem(InvWindow* invWindowRef, float seconds, short toTopItem, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import function TweenStopAllForInvWindow(InvWindow* guiRef, TweenStopResult result=DEFAULT_TweenStopResult);
#endif





///////////////////////////////////////////////////////////////////////////////
// FOR INTERNAL USE BY THIS MODULE ONLY
///////////////////////////////////////////////////////////////////////////////
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
  _eTweenRegionTintR,
  _eTweenRegionTintG,
  _eTweenRegionTintB,
  _eTweenRegionTintAmount,
  _eTweenLabelColorR,
  _eTweenLabelColorG,
  _eTweenLabelColorB,
  _eTweenLabelPosition,
  _eTweenLabelSize,
  _eTweenButtonPosition,
  _eTweenButtonSize,
  _eTweenButtonColorR,
  _eTweenButtonColorG,
  _eTweenButtonColorB,
  _eTweenTextBoxPosition,
  _eTweenTextBoxSize,
  _eTweenTextBoxColorR,
  _eTweenTextBoxColorG,
  _eTweenTextBoxColorB,
  _eTweenSliderPosition,
  _eTweenSliderSize,
  _eTweenSliderValue,
  _eTweenSliderHandleOffset,
  _eTweenListBoxPosition,
  _eTweenListBoxSize,
  _eTweenListBoxSelectedItem,
  _eTweenListBoxTopItem,
  _eTweenInvWindowPosition,
  _eTweenInvWindowSize,
  _eTweenInvWindowTopItem,
  _eTweenViewportX,
  _eTweenViewportY,
  _eTweenViewportXY,
  _eTweenGamma,
  _eTweenShakeScreen,
  _eTweenAreaScaling,
  _eTweenSpeechVolume,
#ifndef STRICT_AUDIO
  _eTweenMusicMasterVolume,
  _eTweenDigitalMasterVolume,
  _eTweenSoundVolume,
  _eTweenChannelVolume,
#endif
};

struct _TweenData {
  _TweenType type;

  TweenTiming timing;
  TweenStyle style;

  int duration;
  int frameCount;

  short toX;
  short toY;
  short fromX;
  short fromY;

  short extraParam1;

  GUI* guiRef;
  Object* objectRef;
  Character* characterRef;
  Region* regionRef;
  Label* labelRef;
  Button* buttonRef;
  TextBox* textBoxRef;
  ListBox* listBoxRef;
  Slider* sliderRef;
  InvWindow* invWindowRef;

  import function step(float amount);
};
