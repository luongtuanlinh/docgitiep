This is an example and tutorial to build and run your Rails app on Docker.

# Preparation

You need followings:

- Docker installed: [Link](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
- Docker compose installed: [Link](https://docs.docker.com/compose/install/)

# Run project

Up Docker container.

```console
$ docker-compose up
```

# Create databases

Open another console and run this to initialize database.

```console
$ cd docker-rails-example/
$ docker-compose exec rails rake db:create db:migrate db:seed
```

Open in browser.

- [`http://localhost:3000/`](http://localhost:3000/)

To stop, in the console where `docker-compose` is running, hit `Ctrl + C` and wait.

```console
Gracefully stopping... (press Ctrl+C again to force)
Stopping docker-rails-example_rails_1   ... done
Stopping docker-rails-example_db_1      ... done

$
```

## Stop docker server

Try to stop the containers by holding `Ctrl-C` in the console. Closing process may take time. Be patient.

```console
Gracefully stopping... (press Ctrl+C again to force)
Stopping docker-rails-example_rails_1   ... done
Stopping docker-rails-example_db_1      ... done

$
```

If you get how to up and end it, up again and move on to the next.

## Open another console

Keep the Docker containers running.

While they are running, you need to open a new console to work.

## Initialize database

In the 2nd console just you opened, type following line to create database while running `docker-compose up` in the 1st one.

```console
$ docker-compose exec rails rake db:create
Created database 'my-great-app_development'
Created database 'my-great-app_test'
```

## Open in browser

Open [`http://localhost:3000/`](http://localhost:3000/) and look at what you have done! Yay! You’re on Rails!

![Welcome screen from Rails](doc/you-are-on-rails.png)

# Up your project from the next time

Now it's simple.

```console
$ docker-compose up
```

And open [`http://localhost:3000/`](http://localhost:3000/).

You may need the 2nd console to run commands like `rails g scaffold`.

# Update your project

## General idea

You may want to run `rails`, `rake` or any other commands. For those cases, the most basic idea is running `docker-compose exec rails xxx`.

Let's say you want to `echo` here. You would use this:

```console
$ docker-compose exec rails echo Hello from Docker container!
```

Please remember you have to type this command into your 2nd console, next the 1st one where your `docker-compose up` is running.

## When you want to generate a scaffold

```console
$ docker-compose exec rails rails g scaffold post title:string body:text
      invoke  active_record
      create    db/migrate/20180806212720_create_posts.rb
      create    /models/post.rb
...
      create      /assets/stylesheets/posts.scss
      invoke  scss
      create    /assets/stylesheets/scaffolds.scss
```

Don't forget migration! (See next chapter.)

## When you generated a new migration

```console
$ docker-compose exec rails rake db:migrate
== 20180806212720 CreatePosts: migrating ======================================
-- create_table(:posts)
   -> 0.0766s
== 20180806212720 CreatePosts: migrated (0.0769s) =============================
```

## When you want to run test

```console
$ docker-compose exec rails rake test
Run options: --seed 52703

# Running:

.......

Finished in 1.302024s, 5.3762 runs/s, 6.9123 assertions/s.
7 runs, 9 assertions, 0 failures, 0 errors, 0 skips
```

## When you added new gems

When you update `Gemfile`, you used to run `bundle install`.

With Docker, you need to rebuild your image instead. This process includes `bundle install` and updates `Gemfile.lock`.

To rebuild, give `--force-recreate` option.

```console
$ docker-compose.exe up --build
```

Otherwise you would see an error like this (you could miss it because the log is too long to read):

```
rails_1  | /usr/local/lib/ruby/gems/2.3.0/gems/bundler-1.13.7/lib/bundler/resolver.rb:366:in `block in verify_gemfile_dependencies_are_found!': Could not find gem 'carrierwave' in any of the gem sources listed in your Gemfile or available on this machine. (Bundler::GemNotFound)
rails_1  |      from /usr/local/lib/ruby/gems/2.3.0/gems/bundler-1.13.7/lib/bundler/resolver.rb:341:in `each'
...
rails_1  |      from /usr/local/bundle/bin/rails:15:in `<main>'
```

# Join somebody's project

These steps should be described in the project's README documentation.

1. Clone the repository
2. Up Docker containers
3. Initialize database
4. Start your job

## Clone the repository

```console
$ git clone ...
$ cd xxx
```

## Up Docker containers

```console
$ docker-compose up
```

Hold `Ctrl-C` to stop.

## Initialize database

Open another console and run:

```console
$ docker-compose exec rails rake db:create db:migrate db:seed
```

## Start your job

Open [`http://localhost:3000/`](http://localhost:3000/) (and another console maybe) and start your job.

Let's rock!
