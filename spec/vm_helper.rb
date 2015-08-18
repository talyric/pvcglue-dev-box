require "thor"
require "pvcglue/configuration"
require "pvcglue/manager"
require "pvcglue/cloud"
require "pvcglue/packages"
require "orca"
require 'pvcglue'


def app_host(path = '')
  @app_host ||= "http://#{pvc_cloud.domains.first}/#{path}"
end

def pvc_cloud
  @pvc_cloud ||= begin
    puts "+"*80
    raise('Not in local mode!') unless Pvcglue::Manager.local_mode? # Safety first!
    Pvcglue.cloud.set_stage('vmtest')
    raise('Not the correct stage!') unless Pvcglue.cloud.stage_name == 'vmtest' # Safety first!
    Pvcglue.cloud
  end
end