// Script header for module 'Tween'
// Author: Edmundo Ruiz (edmundito, netmonkey)
//   Please use the PM function on the AGS forums to contact
//   me about problems with this module
//
// Revision history:
//   1.1, July 9 2009, added license
//   1.0, June 13 2009, created
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
// That said, you are most welcome but not obliged to give me some
// credit in your game or the AGS Games Page such as:
//
// Game:
// Special Thanks
// Edmundo Ruiz
//
// AGS Games page:
// netmonkey Tween Module



// Max number of simultaneous tweens that this module can play
// Feel free to change this number, but the higher it is, the slower it might be
// So just increase it to however many you need.
#define MAX_TWEENS 8

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

// Converts number of seconds to number of game loops 
import int SecondsToLoops(float timeInSeconds);

import void TweenStopAll();

///////////////////////////////////////////////////////////////////////////////
// FOR AGS 3.0 OR LATER ONLY
///////////////////////////////////////////////////////////////////////////////
//

#ifdef AGS_SUPPORTS_IFVER
#ifver 3.0
import int TweenPosition(this GUI*, float timeInSeconds, short toX, short toY, TweenTiming timing=eLinearTween, TweenStyle style=eNoBlockTween);
import int TweenPosition(this Character*, float timeInSeconds, short toX, short toY, TweenTiming timing=eLinearTween, TweenStyle style=eBlockTween);
import int TweenPosition(this Object*, float timeInSeconds, short toX, short toY, TweenTiming timing=eLinearTween, TweenStyle style=eBlockTween);

import int TweenTransparency(this GUI*, float timeInSeconds, short toTransparency, TweenTiming timing=eLinearTween, TweenStyle style=eNoBlockTween);
import int TweenTransparency(this Object*, float timeInSeconds, short toTransparency, TweenTiming timing=eLinearTween, TweenStyle style=eBlockTween);
import int TweenTransparency(this Character*, float timeInSeconds, short toTransparency, TweenTiming timing=eLinearTween, TweenStyle style=eBlockTween);

import void StopAllTweens(this GUI*);
import void StopAllTweens(this Object*);
import void StopAllTweens(this Character*);

import int TweenSize(this GUI*, float timeInSeconds, short toWidth, short toHeight, TweenTiming timing=eLinearTween, TweenStyle style=eNoBlockTween);

import int TweenScaling(this Character*, float timeInSeconds, short toScaling, TweenTiming timing=eLinearTween, TweenStyle style=eBlockTween);

// Comment this line if you would like to support AGS 2.x style Tween function calls:
#define NO_VER_2_TWEENS

#endif
#endif


///////////////////////////////////////////////////////////////////////////////
// FOR AGS 2.x AND LATER
///////////////////////////////////////////////////////////////////////////////


#ifndef NO_VER_2_TWEENS
import int TweenGUIPosition(GUI* guiRef, float timeInSeconds, short toX, short toY, TweenTiming timing=eLinearTween, TweenStyle style=eNoBlockTween);
import int TweenGUITransparency(GUI* guiRef, float timeInSeconds, short toTransparency, TweenTiming timing=eLinearTween, TweenStyle style=eNoBlockTween);
import int TweenGUISize(GUI* guiRef, float timeInSeconds, short toWidth, short toHeight, TweenTiming timing=eLinearTween, TweenStyle style=eNoBlockTween);
import void TweenStopAllForGUI(GUI* guiRef);

import int TweenObjectPosition(Object* objectRef, float timeInSeconds, short toX, short toY, TweenTiming timing=eLinearTween, TweenStyle style=eBlockTween);
import int TweenObjectTransparency(Object* objectRef, float timeInSeconds, short toTransparency, TweenTiming timing=eLinearTween, TweenStyle style=eBlockTween);
import void TweenStopAllForObject(Object* objectRef);

import int TweenCharacterPosition(Character* characterRef, float timeInSeconds, short toX, short toY, TweenTiming timing=eLinearTween, TweenStyle style=eBlockTween);
import int TweenCharacterScaling(Character* characterRef, float timeInSeconds, short toScaling, TweenTiming timing=eLinearTween, TweenStyle style=eBlockTween);
import int TweenCharacterTransparency(Character* characterRef, float timeInSeconds, short toTransparency, TweenTiming timing=eLinearTween, TweenStyle style=eBlockTween);
import void TweenStopAllForCharacter(Character* characterRef);
#endif

///////////////////////////////////////////////////////////////////////////////
// For internal use by this module only.

enum _TweenType {
	_eTweenGUIPosition, 
	_eTweenGUITransparency, 
	_eTweenGUISize,
	_eTweenObjectPosition, 
	_eTweenObjectTransparency, 
	_eTweenCharacterPosition,
	_eTweenCharacterScaling,
	_eTweenCharacterTransparency,
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
  
  GUI* guiRef;
  Object* objectRef;
  Character* characterRef;
  
  import function step(float amount);
};
