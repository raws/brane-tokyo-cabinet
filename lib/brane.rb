require 'oklahoma_mixer'

class Brane
  attr_reader :db

  def initialize(path = 'brane.tcb')
    path = File.expand_path(path.sub(/\.[^\.]*$/, '.tcb'))
    @db = OklahomaMixer.open(path)
  end

  def add(text)
    text.split(/\b[!?\.]+\s*/).each do |sentence|
      sentence.split(/\s+/).map do |word|
        normalize_word(word)
      end.tap do |words|
        return if words.length < 3
        db.store('global:start', words.first, :dup)
        db.store('global:end', words.last, :dup)
      end.each_cons(3) do |before, current, after|
        current.downcase!
        db.store("before:#{current}", before, :dup)
        db.store("after:#{current}", after, :dup)
      end
    end
  end

  def sentence(seed = random_word)
    sentence = [seed]

    while !starter?(sentence.first)
      if (words = db.values("before:#{sentence.first.downcase}")) && !words.empty?
        sentence.unshift(least_common(words))
      else
        break
      end
    end

    while !terminator?(sentence.last)
      if (words = db.values("after:#{sentence.last.downcase}")) && !words.empty?
        sentence.push(least_common(words))
      else
        break
      end
    end

    sentence.join ' '
  end

  def size
    db.keys(prefix: 'after:').size
  end

  def sleep
    db.flush
    db.close
  end

  private
    def normalize_word(word)
      word.gsub '"', ''
    end

    def random_word
      db.keys(prefix: 'after:').sample.slice 6..-1
    end

    def starter?(word)
      db.values('global:start').include? word.downcase
    end

    def terminator?(word)
      db.values('global:end').include? word.downcase
    end

    def frequencies(words)
      hash = Hash.new { |hash, key| hash[key] = 0 }

      words.each_with_object(hash) do |word, hash|
        hash[word] += 1
      end
    end

    def least_common(words)
      frequencies(words).min_by { |word, freq| freq }.first
    end
end
