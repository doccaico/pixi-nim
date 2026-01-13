import std / [jsffi, dom]

proc appendChild*(_: Node, _: JsObject) {.importjs: "#.appendChild(#)".}
