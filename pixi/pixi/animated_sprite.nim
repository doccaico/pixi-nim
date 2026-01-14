import std / [jsffi]

proc AnimatedSprite*(_: openArray[JsObject]): JsObject {.importjs: "PIXI.AnimatedSprite(#)".}
