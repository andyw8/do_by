require "do_by/version"
require "date"

module DoBy
  class LateTask < RuntimeError; end
  class NoDueDateTask < RuntimeError; end

  class Note
    def initialize(description, date = nil)
      raise NoDueDateTask.new("missing due date") unless date
      if DateTime.parse(date) < Time.now
        raise LateTask.new("#{description} is overdue (#{date})")
      end
    end
  end
end

module Kernel
  def TODO(*args)
    return unless ENV['ENABLE_DO_BY']
    DoBy::Note.new(*args)
  end
  alias_method :FIXME, :TODO
  alias_method :OPTIMIZE, :TODO
end
