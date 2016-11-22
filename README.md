# rails5-starter-app

Bibisco Clone!
[bibisco](http://www.bibisco.com/).

## Installation

TODO

### Associated services (TODO)

* Enable [Circle CI](https://circleci.com/) Continuous Integration
* Enable [GitHub auto deploys to Heroku staging and review
    apps](https://dashboard.heroku.com/apps/app-name-staging/deploy/github).

## Gemfile

To see the latest and greatest gems, look at rails5-starter-app's
[Gemfile](templates/Gemfile.erb).

It includes application gems like:

* [Bourbon](https://github.com/thoughtbot/bourbon) for Sass mixins
* [jQuery Rails](https://github.com/rails/jquery-rails) for jQuery
* [Normalize](https://necolas.github.io/normalize.css/) for resetting browser styles
* [Postgres](https://github.com/ged/ruby-pg) for access to the Postgres database
* [Simple Form](https://github.com/plataformatec/simple_form) for form markup
  and style
* [Puma](https://github.com/puma/puma) to serve HTTP requests

And development gems like:

* [Pry Rails](https://github.com/rweng/pry-rails) for interactively exploring
  objects
* [Spring](https://github.com/rails/spring) for fast Rails actions via
  pre-loading
* [Web Console](https://github.com/rails/web-console) for better debugging via
  in-browser IRB consoles.

And testing gems like:

* [Factory Girl](https://github.com/thoughtbot/factory_girl) for test data
* [RSpec](https://github.com/rspec/rspec) for unit testing
* [RSpec Mocks](https://github.com/rspec/rspec-mocks) for stubbing and spying
* [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) for common
  RSpec matchers

## Spring

rails5-starter-app uses [spring](https://github.com/rails/spring) by default.
It makes Rails applications load faster, but it might introduce confusing issues around stale code not being refreshed.
If you think your application is running old code, run `spring stop`.
And if you'd rather not use spring, add `DISABLE_SPRING=1` to your login file.

## Dependencies

rails5-starter-app requires the latest version of Ruby.

Some gems included in rails5-starter-app have native extensions. You should have GCC
installed on your machine before generating an app with rails5-starter-app.

Use [OS X GCC Installer](https://github.com/kennethreitz/osx-gcc-installer/) for
Snow Leopard (OS X 10.6).

Use [Command Line Tools for Xcode](https://developer.apple.com/downloads/index.action)
for Lion (OS X 10.7) or Mountain Lion (OS X 10.8).

PostgreSQL needs to be installed and running for the `db:create` rake task.

## Issues

If you have problems, please create a
[GitHub Issue](https://github.com/malachaifrazier/rails5-starter-app/issues).

## Contributing

Thank you, [contributors]!

[contributors]: https://github.com/malachaifrazier/rails5-starter-app/graphs/contributors

## License

rails5-starter-app is Copyright © 2016 Butterburn LLC.
It is free software,
and may be redistributed under the terms specified in the [LICENSE] file.

[LICENSE]: LICENSE

## About Butterburn LLC

rails5-starter-app is maintained and funded by Butterburn LLC.
The names and logos for Butterburn LLC are trademarks of Butterburn LLC.

We love open source software!
We are [available for hire][hire].

[hire]: http://www.butterburn.co/