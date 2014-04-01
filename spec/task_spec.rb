require 'spec_helper'

describe Task do
  it { should validate_presence_of :task }
  it { should validate_uniqueness_of(:task) }
  it { should ensure_length_of(:task).is_at_least(2) }
end


