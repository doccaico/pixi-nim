import std / [jsffi]

proc Sprite*(_: JsObject): JsObject {.importjs: "PIXI.Sprite(#)".}
