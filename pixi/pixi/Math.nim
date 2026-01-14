import std / [jsffi]

proc PI*(_: JsObject): JsObject {.importjs: "#.PI".}

proc random*(): JsObject {.importjs: "Math.random()".}
proc floor*(_: SomeNumber): JsObject {.importjs: "Math.floor(#)".}
