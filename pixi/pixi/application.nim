import std / [jsffi, asyncjs]

proc Application*(): JsObject {.importjs: "PIXI.Application()".}
proc Application*(_: JsObject): JsObject {.importjs: "PIXI.Application(#)".}

proc init*(_, _: JsObject): Future[void] {.importjs: "#.init(#)".}

proc then*(_: Future[void], _: proc) {.importjs: "#.then(#)".}
