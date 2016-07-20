# encoding: utf-8
require 'spec_helper'
require "logstash/filters/jsonrehasherfilter"

describe LogStash::Filters::JsonRehasherFilter do
  describe "Set to rehashed json" do
    let(:config) do <<-CONFIG
      filter {
        jsonrehasherfilter {
          target => "message"
          metadata_target => "endpoint"
        }
      }
    CONFIG
    end

    # The expected output must be hand trimmed.
    # You could create a ruby hash and call to_json but hand rolling it
    # removes a dependency so that the test case is eye level and clear.
    expected = {"jsondata" => {"data" => {"a"=>"a", "b"=>"b"}}}

    # Sample must be json text as that is what will be received from logstash.
    # This can be formated as logstash will trim it.
    sample(
      "message" => {
        "jsondata" => {
          "data.a" => "a",
          "data.b"=> "b"
        }
      }
    ) do expect(subject['message']).to eq(expected)
    end
  end
end
