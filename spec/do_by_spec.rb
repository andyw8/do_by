require 'do_by'

describe DoBy::Note do
  before do
    allow(Time).to receive(:now) { DateTime.parse('20140601') }
  end

  it "is happy with a note with a date in the future" do
    scan '# TODO 20140701 with date'
  end

  it "is not happy with a note with a date in the past" do
    expect do
      scan '# TODO 20140501 with date'
    end.to exit_with_code(1)
  end

  it "is not happy with a note without a date" do
    expect do
      scan '# TODO without date'
    end.to exit_with_code(1)
  end

  private

  def scan(line)
    DoBy::Note.parse line
  end
end

# http://stackoverflow.com/questions/1480537/how-can-i-validate-exits-and-aborts-in-rspec
RSpec::Matchers.define :exit_with_code do |exp_code|
  actual = nil
  match do |block|
    begin
      block.call
    rescue SystemExit => e
      actual = e.status
    end
    actual and actual == exp_code
  end
  failure_message do |block|
    "expected block to call exit(#{exp_code}) but exit" +
      (actual.nil? ? " not called" : "(#{actual}) was called")
  end
  failure_message_when_negated do |block|
    "expected block not to call exit(#{exp_code})"
  end
  description do
    "expect block to call exit(#{exp_code})"
  end
end
