let sum_if_true test first last =
  (if test first then first else 0)
  + (if test last then last else 0);;

(* The type of this function is (int -> bool) -> int -> int -> int *)

let is_sum_of sum nums =
  let rec summation list =
    match list with
    | [] -> 0
    | h :: l -> h + summation l
  in (summation nums) = sum;;

(* The type of is_sum_of is int -> int list -> bool *)

let make_incr_and_decr n =
  (fun () -> n + 1, fun () -> n - 1);;
