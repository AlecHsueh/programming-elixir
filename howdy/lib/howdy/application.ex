defmodule Howdy.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: Howdy.Worker.start_link(arg1, arg2, arg3)
      # worker(Howdy.Worker, [arg1, arg2, arg3]),
      worker(Howdy.Counter, [Howdy.Worker1, 3], id: Howdy.Worker1),
      worker(Howdy.Counter, [Howdy.Worker2, 5], id: Howdy.Worker2),
      worker(Howdy.Counter, [Howdy.Worker3, 7], id: Howdy.Worker3),
      worker(Howdy.Counter, [Howdy.Worker4, 9], id: Howdy.Worker4),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Howdy.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
