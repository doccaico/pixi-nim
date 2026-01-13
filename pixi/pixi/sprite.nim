import std / [jsffi]

# proc newSprite*(): JsObject {.importc: "PIXI.Sprite".}
proc newSprite*(_: JsObject): JsObject {.importjs: "new PIXI.Sprite(#)".}
