class Status < ActiveRecord::Base

  def self.new_delayed_job
    status = Status.new
    status.state = "testing"
    status.desc = "delayed_job status"
    status.save!
    if Rails.env.development?
      status.run_delayed_job
    else
      status.delay.run_delayed_job
    end
    status.wait
    status
  end

  def result
    if state == 'complete'
      "[OK]"
    else
      "ERROR"
    end
  end

  def run_delayed_job
    self.state = 'complete'
    self.save!
  end

  def wait
    start = Time.zone.now
    loop do
      reload
      break if state == 'complete' || Time.zone.now - start > 10.seconds
      # break if state == 'complete' || Time.zone.now - start > 3.seconds
      sleep(1.0/10.0)
    end
  end

end
