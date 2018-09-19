# require modules here
require "yaml"

def load_library(path)
  library = YAML.load_file(path)
  lib_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  library.each{|key,values|
    lib_hash["get_meaning"][values[1]] = key
    lib_hash["get_emoticon"][values[0]] = values[1]
  }
  lib_hash
end

def get_japanese_emoticon(path, emoticon)
  lib_hash = load_library(path)
  if lib_hash["get_emoticon"][emoticon]
    lib_hash["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  lib_hash = load_library(path)
  if lib_hash["get_meaning"][emoticon]
    lib_hash["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
