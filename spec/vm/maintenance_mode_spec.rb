require 'rails_helper'
require 'vm_helper'

=begin
Commands:
  pvc b -s, --stage=STAGE                       # enable or disable maintenance mode bypass for dev...
  pvc bypass -s, --stage=STAGE                  # enable or disable maintenance mode bypass for dev...
  pvc m -s, --stage=STAGE                       # enable or disable maintenance mode
  pvc maint -s, --stage=STAGE                   # enable or disable maintenance mode
  pvc maintenance -s, --stage=STAGE             # enable or disable maintenance mode
=end

RSpec.describe 'maintenance mode', type: :model do
  before(:each) do
    `pvc vmtest m off`
    raise 'Error disabling maintenance mode' unless $?.exitstatus == 0
    `pvc vmtest b on`
    raise 'Error disabling maintenance mode' unless $?.exitstatus == 0

  end

  after(:all) do
    `pvc vmtest m off`
    raise 'Error disabling maintenance mode' unless $?.exitstatus == 0
  end

  it "from developer ip" do
    response = HTTParty.get(app_host)
    expect(response.code).to eq 200

    out = `pvc vmtest m on`
    expect($?.exitstatus).to eq 0
    # expect(out).to match /Commands:/

    response = HTTParty.get(app_host)
    expect(response.code).to eq 200

    out = `pvc vmtest b off`
    expect($?.exitstatus).to eq 0
    # expect(out).to match /Commands:/

    response = HTTParty.get(app_host)
    expect(response.code).to eq 503
    expect(response.body).to match /-Maintenance Mode-/
  end

  it "should show db help" do
    out = `pvc db`
    expect($?.exitstatus).to eq 0
    expect(out).to match /Commands:/
  end

  it "should show env help" do
    out = `pvc vmtest env`
    expect($?.exitstatus).to eq 0
    expect(out).to match /Commands:/
  end

  it "should show ssl help" do
    out = `pvc vmtest ssl`
    expect($?.exitstatus).to eq 0
    expect(out).to match /Commands:/
  end

  it "should show version" do
    out = `pvc version`
    expect($?.exitstatus).to eq 0
    expect(out).to match /#{Pvcglue::VERSION}/
  end

  it "should show info" do
    out = `pvc info`
    expect($?.exitstatus).to eq 0
    expect(out).to match /Manager settings/
  end

  it "should show manager info" do
    out = `pvc manager show`
    expect($?.exitstatus).to eq 0
    expect(out).to match /"pvcglue_dev_box"/
  end



end