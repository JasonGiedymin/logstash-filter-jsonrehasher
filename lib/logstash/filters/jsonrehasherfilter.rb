# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"
require "jsonrehasher"

class LogStash::Filters::JsonRehasherFilter < LogStash::Filters::Base
  config_name "jsonrehasherfilter"

  # Replace the message with this value.
  config :metadata_target, :validate => :string, :default => "endpoint"
  config :target, :validate => :string, :default => "message"

  public
  def register
    # Add instance variables
  end # def register

  public
  def filter(event)

    if @metadata_target
      event[@target] = JsonRehasher.new().processHash(event[@target])
    end

    filter_matched(event)
  end # def filter
end # class LogStash::Filters::JsonRehasherFilter
