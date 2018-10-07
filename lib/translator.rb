require "yaml"


def load_library(name)
  data = YAML.load_file(name)
  new_hash = {}
  emoticon_use = {}
  meaning_use = {}
  data.each do |english, emoticons|
   emoticon_use[emoticons[0]] = emoticons[1]
   meaning_use[emoticons[1]] = english
  end
  new_hash["get_emoticon"] = emoticon_use
  new_hash["get_meaning"] = meaning_use
  new_hash
end

def get_japanese_emoticon(path, emoticon)
    data = YAML.load_file(path)
    new_hash = load_library(path)
    if new_hash["get_emoticon"][emoticon] == nil
      return "Sorry, that emoticon was not found"
    else
      return new_hash["get_emoticon"][emoticon]
end
end

def get_english_meaning(path, emoticon)
  data = YAML.load_file(path)
  new_hash = load_library(path)
  if new_hash["get_meaning"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  else
    return new_hash["get_meaning"][emoticon]
end
end
