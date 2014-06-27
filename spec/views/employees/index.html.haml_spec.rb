
require "rails_helper"

describe "employees/index" do
  it "displays all the employees" do
    assign(:employees, [
      Employee.create!(:name => "slicer", :designation => "math"),
      Employee.create!(:name => "dicer", :designation => "physics")
    ])

    render

    expect(rendered).to match /slicer/
    expect(rendered).to match /math/
    expect(rendered).to match /dicer/
    expect(rendered).to match /physics/
  end
end

