Deface::Override.new(:virtual_path => %{spree/shared/_header},
					 :name => %{replace_header},
					 :replace => %{header},
					 :text => %{
<header class="wrap" id="header">
	<h1 id="logo">
		<a href="/"><%= title %></a>
	</h1>
	<%= render :partial => 'spree/shared/nav_bar' %>
</header>					 	
					 	},
					 	:original => %{fe273d1ea4ee64cf9b0d97747491aa1df868dc16})