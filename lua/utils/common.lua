local function mergeKeys(nestedArray)
  local keysArr = {}

  for i = 1, #nestedArray do
    local currentArr = nestedArray[i]
    for j = 1, #currentArr do
      keysArr[#keysArr + 1] = currentArr[j]
    end
  end

  return keysArr
end

return {
  mergeKeys = mergeKeys,
}
