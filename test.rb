def test(day)
  require "./#{day}/code"
  require "./#{day}/test"
  actual = main input
  if actual == expected
    puts 'PASSED'
  else
    puts "FAILED: Expected #{expected} but received #{actual}"
  end
end
