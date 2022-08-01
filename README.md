# README

### Must have Ruby 3.0.2
### Developed with
- Ruby 3.0.2
- Rails 7
- Faraday and some middleware
- Turbo & Stimulus for frontend/backend interaction and js behavior
- Postgres
- cssbuild
- Initially just with SASS but decided to use Bulma after all.
- RSpec, Capybara, FactoryBot, Faker - Integration and unit tests
- Devise to persist user and feature the favorite comic feature.
- Docker - to configure db in case it is needed.

### API

API built within namespace Marvel. I have used this structure to encapsulate logic and explore some skills like metaprogramming, but I tried to be clear about the responsibility of each one.
For a frontend purpose, I needed to add two more endpoints regarding comics.
I have used Faraday to diminish the hard work with the response data. It has good treatment with requests and it is a good tool in any more significant case.

### Frontend

Bulma, Stimulus, Turbo(comunication between frontend and backend). That’s all.

### Running
Run:
1. `bundle install`
2. `rails db:create db:migrate`
3. `yarn install`
4. `./bin/dev`

To test:
Just type `rspec` on the project folder
> rspec

*From what I've seen, two tests may fail, but you can check the code and validate the logic, I stopped fighting the bugs after a while.*

### As next steps I would:
- Setup a Logger to deal with error responses.
- Use more Faraday middleware to deal with quantity response.
- Validate the Rack Attack rails approach on tests.
- Explore a more performative way of searching for results.
- Refactor PORO.
- Implement more tests and perhaps add a shoulda-matchers to increase tests covering about attributes and associations.
