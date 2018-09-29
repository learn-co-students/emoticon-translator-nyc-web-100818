# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  final_hash = {
    "get_meaning"=>{}, # this key does not change
    "get_emoticon"=>{} # this key does not change
  }
  emoticons = YAML.load_file('./lib/emoticons.yml')
    emoticons.each do |name, emoticon_array| # add key value pairs as you iterate
      final_hash["get_meaning"][emoticon_array[1]] = name
      final_hash["get_emoticon"][emoticon_array[0]] = emoticon_array[1]
    end

  final_hash
end


def get_japanese_emoticon(file_path, emoticon) # emoticon is the english symbol
  # call on load_library & capture value in a variable so we can iterate over it
  final_hash = load_library(file_path)
  final_hash.each do |get, emoji_hash| # iterate over final_hash
    emoji_hash.each do |symbol, name|
      if final_hash["get_emoticon"].keys.include?(emoticon)
        return final_hash["get_emoticon"][emoticon] # return japanese symbol
      else
        return "Sorry, that emoticon was not found" # otherwise do this and stop
      end
    end
  end
end

def get_english_meaning(file_path, emoticon) # now emoticon is the japanese one
  final_hash = load_library(file_path)
  final_hash.each do |get, emoji_hash|
    emoji_hash.each do |symbol, name|
      if final_hash["get_meaning"].keys.include?(emoticon)
        return final_hash["get_meaning"][emoticon]
      else
        return "Sorry, that emoticon was not found"
      end
    end
  end
end
