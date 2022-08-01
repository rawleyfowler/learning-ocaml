let rec string_fold_left f str =
  let rec string_fold_left' f' str' acc i =
    if i = String.length str then acc
    else let acc' = f' (Char.escaped str'.[i]) acc
      in string_fold_left' f' str acc' (i + 1)
  in string_fold_left' f str "" 0;;

let is_palindrome (s: string): bool = 
  let str = String.lowercase_ascii s in
    match (String.length str) with
    | 0 -> false
    | 1 -> true
    | _ -> (string_fold_left ( ^ ) str) = str;;