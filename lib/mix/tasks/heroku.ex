defmodule Mix.Tasks.Heroku do
  use Mix.Task
  @shortdoc "Run all Dynamos in a web server for heroku, see mix heroku -h"
  @moduledoc """
  Runs all registered Dynamos in their servers.
  mix heroku -p port  # use port 
  mix heroku -h       # this message
  """
  def run(args) do
    Mix.Task.run Mix.project[:prepare_task], args
    dynamos = Mix.project[:dynamos]
    Dynamo.Loader.enable
    optspecs = [aliases: [p: :port, h: :help],
      switches: [port: :keep, help: :keep]]
    {opts, _head} = OptionParser.parse_head(args, optspecs)
    if (opts[:help]) do
      usage
      System.halt
    end
    p = case (opts[:port]) do
      nil -> []
      m -> [port: binary_to_integer m]
    end
    Enum.each dynamos, fn(dynamo) ->
      validate_dynamo(dynamo)
      dynamo.run p
    end
    :timer.sleep(:infinity)
  end
  @spec 
  defp usage() do
    IO.puts "usage: mix heroku [options]\n"
    {n, docs} = __MODULE__.__info__(:moduledoc)
    IO.puts docs
  end
  defp validate_dynamo(dynamo) do
    config   = dynamo.config[:dynamo]
    endpoint = config[:endpoint]

    if endpoint && not Code.ensure_compiled?(endpoint) do
      if config[:compile_on_demand] do
        raise "could not find endpoint #{inspect endpoint}, please ensure it is available"
      else
        raise "could not find endpoint #{inspect endpoint}, please ensure it was compiled " <>
          "by running: MIX_ENV=#{Dynamo.env} mix compile"
      end
    end
  end
end