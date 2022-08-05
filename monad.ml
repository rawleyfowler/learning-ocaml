module type Monad = sig
  type 'a t
  val return : 'a -> 'a t
  val bind : 'a t -> ('a -> 'b t) -> 'b t
  val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t
end

(* Maybe monad *)
module Maybe : Monad = struct
  type 'a t = 'a option
  let return x = Some x

  (* 'a t -> ('a -> 'b t) -> 'b t *)
  let ( >>= ) m f =
    match m with
    | None -> None
    | Some x -> f x
  
  let bind = ( >>= )
end

(* Writer monad *)
module Writer : Monad = struct
  type 'a t = 'a * string

  let return x = (x, "")

  let ( >>= ) m f = 
    let (m1, s1) = m in 
    let (m2, s2) = f m1 in
    (m2, s1 ^ s2)

  let bind = ( >>= )
end