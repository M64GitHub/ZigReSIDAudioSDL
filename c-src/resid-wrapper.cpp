#include "resid-wrapper.h"

SID sid;

void sid_write(int reg, char value) {
  sid.write(reg, value);
}

