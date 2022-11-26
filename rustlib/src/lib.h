#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

typedef struct ComplexStruct {
  int8_t index;
  bool enabled;
} ComplexStruct;

uintptr_t add(uintptr_t left, uintptr_t right);

struct ComplexStruct hello(void);
