return {
  map = function(f, list)
    local r = {}
    for i, item in ipairs(list) do
      table.insert(r, f(item))
    end
    return r
  end,
  
  prepend = function(prefix)
    return function(s)
      return string.format("%s.%s", prefix, s)
    end
  end
}
