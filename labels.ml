let rec range ~first:a ~last:b =
  if a > b then []
  else a :: range ~first:(a + 1) ~last:b;;

(* val range : first:int -> last:int -> int list *)

let rec insert_at_end l i =
  match l with
  | [] -> [i]
  | h :: t -> h :: (insert_at_end t i);;

(* val insert_at_end : a' list -> a' -> a' list *)

let rec join_list lst ~sep:c = 
  let rec join r s =
    match r with
    | [] -> s
    | h :: t -> if t = [] then (s ^ h) else join t (s ^ h ^ c)
  in (join lst "");;

(* val join_list : string list -> sep:string -> string *)
