type 'a btree = Empty | Node of 'a * 'a btree * 'a btree

let t1 = Node(33,
          Node(12, Empty, Empty),
          Node(74,
            Node(43, Empty, Empty),
            Empty))

fun val l = 
  match l with
  