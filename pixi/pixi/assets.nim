import std / [jsffi, asyncjs]

proc init*(_: JsObject): Future[void] {.importjs: "PIXI.Assets.init(#)".}

proc load*(_: JsObject): Future[JsObject] {.importjs: "PIXI.Assets.load(#)".}
proc load*(_: openArray[JsObject]): Future[JsObject] {.importjs: "PIXI.Assets.load(#)".}

proc loadBundle*(_: JsObject): Future[JsObject] {.importjs: "PIXI.Assets.loadBundle(#)".} 

proc backgroundLoad*(_: openArray[JsObject]) {.importjs: "PIXI.Assets.backgroundLoad(#)".}

proc backgroundLoadBundle*(_: openArray[JsObject]) {.importjs: "PIXI.Assets.backgroundLoadBundle(#)".} 

proc add*(_: JsObject) {.importjs: "PIXI.Assets.add(#)".}

proc then*(_: Future[JsObject], _: proc(_: JsObject)) {.importjs: "#.then(#)".}
