# frozen_string_literal: true

require_relative "command"

module Services
  class Log
    extend Command

    LOG_FILE = "tmp/app.log"

    def initialize(message:)
      @message = message
    end

    def run
      File.write(LOG_FILE, log_line, mode: "a+")
    end

    private

    attr_reader :message

    def log_line
      "#{DateTime.now.strftime('%FT%T')}: #{message} \n"
    end
  end
end
