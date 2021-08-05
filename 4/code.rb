def main(*args)
  checkPassports(*args)
end

def checkPassports(passports)
  parsePassports(passports).map { |passport| validatePassport passport }
    .select { |valid| valid }
    .count
end

def parsePassports(passports)
  passports.split("\n\n").map do |fields|
    fields.split(/\s/).compact.reject(&:empty?).map { |field| field.split(':') }
      .to_h
  end
end

def validatePassport(passport)
  fields = '
  byr
  iyr
  eyr
  hgt
  hcl
  ecl
  pid
  '

  fields.split.all? { |field| passport[field] != nil }
end
