(let [input (-> (io.open "input.txt")
								(: :read "*a"))]

	(fn fuel-cost [num] (if (< num 9) 0 (- (math.floor (/ (tonumber num) 3)) 2)))

	(fn total-cost [mass cost]
		(if (<= mass 0)
			(or cost 0)
			(let [new-mass (fuel-cost mass)]
				(total-cost new-mass (+ (or cost 0) new-mass)))))

	(do
		(var sum 0)
		(each [num (string.gmatch input "%d+")]
		(set sum (+ sum (fuel-cost (tonumber num)))))
		(print sum))

	(do
		(var sum 0)
		(each [num (string.gmatch input "%d+")]
		(set sum (+ sum (total-cost (tonumber num)))))
		(print sum)))
