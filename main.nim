import std / [dom, asyncjs, jsffi]
import pixi


dom.window.onload = proc (e: dom.Event): void {.async.} =
  let app = newApplication()

  await app.init(
    JsObject{
        width: 800,                     # Canvas width
        height: 600,                    # Canvas height
        backgroundColor: 0x00ff00,      # Background color
        antialias: true,                # Enable antialiasing
        resolution: 1,                  # Resolution / device pixel ratio
        preference: "webgl".cstring,    # or 'webgpu' // Renderer preference
    })
  document.body.appendChild(app.canvas)

  # let texture = await assetsLoad("assets/dog.jpg".cstring)
  # let sprite = newSprite(texture)
  # app.stage.addChild(sprite)

  let assets = await assetsLoad(["assets/dog.jpg".cstring, "assets/cat.jpg"])
  for texture in assets:
    let sprite = newSprite(texture)
    app.stage.addChild(sprite)
