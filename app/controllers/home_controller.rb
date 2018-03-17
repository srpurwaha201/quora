class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @questions = Question.all
    @questions = @questions.sort_by{ |obj| obj.created_at }.reverse
  end
end
