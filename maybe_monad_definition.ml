let bind (x : int option) (op : int -> int option) =
  match x with
  | None -> None
  | Some t -> op t;;

let ( >>= ) = bind;;

let return a = Some a;;

(* We can use these to implement a set of option infix operators: + - * and /
   This is particulary useful for / where a value of 0 in the divisor should 
   cause an error. *)

(* The naive solution is the following *)
let ( + ) (x : int option) (y : int option) =
  x >>= fun a ->
  y >>= fun b ->
  return (Stdlib.(+) a b);;

let ( - ) (x : int option) (y : int option) =
  x >>= fun a ->
  y >>= fun b ->
  return (Stdlib.(-) a b);;

let ( * ) (x : int option) (y : int option) =
  x >>= fun a ->
  y >>= fun b ->
  return (Stdlib.( * ) a b);;

(* This definition will be slightly different since we want to return None if
  the divisor is equal to zero. *)
let ( / ) (x : int option) (y : int option) = 
  x >>= fun a ->
  y >>= fun b ->
  if b = 0 then None else return (Stdlib.(/) a b);;

(* Now obviously, we can factor out the binds to a helper that upgrades existing functions to
   take optional arguments. *)
let upgrade (op : int -> int -> int option) (x : int option) (y : int option) : int option =
  x >>= fun a ->
  y >>= fun b ->
  op a b;;

let return_upgrade (op : int -> int -> int) (x : int) (y : int) : int option =
  return (op x y);;

(* Now we can redeclare with the less naive solution *)
(* Partial application is key here so we can pass along (int -> int -> int option) *)
(* That is the upgraded version of (int -> int -> int) which is what the infix operators type is. *)
let ( + ) = upgrade (return_upgrade Stdlib.(+));;
let ( - ) = upgrade (return_upgrade Stdlib.(-));;
let ( * ) = upgrade (return_upgrade Stdlib.( * ));;
let ( / ) = upgrade (fun (x : int) (y : int) ->
  if y = 0 then None else Some (Stdlib.(/) x y));;

let ten = Some 10;;
let hundred = Some 100;;

let print_opt_int n = match n with
  | None -> print_string "Nothing!"
  | Some n -> print_int n;;

(* 10 *)
let () = print_opt_int (( / ) hundred ten);;
let () = print_newline ();;
(* Nothing! *)
let () = print_opt_int (( / ) ten (Some 0));;