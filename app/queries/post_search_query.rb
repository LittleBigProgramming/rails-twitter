class PostSearchQuery
  def initialize(term:)
    @term = term
  end

  def to_relation
    Post
      .joins("LEFT JOIN text_posts ON content_type = 'TextPost' AND content_id = text_posts.id")
      .where('text_posts.body LIKE ?', "%#{term}%")
  end

  private

  attr_reader :term
end