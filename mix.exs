defmodule MixTaskHeroku.Mixfile do
  use Mix.Project

  def project do
    [ app: :mix_task_heroku,
      version: "0.0.1",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    []
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    [  { :dynamo, %r(.*), github: "elixir-lang/dynamo" },
       { :ranch, %r(.*), github: "extend/ranch", ref: "c3133bfbc324fbb9ac26ab689cd41dc362ad7c05" },
      { :cowboy, %r(.*), github: "extend/cowboy", ref: "a3049f7100bb9f3cbaef1db6bf6cdeb750d9e298" } ]
  end
end
