class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @questions = []
    @upvoted = []
    current_user.followees.each do |followee|
      @questions = @questions + Question.where(:user_id => followee)
      user = User.find(followee)
      upvoted = user.find_up_voted_items
      if upvoted
        @upvoted.push({upvotee: user, items: upvoted})
      end
    end
    @questions = @questions+Question.where(:user_id => current_user.id)
    @questions = @questions.sort_by{ |obj| obj.created_at }.reverse
    # @upvoted = @upvoted.sort_by{ |obj| obj.created_at }.reverse
  end
end
