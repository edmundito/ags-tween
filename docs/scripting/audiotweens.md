# 1. General

## Speech Volume

    TweenSpeechVolume(float timing, int fromVolume, int toVolume, optional TweenTiming, optional TweenStyle, optional startDelay, optional TweenTimingType)

    StopTweenSpeechVolume(optional TweenStopResult)

Tweens the volume for speech from one value to another. Range: 0 to 255.

    // Will tween the volume for speech from 100 to 50.
    TweenSpeechVolume(3.0, 100, 50);

    // To Stop:
    StopTweenSpeechVolume();


# 2. New-Style Audio

New-Style audio tweens only work in AGS 3.2 or above if the **Enable new-style audio scripting** is set to **True** in the AGS Editor **General Settings** under **Backwards Compatibility**.

## System Volume

    // AGS 3.2+ (with new-style audio scripting enabled)
    TweenSystemVolume(float timing, int toVolume, optional TweenTiming, optional TweenStyle, optional startDelay, optional TweenTimingType)

    StopTweenSystemVolume(optional TweenStopResult)
    
    // In AGS 3.4.0 or above you can also use:
    System.TweenVolume(float timing, int toVolume, optional TweenTiming, optional TweenStyle, optional startDelay, optional TweenTimingType)

    System.StopTweenVolume(optional TweenStopResult)

Tweens the master volume (`System.Volume`) to a new value. Range: 0 to 100.

    // Will tween the system volume from 100 to 50 in 3 seconds.
    System.Volume = 100;
    System.TweenVolume(3.0, 50);

    // To Stop:
    System.StopTweenVolume();


## AudioChannel Panning

    // AGS 3.2+ (with new-style audio scripting enabled)
    AudioChannel.TweenPanning(float timing, int toPanning, optional TweenTiming, optional TweenStyle, optional startDelay, optional TweenTimingType)

    AudioChannel.StopTweenPanning(optional TweenStopResult)

Tweens an `AudioChannel` panning to to a new value. Range: -100 to 100.

    // Will tween the AudioChannel panning from -100 to 100 in 3 seconds.
    myAudioChannel.Panning = -100;
    myAudioChannel.TweenPanning(3.0, 100);

    // To Stop:
    myAudioChannel.StopTweenPanning();


## AudioChannel Position

    // AGS 3.2+ (with new-style audio scripting enabled)
    AudioChannel.TweenPosition(float timing, int toPosition, optional TweenTiming, optional TweenStyle, optional startDelay, optional TweenTimingType)

    AudioChannel.StopTweenPosition(optional TweenStopResult)

Tweens an `AudioChannel` position to to a new value. Range: 0 to length of clip.
Please note that tweening the position might not very smooth due to engine limitations and may result in a "glitchy" effect.

    // Will tween the AudioChannel position to 1000 ms.
    myAudioChannel.TweenPosition(1.0, 1000);
    
    // To Stop:
    myAudioChannel.StopTweenPosition();
    
## AudioChannel Speed (3.4.0+)

    // AGS 3.4.0 or above (with new-style audio scripting enabled)
    AudioChannel.TweenSpeed(float timing, int toSpeed, optional TweenTiming, optional TweenStyle, optional startDelay, optional TweenTimingType)

    AudioChannel.StopTweenSpeed(optional TweenStopResult)

Tweens an `AudioChannel` playback speed to a new value.

    // Will tween the AudioChannel speed from 1000 to 100 in 1 second.
    myAudioChannel.TweenSpeed(1.0, 100);
    
    // To Stop:
    myAudioChannel.StopTweenSpeed();
        
## AudioChannel Volume

    // AGS 3.2+ (with new-style audio scripting enabled)
    AudioChannel.TweenVolume(float timing, int toVolume, optional TweenTiming, optional TweenStyle, optional startDelay, optional TweenTimingType)
    AudioChannel.TweenFadeIn(float timing, optional TweenTiming, optional TweenStyle, optional startDelay, optional TweenTimingType)
    AudioChannel.TweenFadeOut(float timing, optional TweenTiming, optional TweenStyle, optional startDelay, optional TweenTimingType)

    AudioChannel.StopTweenVolume(optional TweenStopResult)

Tweens an `AudioChannel` volume to to a new value. Range: 0 to 100.

    // Will tween the AudioChannel volume from 0 to 100 in 3 seconds.
    myAudioChannel.Volume = 0;
    myAudioChannel.TweenVolume(3.0, 100);

    // Alternatively, you can also call:
    myAudioChannel.TweenFadeIn(3.0);

    // To Stop:
    myAudioChannel.StopTweenVolume();

## AudioChannel Room Location

    // AGS 3.2+ (with new-style audio scripting enabled)
    AudioChannel.TweenRoomLocation(float timing, int toX, int toY, optional TweenTiming, optional TweenStyle, optional startDelay, optional TweenTimingType)

    AudioChannel.StopTweenRoomLocation(optional TweenStopResult)

Tweens an `AudioChannel` room location to a new x and y value. Note that tweening to `0` will remove the directional effect immediately, possibly creating a strange effect.

    // Will tween the AudioChannel room location to 320, 240.
    myAudioChannel.SetRoomLocation(1, 1);
    myAudioChannel.TweenRoomLocation(3.0, 320, 240);

    // To Stop:
    myAudioChannel.StopTweenRoomLocation();

## AudioChannel Stop All Tweens

    AudioChannel.StopAllTweens(optional TweenStopResult)

Will stop all the tweens affecting the current `AudioChannel`.


# 3. Legacy Audio

Legacy audio tweens only work in AGS 3.1 or below or if the **Enable new-style audio scripting** is set to **False** in the AGS Editor **General Settings** under **Backwards Compatibility**.

## Sound Volume

    // AGS 3.0, 3.1 (and 3.2+ with new-style audio scripting disabled)
    TweenSoundVolume(float timing, int fromVolume, int toVolume, optional TweenTiming, optional TweenStyle, optional startDelay, optional TweenTimingType)

    StopTweenSoundVolume(optional TweenStopResult)

Tweens the sound effect volume from one value to another. Range: 0 to 255.

    // Will tween the sound effect volume from 100 to 50.
    TweenSoundVolume(3.0, 100, 50);

    // To Stop:
    StopTweenSoundVolume();


## Music Master Volume

    // AGS 3.0, 3.1 (and 3.2+ with new-style audio scripting disabled)
    TweenMusicMasterVolume(float timing, int fromVolume, int toVolume, optional TweenTiming, optional TweenStyle, optional startDelay, optional TweenTimingType)

    StopTweenMusicMasterVolume(optional TweenStopResult)

Tweens the master music volume from one value to another. Range: 1 to 100.

    // Will tween the music volume from 100 to 50.
    TweenMusicMasterVolume(3.0, 100, 50);

    // To Stop:
    StopTweenMusicMasterVolume();


## Digital Master Volume

    // AGS 3.0, 3.1 (and 3.2+ with new-style audio scripting disabled)
    TweenDigitalMasterVolume(float timing, int fromVolume, int toVolume, optional TweenTiming, optional TweenStyle, optional startDelay, optional TweenTimingType)

    StopTweenDigitalMasterVolume(optional TweenStopResult)

Tweens the master digital volume from one value to another. Range: 1 to 100.

    // Will tween the digital volume from 100 to 50.
    TweenDigitalMasterVolume(3.0, 100, 50);

    // To Stop:
    StopTweenDigitalMasterVolume();


## Channel Volume

    // AGS 3.0, 3.1 (and 3.2+ with new-style audio scripting disabled)
    TweenChannelVolume(float timing, int channel, int fromVolume, int toVolume, optional TweenTiming, optional TweenStyle, optional startDelay, optional TweenTimingType)

    StopTweenChannelVolume(optional TweenStopResult)

Tweens the volume for a given channel from one value to another. Range: 0 to 255.

    // Will tween the volume for channel 1 from 100 to 50.
    TweenChannelVolume(3.0, 1, 100, 50);

    // To Stop:
    StopTweenChannelVolume();