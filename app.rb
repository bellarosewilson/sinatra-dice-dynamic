require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

# Dynamic route for any dice/sides
get("/dice/:dice/:sides") do
  @num_dice = params[:dice].to_i
  @num_sides = params[:sides].to_i
  @rolls = Array.new(@num_dice) { rand(1..@num_sides) }

  erb(:roll)  # adding `views/roll.erb`
end
