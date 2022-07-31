let rec pow x y =
  match y with
  | 0 -> 1
  | _ -> x * pow x (y - 1);;

(* int -> int -> int *)
