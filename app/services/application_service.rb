# frozen_string_literal: true

# Service base class
class ApplicationService
  class << self
    # -- class methods

    def call(*args)
      logger.tagged(to_s) do
        new(*args).call
      end
    end

    def logger
      Rails.logger
    end

    # -- private class methods

    private
  end

  # -- instance methods

  def call(*args)
    raise 'Must be overridden'
  end

  # -- private instance methods

  private

  def logger
    self.class.logger
  end

  def suppress_exception
    yield
  rescue StandardError => e
    logger.error("#{e.class.name}\n#{e}\n#{e.backtrace.join("\n")}")
  end
end
