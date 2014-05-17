# DoBy

This is proof of concept for automatic expiring TODO notes.

TODO comments can be a plague on a software codebase. They begin as a good
intention to go back and do something, but are easily forgotten. They can hang
around in code for years. They're not code, so they don't cause anything to fail.

DoBy makes your TODO comments complain when they become stale. You
specify a date which you to defer until. When your tests run, the TODOs expiry
dates will be checked, and the test will fail if the task is overdue.

This forces you  to look at the TODO task again. If it's no longer relevant, you
can delete it. If you can fix it, you fix it. If you cannot fix it right now,
change the date to something in the future to re-visit it again.

# Example

You can add rememinders to specs or the actual implementation, anywhere
that will be executed:

`TODO 'fix this', '2014-06-01'`

In your production environment, set `DISABLE_DO_BY=1` to disable checks.

The date can be anything parseable by Ruby's `DateTime.parse` method.

## Installation

Add this line to your application's Gemfile:

    gem 'do_by', github: 'andyw8/do_by'

And then execute:

    $ bundle

## Contributing

1. Fork it ( https://github.com/andyw8/do_by/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
