let make_valley lst = 
  let rev_lst = List.rev lst in
    let rec aux acc = function
      | [] -> acc
      | [_] -> acc
      | h :: (a :: t) -> aux ((h :: acc) @ [a]) t
    in aux [] rev_lst;;

let test_list = List.rev [94; 88; 74; 63; 50; 46; 32; 27; 25; 22; 18];;
(* 18 22 25 27 32 46 50 63 74 88 94 *)
(* h  a  <----------- t ----------> *)

(* Expected [94; 74; 50; 32; 25; 18; 22; 27; 46; 63; 88] *)
let () = print_string "List before: \n"
let () = List.iter (Printf.printf "%d ") test_list

let () = print_string "\nList after: \n"
let () = List.iter (Printf.printf "%d ") (make_valley test_list)