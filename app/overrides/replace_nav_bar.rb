# encoding: UTF-8
Deface::Override.new(:virtual_path => %{spree/shared/_nav_bar},
					 :name => %{replace_nav_bar},
					 :replace => %{nav},
					 :text => %{
<nav>
	<ul>
		<li><a href="sd" title="<%= UnicodeUtils.upcase('kimiz', :tr)%>"><%= UnicodeUtils.upcase('kimiz', :tr)%></a></li>
		<li><a href="dds" title="<%= UnicodeUtils.upcase('iletişim', :tr)%>"><%= UnicodeUtils.upcase('iletişim', :tr)%></a></li>
		<li class="last"><a href="aasa" title="<%= UnicodeUtils.upcase('teslimat', :tr)%>"><%= UnicodeUtils.upcase('teslimat', :tr)%></a></li>
	</ul>
	<ul class="sepet dolu">
		<li class="aratoplam">
			<a href="/nl/checkout/stap1.html" title="Sepet">18,00 TL</a>
		</li>
		<li class="miktar">1</li>
		<li>
			<a href="/nl/checkout/stap1.html" title="Sepet"><%= UnicodeUtils.upcase('sepete gözat', :tr)%></a>
		</li>
	</ul
</nav>					 	
					 	},
					 	:original => %{7b8b4dca34f6155872ba6ad6dfc427c1274fe312})