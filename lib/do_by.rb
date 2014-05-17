require "do_by/version"

module DoBy
  class LateTask < RuntimeError
  end

  class Note
    def initialize(description, date = nil)
      message = description + " is overdue"
      if date
        parsed_date = DateTime.parse date
        if parsed_date < Time.now
          message += " (#{date})"
          raise LateTask.new(message)
        end
      end
    end
  end
end

def TODO(*args)
  DoBy::Note.new(*args)
end
