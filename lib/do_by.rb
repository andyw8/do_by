require "do_by/version"

module DoBy
  class Checker
    def self.invoke
      new.invoke
    end

    def invoke
      Dir.glob("**/*").each do |path|
        next if File.directory?(path)
        File.open(path).each_line.with_index do |line, line_no|
          # TODO 20140531 make this more efficient
          parse(path, line, line_no + 1)
        end
      end
    end

    def parse(path, line, line_no)
      return if ENV['DO_BY_TESTING']
      return unless line.match('TODO')
      matches = line.match('TODO (\d{8}) (.*)')
      unless matches
        Kernel.abort("#{path}:#{line_no} No due by date detected in TODO comment")
      end
      date_portion = matches[1]
      comment = matches[2]
      parsed_date = DateTime.parse date_portion
      if parsed_date < Time.now
        message = "Expired TODO: #{comment} (#{date_portion})"
        Kernel.abort(message)
      end
    end
  end
end
