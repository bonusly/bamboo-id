require "spec_helper"

RSpec.describe BambooId do
  it "has a version number" do
    expect(BambooId::VERSION).not_to be nil
  end
end
