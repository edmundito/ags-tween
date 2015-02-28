The `TweenGame` object adds additional functions that AGS's `Game` object does not contain.
These functions are also used internally by the Tween module.

## GetRFromColor

    static int TweenGame.GetRFromColor(int color)

Returns the red value from a colour number. This is complementary to AGS's `Game.GetColorFromRGB`.

    int red = TweenGame.GetRFromColor(15);

## GetGFromColor

    static int TweenGame.GetGFromColor(int color)

Returns the green value from a colour number. This is complementary to AGS's `Game.GetColorFromRGB`.

    int green = TweenGame.GetGFromColor(15);

## GetBFromColor

    static int TweenGame.GetRFromColor(int color)

Returns the blue value from a colour number. This is complementary to AGS's `Game.GetColorFromRGB`.

    int blue = TweenGame.GetGFromColor(15);
