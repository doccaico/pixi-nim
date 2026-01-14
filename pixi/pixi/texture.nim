import std / [jsffi]

proc `from`*(_: JsObject): JsObject {.importjs: "PIXI.Texture.from(#)".}

var WHITE* {.importc: "PIXI.Texture.WHITE".}: JsObject
