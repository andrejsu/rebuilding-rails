# frozen_string_literal: true

require 'rulers'

module BestQuotes
  class Application < Rulers::Application
    $LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'app', 'controllers')
    require 'quotes_controller'
  end
end
