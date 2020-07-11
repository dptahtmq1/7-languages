(ns clojure7.day3.barber)

(def waiting-customer (atom 0))
(def customer-count (atom 0))
(def chairs 3)
(def open? (atom true))

(defn make-customer
  []
  (future
    (println "make customer")
    (while @open?
      (if (< @waiting-customer chairs)
        (do
          (swap! waiting-customer inc)
          (Thread/sleep (+ 10 (rand-int 20))))))
    ))

(defn haircut
  "cut 20ms"
  []
  (future
    (println "start haircut")
    (while @open?
      (if (> @waiting-customer 0)
        (do
          (swap! waiting-customer dec)
          (swap! customer-count inc)
          (Thread/sleep 20))))
    ))

(defn open
  "[during]ms open"
  [during]
  (println (str "open barber shop during " during "ms"))
  (future
    (haircut)
    (make-customer)
    (Thread/sleep during)
    (swap! open? not)
    (println (str "close barber shop, result : " @customer-count))
    ))

; (require '[clojure7.day3.barber])
; (ns clojure7.day3.barber)
; (def barber (open 10000))
; (@barber)
; (println @customer-count)