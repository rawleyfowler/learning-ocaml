let head (h :: _) = h;;

let rec tail = function
  | [] -> raise (Match_failure ("Unreachable", 1, 1))
  | [x] -> x
  | (_ :: t) -> tail t;;
    
let init lst =
  let rec aux acc = function
    | [] -> raise (Match_failure ("Unreachable", 1, 1))
    | [_] -> acc
    | (h :: t) -> aux (h :: acc) t
  in aux [] lst;;