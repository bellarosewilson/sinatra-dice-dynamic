require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/dice/2/6") do
  @rolls = []

  2.times do
    die = rand(1..6)
    @rolls.push(die)
  end

  erb(:two_six)
end

get("/dice/2/10") do
  @rolls = []

  2.times do
    die = rand(1..10)
    @rolls.push(die)
  end

  erb(:two_ten)
end

get("/dice/1/20") do
  @rolls = []

  1.times do
    die = rand(1..20)
    @rolls.push(die)
  end

  erb(:one_twenty)
end

get("/dice/5/4") do
  @rolls = []

  5.times do
    die = rand(1..4)
    @rolls.push(die)
  end

  erb(:five_four)
end

# This is the general dynamic route for any number of dice and sides
get("/dice/:number_of_dice/:how_many_sides") do
  @num_dice = params[:number_of_dice].to_i
  @sides = params[:how_many_sides].to_i

  @rolls = []

  @num_dice.times do
    die = rand(1..@sides)
    @rolls.push(die)
  end

  erb(:randomdice) # You need to create this template
end
