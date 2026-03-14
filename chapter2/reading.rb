# frozen_string_literal: true

def chalkboard_gag(line, repetition)
  repetition.times { |x| puts "#{x}: #{line}"}
end

chalkboard_gag("I will not drive the principles car", 3)
