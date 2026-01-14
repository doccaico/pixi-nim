import pixi

proc makeLoadScreen {.async.}
proc makeGameScreen {.async.}


dom.window.onload = proc (e: dom.Event): void {.async.} =
  # Create a new application
  let app = jsNew Application()

  # Initialize the application
  await app.init(
    JsObject{
        background: "#1099bb".js,
        resizeTo: window,
    }
  ).then(proc =
    # Append the application canvas to the document body
    document.body.appendChild(app.canvas)

    # Add the assets to load
    Assets.add(JsObject{
      alias: "flowerTop".js,
      src: "https://pixijs.com/assets/flowerTop.png".js,
    })
    Assets.add(JsObject{
      alias: "eggHead".js,
      src: "https://pixijs.com/assets/eggHead.png".js,
    })

    # Load the assets and get a resolved promise once both are loaded
      let texturesPromise = Assets.load(["flowerTop".js, "eggHead".js]); # => Promise<{flowerTop: Texture, eggHead: Texture}>

    # When the promise resolves, we have the texture!
    texturesPromise.then(proc (textures: JsObject) =
      # Create a new Sprite from the resolved loaded Textures
      let flower = Sprite.from(textures.flowerTop)

      flower.anchor.set(0.5)
      flower.x = app.screen.width * 0.25
      flower.y = app.screen.height / 2
      app.stage.addChild(flower)

      let egg = Sprite.from(textures.eggHead)

      egg.anchor.set(0.5)
      egg.x = app.screen.width * 0.75
      egg.y = app.screen.height / 2
      app.stage.addChild(egg)
    )
