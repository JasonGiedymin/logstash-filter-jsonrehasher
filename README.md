# Logstash Plugin

## Usage

1. Import this gem into your gemspec for logstash, allowing logsash to install the plugin.
1. Use the filter like so:
```ruby
filter {
    jsonrehasherfilter {
        target => "message"
        metadata_target => "endpoint"
    }
}
```
1. the `message` field that will be read and replaced with proper json. It is required. This plugin will not do top level event replacement.
1. the `metadata_target` is unused at the moment.


## Recommended Development Tools

```shell
# install rbenv
rbenv install jruby-9.0.5.0
rbenv local jruby-9.0.5.0
gem install bundler
```

This is a plugin for [Logstash](https://github.com/elastic/logstash).

## Developing

### 1. Plugin Developement and Testing

#### Code
- To get started, you'll need JRuby with the Bundler gem installed.

- Install dependencies
```sh
bundle install
```

#### Test

- Update your dependencies

```sh
bundle install
```

- Run tests

```sh
bundle exec rspec
```

### 2. Running your unpublished Plugin in Logstash

#### 2.1 Run in a local Logstash clone

- Edit Logstash `Gemfile` and add the local plugin path, for example:
```ruby
gem "logstash-filter-awesome", :path => "/your/local/logstash-filter-awesome"
```
- Install plugin
```sh
bin/plugin install --no-verify
```
- Run Logstash with your plugin
```sh
bin/logstash -e 'filter {awesome {}}'
```

- A better way to test with configs
```
# make sure the following is in the config:
# output {
#    stdout {codec => rubydebug}
#    file {
#         codec => "json_lines"
#         path => "../debug-filters.json"
#     }
# }
bin/logstash --config ../configs -l ../logstash-debug.log
```

At this point any modifications to the plugin code will be applied to this local Logstash setup. After modifying the plugin, simply rerun Logstash.

#### 2.2 Run in an installed Logstash

You can use the same **2.1** method to run your plugin in an installed Logstash by editing its `Gemfile` and pointing the `:path` to your local plugin development directory or you can build the gem and install it using:

- Build your plugin gem
```sh
gem build logstash-filter-awesome.gemspec
```
- Install the plugin from the Logstash home
```sh
bin/plugin install /your/local/plugin/logstash-filter-awesome.gem
```
- Start Logstash and proceed to test the plugin
