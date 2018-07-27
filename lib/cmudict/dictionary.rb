# encoding: UTF-8

require 'singleton'

module CMUDict

  class Dictionary
    include Singleton
    private_class_method :new

    def phonemes(word)
      @words[word.upcase.to_sym] || ''
    end

    protected

    def initialize
      @words = {}
      load
    end

    def load
      source = File.join(File.dirname(__dir__), 'dict', 'cmudict-0.7b')
      pp source
      File.foreach(source, encoding: 'utf-8') do |line|
        next if line[0] == ';'
        word, *phonemes = line.encode('UTF-8', invalid: :replace).split
        word = word[0..-4] if word.match?(/\(\d\)/)
        @words[word.to_sym] ||= []
        @words[word.to_sym] << phonemes
      end
    end
  end

end
