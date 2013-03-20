# encoding: UTF-8
Deface::Override.new(:virtual_path => %{spree/products/show},
					 :name => %{replace_products_show},
					 :replace => %{[data-hook='product_show']},
					 :text => %{
<% @body_id = 'urun_detayi' %>
<div id="turuncu" class="detaylar">
	<div id="turuncu_ap"></div>
	<section id="detaylar" class="wrap" itemscope itemtype="http://schema.org/Product">
		<h1 itemprop="name">Ürün Adı</h1>
		<%= render :partial => 'spree/products/form' %>
		<div id="onizleme_hizalama">
			<div id="onizleme_tasiyici">
				<div id="onizleme" class="zibin">
					<div class="ecaf on_taraf" id="on_izleme">
						<div class="resim" style="background-image: url(http://www.babyshirts.be/uploads/kleuren/muts/voor21.png);">
							<p></p>
							<p></p>
							<p></p>
						</div>
					</div>
					<div class="ecaf arka_taraf" id="arka_izleme">
						<div class="resim" style="background-image: url(http://www.babyshirts.be/uploads/kleuren/muts/voor21.png);">
							<p></p>
							<p></p>
							<p></p>
						</div>
					</div>
				</div>
			</div>
			<div id="degistir">
				<a href="#"></a>
			</div>
			<ul id="kumasyuzu" class="clearfix">
				<li class="on_taraf active">
					<a href="#">Ön YÜz</a>
				</li>
				<li class="arka_taraf">
					<a href="#">Arka yÜz</a>
				</li>
			</ul>
		</div>
	</section>
</div>
<div id="turuncualt">
</div>

<%= render :partial => %{spree/shared/olcu_tablosu}, :size_chart => @size_chart %>

<div id="webfonts-tasiyici">
	<%= render :partial => 'spree/products/webfonts' %>
</div>
<% content_for :belgesonu do %>
	<%= javascript_include_tag "bootstrap-tab", "customcb", "social", "product_page", "variant" %>
<% end %>					 	
					 	},
					 	:original => %{b05ac497efeeebd4464f29891fd2c4a0f60c24d9})