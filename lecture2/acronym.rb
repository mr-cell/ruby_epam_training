# frozen_string_literal: true

# Acronym class
class Acronym
  def self.abbreviate(phrase)
    phrase_split = phrase
      .split(/[\s|\-]/)
      .reject { |e| e.empty? }
      .map { |e| e[0].upcase() }
      .join('')
  end
end
