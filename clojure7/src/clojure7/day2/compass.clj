(ns clojure7.day2.compass)

(defprotocol Compass
  (direction [c])
  (left [c])
  (right [c])
  )

(def directions [:north :east :south :west])

(defn turn
  [base amount]
  (rem (+ base amount) (count directions)))

(defrecord SimpleCompass [bearing]
  Compass
  (direction [_] (directions bearing))
  (left [_] (SimpleCompass. (turn bearing 3)))
  (right [_] (SimpleCompass. (turn bearing 1)))
  Object
  (toString [this] (str "[" (direction this) "]"))
  )

; (require '[clojure7.day2.compass :as comp])
;; (clojure7.day2.compass/turn 1 1)
;; (comp/turn 1 1)
; (ns clojure7.day2.compass)
;; (turn 1 1)