import std / [jsffi, asyncjs]

proc newApplication*(): JsObject {.importjs: "new PIXI.Application()".}
proc newApplication*(_: JsObject): JsObject {.importjs: "new PIXI.Application(#)".}

proc init*(_, _: JsObject): Future[void] {.importjs: "#.init(@)".}
