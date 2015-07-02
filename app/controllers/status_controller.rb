class StatusController < ApplicationController
  def dj
    @status = Status.new_delayed_job
  end

  def resque
  end
end
