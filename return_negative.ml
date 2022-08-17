let make_negative x =
  match x with
  | 0 -> 0
  | y when y < 0 -> y
  | y when y > 0 -> -y;;

let make_negative_two = function
  | 0 -> 0
  | x when x < 0 -> x
  | x when x > 0 -> -x;;
