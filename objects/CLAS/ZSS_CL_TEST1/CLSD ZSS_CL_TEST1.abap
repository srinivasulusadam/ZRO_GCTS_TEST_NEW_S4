class-pool .
*"* class pool for class ZSS_CL_TEST1

*"* local type definitions
include ZSS_CL_TEST1==================ccdef.

*"* class ZSS_CL_TEST1 definition
*"* public declarations
  include ZSS_CL_TEST1==================cu.
*"* protected declarations
  include ZSS_CL_TEST1==================co.
*"* private declarations
  include ZSS_CL_TEST1==================ci.
endclass. "ZSS_CL_TEST1 definition

*"* macro definitions
include ZSS_CL_TEST1==================ccmac.
*"* local class implementation
include ZSS_CL_TEST1==================ccimp.

*"* test class
include ZSS_CL_TEST1==================ccau.

class ZSS_CL_TEST1 implementation.
*"* method's implementations
  include methods.
endclass. "ZSS_CL_TEST1 implementation
