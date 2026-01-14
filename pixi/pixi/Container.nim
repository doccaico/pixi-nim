import std / [jsffi]

# type Sprite = object

proc Container*(): JsObject {.importjs: "PIXI.Container()".}
# proc Sprite*(_: JsObject): JsObject {.importjs: "PIXI.Sprite(#)".}
# template Sprite*(a: JsObject): JsObject = a

# proc `from`*(_: typedesc[Sprite], _: JsObject): JsObject {.importjs: "PIXI.#.from(#)".}
# proc `from`*(_: JsObject, _: JsObject): JsObject {.importjs: "PIXI.Sprite.from(#)".}
# proc `from`*( _: JsObject): JsObject {.importjs: "PIXI.Sprite.from(#)".}
