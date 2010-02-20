// Script header for module 'Tween'
//
// Author: Edmundo Ruiz (edmundito, netmonkey)
// Contributors: Tzach Shabtay (tzachs)
//   Please use the messaging function in the AGS forums to contact
//   us about problems or questions.
//
// Revision History:
//    (See CHANGES.TXT for more detailed information)
//    1.2, ???, Settings for default TweenTiming and TweenStyle
//    1.1, February 17 2010, added ~30 new tweens
//    1.0L, July 9 2009, added license
//    1.0, June 13 2009, created
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

// Settings for AGS 3 and ABOVE:
#ifdef AGS_SUPPORTS_IFVER
#ifver 3.0

// Comment this line out if you would like to support AGS 2.x style Tween function calls:
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

///////////////////////////////////////////////////////////////////////////////
// UTILITY FUNCTIONS
///////////////////////////////////////////////////////////////////////////////

// Converts number of seconds to number of game loops 
import int SecondsToLoops(float timeInSeconds);

///////////////////////////////////////////////////////////////////////////////
// TWEEENS
///////////////////////////////////////////////////////////////////////////////

import void TweenStopAll();

import int TweenViewportX(float timeInSeconds, short toX, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenViewportY(float timeInSeconds, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenViewportXY(float timeInSeconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);

import int TweenGamma(float timeInSeconds, short toGamma, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenShakeScreen(float timeInSeconds, short fromDelay, short toDelay, short fromAmount, short toAmount, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);

import int TweenMusicMasterVolume(float timeInSeconds, short fromVolume, short toVolume, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenDigitalMasterVolume(float timeInSeconds, short fromVolume, short toVolume, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenChannelVolume(float timeInSeconds, short channel, short fromVolume, short toVolume, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenSpeechVolume(float timeInSeconds, short fromVolume, short toVolume, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenSoundVolume(float timeInSeconds, short fromVolume, short toVolume, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);

import int TweenAreaScaling(float timeInSeconds, short area, short fromMin, short toMin, short fromMax, short toMax, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);

// FOR AGS 3.0 OR LATER ONLY:

#ifdef AGS_SUPPORTS_IFVER
#ifver 3.0
import int TweenPosition(this GUI*, float timeInSeconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenPosition(this Character*, float timeInSeconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenPosition(this Object*, float timeInSeconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenPosition(this Label*, float timeInSeconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenPosition(this Button*, float timeInSeconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenPosition(this TextBox*, float timeInSeconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenPosition(this ListBox*, float timeInSeconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenPosition(this Slider*, float timeInSeconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenPosition(this InvWindow*, float timeInSeconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);

import int TweenTransparency(this GUI*, float timeInSeconds, short toTransparency, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenTransparency(this Object*, float timeInSeconds, short toTransparency, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenTransparency(this Character*, float timeInSeconds, short toTransparency, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);

import int TweenZOrder(this GUI*, float timeInSeconds, short toZOrder, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);

import void StopAllTweens(this GUI*);
import void StopAllTweens(this Object*);
import void StopAllTweens(this Character*);
import void StopAllTweens(this Region*);
import void StopAllTweens(this Label*);
import void StopAllTweens(this Button*);
import void StopAllTweens(this TextBox*);
import void StopAllTweens(this ListBox*);
import void StopAllTweens(this Slider*);
import void StopAllTweens(this InvWindow*);

import int TweenSize(this GUI*, float timeInSeconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenSize(this Label*, float timeInSeconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenSize(this Button*, float timeInSeconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenSize(this TextBox*, float timeInSeconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenSize(this ListBox*, float timeInSeconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenSize(this Slider*, float timeInSeconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenSize(this InvWindow*, float timeInSeconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);

import int TweenScaling(this Character*, float timeInSeconds, short toScaling, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);

import int TweenImage(this Object*, Object* objectRef, float timeInSeconds, short toSprite, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);

import int TweenAnimationSpeed(this Character*, float timeInSeconds, short toAnimationSpeed, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);

import int TweenLightLevel(this Region*, float timeInSeconds, short toLightLevel, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenTintR(this Region*, float timeInSeconds, short toR, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenTintG(this Region*, float timeInSeconds, short toG, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenTintB(this Region*, float timeInSeconds, short toB, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenTintAmount(this Region*, float timeInSeconds, short toAmount, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenTintBlackAndWhite(this Region*, float timeInSeconds, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);

import int TweenColorR(this Label*, float timeInSeconds, short toR, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenColorG(this Label*, float timeInSeconds, short toG, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenColorB(this Label*, float timeInSeconds, short toB, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenColorR(this Button*, float timeInSeconds, short toR, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenColorG(this Button*, float timeInSeconds, short toG, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenColorB(this Button*, float timeInSeconds, short toB, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenColorR(this TextBox*, float timeInSeconds, short toR, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenColorG(this TextBox*, float timeInSeconds, short toG, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenColorB(this TextBox*, float timeInSeconds, short toB, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);

import int TweenValue(this Slider*, float timeInSeconds, short toValue, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenHandleOffset(this Slider*, float timeInSeconds, short toOffset, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);

import int TweenSelectedItem(this ListBox*, float timeInSeconds, short toSelectedItem, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);

import int TweenTopItem(this ListBox*, float timeInSeconds, short toTopItem, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenTopItem(this InvWindow*, float timeInSeconds, short toTopItem, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
#endif
#endif

// FOR AGS 2.x AND LATER:

#ifndef NO_VER_2_TWEENS
import int TweenGUIPosition(GUI* guiRef, float timeInSeconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenGUITransparency(GUI* guiRef, float timeInSeconds, short toTransparency, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenGUISize(GUI* guiRef, float timeInSeconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenGUIZOrder(GUI* guiRef, float timeInSeconds, short toZOrder, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import void TweenStopAllForGUI(GUI* guiRef);

import int TweenObjectPosition(Object* objectRef, float timeInSeconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenObjectTransparency(Object* objectRef, float timeInSeconds, short toTransparency, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenObjectImage(Object* objectRef, Object* tmpObjectRef, float timeInSeconds, short toSprite, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import void TweenStopAllForObject(Object* objectRef);

import int TweenCharacterPosition(Character* characterRef, float timeInSeconds, short toX, short toY, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenCharacterScaling(Character* characterRef, float timeInSeconds, short toScaling, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenCharacterTransparency(Character* characterRef, float timeInSeconds, short toTransparency, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenCharacterAnimationSpeed(Character* characterRef, float timeInSeconds, short toAnimationSpeed, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import void TweenStopAllForCharacter(Character* characterRef);

import int TweenRegionLightLevel(Region* regionRef, float timeInSeconds, short toLightLevel, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenRegionTintR(Region* regionRef, float timeInSeconds, short toR, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenRegionTintG(Region* regionRef, float timeInSeconds, short toG, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenRegionTintB(Region* regionRef, float timeInSeconds, short toB, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenRegionTintAmount(Region* regionRef, float timeInSeconds, short toAmount, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import int TweenRegionTintBlackAndWhite(Region* regionRef, float timeInSeconds, TweenTiming timing=DEFAULT_TweenTiming, TweenStyle style=DEFAULT_TweenStyle);
import void TweenStopAllForRegion(Region* guiRef);

import int TweenLabelSize(Label* labelRef, float timeInSeconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenLabelPosition(Label* labelRef, float timeInSeconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenLabelColorR(Label* labelRef, float timeInSeconds, short toR, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenLabelColorG(Label* labelRef, float timeInSeconds, short toG, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenLabelColorB(Label* labelRef, float timeInSeconds, short toB, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import void TweenStopAllForLabel(Label* guiRef);

import int TweenButtonSize(Button* buttonRef, float timeInSeconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenButtonPosition(Button* buttonRef, float timeInSeconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenButtonColorR(Button* buttonRef, float timeInSeconds, short toR, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenButtonColorG(Button* buttonRef, float timeInSeconds, short toG, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenButtonColorB(Button* buttonRef, float timeInSeconds, short toB, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import void TweenStopAllForButton(Button* guiRef);

import int TweenTextBoxSize(TextBox* textBoxRef, float timeInSeconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenTextBoxPosition(TextBox* textBoxRef, float timeInSeconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import void TweenStopAllForTextBox(TextBox* guiRef);

import int TweenListBoxSize(ListBox* listBoxRef, float timeInSeconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenListBoxPosition(ListBox* listBoxRef, float timeInSeconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenListBoxSelectedItem(ListBox* listBoxRef, float timeInSeconds, short toSelectedItem, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenListBoxTopItem(ListBox* listBoxRef, float timeInSeconds, short toTopItem, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import void TweenStopAllForListBox(ListBox* guiRef);

import int TweenSliderSize(Slider* sliderRef, float timeInSeconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenSliderPosition(Slider* sliderRef, float timeInSeconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenSliderValue(Slider* sliderRef, float timeInSeconds, short toValue, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenSliderHandleOffset(Slider* sliderRef, float timeInSeconds, short toOffset, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import void TweenStopAllForSlider(Slider* guiRef);

import int TweenInvWindowSize(InvWindow* invWindowRef, float timeInSeconds, short toWidth, short toHeight, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenInvWindowPosition(InvWindow* invWindowRef, float timeInSeconds, short toX, short toY, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import int TweenInvWindowTopItem(InvWindow* invWindowRef, float timeInSeconds, short toTopItem, TweenTiming timing=DEFAULT_GUI_TweenTiming, TweenStyle style=DEFAULT_GUI_TweenStyle);
import void TweenStopAllForInvWindow(InvWindow* guiRef);
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
  _eTweenMusicMasterVolume, 
  _eTweenDigitalMasterVolume, 
  _eTweenChannelVolume, 
  _eTweenSpeechVolume, 
  _eTweenSoundVolume, 
  _eTweenAreaScaling
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
