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
  end,

  require_all = function(dir, prefix, f)
    local handle = vim.loop.fs_scandir(dir)

    while handle do
      local filename, filetype = vim.loop.fs_scandir_next(handle)

      if filename and filetype == 'file' then
        local ok, module = pcall(require, (prefix .. string.sub(filename, 1, -5)))
        if ok then
          f(module)
        end
      elseif not filename then
        break
      end
    end
  end
}
