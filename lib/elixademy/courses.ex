defmodule Elixademy.Courses do
  use Ash.Domain

  resources do
    resource Elixademy.Courses.Author

    resource Elixademy.Courses.Serie
    resource Elixademy.Courses.SerieEpisode

    resource Elixademy.Courses.Topic
    resource Elixademy.Courses.Category
  end
end
