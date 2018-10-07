# require modules here
require 'yaml'

def load_library(filepath)
  # code goes here
  emoticons = YAML.load_file(filepath)
  translate = { "get_meaning" => {}, "get_emoticon" => {} } 
  emoticons.each do |meaning, emoticon|
    translate["get_meaning"][emoticon[1]] = meaning 
    translate["get_emoticon"][emoticon[0]] = emoticon[1] 
  end 
  translate
end

def get_japanese_emoticon (file, emoticon)
  # code goes here
  translate = load_library(file)
  if translate["get_emoticon"].has_key?(emoticon)
    japanese_emoticon = translate["get_emoticon"][emoticon]
  else 
    japanese_emoticon = "Sorry, that emoticon was not found" 
  end 
  japanese_emoticon
end

def get_english_meaning(file, emoticon)
  # code goes here
  translate = load_library(file)
  if translate["get_meaning"].has_key?(emoticon)
    english_emoticon = translate["get_meaning"][emoticon]
  else 
    english_emoticon = "Sorry, that emoticon was not found"
  end 
  english_emoticon
end