import std / [jsffi]

proc `from`*(_: JsObject): JsObject {.importjs: "PIXI.Texture.from(#)".}
