class-pool .
*"* class pool for class Z_CROSS_TRANSPORT_CLASS

*"* local type definitions
include Z_CROSS_TRANSPORT_CLASS=======ccdef.

*"* class Z_CROSS_TRANSPORT_CLASS definition
*"* public declarations
  include Z_CROSS_TRANSPORT_CLASS=======cu.
*"* protected declarations
  include Z_CROSS_TRANSPORT_CLASS=======co.
*"* private declarations
  include Z_CROSS_TRANSPORT_CLASS=======ci.
endclass. "Z_CROSS_TRANSPORT_CLASS definition

*"* macro definitions
include Z_CROSS_TRANSPORT_CLASS=======ccmac.
*"* local class implementation
include Z_CROSS_TRANSPORT_CLASS=======ccimp.

*"* test class
include Z_CROSS_TRANSPORT_CLASS=======ccau.

class Z_CROSS_TRANSPORT_CLASS implementation.
*"* method's implementations
  include methods.
endclass. "Z_CROSS_TRANSPORT_CLASS implementation
