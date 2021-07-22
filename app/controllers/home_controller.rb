class HomeController < ApplicationController
  def index
    @users = User.all
    # @works = Work.all
    # user = User.find(1)
    # @works = user.works
    @works = Work.find("2021-01-01")
  end
end
