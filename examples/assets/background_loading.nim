import pixi

dom.window.onload = proc (e: dom.Event): void {.async.} =
  # Create a new application
  let app = jsNew Application()

  # Initialize the application
  app.init(
    JsObject{
        background: "#1099bb".cstring,
        resizeTo: window,
    }
  ).then(
    proc =
      # Append the application canvas to the document body
      document.body.appendChild(app.canvas)

      # Add the assets to load
      Assets.add(JsObject{
        alias: "flowerTop".cstring,
        src: "https://pixijs.com/assets/flowerTop.png".cstring,
      })
      Assets.add(JsObject{
        alias: "eggHead".cstring,
        src: "https://pixijs.com/assets/eggHead.png".cstring,
      })

      # Allow the assets to load in the background
      Assets.backgroundLoad(["flowerTop".cstring, "eggHead"])

      # If the background load hasn't loaded this asset yet, calling load forces this asset to load now.
      Assets.load("eggHead".cstring).then(
        proc (texture: JsObject) =
          # Auxiliar flag for toggling the texture
          var isEggHead = true

          # Create a new Sprite from the resolved loaded texture
          let character = jsNew Sprite(texture)

          character.anchor.set(0.5)
          character.x = app.screen.width / 2
          character.y = app.screen.height / 2
          character.eventMode = "static".cstring
          character.cursor = "pointer".cstring

          app.stage.addChild(character)

          character.on("pointertap".cstring,
            async proc =
              isEggHead = not isEggHead
              # These promise are already resolved in the cache.
              character.texture = await Assets.load(
                if isEggHead :"eggHead".cstring else: "flowerTop".cstring
              )
          )
      )
  )
