defmodule ExDiscourseWeb.ErrorJSONTest do
  use ExDiscourseWeb.ConnCase, async: true

  test "renders 404" do
    assert ExDiscourseWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert ExDiscourseWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
