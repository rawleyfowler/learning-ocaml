let one_hundred = (fun x -> x * x) 10;; (* Anonymous functions, 100 *)
let () = print_int one_hundred

let double = fun x -> x * 2;;
let a = double 3 in print_int a;; (* Named functions, 6 *)

let square = fun x -> x * x;; (* Another named function *)

(* Closures *)
let two = 2;;
let plus_two : int -> int = fun x -> x + two;;
let two = 3;;

let () = print_int (plus_two 10) (* Prints 12 *)

(* Better way to write the plus_two function *)
let plus_two =
  let two = 2 in
  fun x -> x + two;;

let () = print_int (plus_two 3) (* Prints 5 *)

(* Multi-args and currying *)
let avg = fun x -> (fun y -> (x +. y) /. 2.) (* Note, it's type is float -> (float -> float) *)

(* Multi-args, printf example *)
let () = Printf.printf "%s\n" "Hello World!" (* This is just currying. *)
let greet = Printf.printf "Hello %s!\n" (* Here we save the curry result, and use it later *)
(* I believe that printf closes in on the first string "Hello %s!\n" then returns a curried function that contains that closed in value to print *)
let () = greet "Bob" (* Hello Bob! *)
