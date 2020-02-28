class RandomNumbersContract < BaseContract
  schema do
    required(:min).value(:float)
    required(:max).value(:float)
  end

  rule(:min, :max) do
    key.failure(:invalid) if values[:max] < values[:min]
  end
end
