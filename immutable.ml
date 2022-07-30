let x : int = 3;; (* This binds the expression 3 to symbol x without a in binding *)

let x : int = 3 in x + 5;; (* This binds the expression 3 to x using a let-in-binding *)
