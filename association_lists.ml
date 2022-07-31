(* An association list is the easiest type of a map, here is an example: *)
let sides = [("rectangle", 4); ("nonagon", 9); ("hexagon", 6)];;
(* This is not a datatype unto itself, rather it is a combination of two other types, lists and pairs *)
(* A Function for binds [k] to [v], and otherwise is the same as [lst] *)
let insert k v lst = (k, v) :: lst;;

(* If association list [lst] binds key [k] then [Some v] else is [None] *)
let rec lookup k = fun 
  | [] -> None
  | (k', v) :: t -> if k = k' then Some v else lookup k t
