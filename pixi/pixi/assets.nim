import std / [jsffi, asyncjs]

var Assets* {.importc, nodecl.}: JsObject

proc load*(_: JsObject, _: cstring): Future[JsObject] {.importjs: "PIXI.#.load(#)".}
proc load*(_: JsObject, _: openArray[cstring]): Future[JsObject] {.importjs: "PIXI.#.load(#)".}

proc backgroundLoad*(_: JsObject, _: openArray[cstring]) {.importjs: "PIXI.#.backgroundLoad(#)".}

proc add*(_, _: JsObject) {.importjs: "PIXI.#.add(#)".}

proc then*(_: Future[JsObject], _: proc(_: JsObject)) {.importjs: "#.then(#)".}
