let rec fact n : int -> int = fun
  | 0 -> 0
  | 1 -> 1
  | x :: l -> 
