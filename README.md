# Newmark's sliding block analysis

This is a Matlab code to run Newmark sliding block analyses using
(a) harmonic excitations (see example1.m) and (b) excitation timehistories
(see example2.m).

Harmonic excitations are defined as a sinusoidal motion,
with amplitude amax and period T.
They consist of a ramp-up phase of N1 cycles,
a main part of N2 cycles, and a ramp-down phase of N3 cycles.

Excitation timehistories are read as arrays of times and accelerations
(in g), using an interpolation function.

The sliding block analysis is conducted using positive and negative
yield accelerations ay1 and ay2, respectively (in g).

More information about the utilised functions is given in the headers.

A sample plotting script is also provided.