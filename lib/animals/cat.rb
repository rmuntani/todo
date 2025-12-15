require 'foods/foods'
require 'animals/animal'

class Cat
  include Animal

  def initialize(liked_foods: [CatFood, Chicken, Milk],
                 noise: "meow")
    @liked_foods = liked_foods
    @noise = noise
  end

  private

  attr_reader :liked_foods, :noise
end
