class Lexicon


  Pair = Struct.new(:token,:word)
  

  def initialize

    @directions = %w[north south east west down up left right back]
    @verbs = %w[go stop kill eat]
    @stops = %w[the in of from at it]
    @nouns = %w[door bear princess cabinet]
    @numbers = "[0-9]+"
  
  end

  def prompt_user 
    print "> "
    user_selection = gets        # get input
    user_selection ||= ''        # set to empty string if nil
    user_selection.chomp!        # remove trailing newline  
  
    user_selection

  end

  def scan(input)
  
    sentence = []
    
    words = input.split()

    words.each do |word|

      word_d = word.downcase

    if @directions.include? word_d
       sentence.push(Pair.new(:direction,word))
    elsif @verbs.include? word_d
      sentence.push(Pair.new(:verb,word))
    elsif @stops.include? word_d
     sentence.push(Pair.new(:stop,word))
    elsif @nouns.include? word_d
     sentence.push(Pair.new(:noun,word))
    elsif word.match(@numbers)
     sentence.push(Pair.new(:number,word.to_i))
    else
     sentence.push(Pair.new(:error,word))
    end
   end

    puts sentence

  end

end

stuff = Lexicon.new()
stuff_input = stuff.prompt_user
stuff.scan(stuff_input)