require 'pry'
require 'yaml'

def load_library(library)
  library = YAML.load_file('./lib/emoticons.yml')
  new_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
    }
    library.each do |meaning, emoticons|
       new_hash["get_meaning"][emoticons[1]] = meaning #japanese  {"get_meaning"=>{"☜(⌒▽⌒)☞"=>"angel"}
       new_hash["get_emoticon"][emoticons[0]] = emoticons[1] #english  "get_emoticon"=>{"O:)"=>"☜(⌒▽⌒)☞"}
     end
  new_hash
end


def get_japanese_emoticon(file_path, emoticon)
  new_path = load_library(file_path)
 if new_path["get_emoticon"][emoticon]
    new_path["get_emoticon"][emoticon]
    new_path["get_emoticon"][emoticon]
  else
      return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  new_path = load_library(file_path)
  if new_path["get_meaning"][emoticon]
     new_path["get_meaning"][emoticon]
     new_path["get_meaning"][emoticon]
   else
       return "Sorry, that emoticon was not found"
   end
end

#nil https://lukaszwrobel.pl/blog/ruby-is-nil/
