class MonitWeb < Rack::Proxy

  def rewrite_env(env)
    env["HTTP_HOST"] = "localhost:2812"
    # env["REQUEST_PATH"] = '/_runtime'
    env["PATH_INFO"] = "/#{env['action_dispatch.request.parameters']['other']}"
    # env["REQUEST_URI"] = '/_runtime'
    env.each {|key, value| puts "#{key}=#{value}"}
    # puts env.inspect

    env
  end

  def rewrite_response(triplet)
    status, headers, body = triplet

    # headers["X-Foo"] = "Bar"

    triplet
  end

end