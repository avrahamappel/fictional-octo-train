def run(day)
  require "./#{day}/code"
  input = File.read("./#{day}/input.txt")
  puts main input
end
