import ../../src/pixi

dom.window.onload = proc (e: dom.Event): void {.async.} =
  # Create a new application
  let app = Application()

  # Initialize the application
  await app.ApplicationInit(
    JsObject{
        background: "#1099bb".js,
        resizeTo: window,
    }
  )

  # Append the application canvas to the document body
  document.body.appendChild(app.canvas)

  # load resources
  discard await AssetsLoad("https://pixijs.com/assets/spritesheet/monsters.json".js)

  # holder to store aliens
  var aliens: seq[JsObject]
  let alienFrames = [
    "eggHead.png".js,
    "flowerTop.png".js,
    "helmlok.png".js,
    "skully.png".js,
  ]

  let count = 0.0

  # create an empty container
  let alienContainer = Container()

  alienContainer.x = app.screen.width / 2
  alienContainer.y = app.screen.height / 2

  # make the stage interactive
  app.stage.eventMode = "static".js
  app.stage.addChild(alienContainer)

  # add a bunch of aliens with textures from image paths
  for i in 0..<100:
    let frameName = alienFrames[i mod 4]

    # create an alien using the frame name..
    let alien = SpriteFrom(frameName)

    alien.tint = MathRandom() * 0xffffff

    alien.x = MathRandom() * app.screen.width - app.screen.width / 2
    alien.y = MathRandom() * app.screen.height - app.screen.height / 2
    alien.anchor.x = 0.5
    alien.anchor.y = 0.5
    aliens.add(alien)
    alienContainer.addChild(alien)

  proc onClick =
    alienContainer.cacheAsTexture(not alienContainer.isCachedAsTexture)

  # Combines both mouse click + touch tap
  app.stage.on("pointertap".js, onClick)

  app.ticker.add(
    proc =
      # let's rotate the aliens a little bit
      for i in 0..<100:
        let alien = aliens[i]
        alien.rotation += 0.1

      count += 0.01

      alienContainer.scale.x = MathSin(count)
      alienContainer.scale.y = MathSin(count)
      alienContainer.rotation += 0.01
  )
