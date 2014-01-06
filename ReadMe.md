# Temporal-Difference Learning Demos in MATLAB

In this package you will find MATLAB codes which demonstrate some selected examples of *temporal-difference learning* methods in *prediction problems* and in *reinforcement learning*.

To begin:

* Run `DemoGUI.m`
* Start with the set of predefined demos: select one and press *Go*
* Modify demos: select one of the predefined demos, and modify the options

Feel free to distribute or use package especially for educational purposes. I personally, learned too much from cliff-walking. 

The repository for the package is hosted on [GitHub](https://github.com/sinairv/Temporal-Difference-Learning).

## Why temporal difference learning is important

A quotation from *R. S. Sutton*, and *A. G. Barto* from their book *Introduction to Reinforcement Learning* ([here](http://www.cs.ualberta.ca/~sutton/book/ebook/node60.html)):

> If one had to identify one idea as central and novel to reinforcement learning, it would undoubtedly be temporal-difference (TD) learning. 

Many basic reinforcement learning algorithms such as *Q-Laerning* and *SARSA* are in essence *temporal difference learning methods*.

## Demos

* *Prediciton random walk*: see how precise we can predict the probability of visiting nodes

* *RL random walk*: see how RL generated random walk policy converges the computed probabilities.

* *Simple grid world (with and without king moves)*: see how RL generated policy helps the agent find the goal through time (by *king-moves* it is meant moving along the four main directions and the diagonals, i.e., the way king moves in chess).

* *Windy grid world*: the wind distracts the agent from its destination sought by its actions. See how RL solves this problem.

* *Cliff walking*: the agent should reach its destination while avoiding the cliffs. A truly instructive example, which shows the differences between *on-policy*, and *off-policy* learning algorithms. 

## References

[1] Sutton, R. S., "Learning to predict by the methods of temporal differences, In *Machine Learning*, pp. 9-44, 1988 (available [online](http://webdocs.cs.ualberta.ca/~sutton/papers/sutton-88.pdf))

[2] Sutton, R. S. and Barto, A. G., "Reinforcement learning: An introduction," 1998 (available [online](http://webdocs.cs.ualberta.ca/~sutton/book/ebook/the-book.html))

[3] Kaelbling, L. P., Littman, M. L., and Moore, A. W., "Reinforcement learning: A survey," *Journal of Artificial Intelligence Research*, Vol.4, pp.237-285, 1997 (available [online](http://www.jair.org/media/301/live-301-1562-jair.pdf))

## Contact

Copyright (c) 2011 Sina Iravanian - licensed under MIT.

Homepage: [www.sinairv.com](http://www.sinairv.com)

GitHub: [github.com/sinairv](https://github.com/sinairv)

Twitter: [@sinairv](http://www.twitter.com/sinairv)

## Screenshots

Prediction random walk demo:

![Prediction random walk demo](http://www.sinairv.com/Temporal-Difference-Learning/images/PrdRandomWalk.png)

RL random walk demo:

![RL random walk demo](http://www.sinairv.com/Temporal-Difference-Learning/images/RLRandomWalk.png)

Simple grid-world demo:

![Simple grid-world demo](http://www.sinairv.com/Temporal-Difference-Learning/images/GridWorlds.png)
