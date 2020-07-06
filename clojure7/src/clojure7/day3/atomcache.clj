(ns clojure7.day3.atomcache)

(defn cache-create
  []
  (atom {}))

(defn cache-get
  [cache key]
  (@cache key))

(defn cache-put
  ([cache value-map]
   (swap! cache merge value-map))
  ([cache key value]
   (swap! cache assoc key value)))

; (require '[clojure7.day3.atomcache])
; (ns clojure7.day3.atomcache)
; (def ac (cache-create))
; (cache-put ac :quote "I'm your father, Luke.")
; (println (str "Cached item: " (cache-get ac :quote)))