module Animal
  # I was on the fence between using simple inheritance or including a module to the animal classes. As
  # there's a hint that there could be animals that are also food (like Chicken and Fish), I preferred
  # using modules to share code, as that would make it easier and clearer that an Animal can also be Food.
  # Both solutions (inheritance and including a class) have the same effect, as included modules are added to
  # the classes' ancestors (which I had to confirm by doing Dog.ancestors).
  #
  # An alternative to that would be using composition, but that didn't make sense to me in that case, as a dog
  # is an animal. That is, to me, a better way to model the classes.
  def eat(food)
    if likes_food?(food)
      LIKED_FOOD_REPEATS.times { make_noise }
    else
      DISLIKED_FOOD_REPEATS.times { make_noise }
    end
  end

  def likes_food?(food)
    liked_foods.include?(food)
  end

  def make_noise
    puts noise
  end

  private

  def liked_foods
    raise NotImplementedError
  end

  def noise
    raise NotImplementedError
  end

  LIKED_FOOD_REPEATS = 3
  DISLIKED_FOOD_REPEATS = 1
end
