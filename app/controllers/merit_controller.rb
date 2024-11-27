class MeritsController < ApplicationController
  def index
    @merits = Merit.all
  end
end
