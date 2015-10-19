
ats2erlcml_cml_channel ()       -> 'Elixir.Channel':channel().
ats2erlcml_cml_recv (chan)      -> 'Elixir.Channel':recv(chan).
ats2erlcml_cml_send (chan, msg) -> 'Elixir.Channel':send(chan, msg).
ats2erlcml_cml_spawn (f)        -> 'Elixir.Process':spawn(f).