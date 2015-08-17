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

  it "from developer ip" do
    out = `pvc vmtest m off`
    expect($?.exitstatus).to eq 0

    out = `pvc vmtest b on`
    expect($?.exitstatus).to eq 0

    # Should not be in maintenance_mode
    response = HTTParty.get(app_host)
    # puts response.body, response.code, response.message, response.headers.inspect
    expect(response.code).to eq 200
    # expect(response.body).to match /The list below shows an overview of the jobs in the delayed_job queue/

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