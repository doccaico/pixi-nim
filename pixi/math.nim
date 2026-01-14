import std / [jsffi]

var Math* {.importc, nodecl.}: JsObject

proc PI*(_: JsObject): JsObject {.importjs: "#.PI".}

proc random*(_: JsObject): JsObject {.importjs: "#.random()".}
