s.waitForBoot({
  // Play scale once.
  x = Pbind(\degree, Pseq([0, 3, 5, 7], 1), \dur, 0.25);
  x.play;
});