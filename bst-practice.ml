let bpa = Array.make 100 (-1)
let test_string = "3 4 5 1 2"
let test_array = [|3;4;5;1;2|]

let hack_1 = [|1;2;3|]
let hack_2 = [|2;1;3|]
let hack_3 = [|3;2;1;5;4;6|]
let hack_4 = [|1;3;4;2|]
let hack_5 = [|3;4;5;1;2|]
let error_arr = [|20;9;6;19;4;13;1;7;12;18;20;10;15;14;5;2;16;11;8;17;3|]
let error_list = Array.to_list error_arr


(* let max_num_index_in_arr index arr =
  let max_num_index = ref 0
  in
  for i=0 to index-1 do
    if arr.(i) > arr.(!max_num_index) then max_num_index := i
  done;
  !max_num_index *)

let int_array_of_string s = 
  Array.of_list
  @@ List.map int_of_string
  @@ String.split_on_char ' ' s

(* let is_not_in_bpa s e = 
  let not_el = ref true
  in
  for i=0 to (s-2) do
    if e = bpa.(i) then not_el := false
  done;
  !not_el *)

let rec get_backpointer l n idx =
  if idx = -1
  then 0
  else
  (if l.(idx) > n
  then idx+1
  else (if arrbp.(idx)<>None
           then idx
  else get_backpointer l n (idx-1)))


let process_input s pre = 
  Array.fill bpa 0 100 (-1)
  for i=1 to (s-1) do
    if pre.(i)>pre.(i-1)
      then bpa.(i) <- get_backpointer pre pre.(i) (i-1)
    (* Here it is dealing with a bpa that is not fully done at this point!! have to do it to that index for it to work *)
        (* not sure if should do i or s after is_not_in_bpa (or something else) *)
   
  done

(* need to fix so that doesn't always do the one before as the parent
   , have to figure out how to get parent *)


(* Array.sub bpa 0 s *)


let is_bst s pre = 
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


  (* 
  (max_num_index_in_arr 5 (Array.of_list (List.filter (is_not_in_bpa 5 ) (Array.to_list (error_arr)))));;
 *)