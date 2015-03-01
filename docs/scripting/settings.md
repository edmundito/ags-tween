You can adjust default settings at the top of the **Tween.ash** file:

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

    // Default TweenTimingType
    #define Tween_TIMING eTweenSeconds
    #define Tween_TIMING_GUI eTweenSeconds
    #define Tween_TIMING_AUDIO eTweenSeconds


These allow you to change the defaults in some of the tween.

For example, by default all GUI tweens are blocking (`eBlockTween`). If you would like to start with
all non-blocking tweens instead, you can change the definition of `Tween_EASING_TYPE_GUI` to:

    #define Tween_STYLE_GUI eNoBlockTween
