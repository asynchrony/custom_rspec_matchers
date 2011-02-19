class DbRatingMatcher
  def initialize(rating)
    @rating = rating
  end

  def matches?(query)
    @query_rating = rating(query)
    @query_rating > @rating
  end

  def description
    "have rating greater than 75. Is #{@query_rating}."
  end

  def failure_message
    " #{@query_rating} is low. Try to make it greater than #{@rating}"
  end

  def rating(query)
    collection_size = query.collection.count
    return 100 if collection_size <= 1
    explanation = query.explain
    0 if collection_size > 1 && !explanation['indexBounds'].nil? && explanation['indexBounds'].empty?
    convert(explanation['nscanned']/collection_size) + 50*(explanation['n']/explanation['nscanned'])
  end

  def convert(ratio)
    ((ratio * -100) + 100) / 2
  end

end

def have_high_rating
  DbRatingMatcher.new(75)
end