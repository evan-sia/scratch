items = [
  {
    original: {
      quantity: 3,
      amendment_type: "REMOVAL"
    },
    amends: {
      quantity: 2,
      amendment_type: "REMOVAL"
    }
  },
  {
    original: nil,
    amends: nil
  },
  {
    original: {
      quantity: 3,
      amendment_type: "REMOVAL"
    },
    amends: {
      quantity: 3,
      amendment_type: "REMOVAL"
    }
  },
]

WEIGHT = {
  REMOVAL: 2,
  SUB: 1
}

items = items.sort_by do |i|
  if i[:original].nil? && i[:amends].nil?
    1
  elsif  i[:amends][:amendment_type] == "SUB" && i[:amends][:quantity] != i[:original][:quantity]
    2
  elsif  i[:amends][:amendment_type] == "SUB" && i[:amends][:quantity] == i[:original][:quantity]
    3
  elsif i[:amends][:amendment_type] == "REMOVAL" && i[:amends][:quantity] - i[:original][:quantity] == 0
    5
  else
    WEIGHT[i[:amends][:amendment_type].to_sym]
  end
end

p items
