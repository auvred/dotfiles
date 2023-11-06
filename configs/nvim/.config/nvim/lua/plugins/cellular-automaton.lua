local map = require("utils").map

map("n", "<leader>gq1", function()
  require("cellular-automaton").start_animation("make_it_rain")
end)
map("n", "<leader>gq2", function()
  require("cellular-automaton").start_animation("game_of_life")
end)
map("n", "<leader>gq3", function()
  require("cellular-automaton").start_animation("scramble")
end)
