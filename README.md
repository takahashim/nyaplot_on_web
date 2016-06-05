# Nyaplot on Web

Use Nyaplot plotter simply on web browser, without IRuby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nyaplot_on_web'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nyaplot_on_web

## Usage

Execute a command `nyaplot_on_web`.

    $ nyaplot_on_web

`nyaplot_on_web` calls `pry` interactive environments.

```
$ nyaplot_on_web
[1] pry(main)> plot = Nyaplot::Plot.new
=> #<Nyaplot::Plot:0x007fe972a656e0 @properties={:diagrams=>[], :options=>{}}>
[2] pry(main)> bar = plot.add(:bar, ['Persian', 'Maine Coon', 'American Shorthair'], [15,45,30])
=> #<Nyaplot::Diagram:0x007fe9749c8c80
 @properties={:type=>:bar, :options=>{:x=>"data0", :y=>"data1"}, :data=>"d4e88362-e0f4-485c-aece-6eb44abd5404"},
 @xrange=["Persian", "Maine Coon", "American Shorthair"],
 @yrange=[0, 45]>
[3] pry(main)> plot.show
start server on port 28288.
=> #<Process::Waiter:0x007fe974a59b90 sleep>
[4] pry(main)>
shutdown server
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/takahashim/nyaplot_on_web.

