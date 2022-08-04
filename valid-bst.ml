let bpa = Array.make 100 (-1)


let int_array_of_string s = 
  Array.of_list
  @@ List.map int_of_string
  @@ String.split_on_char ' ' s



let rec get_backpointer l n idx =

  (* if you have gone to an index past the root, then the root must be the parent so the backpointer is to 0 *)
  if idx = -1
  then 0
  else

  (* if you are going back in the array and find a number that is greater, then the index has to be the one in front *)
  (if l.(idx) > n
  then idx+1

  (* if you reach a node that has a backpointer, then that is the backpointer of the current node *)
  else (if bpa.(idx)<>(-1)
           then idx

  (* if nothing is met, go one space back in the array and repeat *)
  else get_backpointer l n (idx-1)))



(* processes input*)
let process_input s pre = 
  (* resets bpa to -1's  *)
  Array.fill bpa 0 100 (-1);

  (* goes through array to see when you find a node that is greater than the previous 
     and applies the get_backpointer function *)
  for i=1 to (s-1) do
    if pre.(i)>pre.(i-1)
      then bpa.(i) <- get_backpointer pre pre.(i) (i-1)
  done



(* this function goes through the backpointer array *)
let is_bst s pre = 
  let flag = ref true
  in
  for i=1 to (s-1) do
    (* once you find a node in bpa that backpoints to something... *)
    if (bpa.(i)>(-1))
      then
        (* checks in the pre list to make sure that all of the elements 
           to the right of the index in bpa are greater than the backpointed ]
           element in the pre-order array*)
        for j=i to (s-1) do
          if pre.(j)<=pre.(bpa.(i))
            then flag := false
        done
  done;
  !flag


  (* main function, deals with inputs on HackerRank *)
  let () = 
  let n = int_of_string (read_line ())
  in
  for i=1 to n do
    let size = int_of_string (read_line ()) 
    in let pre = int_array_of_string @@ read_line ()
    in
    process_input size pre;
    print_endline @@ if (is_bst size pre == true) then "YES" else "NO"
   done