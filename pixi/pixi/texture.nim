import std / [jsffi]

var Texture* {.importc, nodecl.}: JsObject

proc `from`*(_: JsObject, _: cstring): JsObject {.importjs: "PIXI.#.from(#)".}
