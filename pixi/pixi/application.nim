import std / [jsffi, asyncjs]

# proc newApplication*(): JsObject {.importjs: "new PIXI.Application()".}
# proc newApplication*(_: JsObject): JsObject {.importjs: "new PIXI.Application(#)".}
proc Application*(): JsObject {.importjs: "PIXI.Application()".}
proc Application*(_: JsObject): JsObject {.importjs: "PIXI.Application(#)".}

proc init*(_, _: JsObject): Future[void] {.importjs: "#.init(@)".}
# proc init*(_, _: JsObject): JsObject {.importjs: "#.init(@)".}

# proc then*(_: JsObject, _: proc) {.importjs: "#.then(@)".}
proc then*(_: Future[void], _: proc) {.importjs: "#.then(@)".}
# proc init*(_, _: JsObject): JsObject {.importjs: "#.init(@)".}
# proc init*(_, _: JsObject): JsObject | Future[void] {.importjs: "#.init(@)".}
# proc init*(a, b: JsObject): JsObject {.importjs: "#.init(@)".}
