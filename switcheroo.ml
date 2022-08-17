(* Imperative style solution *)
let switcheroo (s : string) : string =
  let switch_char = function
    | 'a' -> 'b'
    | 'b' -> 'a'
    | x -> x
  in
  let buff = Buffer.create (String.length s) in
  String.iter (fun c ->
      Buffer.add_char buff (switch_char c)) s;
      Buffer.contents buff;;

(* Simpler map solution *)
let switcheroo (s : string) : string =
  String.map (
      function
      | 'a' -> 'b'
      | 'b' -> 'a'
      | c -> c
    ) s;;
