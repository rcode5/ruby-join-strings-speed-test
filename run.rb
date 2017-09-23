#!/usr/bin/env ruby

require 'benchmark'
require 'faker'
require 'byebug'
if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('2.4.0')
  require 'active_support/core_ext/enumerable'
end

class Summer
  def self.plus(s1, s2)
    s1 + s2 + s1
  end

  def self.join(s1,s2)
    [s1, s2, s1].join
  end

  def self.interpolate(s1,s2)
    "#{s1}#{s2}#{s1}"
  end
end


NUM_RUNS = 1000000
s1 = Faker::Lorem.word
s2 = Faker::Lorem.word

expected_value = Summer.plus(s1, s2)

Benchmark.bm do |x|
  %i( plus join interpolate ).each do |method|
    x.report(method) do
      for i in 1..NUM_RUNS
        result = Summer.send(method, s1, s2)
        raise "Your maths are wrong #{result} <=> #{expected_value}" if (result != expected_value)
      end
    end
  end
end
