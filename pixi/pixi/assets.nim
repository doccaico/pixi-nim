import std / [jsffi, asyncjs]

proc assetsLoad*(_: cstring): Future[JsObject] {.importjs: "PIXI.Assets.load(#)".}
proc assetsLoad*(_: openArray[cstring]): Future[JsObject] {.importjs: "PIXI.Assets.load(#)".}
