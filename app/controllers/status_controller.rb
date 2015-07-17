class StatusController < ApplicationController
  def dj
    @status = Status.new_delayed_job
  end

  def resque
    @status = Status.new_resque_job
  end
end
