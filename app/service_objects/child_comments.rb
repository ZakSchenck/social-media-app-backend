class ChildComments
  attr_reader :comment

  def initialize(comment)
    @comment = comment
  end

  def comment_with_replies
    comments = comment.attributes
    child_comments = comment.comments
    comments.merge!(comments: [])

    child_comments.each do |ct|
      comments[:comments] << ct.attributes
    end
    comments
  end
end
