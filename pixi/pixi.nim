import pixi / [utils, types]
export utils, types

import std / [dom, asyncjs, jsffi]
export dom, asyncjs, jsffi


# application
proc Application*(): JsObject {.importjs: "new PIXI.Application()".}
proc Application*(_: JsObject): JsObject {.importjs: "new PIXI.Application(#)".}
proc ApplicationInit*(_: JsObject, _: JsObject): Future[void] {.importjs: "#.init(#)".}
proc ApplicationThen*(_: Future[void], _: proc) {.importjs: "#.then(#)".}

# assets
proc AssetsInit*(_: JsObject): Future[void] {.importjs: "PIXI.Assets.init(#)".}
proc AssetsLoad*(_: JsObject): Future[JsObject] {.importjs: "PIXI.Assets.load(#)".}
proc AssetsLoad*(_: openArray[JsObject]): Future[JsObject] {.importjs: "PIXI.Assets.load(#)".}
proc AssetsLoadBundle*(_: JsObject): Future[JsObject] {.importjs: "PIXI.Assets.loadBundle(#)".} 
proc AssetsBackgroundLoad*(_: openArray[JsObject]) {.importjs: "PIXI.Assets.backgroundLoad(#)".}
proc AssetsBackgroundLoadBundle*(_: openArray[JsObject]) {.importjs: "PIXI.Assets.backgroundLoadBundle(#)".} 
proc AssetsAdd*(_: JsObject) {.importjs: "PIXI.Assets.add(#)".}
proc AssetsThen*(_: Future[JsObject], _: proc(_: JsObject)) {.importjs: "#.then(#)".}

# texture
proc TextureFrom*(_: JsObject): JsObject {.importjs: "PIXI.Texture.from(#)".}
proc TextureThen*(_: Future[JsObject], _: proc(_: JsObject)) {.importjs: "#.then(#)".}
var TextureWHITE* {.importc: "PIXI.Texture.WHITE".}: JsObject

# text
proc Text*(_: JsObject): JsObject {.importjs: "new PIXI.Text(#)".}

# sprite
proc Sprite*(_: JsObject): JsObject {.importjs: "new PIXI.Sprite(#)".}
proc SpriteFrom*( _: JsObject): JsObject {.importjs: "PIXI.Sprite.from(#)".}

# color
proc Color*(_: ColorSource): Color {.importjs: "new PIXI.Color(#)".}

# animated_sprite
proc AnimatedSprite*(_: openArray[JsObject]): JsObject {.importjs: "new PIXI.AnimatedSprite(#)".}

# container
proc Container*(): JsObject {.importjs: "new PIXI.Container()".}

# math
var MathPI* {.importjs: "Math.PI".}: JsObject
proc MathRandom*(): JsObject {.importjs: "Math.random()".}
proc MathFloor*(_: SomeNumber): JsObject {.importjs: "Math.floor(#)".}
