def convert_string(string)
  conversion_chart = { "n"=>"ん","a"=>"あ","i"=>"い","u"=>"う","e"=>"え","o"=>"お", "ka"=>"か","ki"=>"き","ku"=>"く","ke"=>"け","ko"=>"こ","sa"=>"さ","su"=>"す","se"=>"せ","so"=>"そ","ta"=>"た","te"=>"て","to"=>"と","na"=>"な","ni"=>"に","nu"=>"ぬ","ne"=>"ね","no"=>"の","ha"=>"は","hi"=>"ひ","fu"=>"ふ","he"=>"へ","ho"=>"ほ","ma"=>"ま","mi"=>"み","mu"=>"む","me"=>"め","mo"=>"も","ya"=>"や","yu"=>"ゆ","yo"=>"よ","ra"=>"ら","ri"=>"り","ru"=>"る","re"=>"れ","ro"=>"ろ","wa"=>"わ","wi"=>"ゐ","we"=>"ゑ","wo"=>"を","ga"=>"が","gi"=>"ぎ","gu"=>"ぐ","ge"=>"げ","go"=>"ご","za"=>"ざ","ji"=>"じ","zu"=>"ず","ze"=>"ぜ","zo"=>"ぞ","da"=>"だ","di"=>"ぢ","du"=>"づ","de"=>"で","do"=>"ど","ba"=>"ば","bi"=>"び","bu"=>"ぶ","be"=>"べ","bo"=>"ぼ","pa"=>"ぱ","pi"=>"ぴ","pu"=>"ぷ","pe"=>"ぺ","po"=>"ぽ", "shi"=>"し","chi"=>"ち","tsu"=>"つ", " "=>" "}
  current_character = 0
  converted_string = ""
  broken_character_array = string.scan(/.{1}/)
  while current_character < broken_character_array.length
    character = broken_character_array[current_character]
    double_character = broken_character_array[current_character + 1] ? character + broken_character_array[current_character + 1] : nil
    triple_character = broken_character_array[current_character + 2] ? double_character + broken_character_array[current_character +2] : nil
    if conversion_chart.key?(double_character)
      converted_string += conversion_chart[double_character]
      current_character += 2
    elsif conversion_chart.key?(character)
      converted_string += conversion_chart[character]
      current_character += 1
    elsif conversion_chart.key?(triple_character)
      converted_string += conversion_chart[triple_character]
      current_character += 3
    else
      converted_string = "Failed on character #{character} at position #{current_character}"
      break
    end
  end
  return converted_string
end
