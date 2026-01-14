import std / [jsffi, asyncjs]

var Assets* {.importc, nodecl.}: JsObject

proc load*(_: JsObject, _: JsObject): Future[JsObject] {.importjs: "PIXI.#.load(#)".}
proc load*(_: JsObject, _: openArray[JsObject]): Future[JsObject] {.importjs: "PIXI.#.load(#)".}

proc backgroundLoad*(_: JsObject, _: openArray[JsObject]) {.importjs: "PIXI.#.backgroundLoad(#)".}

proc add*(_, _: JsObject) {.importjs: "PIXI.#.add(#)".}

proc then*(_: Future[JsObject], _: proc(_: JsObject)) {.importjs: "#.then(#)".}
