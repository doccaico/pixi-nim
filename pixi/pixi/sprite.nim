import std / [jsffi]

# proc newSprite*(): JsObject {.importc: "PIXI.Sprite".}
proc Sprite*(_: JsObject): JsObject {.importjs: "PIXI.Sprite(#)".}
