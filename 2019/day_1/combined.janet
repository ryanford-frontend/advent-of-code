(defn part-one
  "find initial fuel requirements"
  [mass]

  (if (< mass 9)
    0
    (- (math/floor (/ mass 3)) 2)))

(defn part-two
  "find cost including cost of fuel weight"
  [mass &opt cost]
  (if (<= mass 0)
    (or cost 0)
    (let [new-mass (part-one mass)]
      (part-two new-mass (+ (or cost 0) new-mass)))))

(defn show-solution [f input]
  (print (reduce + 0 (map (fn [n] (f (scan-number n))) (array/slice (string/split "\n" input) 0 -2)))))

(let [input (file/read (file/open "input.txt" :r) :all)]
  (show-solution part-one input)
  (show-solution part-two input))
