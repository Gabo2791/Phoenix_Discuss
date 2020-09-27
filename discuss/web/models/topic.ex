 defmodule Discuss.Topic do
   use Discuss.Web, :model #importacion de la funcion model contenida en web.ex

   schema "topics" do
     field :title, :String
   end
 end
