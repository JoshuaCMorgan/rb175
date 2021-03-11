# advice.rb

class Advice
  def initialize
    @advice_list = [
      "Call out to God, and then you will understand everything better.",
      "I have found the paradox, that if you die unto your self, you will find life.",
      "What we think, we become.",
      "Love all, trust God, do wrong to none.",
      "Oh, my friend, it's not what they take away from you that counts. It's what you do with what you have left.",
      "Lost time is never found again.",
      "Nothing will work unless you do."
    ]
  end

  def generate
    @advice_list.sample
  end
end