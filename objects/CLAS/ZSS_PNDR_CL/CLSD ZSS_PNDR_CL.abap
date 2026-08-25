class-pool .
*"* class pool for class ZSS_PNDR_CL

*"* local type definitions
include ZSS_PNDR_CL===================ccdef.

*"* class ZSS_PNDR_CL definition
*"* public declarations
  include ZSS_PNDR_CL===================cu.
*"* protected declarations
  include ZSS_PNDR_CL===================co.
*"* private declarations
  include ZSS_PNDR_CL===================ci.
endclass. "ZSS_PNDR_CL definition

*"* macro definitions
include ZSS_PNDR_CL===================ccmac.
*"* local class implementation
include ZSS_PNDR_CL===================ccimp.

*"* test class
include ZSS_PNDR_CL===================ccau.

class ZSS_PNDR_CL implementation.
*"* method's implementations
  include methods.
endclass. "ZSS_PNDR_CL implementation
