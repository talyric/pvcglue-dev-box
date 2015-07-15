class MonitController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @result = MonitWeb.new.call(request.env)
    # puts request.env.inspect
    # render :status => 200, :content_type => @result[1]["content-type"], :layout => false, :text => @result[2]
    text = @result[2].to_s
    # text.gsub!(/href='/, "/href='monit/")
    render :status => 200, :layout => false, :text => text
  end
end
