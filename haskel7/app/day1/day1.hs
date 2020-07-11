module Day1 where

reverse2 :: [a] -> [a]
reverse2 [] = []
reverse2 (h:t) = reverse2(t) ++ [h]

colors = ["black", "white", "blue", "yellow", "red"]
color_tuple = [(a, b) | a <- colors, b <- colors, a /= b, a < b]

times_table = [(a, b, a * b) | a <- [1..12], b <- [1..12]]

map_colors = ["red", "green", "blue"]
coloring = [(alabama, mississippi, georgia, tennessee, florida) |
  alabama <- map_colors, mississippi <- map_colors, georgia <- map_colors, tennessee <- map_colors, florida <- map_colors,
  mississippi /= alabama, mississippi /= tennessee, alabama /= tennessee, alabama /= georgia, alabama /= florida,
  georgia /= florida, georgia /= tennessee]