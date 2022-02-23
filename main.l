(seed (in "/dev/urandom" (rd 8)))
(load "english.l")
(de green (A)
   (prin "^[[30;102m" A "^[[0m") )
(de gray (A)
   (prin "^[[30;47m" A "^[[0m") )
(de yellow (A)
   (prin "^[[30;103m" A "^[[0m") )
(de display (Lst G)
   (mapc
      '((A B)
         (case A
            (1 (gray B))
            (2 (yellow B))
            (3 (green B)) ) )
      Lst
      G )
   (prinl) )
(de compare (W G)
   (make
      (for (I . X) G
         (link
            (cond
               ((= X (get W I)) 3)
               ((member X W) 2)
               (T 1) ) ) ) ) )
(let
   (W (chop (get *W (rand 1 2048)))
      L (length W)
      Lst (need L 3)
      C 0
      S NIL
      G NIL )
   (prinl "Word is " L " chars and your attempts.")
   (loop
      (prin
         "Enter word: " )
      (setq G (in NIL (line))  S (compare W G))
      (display S G)
      (inc 'C)
      (T (or
         (= L C)
         (= Lst S) ) ) ) )
(msg 'bye.)
(bye)
