module AutoHotkey.Builtins

import AutoHotkey.FFI

%access public export

data AutoHotkeyList a = MkList (Raw a)

data Key
  = Ctrl
  | Alt
  | U
  | W

||| Call an AutoHotkey builtin.
%inline
builtin : String -> (ty : Type) -> {auto fty : FTy FFI_AHK [] ty} -> ty
builtin name =
  foreign FFI_AHK (AHK_Function name)

%inline
msgBox : String -> AHK_IO ()
msgBox = builtin "MsgBox" (String -> AHK_IO ())

hotkey : String -> AHK_IO () -> AHK_IO ()
hotkey hotkeyString action =
  builtin "idris_define_hotkey"
    (String -> AutoHotkeyFn (() -> AHK_IO ()) -> AHK_IO ())
    hotkeyString
    (MkAutoHotkeyFn (\x => action))