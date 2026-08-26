return function(mod)
  mod.hooks:wrap("ui.options.rows", function(next, game, rows)
    local out = next(game, rows)
    if type(out) ~= "table" then return out end
    out[#out + 1] = {
      id = "no_bike_music",
      label = "BIKE MUSIC",
      value = function()
        return mod.save:get("suppress", true) and "OFF" or "ON"
      end,
      activate = function()
        mod.save:set("suppress", not mod.save:get("suppress", true))
      end,
    }
    return out
  end)

  mod.hooks:wrap("music.select", function(next, song, ctx)
    if song == "Music_BikeRiding" then
      if mod.save:get("suppress", true) then
        return ctx.mapSong
      end
    end
    return next(song, ctx)
  end)
end
