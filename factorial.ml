let rec fact n : int64 -> int64 = 
  if n = 0L then 1L
  else n * (fact (n - 1));;

let rec test n : int -> int =
  if n = 0 then (fun k -> k)
  else (fun x -> x * x);;
