defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  alias Discuss.Topic

  def index(conn,_params) do #Controlador que te redirige a la pagina principal
    topics = Repo.all(Topic)
    render conn, "index.html", topics: topics
  end
  def new(conn, _params) do #Controlador que realiza el despliegue de un formulario para ingresar nuevos tópicos
    changeset = Topic.changeset(%Topic{}, %{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"topic" => topic}) do #Controlador que realiza la creación de un nuevo topico 
    changeset = Topic.changeset(%Topic{}, topic)

    case Repo.insert(changeset) do #Funcion que realiza la insercion de un nuevo topico en la base de datos
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic Created!")
        |> redirect(to: topic_path(conn, :index))
      {:error, changeset} -> render conn, "new.html", changeset: changeset
    end
  end

  def edit(conn, %{"id" => topic_id}) do #Controlador que despliega el formulario para editar tópicos existentes
    topic = Repo.get(Topic, topic_id)
    changeset = Topic.changeset(topic)
    IO.inspect("mostrando changeset ******************")
    IO.inspect(changeset)
    render conn, "edit.html", changeset: changeset, topic: topic
  end

  def update(conn, %{"id" => topic_id, "topic" => topic}) do #Controlador que realiza la actualización de los datos de un tópico en particular y lo graba en la base de datos
    old_topic = Repo.get(Topic, topic_id)
    changeset = Topic.changeset(old_topic, topic)
    IO.inspect(changeset)

  # changeset=Repo.get(Topic, topic_id) |> Topic.changeset(topic)
    case Repo.update(changeset) do # Función que realiza la actualizacion de los datos de un tópico en particular de acuerdo a su id.
      {:ok, _topic} ->
        conn
        |> put_flash(:info,"Topic Updated!")
        |> redirect(to: topic_path(conn, :index))
      {:error, changeset} ->
        render conn, "edit.html", changeset: changeset, topic: old_topic
      end
    end

    def delete(conn, %{"id" => topic_id}) do
      Repo.get!(Topic, topic_id) |> Repo.delete!
      conn
      |>put_flash(:info, "Topic Deleted!")
      |> redirect(to: topic_path(conn, :index))
    end
end
