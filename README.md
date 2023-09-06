# le buddy

*le buddy* is a project under the PGP (post graduate projects) umbrella of [Le
Wagon Cape Town](https://www.lewagon.com/cape-town), the first one in fact!

It will be built in public by a rotating team of *le wagon Cape Town* alumni who
offer their free time to learn and build a project that will be published and
used in the real world.

Learn more in this repository's wiki.

## What is *le buddy*?

*le buddy* is a platform for *le wagon* alumni to re-do the bootcamp challenges.
Sign up and find a buddy amongst the alumni to complete the challenges!

### Features planned for version 1

- Sign up using Github.
- Create a profile to tell us more about yourself and your goals.
- Browse *buddy ups* posted by other users and join them to participate in
completing the challenge(s).
- Create your own *buddy ups* to get others to join you in completing the
challenge of your choice.
- Provide private feedback to your buddy after challenge completion.
- Provide private feedback to the app maintainers to report bugs, suggest
improvements, or report abuse.

### Features planned for version 2

- Chat with your buddies on a challenge.
- See the challenge instructions inside *le buddy* to avoid having to use Kitt.
- Rake your challenges and see the results in *le buddy*.

### The tech behind *le buddy*

- Ruby (v 3.2.0) on Rails (v 7.0.6)
- Webpack
- PostgreSQL
- CSS with [Bulma](https://bulma.io)

## Contributions

To join the team, get in touch with [Kiki](https://github.com/KIKMAKER) to be
added as a contributor to the projects. No pull requests will be accepted from
outside the nominated team.

Once you are a contributor, first go read the wiki (in this repo). You'll have
access to the Trello board to grab tickets and complete them. A drawing of the
database schema is [available on Kitt](https://kitt.lewagon.com/db/105325).

We work by means of branches and pull requests – never push to the master branch
from development.

- Assign a task to yourself on Trello.
- Move it to the Doing list of that particular project.
- Create a branch and code away until done.
- Merge master into your branch and resolve merge conflicts.
- Push your branch to GitHub and create a Pull Request – make it a good one with
thorough descriptions, screenshots, etc.

**Do not** merge your own pull request – rather request a review from one of the
other collaborators on the repository.

## Setup

You need PostgreSQL and rbenv installed on your local machine. You can follow the
[le wagon setup](https://github.com/lewagon/setup) instructions to make sure
you have all the necessary components.

1. Clone this repository.
2. Make sure you have Ruby v3.2.0 installed with ```rbenv versions```. If not,
install it with ```rbenv install 3.2.0```.
3. Create an ```.env``` file and populate it with the values in the Slack canvas.
4. Run ```bundle install``` and ```yarn install```
5. Set up the database with ```rails db:drop db:create db:seed db:migrate```

Run the server in development with ```dev``` (or ```bin/dev```).

## Testing

Testing will be done with the [default Rails systems of MiniTest and
Capybara](https://guides.rubyonrails.org/testing.html).
You are responsible for writing tests of all the functionality you add.

There is no CI workflow so it is the responsibility of each developer to run
the full test suite locally (and they must all pass!) before submitting a pull
request.

To run the tests there is an environment variable required in your .env file,
so please make sure that is up to date as per the template in the Slack canvas.

### Running the tests

Run integration tests with ```rails test```

Run system tests only with ```rails test:system```

Run both unit and system tests with: ```rails test:all```
