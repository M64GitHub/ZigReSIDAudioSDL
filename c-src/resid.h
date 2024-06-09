#ifndef SDL_RESID_H
#define SDL_RESID_H

#include "audio-config.h"

typedef struct S_ReSID_t {
  // public:
  //     ReSID();
  //     ~ReSID();
  //
  // void writeRegs(unsigned char *regs, int len);
  //
  // // dumb audio rendering, not frame aware
  // int clock(unsigned int cycles, short *buf, int buflen);
  //

  // calculated CONSTANTS
  int SAMPLES_PER_FRAME;
  int CYCLES_PER_FRAME;
  double CYCLES_PER_SAMPLE;

  unsigned char shadow_regs[32];

  // private:
  //     void precalc_constants();

  // SID sid;    // NOTE:  <=================================== C++ obj
} ReSID;

ReSID *ReSID_new();

void ReSID_init(ReSID *resid);

void ReSID_writeRegs(ReSID *resid, unsigned char *regs, int len);

int ReSID_clock(ReSID *resid, unsigned int cycles, short *buf, int buflen);

void ReSID_precalc_constants(ReSID *resid);

// typedef struct S_SID_Dump_Player_t {
//   short outputs[3];
//
//   ReSID *R;
//   ReSIDPbData *D;
//
//   // sid dmp
//   unsigned char *dmp;
//   unsigned int dmp_len;
//   unsigned int dmp_idx;
//
//   // audio buffer fill: samples until next frame
//   int samples2do; // 882
// } ReSIDDmpPlayer;

//
// class ReSID
// {
// public:
//     ReSID();
//     ~ReSID();
//
//     void writeRegs(unsigned char *regs, int len);
//
//     // dumb audio rendering, not frame aware
//     int clock(unsigned int cycles, short *buf, int buflen);
//
//     // calculated CONSTANTS
//     int SAMPLES_PER_FRAME;
//     int CYCLES_PER_FRAME;
//     double CYCLES_PER_SAMPLE;
//
//     unsigned char shadow_regs[32];
//
// private:
//     void precalc_constants();
//
//     SID sid;
// };


#endif
