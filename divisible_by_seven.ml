let digits n =
  let rec digits' n' acc =
    match n' with
    | 0 -> acc
    | _ -> digits' (n' / 10) (n mod 10 :: acc) in
  match n with
  | 0 -> [0]
  | _ -> digits' n [];;
  
let rec last lst = 
  match lst with
  | [] -> None
  | (h :: t) -> if t = [] then Some h else last t;;

let seven m =
  let rec seven' m' i =
    let d = digits m' in
      if (m' mod 7) = 0 then (m', i)
      else match List.length d with
        | 1 -> (m', i)
        | 2 -> (m', i)
        | n -> let num = (m' / 10)
      in seven' (num - (
        match last d with
        | Some c -> c
        | None -> 0
        ) * 2) (i + 1)
    in seven' m 0;;