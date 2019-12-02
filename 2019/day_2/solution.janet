(defmacro calc [op t i]
  ~(put ,t (get ,t (+ ,i 3)) (,op (get ,t (get ,t (+ ,i 1))) (get ,t (get ,t (+ ,i 2))))))

(let [input (map scan-number (string/split "," (string/trim (slurp "input.txt"))))
      input-proto (zipcoll (range (length input)) input)]
  (let [tbl (table/clone input-proto)]
    (put tbl 1 12)
    (put tbl 2 2)
    (loop [i :range [0 (length tbl) 4]]
      (match (get tbl i)
        1 (calc + tbl i)
        2 (calc * tbl i)
        (break)))
    (print (get tbl 0)))
  (let [target 19690720]
    (loop [i :range [0 100]]
      (loop [j :range [0 100]]
        (let [tbl (table/clone input-proto)]
          (put tbl 1 i)
          (put tbl 2 j)
          (loop [k :range [0 (length tbl) 4]]
            (if (= (get tbl 0) target)
              (do (print (+ (* i 100) j)) (break)))
            (match (get tbl k)
              1 (calc + tbl k)
              2 (calc * tbl k)
              (break))))))))
