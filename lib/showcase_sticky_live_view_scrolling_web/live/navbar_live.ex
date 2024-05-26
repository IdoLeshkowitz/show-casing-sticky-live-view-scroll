defmodule ShowcaseStickyLiveViewScrollingWeb.NavbarLive do
  use ShowcaseStickyLiveViewScrollingWeb, :live_view

  def mount(_, _, socket) do
    arr = 1..1000 |> Enum.to_list()

    socket =
      socket
      |> assign(:arr, arr)

    {:ok, socket, layout: {ShowcaseStickyLiveViewScrollingWeb.Layouts, :empty}}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-col h-screen overflow-scroll">
      <div :for={i <- @arr}>
        <%= i %>
      </div>
    </div>
    """
  end
end
