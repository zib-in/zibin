# encoding: UTF-8
Deface::Override.new(:virtual_path => %{spree/layouts/spree_application},
					 :name => %{replace_body},
					 :replace => %{[data-hook=body]},
					 :text => %{
<body id="<%= @body_id || 'default' %>" data-hook="body">
	<div id="fb-root"></div>
	<script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script>
	<%= render :partial => 'spree/shared/header' %>
	<div id="ana">
		<%= yield %>
	</div>
	<%= render :partial => 'spree/shared/footer' %>
	<%= yield :belgesonu %>
</body>
					 	},
					 	:original => %{77e1d75fe67e948d99deb620579ffaf2ac5f511f})