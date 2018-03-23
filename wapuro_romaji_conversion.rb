def split_string(string)
  character_array = string.scan(/.{1}/)
  return character_array
end

def test_first_char(tracker,split_array)
  results = {}
  single_conversion = { 'n'=>"ん",'a'=>"あ",'i'=>"い",'u'=>"う",'e'=>"え",'o'=>"お"}
  first_chars = ["a","c","b","d","e","f","g","h","i","j","k","m","n","o","p","r","s","t","u","w","y","z"]
  char = split_array[tracker]
  if first_chars.include?(char)
    if single_conversion.key?(char) && char != "n"
      results[:converted_character] = single_conversion[char]
      results[:completed_characters] = 1
      puts results
    else
      results = multi_char(tracker,split_array)
    end
  elsif char == " "
    results[:converted_character] = char
    results[:completed_characters] = 1
  else
    results[:failure] = "Failure on #{char}"
  end
  return results
end

def multi_char(tracker,split_array)
  results = {}

  double_conversion = { "ka"=>"か","ki"=>"き","ku"=>"く","ke"=>"け","ko"=>"こ","sa"=>"さ","su"=>"す","se"=>"せ","so"=>"そ","ta"=>"た","te"=>"て","to"=>"と","na"=>"な","ni"=>"に","nu"=>"ぬ","ne"=>"ね","no"=>"の","ha"=>"は","hi"=>"ひ","fu"=>"ふ","he"=>"へ","ho"=>"ほ","ma"=>"ま","mi"=>"み","mu"=>"む","me"=>"め","mo"=>"も","ya"=>"や","yu"=>"ゆ","yo"=>"よ","ra"=>"ら","ri"=>"り","ru"=>"る","re"=>"れ","ro"=>"ろ","wa"=>"わ","wi"=>"ゐ","we"=>"ゑ","wo"=>"を","ga"=>"が","gi"=>"ぎ","gu"=>"ぐ","ge"=>"げ","go"=>"ご","za"=>"ざ","ji"=>"じ","zu"=>"ず","ze"=>"ぜ","zo"=>"ぞ","da"=>"だ","di"=>"ぢ","du"=>"づ","de"=>"で","do"=>"ど","ba"=>"ば","bi"=>"び","bu"=>"ぶ","be"=>"べ","bo"=>"ぼ","pa"=>"ぱ","pi"=>"ぴ","pu"=>"ぷ","pe"=>"ぺ","po"=>"ぽ" }

  triple_conversion = {"shi"=>"し","chi"=>"ち","tsu"=>"つ"}

  char = split_array[tracker]
  second_char = split_array[tracker + 1]
  double_char = char + second_char
  if double_conversion.key?(double_char)
    results[:converted_character] = double_conversion[double_char]
    results[:completed_characters] = 2
  elsif second_char == "h" || second_char == "s"
    third_char = split_array[tracker + 2]
    triple_char = double_char + third_char
    if triple_conversion.key?(triple_char)
      results[:converted_character] = double_conversion[triple_char]
      results[:completed_characters] = 2
    else
      results[:failure] = "Failure on #{triple_char}"
    end
  else
    results[:failure] = "Failure on #{double_char}"
  end

  return results
end

def assess_array(string)
  tracker = 0
  return_string = ""

  split_array = split_string(string)

  romanji_length = split_array.length

  while tracker < romanji_length
    results = test_first_char(tracker, split_array)
    if results[:failure]
      return_string = results[:failure]
      break
    end
    return_string += results[:converted_character]
    tracker += results[:completed_characters]
  end

  return return_string
end
