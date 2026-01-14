import std / [jsffi]

# type
#   ApplicationObj* = ref object of JsObject
#   TextureObj* = ref object of JsObject

type
  Hsl* = object
    h*: uint8
    s*: uint8
    l*: uint8
  Hsla* = object
    h*: uint8
    s*: uint8
    l*: uint8
    a*: float
  Hsv* = object
    h*: uint8
    s*: uint8
    l*: uint8
  Hsva* = object
    h*: uint8
    s*: uint8
    l*: uint8
    a*: float
  Rgb* = object
    r*: uint8
    g*: uint8
    b*: uint8
  Rgba* = object
    r*: uint8
    g*: uint8
    b*: uint8
    a*: float
  Color* = object
    red*: uint8
    green*: uint8
    blue*: uint8
    alpha*: uint8

# https://pixijs.download/release/docs/color.ColorSource.html
type
  ColorSource* =
    JsObject |
    int32 |
    array[3, float32] |
    array[4, float32] |
    Hsl |
    Hsla |
    Hsv |
    Hsva |
    Rgb |
    Rgba |
    Color
