require 'rails_helper'

RSpec.describe "main" do
  it "should do ALL_THE_THINGS" do
    # not working for the "test" stage yet, due to a db issue
    # expect(system("pvc test start")).to eq true
    # expect(system("pvc manager bootstrap")).to eq true
    # expect(system("pvc test bootstrap")).to eq true
    # expect(system("pvc test pvcify")).to eq true
    # expect(system("pvc test build")).to eq true
    # expect(system("pvc test deploy")).to eq true
  end

  it "do it on local" do
    expect(system("pvc local start")).to eq true
    expect(system("pvc manager bootstrap")).to eq true
    expect(system("pvc local bootstrap")).to eq true
    expect(system("pvc local pvcify")).to eq true
    expect(system("pvc local build")).to eq true
    expect(system("pvc local deploy")).to eq true
    # expect(system("pvc local destroy")).to eq true
  end
end