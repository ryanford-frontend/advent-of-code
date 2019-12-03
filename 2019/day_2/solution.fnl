(let [data (-> (io.open "input.txt")
									(: :read "*a")
									(: :gmatch "%d+"))
			input {}]
	(each [k data] (table.insert input (tonumber k)))
	(tset input 0 (table.remove input 1))
	(tset input :add (fn [self i]
		(tset self (. self (+ i 3)) (+ (. self (. self (+ i 1))) (. self (. self (+ i 2)))))))
	(tset input :mult (fn [self i]
		(tset self (. self (+ i 3)) (* (. self (. self (+ i 1))) (. self (. self (+ i 2)))))))
	(tset input :new (fn [self o]
		(tset self "__index" self)
		(setmetatable (or o {}) self)))

	(let [tbl (input:new { 1 12 2 2 })]
		(var done nil)
		(for [i 0 (length input) 4]
			(if (not= done true)
				(match (. tbl i)
					1 (tbl:add i)
					2 (tbl:mult i)
					(set done true))))
		(print (. tbl 0)))

	(for [i 0 99]
		(for [j 0 99]
			(let [tbl (input:new { 1 i 2 j })
						target 19690720]
				(var done nil)
				(for [k 0 (length input) 4]
					(if (not= done true)
						(match (. tbl k)
							1 (tbl:add k)
							2 (tbl:mult k)
							(set done true))
							(when (= (. tbl 0) target)
								(print (+ (* i 100) j))
								(set done true))))))))
