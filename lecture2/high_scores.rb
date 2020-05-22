# frozen_string_literal: true

# class HighScores
class HighScores
  attr_reader :scores

  def initialize(scores)
    @scores = scores
  end

  def latest
    @scores.last
  end

  def personal_best
    @scores.max
  end

  def personal_top_three
    @scores
      .sort
      .reverse
      .take(3)
  end
end