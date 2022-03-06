# Original: https://github.com/Renaud11232/icecast-autodj
# By: Renaud11232
# MIT License

set("ha rbor.bind_addr", "0.0.0.0")

silence = blank()

autodj = playlist(
  "/media",
  reload_mode="watch"
)

source_chain = fallback(
  track_sensitive=false,
  [autodj, silence]
)

radio = nrj(source_chain)

output.icecast(
  %vorbis,
  host="localhost",
  port=8001,
  user="source",
  password="source-password",
  mount="stream.ogg",
  name="Stream name",
  radio
)
