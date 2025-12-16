# Healthie Exercise

This repository includes the answers to the coding exercise. The Rails app was generated using `rails new`, with the
only option being webpacker for js. You can run the environment with docker using script/run.sh. Remember to run `bundle install`.

The solutions are divided into:

- Question: the Question.md file has the answers to the theoretical question I choose;

- Class Design: 
    - lib/animals defines the animals, while lib/foods defines the foods. The animals can be feed using the
    a rake task. Design choices are explained in the files related to them. To run the task, use: `rails animals:feed_animals`;

- Database and Model design:
    - models were generated using `rails g model (...)`. The drawing below summarizes how they are associated. Decisions are
    annotated in migrations or models;


- I didn't do RSpec tests for the models because they were not required, but I'd have a test for the uniqueness (just to make sure it's not
  dropped by accident, as I don't like re-testing gem code) and the Journal scopes;

- The queries are exemplified in `rails data:queries`;

```
Providers  <->   Plan     <-> Client    <-> Journal Entries
has many   <-  belongs to     has many  <-  belongs to
               belongs to  -> has many
```


- JS:
    - run the Rails app and access '/' to get to the page that uses compiled assets. The code used for it is inside src/. I used Vite to compile the 
    code, as that's what I have used recently, but I reckon the setup could be improved. I would usually use tailwind for styling, but I chose to 
    use only a linter, vite, React, and the confetti library to keep things simple. I opted in favor of doing all the drag and drop manually instead 
    of using a library, as that seemed like a requirement. I had to look up how Drag and Drop are usually implemented and used https://developer.mozilla.org/en-US/docs/Web/API/HTML_Drag_and_Drop_API as my reference.

## How to run the app

First build the docker image:

```bash
./script/build.sh
```

After that, you can run the container:

```bash
./script/serve.sh
```

I used `script/run.sh` for development.
