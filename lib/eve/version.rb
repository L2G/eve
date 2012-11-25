module Eve
  module Version
    MAJOR, MINOR, PATCH, PRE = 3, 0, 0, 'a1'
    STRING = [MAJOR, MINOR, PATCH, PRE].join('.')
  end
  
  VERSION = Version::STRING
end
