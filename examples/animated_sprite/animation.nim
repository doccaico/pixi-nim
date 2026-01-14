import PIXI

dom.window.onload = proc (e: dom.Event): void {.async.} =
  # Create a new application
  let app = Application()

  # Initialize the application
  await app.init(
    JsObject{
        autoStart: false,
        resizeTo: window,
    }
  )

  # Append the application canvas to the document body
  document.body.appendChild(app.canvas);

  # Load the animation sprite sheet
  let spritesheet = await AssetsLoad(
    "https://pixijs.com/assets/spritesheet/0123456789.json".js,
  )

  # Create an array to store the textures
  var textures: seq[JsObject]

  for i in 0..<10:
    # let framekey = "0123456789 ".toJs & jsString(i) & ".ase".toJs
    let framekey = "0123456789 ".js & js(i) & ".ase".js
    let texture = TextureFrom(framekey)
    let time = spritesheet.data.frames[framekey].duration
    textures.add(
      JsObject{
        texture: texture,
        time: time
      }
    )

  let scaling = 4

  # Create a slow AnimatedSprite
  let slow = AnimatedSprite(textures)

  slow.anchor.set(0.5)
  slow.scale.set(scaling)
  slow.animationSpeed = 0.5
  slow.x = (app.screen.width - slow.width) / 2
  slow.y = app.screen.height / 2
  slow.play()
  app.stage.addChild(slow)

  # Create a fast AnimatedSprite
  let fast = AnimatedSprite(textures)

  fast.anchor.set(0.5)
  fast.scale.set(scaling)
  fast.x = (app.screen.width + fast.width) / 2
  fast.y = app.screen.height / 2
  fast.play()
  app.stage.addChild(fast)

  # Start animating
  app.start()
