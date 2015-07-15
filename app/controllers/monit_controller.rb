class MonitController < ApplicationController
  def index
    @result = MonitWeb.new.call(request.env)
    # puts request.env.inspect
    # render :status => 200, :content_type => @result[1]["content-type"], :layout => false, :text => @result[2]
    render :status => 200, :layout => false, :text => @result[2]
  end
end
