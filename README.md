# MixTaskHeroku

mix task 'run dynamo' under heroku

usage: 

1. add dynamo and mix_task_heroku into your mix.exe deps

<pre>
    defp deps do
      [ { :ranch, %r(.*), github: "extend/ranch", ref: "c3133bfbc324fbb9ac26ab689cd41dc362ad7c05" },
        { :cowboy, %r(.*), github: "extend/cowboy", ref: "a3049f7100bb9f3cbaef1db6bf6cdeb750d9e298" },
        { :dynamo, %r(.*), github: "elixir-lang/dynamo" } 
        { :mix_task_heroku, %r(.*), guthub: "k1complete/mix_task_heroku" } ]
    end
</pre>

2. write and build your dynamo

    mix deps.get

3. write run dynamo under heroku 

    mix heroku

