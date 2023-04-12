return {
  map = function(f, list)
    local r = {}

    for _, item in ipairs(list) do
      table.insert(r, f(item))
    end

    return r
  end,

  reduce = function(f, v, list)
    local r = v

    for _, item in ipairs(list) do
      r = f(r, item)
    end

    return r
  end,

  prepend = function(prefix)
    return function(s)
      return string.format("%s.%s", prefix, s)
    end
  end
}
