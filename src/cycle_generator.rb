require 'logger'
require 'statsd-instrument'

class CycleGenerator

  MAX_DURATION = 20.0 # seconds

  attr_reader :logger

  def initialize
    @prng = Random.new
    @total_cycles = 0
    @logger = Logger.new(STDOUT)
  end

  def random_duration
    @prng.rand(MAX_DURATION)
  end

  def cycle
    @total_cycles += 1
    duration = random_duration
    # Docker does not capture stdout, so use stderr instead
    STDERR.puts "Cycle #{@total_cycles}, runtime: #{duration}"
    sleep duration
  end

  def run
    while true
      StatsD.measure('cycle_runtime') do
        cycle
      end
      StatsD.increment('cycles_total')
    end
  end

  def self.run
    self.new.run
  end
end
