import pixi

proc makeLoadScreen {.async.}
proc makeGameScreen {.async.}

# Create a new application
let app = jsNew Application()

proc init {.async.} =

  # Initialize the application
  await app.init(
    JsObject{
        background: "#1099bb".js,
        resizeTo: window,
    }
  )

  # Append the application canvas to the document body
  document.body.appendChild(app.canvas)

  # Manifest example
  let manifestExample = JsObject{
    bundles: [
      JsObject{
        name: "load-screen".js,
        assets: [
          JsObject{
            alias: "flowerTop".js,
            src: "https://pixijs.com/assets/flowerTop.png".js,
          },
        ],
      },
      JsObject{
        name: "game-screen".js,
        assets: [
          JsObject{
            alias: "eggHead".js,
            src: "https://pixijs.com/assets/eggHead.png".js,
          },
        ],
      },
    ],
  }

  await Assets.init(JsObject{ manifest: manifestExample })

  # Bundles can be loaded in the background too!
  Assets.backgroundLoadBundle(["load-screen".js, "game-screen".js])

  discard makeLoadScreen()

proc makeLoadScreen {.async.} =
  # Get the assets from the load screen bundle.
  # If the bundle was already downloaded the promise resolves instantly!
  let loadScreenAssets = await Assets.loadBundle("load-screen".js)

  # Create a new Sprite from the resolved loaded texture
  let goNext = jsNew Sprite(loadScreenAssets.flowerTop)

  goNext.anchor.set(0.5)
  goNext.x = app.screen.width / 2
  goNext.y = app.screen.height / 2
  app.stage.addChild(goNext)

  goNext.eventMode = "static".js
  goNext.cursor = "pointer".js

  goNext.on("pointertap".js,
    proc =
      goNext.destroy()
      discard makeGameScreen()
  )

proc makeGameScreen {.async.} =
  # Wait here until you get the assets
  # If the user spends enough time in the load screen by the time they reach the game screen
  # the assets are completely loaded and the promise resolves instantly!
  let loadScreenAssets = await Assets.loadBundle("game-screen".js)

  # Create a new Sprite from the resolved loaded texture
  let goBack = jsNew Sprite(loadScreenAssets.eggHead)

  goBack.anchor.set(0.5)
  goBack.x = app.screen.width / 2
  goBack.y = app.screen.height / 2
  app.stage.addChild(goBack)

  goBack.eventMode = "static".js
  goBack.cursor = "pointer".js

  goBack.on("pointertap".js,
    proc =
      goBack.destroy()
      # The user can go back and the files are already downloaded
      discard makeLoadScreen()
  )

discard init()
