# Forward kinematics of a general Stewart-Gough platform

A Stewart-Gough platform (SGP) is a type of parallel manipulator used in various applications including flight simulators, robotic manipulators, haptic devices, surgical robots, radio telescopes, etc. The SGP consists of a fixed base and a movable platform connected by six extensible legs. Each leg is connected to both the base and the platform through universal (spherical) joints, allowing for a wide range of motion, see Figure. The lengths of the legs are typically controlled by actuators, such as hydraulic or pneumatic cylinders, which can extend or retract the legs.

<p align="center">
  <img src="SGP.png" width="32%" />
</p>
<p align="center">
  <bf>Figure 1:</bf> The general Stewart-Gough platform
</p>

The forward (or direct) kinematics problem for a Stewart-Gough platform involves determining the position and orientation of the movable platform given the lengths of the six extensible legs. This problem is inherently complex due to the parallel structure of the platform, which results in a system of non-linear equations.

MATLAB/Julia/Python implementations of the algorithm from

@article{martyushev2025forward,<br />
&nbsp;&nbsp;&nbsp; title={Forward kinematics of a general Stewart--Gough platform by elimination templates},<br />
&nbsp;&nbsp;&nbsp; author={Martyushev, Evgeniy},<br />
&nbsp;&nbsp;&nbsp; journal={},<br />
&nbsp;&nbsp;&nbsp; volume={},<br />
&nbsp;&nbsp;&nbsp; number={},<br />
&nbsp;&nbsp;&nbsp; pages={},<br />
&nbsp;&nbsp;&nbsp; year={2025},<br />
&nbsp;&nbsp;&nbsp; publisher={}<br />
}

If you use this code, please cite the above paper.

The implementations have been tested on
* MATLAB R2019b
* Julia 1.11.3
* Python 3.13.2 + numpy-2.2.2 + scipy-1.15.1