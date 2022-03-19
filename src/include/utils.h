#ifndef _UTILS_H
#define _UTILS_H

#include <iostream>
#include <iomanip> // setprecision
#include <sstream> // stringstream

#include <openvr.h>
#include <SDL.h>
#include <SDL_ttf.h>

using namespace std;

// SDL variables
extern SDL_Window* window;
extern SDL_Rect windowRect;
extern TTF_Font* font;
extern SDL_Renderer* renderer;
extern SDL_Color black, green, blue;

void print_text(const char*, SDL_Color, int, int);
string ftos(float f, int precision);	// float to string with 2-decimal precision
string vftos(float* v, int precision);	// float vector to string with 2-decimal precisions
string GetTrackedDeviceString(vr::IVRSystem*, vr::TrackedDeviceIndex_t, vr::TrackedDeviceProperty, vr::TrackedPropertyError *peError = NULL);
string GetTrackedDeviceClassString(vr::ETrackedDeviceClass td_class);

#endif