require 'rails_helper'
require 'vm_helper'

RSpec.describe "application", type: :model do
  # it "should do ALL_THE_THINGS" do
  #   # not working for the "test" stage yet, due to a db issue
  #   # expect(system("pvc test start")).to eq true
  #   # expect(system("pvc manager bootstrap")).to eq true
  #   # expect(system("pvc test bootstrap")).to eq true
  #   # expect(system("pvc test pvcify")).to eq true
  #   # expect(system("pvc test build")).to eq true
  #   # expect(system("pvc test deploy")).to eq true
  # end

  # it "do it on local" do
  #   # expect(system("pvc local start")).to eq true
  #   # expect(system("pvc manager bootstrap")).to eq true
  #   # expect(system("pvc manager push")).to eq true
  #   # expect(system("pvc local bootstrap")).to eq true
  #   # expect(system("pvc local pvcify")).to eq true
  #   # expect(system("pvc local build")).to eq true
  #   # expect(system("pvc local deploy")).to eq true
  #   # expect(system("pvc local destroy")).to eq true
  # end

  it "should successfully connect to the app" do
    response = HTTParty.get(app_host)
    expect(response.code).to eq 200
  end

  it "should successfully run delayed_jobs" do
    response = HTTParty.get(app_host('status/dj'))
    expect(response.code).to eq 200
    expect(response.body).to match /-OK-/
  end

  it "should successfully run resque jobs" do
    response = HTTParty.get(app_host('status/resque'))
    expect(response.code).to eq 200
    expect(response.body).to match /-OK-/
  end

  it "should successfully display monit status page" do
    response = HTTParty.get(app_host('monit/'))
    expect(response.code).to eq 200
    expect(response.body).to match /and monitoring/
  end

  it "should successfully display resque status page" do
    response = HTTParty.get(app_host('resque'))
    expect(response.code).to eq 200
    expect(response.body).to match /0 of 2 Workers Working/
  end

  it "should successfully display delayed_job status page" do
    response = HTTParty.get(app_host('delayed_job/overview'))
    # puts response.body, response.code, response.message, response.headers.inspect
    expect(response.code).to eq 200
    expect(response.body).to match /The list below shows an overview of the jobs in the delayed_job queue/
  end


end