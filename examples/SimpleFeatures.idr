import AutoHotkey.Builtins
import AutoHotkey.FFI

foo : String
foo =
  let x = \y => y ++ "from Idris!"
  in x "Hello AutoHotkey, "

main : AHK_IO ()
main = do
  x <- pure "lol"
  msgBox x
  msgBox x