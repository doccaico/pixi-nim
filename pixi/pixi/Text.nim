import std / [jsffi]

proc Text*(_: JsObject): JsObject {.importjs: "PIXI.Text(#)".}
