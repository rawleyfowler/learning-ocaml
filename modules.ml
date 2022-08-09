module MyList = struct
  type 'a my_list =
    | Nil
    | Cons of 'a * 'a my_list

  let rec map f = function
    | Nil -> Nil
    | Cons (h, t) -> Cons (f h, map f t)
end

module MyTree = struct
  type 'a my_tree =
    | Leaf of 'a
    | Node of 'a my_tree * 'a * 'a my_tree

  let rec map f = function
    | Leaf a -> Leaf (f a)
    | Node (l, n, r) -> Node (map f l, f n, map f r)
end

let tree = MyTree.Node ((Leaf 10), 10, (Leaf 50))

let () = print_int (match (MyTree.map (fun x -> x * x) tree) with
  | Node (_, v, _) -> v
  | Leaf a -> a)