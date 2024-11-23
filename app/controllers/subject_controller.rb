class SubjectController < ApplicationController
  def index
    @subjects = Subject.all
  end
end
