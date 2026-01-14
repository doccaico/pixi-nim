import std / [jsffi]

var Texture* {.importc, nodecl.}: JsObject

proc `from`*(_: JsObject, _: JsObject): JsObject {.importjs: "PIXI.#.from(#)".}
