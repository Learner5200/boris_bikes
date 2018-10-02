require "boris_bikes"
describe DockingStation do
  it { should respond_to :release_bike }
  it "get bike and expect working" do
    expect(subject.release_bike).to be_working
  end
end
