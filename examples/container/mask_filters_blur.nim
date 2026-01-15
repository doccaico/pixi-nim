import ../../src/pixi

dom.window.onload = proc (e: dom.Event): void {.async.} =
  # Create a new application
  let app = Application()

  # Initialize the application
  await app.ApplicationInit(
    JsObject{
        resizeTo: window,
    }
  )

  # Append the application canvas to the document body
  document.body.appendChild(app.canvas)

  # Inner radius of the circle
  const radius = 100

  # The blur amount
  const blurSize = 32

  # Load the grass texture
  let grassTexture = await AssetsLoad(
    "https://pixijs.com/assets/bg_grass.jpg".js,
  )

  # Create the grass background
  let background = Sprite(grassTexture)

  app.stage.addChild(background)
  background.width = app.screen.width
  background.height = app.screen.height

  let circle = Graphics()
    .circle(radius + blurSize, radius + blurSize, radius)
    .fill(JsObject{ color: 0xff0000 })

  circle.filters = [BlurFilter(JsObject{
    strength: blurSize,
  })]

  let bounds = Rectangle(
    0,
    0,
    (radius + blurSize) * 2,
    (radius + blurSize) * 2,
  )
  let texture = app.renderer.generateTexture(JsObject{
    target: circle,
    resolution: 1,
    frame: bounds,
    textureSourceOptions: JsObject{
      scaleMode: "nearest".js,
    },
  })
  let focus = Sprite(texture)

  app.stage.addChild(focus)

  background.mask = focus

  app.stage.eventMode = "static".js
  app.stage.hitArea = app.screen;
  app.stage.on("pointermove".js,
    proc (event: JsObject) =
      focus.position.x = event.global.x - focus.width / 2
      focus.position.y = event.global.y - focus.height / 2
  )
