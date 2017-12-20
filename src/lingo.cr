require "benchmark"
require "./lingo/*"
require "./language/*"

command = ARGV.shift
if command == "lex"
  contents = File.read(ARGV.shift)
  puts "#{ contents }\n" + "-"*10 + "\n"

  puts "Lexing using \"#{ Y86.inspect }\" ruleset\n" + "-"*10 + "\n"
  tokens = [] of Token?

  time = Benchmark.realtime {
    tokens = Y86.lex(contents)
  }

  p tokens

  puts "...took #{ time }"
end