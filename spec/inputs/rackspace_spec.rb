require "logstash/devutils/rspec/spec_helper"
require "logstash/inputs/rackspace"

describe LogStash::Inputs::Rackspace do

  let(:plugin) { described_class.new(config) }

  describe "debugging `api_key`" do
    let(:config) {{ "username" => "user_name", "api_key" => "$ecre&-key" }}

    it "should not show origin value" do
      expect(plugin.logger).to receive(:debug).with('<password>')
      plugin.logger.send(:debug, plugin.api_key.to_s)
    end
  end
end