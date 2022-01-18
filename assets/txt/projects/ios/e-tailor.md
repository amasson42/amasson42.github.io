Apple made many great frameworks to use machine learning with CoreML and image reconition with VisionKit... This project does not use any of those !

I had a coworker who made an algorithm to extract the measurement of someone from three pictures of him in specific position. The algorithm was implemented in C++ and embbeded in an Android application. It was only a proof of concept. There was no interface, only a timer that wait 5 seconds to take the three pictures.

I was then asked to port this application to iOS and to come with a user friendly design to use it.

The first thing I did was to change the C++ implementation to make it cross platform. Then a bridge to use the C++ code on both Android and iOS. Thanks to Objective-C++ and JNI it's possible on both platforms !
