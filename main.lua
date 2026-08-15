-- disables the bike music and keeps the regular overworld music playing
return function(mod)
  mod.hooks:wrap("music.select", function(next, song, ctx)
    if ctx.onBike then
      return ctx.mapSong
    end
    return next(song, ctx)
  end)
end