defmodule ShowcaseStickyLiveViewScrollingWeb.ALive do
  use ShowcaseStickyLiveViewScrollingWeb, :live_view

  def render(assigns) do
    ~H"""
    <div>
      Live View A <br />
      <.link navigate={~p"/b"}>
        to b
      </.link>
    </div>
    """
  end

  def mount(_, _, socket) do
    {:ok, socket}
  end
end
