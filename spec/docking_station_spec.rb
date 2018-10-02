require "boris_bikes"
describe DockingStation do
  it { should respond_to :release_bike }
  it "releases working bikes" do
    expect(subject.release_bike).to be_working
  end
end
