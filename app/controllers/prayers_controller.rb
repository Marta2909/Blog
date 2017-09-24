class PrayersController < ApplicationController
  def index
    @prayers = Prayer.all
  end

  def count
    @count = Prayer.count
    @new_count = Prayer.count + 1
  end
end
