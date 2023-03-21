# frozen_string_literal: true

require "rulers/version"
require "rulers/routing"

module Rulers
  class Application
    def call(env)
      return [404, { "Content-Type" => "text/html" }, []] if env["PATH_INFO"] == "/favicon.ico"

      klass, action = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.public_send(action)

      [200, { "Content-Type" => "text/html" }, [text]]
    end
  end

  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end
  end
end
