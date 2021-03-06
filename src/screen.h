#ifndef SCREEN_H
#define SCREEN_H

#include <raylib.h>
#include <raymath.h>
#include <stdio.h>
#include <stdlib.h>

#include "resource.h"

typedef struct Screen_t {
    bool in_use;
    Vector3 pos;
    Vector3 realpos;
    RenderTexture2D texture;
} Screen_t;

const double screen_w_gl = 1.0485;
const double screen_h_gl = 1.049;
const int screen_w = 512;
const int screen_h = 512;

Screen_t local_screen;
Vector3 screen_offset;

void loadScreenModels(Shader);
void freeScreenModels();
Screen_t loadScreen(int, int);
void drawScreen(Screen_t*);
void drawPlayer(Screen_t*, float);

#endif
