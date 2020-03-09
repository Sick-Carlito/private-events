# Private-events

This is a simple rails application that implements the use of one_to_many and many_to_many associations. The app allows users to create and attend events. However, these events can only be created when a user signs up and signs in.

Things covered in the project:

- Models, Views, and Controllers (MVC)
- Routing
- Migrations
- Views with forms and helpers
- Adding gems for extra features



## How to run this app
To run it, clone this repository locally, and run these commands on your terminal.
```
Git clone git@github.com:Sick-Carlito/private-events.git

cd ~/members-only
rails s

```

#### To sign up
```
Visit localhost:3000/signup
```

then proceed to sign in

#### To sign in
```
Visit localhost:3000/signin
```
#### To create an event
```
Visit localhost:3000/events/new
```

#### To view the created events
```
Visit localhost:3000/events/index
```

Note: You must be signed in to create an event

## Build with

- Ruby 2.6.3
- Rails 6.0.2
- sqlite3 1.4
- yarn bundler
- Rspec-rails

## Author

- [Carl](https://github.com/Sick-Carlito/private-events)


## Acknowledgments

- [The Odin Project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations)