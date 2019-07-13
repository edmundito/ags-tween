// Right now these are only experiments for a new Tween engine

managed struct ManagedTween {
  protected float _duration;
  import attribute float Duration;
  import ManagedTween* SetStartDelay(float startDelay);
  import ManagedTween* Play();
  import ManagedTween* Stop();
  import ManagedTween* Pause();
  import ManagedTween* Rewind();
};

managed struct ManagedTween2 extends ManagedTween {
};

import void ManagedTweenTimeline(ManagedTween* tween1, ManagedTween* tween2,  ManagedTween* tween3 = 0);