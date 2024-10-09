defmodule Intro do
  use Application
  alias UUID

  def start(_type, _args) do
    IO.puts(UUID.uuid4())
    Intro.hello()
    Intro.number_stuff()
    Intro.executive_status()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def hello do
    # variables
    x = 45
    x = x + 20
    IO.puts(x)

    # atoms
    # introduces performance improvements
    IO.puts(:"dodo and beans")
  end

  def executive_status do
    name = "Mufu"
    status = Enum.random([:gold, :silver, :bronze, :guest])

    case status do
      :gold ->
        :silver
        :bronze -> IO.puts("Welcome to the arena, #{name}.\nThis should be fun, hehe!")
      _ -> IO.puts("Who goes you?!")
    end
  end

  def stuff_about_maps do
    map = %{:hello => "world", 32 => :age, "height" => 190.67}

    # if the key is an atom, we can access its value
    # with the dot notation
    IO.puts(map.hello)

    # accessing the map value with a helper func
    height = Map.get(map, "height")
    IO.puts(height)

    # deleting an item from the map is simple done with Map.delete()
    Map.delete(map, :hello)

    # we can also delete multiple keys at once
    Map.drop(map, ["height", 32])

    # Updating an item in the map is quite straight forward shaa
    Map.put(map, "height", 200)

    # but this approach is error-prone. it is better we use the replace method
    # this will throw an error because I've added the (!) and the key does not exist
    Map.replace!(map, "heigt", 299)
  end
  def number_stuff do
    a = 10
    b = 2.0

    IO.puts(a+b)

    IO.puts(Float.ceil(0.5))
  end
end
