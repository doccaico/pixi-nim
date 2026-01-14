import std / [jsffi, asyncjs]

var Assets* {.importc, nodecl.}: JsObject

# proc assetsLoad*(_: cstring): Future[JsObject] {.importjs: "PIXI.Assets.load(#)".}
# proc assetsLoad*(_: openArray[cstring]): Future[JsObject] {.importjs: "PIXI.Assets.load(#)".}

proc load*(_: JsObject, _: cstring): Future[JsObject] {.importjs: "PIXI.#.load(#)".}
proc load*(_: JsObject, _: openArray[cstring]): Future[JsObject] {.importjs: "PIXI.#.load(#)".}

proc backgroundLoad*(_: JsObject, _: openArray[cstring]) {.importjs: "PIXI.#.backgroundLoad(#)".}
# proc load*(_: JsObject, _: cstring): JsObject {.importjs: "PIXI.#.load(#)".}

proc add*(_, _: JsObject) {.importjs: "PIXI.#.add(#)".}

# proc then*(_: Future[JsObject], _: proc) {.importjs: "#.then(@)".}
# proc then*(_: JsObject, _: proc) {.importjs: "#.then(@)".}
# proc then*(_: Future[JsObject], _: proc(texture: Future[JsObject])) {.importjs: "#.then(@)".}
proc then*(a: Future[JsObject], _: proc(a: JsObject)) {.importjs: "#.then(@)".}
