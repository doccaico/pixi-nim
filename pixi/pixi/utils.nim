import std / [jsffi, dom]

template js*(s: string | SomeNumber): JsObject = toJs(s)

proc appendChild*(_: Node, _: JsObject) {.importjs: "#.appendChild(#)".}

proc `&`*(a, b: JsObject): JsObject {.importjs: "(# + #)"}
proc `[]`*(obj: JsObject; _: JsObject): JsObject {.importjs: "#[#]"} 

proc `+`*(_, _: SomeNumber | JsObject): JsObject {.importjs: "(# + #)".}
proc `-`*(_, _: SomeNumber | JsObject): JsObject {.importjs: "(# - #)".}
proc `*`*(_, _: SomeNumber | JsObject): JsObject {.importjs: "(# * #)".}
proc `/`*(_, _: SomeNumber | JsObject): JsObject {.importjs: "(# / #)".}
proc `%`*(_, _: SomeNumber | JsObject): JsObject {.importjs: "(# % #)".}
proc `+=`*(_, _: SomeNumber | JsObject): JsObject {.importjs: "(# += #)", discardable.}
proc `-=`*(_, _: SomeNumber | JsObject): JsObject {.importjs: "(# -= #)", discardable.}
proc `*=`*(_, _: SomeNumber | JsObject): JsObject {.importjs: "(# *= #)", discardable.}
proc `/=`*(_, _: SomeNumber | JsObject): JsObject {.importjs: "(# /= #)", discardable.}
proc `%=`*(_, _: SomeNumber | JsObject): JsObject {.importjs: "(# %= #)", discardable.}
proc `++`*(_: SomeNumber | JsObject): JsObject {.importjs: "(++#)".}
proc `--`*(_: SomeNumber | JsObject): JsObject {.importjs: "(--#)".}
proc `>`*(_, _: SomeNumber | JsObject): JsObject {.importjs: "(# > #)".}
proc `<`*(_, _: SomeNumber | JsObject): JsObject {.importjs: "(# < #)".}
proc `>=`*(_, _: SomeNumber | JsObject): JsObject {.importjs: "(# >= #)".}
proc `<=`*(_, _: SomeNumber | JsObject): JsObject {.importjs: "(# <= #)".}
proc `**`*(_, _: SomeNumber | JsObject): JsObject {.importjs: "((#) ** #)".}
  # (#) needed, refs https://github.com/nim-lang/Nim/pull/16409#issuecomment-760550812
proc `and`*(_, _: SomeNumber | JsObject): JsObject {.importjs: "(# && #)".}
proc `or`*(_, _: SomeNumber | JsObject): JsObject {.importjs: "(# || #)".}
proc `not`*(_: SomeNumber | JsObject): JsObject {.importjs: "(!#)".}
proc `in`*(_, _: SomeNumber | JsObject): JsObject {.importjs: "(# in #)".}

proc `|`*(_, _: SomeNumber | JsObject): JsObject {.importjs: "(# | #)".}
