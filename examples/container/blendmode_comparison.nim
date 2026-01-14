import pixi

# Require
# <script src="https://cdn.jsdelivr.net/npm/pixi.js@8.15.0/dist/packages/advanced-blend-modes.min.js"></script>

dom.window.onload = proc (e: dom.Event): void {.async.} =
  # Create a new application
  let app = Application()

  # Initialize the application
  await app.ApplicationInit(
    JsObject{
        antialias: true,
        backgroundColor: "white".js,
        resizeTo: window,
        # NEEDS TO BE TRUE FOR WEBGL!
        useBackBuffer: true,
    }
  )

  # Append the application canvas to the document body
  document.body.appendChild(app.canvas)

  let pandaTexture = await AssetsLoad("https://pixijs.com/assets/panda.png".js)
  let rainbowGradient = await AssetsLoad("https://pixijs.com/assets/rainbow-gradient.png".js)

  let allBlendModes = [
    "normal".js,
    "add".js,
    "screen".js,
    "darken".js,
    "lighten".js,
    "color-dodge".js,
    "color-burn".js,
    "linear-burn".js,
    "linear-dodge".js,
    "linear-light".js,
    "hard-light".js,
    "soft-light".js,
    "pin-light".js,
    "difference".js,
    "exclusion".js,
    "overlay".js,
    "saturation".js,
    "color".js,
    "luminosity".js,
    "add-npm".js,
    "subtract".js,
    "divide".js,
    "vivid-light".js,
    "hard-mix".js,
    "negation".js,
  ]

  let size = 800 / 5

  var pandas: seq[JsObject]

  for i in 0..<allBlendModes.len:
    let container = Container()

    let sprite = Sprite(JsObject{
      texture: pandaTexture,
      width: 100,
      height: 100,
      anchor: 0.5,
      position: JsObject{ x: size / 2, y: size / 2 },
    })

    pandas.add(sprite)

    let sprite2 = Sprite(JsObject{
      texture: rainbowGradient,
      width: size,
      height: size,
      blendMode: allBlendModes[i],
    })

    container.addChild(sprite, sprite2)

    let text = Text(JsObject{
      text: allBlendModes[i],
      style: JsObject{
        fontSize: 16,
        fontFamily: "short-stack".js,
      },
    })

    # Add blend mode text labels
    text.x = size / 2 - text.width / 2
    text.y = size - text.height
    let textBackground = Sprite(TextureWHITE)

    textBackground.x = text.x - 2
    textBackground.y = text.y
    textBackground.width = text.width + 4
    textBackground.height = text.height + 4
    container.addChild(textBackground, text)

    app.stage.addChild(container)

    container.x = (i mod 5) * size
    container.y = MathFloor(i / 5) * size

  app.ticker.add(
    proc =
      for i, panda in pandas:
        panda.rotation += 0.01 * (if (i mod 2) != 0: 1 else: -1)
  )
