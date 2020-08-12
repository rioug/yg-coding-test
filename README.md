# YourGrocer Coding Test

Thank you for taking the time to do this coding test.

## Coding test

This is a Ruby on Rails app that simulates a basic ecommerce website.

- There are two database models: `Product` and `Retailer`.

- Each product belongs to a retailer.

- Each product has a price, which must be greater than $0.00.

- The user can create, read, update, and delete products and retailers.

### Task

Your task is to develop the initial stage of a __shopping cart__ feature.

Please complete the following user stories:

- As a user, I can add a product to the cart.

- As a user, I can see which products are in the cart.

- As a user, I can remove a product from the cart.

### Guidelines

- Focus on the functionality. (The UI design isn't important, but it must _work_.)

- Write tests.

- Write clear commit messages.

- You do _not_ need to implement other features such as payment or user authentication.

### Instructions

Clone this repo to get started. Get the app running in your browser (see the instructions later in this document). Explore the basic functionality of the app, and think about the requested feature changes.

Commit your changes to the code. When finished, please email us with one of the following:

- a link to your copy of the Git repo (e.g. on GitHub), or
- a .zip file which includes the Git history.

---

## Running the code

This app has been tested with Ruby 2.5 and 2.6.

### Install dependencies

```sh
gem install bundler
bundle install
```

### Set up the sqlite database

```sh
bundle exec rake db:setup db:migrate
```

### Run tests

```sh
bundle exec rspec
```

### Start the server

```sh
bundle exec rails server
```
