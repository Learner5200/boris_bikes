require "boris_bikes"

describe Bike do

  context "users can report bike status" do
    it "can report bike as working" do
      subject.working = true
      expect(subject.working).to eq(true)
    end
    it "can report bike as not working" do
      subject.working = false
      expect(subject.working).to eq(false)
    end
  end

end
