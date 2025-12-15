# Healthie Exercise

This repository includes the anwers to Healthie's coding exercise. The Rails app was generated using `rails new`, with the
only option being webpacker for js. You can run the environment with docker using script/run.sh. Remember to run `bundle install`.

The solutions are divided into:

- Question: the Question.md file has the answers to the theoretical question I choose;

- Class Design: 
    - lib/animals defines the animals, while lib/foods defines the foods. The animals can be feed using the
    a rake task. Design choices are explained in the files related to them. To run the task, use: `rails animals:feed_animals`;


