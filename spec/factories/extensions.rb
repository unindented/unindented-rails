FactoryGirl.define do

  sequence :extension_name do |n|
    "extension#{n}"
  end

  factory(:extension) do
    name { FactoryGirl.generate(:extension_name) }
  end

end
