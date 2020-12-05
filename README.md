# Mission To Mars

![CI status](https://github.com/matt-thomson/mission-to-mars/workflows/CI/badge.svg)

Program to track robots travelling around Mars.

## Prerequisites

You'll need [Ruby](https://www.ruby-lang.org) and [Bundler](https://bundler.io/) installed on your system.  Ruby 2.6.6 has been used for development, but other versions should work.

Once you have those installed, run `bin/setup` within the repository to install the dependencies.

## Usage

To run the app:

```
bin/mars
```

## Linting

Linting is provided by [Rubocop](https://github.com/rubocop-hq/rubocop), mostly following its default style guide.  It can be run with:

```
bin/rubocop
```

Rubocop can fix many of its violations automatically, by running:

```
bin/rubocop -a
```

## Tests

Tests are written with [RSpec](https://rspec.info/), and can be run with:

```
bin/rspec
```
