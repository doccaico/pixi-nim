import PIXI

let color1 = PIXI.Color("red".js)
let color2 = PIXI.Color("#ffff00".js)
let color3 = PIXI.Color(Rgb(r: 50, g: 50, b: 50))

# var arr: Float32Array = [1, 0, 0]
# arr 
# var arr = @[1'f32, 0, 0]
# var arr: seq[float32]
#
# arr.add 1'f32
# arr.add 0'f32
# arr.add 0'f32
# var arr: array[3, float32]
# arr = [1'f32, 0, 0]

let
  arr = [1'f32, 0, 0, 0.5]
let color4 = PIXI.Color(arr)

const val = 0xffffff
let color5 = PIXI.Color(val)



# type
#   Person = object
#     name: string
#     age: int
#
# # let p = Person(name: "hi", age: 27)
# let p = Person("hi")
# echo p
# for i, a in arr:
#   echo $i, $a
# echo 10 mod 3
# echo 10 % 3
