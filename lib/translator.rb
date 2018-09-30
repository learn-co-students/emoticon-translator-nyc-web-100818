require "yaml"
require "pry"

def load_library(lib)
  emoticons = YAML.load_file(lib) 
  new_lib = {"get_emoticon" => {}, "get_meaning" => {}}
  
  emoticons.each do |word, sym|
    new_lib["get_emoticon"][sym.first] = sym.last 
    new_lib["get_meaning"][sym.last] = word
  end 
 new_lib
end

def get_japanese_emoticon(lib, message)
  library = load_library(lib)
  sym = library["get_emoticon"][message]
  return "Sorry, that emoticon was not found" if sym.nil?
  sym
end

def get_english_meaning(lib, message)
  library = load_library(lib)
  sym = library["get_meaning"][message]
  return "Sorry, that emoticon was not found" if sym.nil?
  sym
end
