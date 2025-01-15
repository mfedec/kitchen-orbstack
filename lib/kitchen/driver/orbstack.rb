# frozen_string_literal: true

require 'kitchen'
require 'json'

module Kitchen
  module Driver
    # Orbstack driver for Kitchen.

    class Orbstack < Kitchen::Driver::Base
      kitchen_driver_api_version 2

      default_config :username, "root"
      default_config :port, "22"

      def create(state)
        debug(instance.to_str)
        run_command("orbctl create -a arm64 ubuntu:jammy #{instance.name}")
        state[:hostname] = "#{orb_config['name']}@orb"
        state[:port] = 22
        # state[:username] = 'kitchen-1'
        # instance.transport.connection(state).wait_until_ready
        info("Orbstack instance created.")
      end

      def destroy(state)
        return if state[:hostname].nil?

        run_command("orbctl delete -f #{instance.name}")
        # info("Orbstack instance #{} destroyed.")
        state.delete(:hostname)
      end

      def orb_config
        json = run_command("orbctl info kitchen-1 -f json", {live_stream: nil})
        JSON.parse(json)
      end
    end
  end
end

## ssh kitchen-1@orb
## 