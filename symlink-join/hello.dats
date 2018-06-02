#include "contrib/pkg1/pkg1-message.sats"
#include "contrib/pkg2/pkg2-message.sats"

implement main0 () = let
  val () = println!(PKG1_MESSAGE)
  val () = println!(PKG2_MESSAGE)
in
  print ("Hello, world!\n")
end
