module MyStack = struct
  exception StackIsEmpty

  type 'a stack =
    | Empty
    | Data of 'a * 'a stack

  let push = function
    | (x, s) -> Data (x, s)

  let peek = function
    | Empty -> raise StackIsEmpty
    | Data (x, _) -> x

  let pop = function
    | Empty -> raise StackIsEmpty
    | Data (_, s) -> s
end