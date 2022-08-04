let bpa = Array.make 100 (-1)
let test_string = "3 4 5 1 2"
let test_array = [|3;4;5;1;2|]

(* let hack_1 = [|1;2;3|]
let hack_2 = [|2;1;3|]
let hack_3 = [|3;2;1;5;4;6|]
let hack_4 = [|1;3;4;2|]
let hack_5 = [|3;4;5;1;2|] *)

let int_array_of_string s = 
  Array.of_list
  @@ List.map int_of_string
  @@ String.split_on_char ' ' s

let process_input s a = 
  for i=1 to (s-1) do
    if a.(i)>a.(i-1)
      then bpa.(i) <- (i-1)
    else bpa.(i) <- (-1)
  done


(* Array.sub bpa 0 s *)


let process_bpa s pre = 
  let flag = ref true
  in
  for i=1 to (s-1) do
    if (bpa.(i)>(-1))
      then
        for j=i to (s-1) do
          if pre.(j)<=pre.(bpa.(i))
            then flag := false
        done
  done;
  !flag




let () = 
  let n = int_of_string (read_line ())
  in
  for i=1 to n do
    let size = int_of_string (read_line ()) 
    in let pre = int_array_of_string @@ read_line ()
    in
    process_input size pre;
    print_endline @@ if (*is_bst pre size 1*) true then "YES" else "NO"
   done


(* type 'a btree = Empty | Node of 'a * 'a btree * 'a btree
let list = [1;2;3;4;5]
let t1 = Node(33,
          Node(12, Empty, Empty),
          Node(74,
            Node(43, Empty, Empty),
            Empty)) *)



(* let rec is_max_of_list l =
   match l with
   | [] -> failwith "empty list"
   | [x] -> x
   | h::t -> max h (is_max_of_list t)
 
let rec is_min_of_list l =
   match l with
   | [] -> failwith "empty list"
   | [x] -> x
   | h::t -> min h (is_min_of_list t)



let rec split_preorder l =
  match l with
  (* | base case *)
  | h1::h2::t -> 
    if h1>h2 then split_preorder (h1::t)
    else h2::t *)


(* let rec val l = 
  match l with
  | [] -> true
  | h1::h2::t -> 
    if (h2>h1) then *)



(* 
- if 2nd > 1st, then check number after that, if < 
*)

(* for each number that has a bp parent, check the numbers to right to see if all bigger than parent *)


