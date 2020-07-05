(ns clojure7.day1.day1)

(defn big
  "Return true if st is bigger than n"
  [st n]
  (> (count st) n)
  )

;(big "abcd" 2)

(defn collection-type
  "Return collection type as symbol"
  [col]
  (cond
    (map? col) :map
    (list? col) :list
    (vector? col) :vector
    :else :unknown
    )
  )

;(collection-type {:a 1})
;(collection-type '(1 2 3))
;(collection-type [1 2])
;(collection-type "abcd")