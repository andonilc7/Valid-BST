type 'a btree = Empty | Node of 'a * 'a btree * 'a btree
let list = [1;2;3;4;5]
let t1 = Node(33,
          Node(12, Empty, Empty),
          Node(74,
            Node(43, Empty, Empty),
            Empty))

let rec is_max_of_list l =
   match l with
   | [] -> failwith "empty list"
   | [x] -> x
   | h::t -> max h (is_max_of_list t)
 
let rec is_min_of_list l =
   match l with
   | [] -> failwith "empty list"
   | [x] -> x
   | h::t -> min h (is_min_of_list t)


(* let rec val l = 
  match l with
  | [] -> true
  | h1::h2::t -> 
    if (h2>h1) then *)



(* 
- if 2nd > 1st, then check number after that, if < 
*)