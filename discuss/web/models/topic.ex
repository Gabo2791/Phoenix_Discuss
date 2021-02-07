 defmodule Discuss.Topic do
   use Discuss.Web, :model #importacion de la funcion model contenida en web.ex

   schema "topics" do
     field :title, :string
   end

   def changeset(struct, params \\ %{}) do
     struct
     |> cast(params, [:title])
     |> validate_required([:title])
   end
 end
