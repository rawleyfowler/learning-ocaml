let rec sum lst =
  match lst with
  | [] -> 0
  | h :: t -> h + sum t;;

let rec concat lst =
  match lst with
  | [] -> ""
  | h :: t -> h ^ concat t;;

(* A lot of shared code between these two functions.
   We can simplify this with a new function and "factor out"
   the common factors to make a more generic function, "combine" *)
let rec combine init lst op =
  match lst with
  | [] -> init
  | h :: t -> op h (combine init t op);;

let sum' lst = combine 0 lst ( + );;
let concat' lst = combine "" lst ( ^ );;
let join' lst ~sep:a = 
  combine "" lst (fun v l -> match l with
  | "" -> (a ^ v)
  | _ -> (l ^ a ^ v));;

(* Fold right, this implementation is not tail recursive, see fold_right_tr *)
let rec fold_right f lst acc =
  match lst with
  | [] -> acc
  | h :: t -> f h (fold_right f t acc);;

(* This is tail recursive because we perform the work before the recursion  *)
let rec fold_right_tr f lst acc =
  match lst with
  | [] -> acc
  | h :: t ->
      let acc' = f acc h in
      fold_right_tr f t acc';;

let rec reverse lst =
  let rec reverse' lst' acc =
    match lst' with
    | [] -> acc
    | h :: t -> reverse' t (h :: acc)
  in reverse' lst [];;
