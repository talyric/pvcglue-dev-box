require 'rails_helper'
require 'vm_helper'

=begin
Commands:
  pvc b -s, --stage=STAGE                       # enable or disable maintenance mode bypass for dev...
  pvc bootstrap -s, --stage=STAGE               # bootstrap...
  pvc build -s, --stage=STAGE                   # build...
  pvc bypass -s, --stage=STAGE                  # enable or disable maintenance mode bypass for dev...
  pvc c -s, --stage=STAGE                       # shortcut for console
  pvc console -s, --stage=STAGE                 # open rails console
  pvc db SUBCOMMAND ...ARGS                     # db utils
  pvc deploy -s, --stage=STAGE                  # deploy the app
  pvc destroy -s, --stage=STAGE                 # destory local virtual machines
  pvc env SUBCOMMAND ...ARGS -s, --stage=STAGE  # manage stage environment
  pvc help [COMMAND]                            # Describe available commands or one specific command
  pvc info                                      # show the pvcglue version and cloud settings
  pvc kill -s, --stage=STAGE                    # force shutdown (power off) local virtual machines...
  pvc m -s, --stage=STAGE                       # enable or disable maintenance mode
  pvc maint -s, --stage=STAGE                   # enable or disable maintenance mode
  pvc maintenance -s, --stage=STAGE             # enable or disable maintenance mode
  pvc manager SUBCOMMAND ...ARGS                # manage manager
  pvc pvcify -s, --stage=STAGE                  # update capistrano, database.yml and other configu...
  pvc rake -s, --stage=STAGE                    # run rake task on remote stage
  pvc rebuild -s, --stage=STAGE                 # destroy, build and start local virtual machines
  pvc restart -s, --stage=STAGE                 # stop and then start local virtual machines
  pvc s -s, --stage=STAGE                       # shell
  pvc sh -s, --stage=STAGE                      # run interactive shell on node
  pvc show                                      # show the pvcglue version and cloud settings
  pvc ssl SUBCOMMAND ...ARGS -s, --stage=STAGE  # manage ssl certificates
  pvc start -s, --stage=STAGE                   # start local virtual machines (build first, if req...
  pvc status -s, --stage=STAGE                  # show status of local virtual machines
  pvc stop -s, --stage=STAGE                    # shut down local virtual machines
  pvc suspend -s, --stage=STAGE                 # suspend local virtual machines
  pvc up -s, --stage=STAGE                      # start; bootstrap; pvcify; build; deploy
  pvc update_config -s, --stage=STAGE           # debug use
  pvc version                                   # show the version of PVC...
=end

RSpec.describe 'cli', type: :model do

  it "should show main help" do
    out = `pvc`
    expect($?.exitstatus).to eq 0
    expect(out).to match /Commands:/
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