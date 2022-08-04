let bpa = Array.make 100 (-1)
(* let test_string = "3 4 5 1 2"
let test_array = [|3;4;5;1;2|] *)

(* let hack_1 = [|1;2;3|]
let hack_2 = [|2;1;3|]
let hack_3 = [|3;2;1;5;4;6|]
let hack_4 = [|1;3;4;2|]
let hack_5 = [|3;4;5;1;2|] *)

let max_num_index_in_arr index arr =
  let max_num_index = ref 0
  in
  for i=0 to index-1 do
    if arr.(i) > arr.(!max_num_index) then max_num_index := i
  done;
  !max_num_index

let int_array_of_string s = 
  Array.of_list
  @@ List.map int_of_string
  @@ String.split_on_char ' ' s

let process_input s pre = 
  for i=1 to (s-1) do
    if pre.(i)>pre.(i-1)
      then bpa.(i) <- (max_num_index_in_arr i pre)
    else bpa.(i) <- (-1)
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

  let () = 
  let n = int_of_string (read_line ())
  in
  for i=1 to n do
    let size = int_of_string (read_line ()) 
    in let pre = int_array_of_string @@ read_line ()
    in
    process_input size pre;
    print_endline @@ if (is_bst size pre==true) then "YES" else "NO"
   done


