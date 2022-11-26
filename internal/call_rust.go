package internal

/*
#cgo LDFLAGS: ${SRCDIR}/../rustlib/lib.a
#include "../rustlib/src/lib.h"
*/
import "C"
import "fmt"

func CallRustLibrary() {
	r := C.hello()
	if r.enabled {
		fmt.Println(r.index)
	}
	fmt.Println(C.add(20, 10))
}
