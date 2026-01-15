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
  let rect = Graphics().rect(0, 0, 400, 400).fill("red".js)
  let masky = Graphics().star(160, 160, 5, 100).fill("yellow".js)

  masky.width = 240
  masky.height = 240

  rect.setMask(JsObject{
    mask: masky,
    inverse: true,
  })

  app.stage.addChild(rect, masky)
  app.stage.position.set(
    window.innerWidth / 2 - 200,
    window.innerHeight / 2 - 200,
  )
