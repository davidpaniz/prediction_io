module PredictionIO
  CONFIG_PATH = File.
    expand_path("../support", __FILE__)

  Logger = Object.new
  def Logger.error(n); @n = n; end
  def Logger.read; @n; end
end

require 'active_resource/http_mock'
require 'prediction_io/configurator'

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
end

class PredictionIO::FakeAsync
  def self.async(payload, &job)
    yield(payload)
  end

  def worker(payload, &job)
    payload.call(job.call)
  end

end

RSpec::Matchers.define(:be_rescued){ |e|
  match { |a| a === :rescued }
}
