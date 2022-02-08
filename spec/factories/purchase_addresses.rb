FactoryBot.define do
  factory :purchase_address do
    token          {"tok_abcdefghijk00000000000000000"}
    post_code      { '123-4567' }
    area_id        { 2 }
    municipalities { '大阪市' }
    address        { '1-1-1' }
    building       { '大阪マンション' }
    telephone_num  { '09012345678' }
  end
end
