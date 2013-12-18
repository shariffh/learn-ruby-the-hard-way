require 'test/unit'
require_relative '../lib/ex49'

class ParserTests < Test::Unit::TestCase

  Pair = Lexicon::Pair
  
    def test_peek()
      assert_equal(Parser.peek([ Pair.new(:noun, 'bear'), Pair.new(:verb, 'eat') ]), :noun)
      assert_equal(Parser.peek([ Pair.new(:verb, 'bear'), Pair.new(:noun, 'eat') ]), :verb)
   end
   
   def test_match()
      assert_equal(Parser.match( [ Pair.new(:noun, 'bear'), Pair.new(:verb, 'eat') ], :noun),
                   Pair.new(:noun, 'bear') )
      assert_equal(Parser.match( [ Pair.new(:verb, 'eat'), Pair.new(:noun, 'bear') ], :verb),
                   Pair.new(:verb, 'eat') )
   end

   def test_skip()
      assert_equal(Parser.skip( [ Pair.new(:noun, 'bear'), Pair.new(:verb, 'eat') ], :stop),
                   nil )
   end
   
   def test_parse_verb()
      assert_equal(Parser.parse_verb([ Pair.new(:verb, 'eat'), Pair.new(:noun, 'bear') ]),
                   Pair.new(:verb, 'eat') )
      assert_raise( ParserError ) { Parser.parse_verb([Pair.new(:noun, 'bear')]) }
   end
   
   def test_parse_object()
      assert_equal(Parser.parse_object([ Pair.new(:noun, 'bear'), Pair.new(:verb, 'eat') ]),
                   Pair.new(:noun, 'bear') )
      assert_raise( ParserError ) { Parser.parse_object([Pair.new(:verb, 'eat')]) }
   end
   
   def test_parse_subject()
      # Princess eat bear
      result1 = Parser.parse_subject([ Pair.new(:verb, 'eat'), Pair.new(:noun, 'bear') ],
                                Pair.new(:noun, 'princess'))
      
      result2 = Sentence.new(Pair.new(:noun, 'princess'),Pair.new(:verb, 'eat'),
                             Pair.new(:noun, 'bear'))
      #assert_equal(result1,result2)
   end

   def test_parse_sentence()
      # Princess eat bear
      result1 = Parser.parse_sentence([Pair.new(:noun, 'princess'),
                                Pair.new(:verb, 'eat'),
                                Pair.new(:noun, 'bear')])
      result2 = Sentence.new(Pair.new(:noun, 'princess'),
                             Pair.new(:verb, 'eat'),
                             Pair.new(:noun, 'bear'))
                             
      #assert_equal(result1,result2)
      
      assert_raise( ParserError ) { Parser.parse_sentence([Pair.new(:verb, 'eat')]) }
      assert_raise( ParserError ) { Parser.parse_sentence([Pair.new(:direction, 'north')]) }
   end

end