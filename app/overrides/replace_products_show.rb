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
		<aside id="sepetbilgi" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
			<div class="miktar">
				<span>Mİktar</span>
				<input type="text" id="miktar" value="1">
			</div>
			<span class="x">X</span>
			<span class="fiyat" itemprop="price">16.00 TL</span>
			<div class="sepet">
				<a href="/nl/checkout/stap1.html" title="Sepet" class="ekle">Sepete Ekle</a>
			</div>
		</aside>
		<%= form_for :order, :url => populate_orders_path do |f| %>
			<% if @product.has_variants? %>
				<% @product.grouped_option_values.each do |type, values| %>
					<fieldset>
						<legend><%= UnicodeUtils.upcase(type.presentation) %></legend>
					</fieldset>
				<% end %>
			<fieldset>
				<legend>Beden ÖlÇÜsÜ:</legend>
				<% @size_chart = @product.size_chart %>
				<% if @size_chart and !@size_chart.size_values.empty? %>
				<a href="#" id="olcutablosudgm">ÖlÇü Tablosu</a>
				<% end %>
				<div class="radiobuttonlar clearfix" id="beden">
					<div class="clearfix">
						<button rel="1" id="1">
							<div class="secili"></div>
						</button>
						<label for="1">3-6 ay</label>
					</div>
					<div class="clearfix">
						<button rel="2" id="2">
						</button>
						<label for="2">3-6 ay</label>
					</div>
					<div class="clearfix">
						<button rel="3" id="3">
						</button>
						<label for="3">3-6 ay</label>
					</div>
					<input type="hidden" name="beden" value="1">
				</div>
			</fieldset>
			<fieldset>
				<legend>kumaŞ rengİ:</legend>
				<div class="radiobuttonlar clearfix" id="renk">
					<div class="clearfix secenek">
						<button rel="21" id="21" style="background-color:#ffffff;">
							<div class="secili"></div>
						</button>
						<label for="21">Beyaz</label>
					</div>
					<div class="clearfix secenek">
						<button rel="30" id="30" style="background-color:#f6b7c7;">
						</button>
						<label for="30">Pembe</label>
					</div>
					<div class="clearfix secenek">
						<button rel="35" id="35" style="background-color:#7bc0dd;">
						</button>
						<label for="35">Turkuaz</label>
					</div>
					<input type="hidden" name="kumasrengi" value="21">
				</div>
			</fieldset>
			<% end %>
			<ul class="nav nav-sekmeler" id="detaylarSekme">
				<li class="active">
					<a href="#on_taraf" data-toggle="tab">Ön</a>
				</li>
				<li>
					<a href="#arka_taraf" data-toggle="tab">arka</a>
				</li>
			</ul>
			<div class="sekme-icerik">
				<div class="sekme-panel clearfix active" id="on_taraf">
					<div class="clearfix">
						<div class="yazilar">
							<h3>YazI</h3>
							<span>1</span>
							<input name="yazi1" type="text" value="">
							<span>2</span>
							<input name="yazi2" type="text" value="">
							<span>3</span>
							<input name="yazi3" type="text" value="">
						</div>
						<div class="yazitipleri">
							<h3>tİpİ</h3>
							<a href="#" class="dgm">bİr seçİm yap</a>
							<input type="hidden" name="yazitipi1" value="">
							<a href="#" class="dgm">bİr seçİm yap</a>
							<input type="hidden" name="yazitipi2" value="">
							<a href="#" class="dgm">bİr seçİm yap</a>
							<input type="hidden" name="yazitipi3" value="">
						</div>
						<div class="yazirenkleri">
							<h3>rengİ</h3>
							<select id="yazirengi1" name="yazirengi1" data-savedval=""><option value="0">bİr seçİm yap</option><option value="24" data-hex="#b5d568">Appelgroen</option><option value="23" data-hex="#fcdb3e">Geel</option><option value="34" data-hex="#a5916e">Goud metallic</option><option value="25" data-hex="#387764">Groen</option><option value="27" data-hex="#294ca0">Koningsblauw</option><option value="29" data-hex="#428ccb">Blauw</option><option value="26" data-hex="#2f3857">Marineblauw</option><option value="31" data-hex="#f4812e">Oranje</option><option value="28" data-hex="#a9cae9">Pastelblauw</option><option value="32" data-hex="#df4640">Rood</option><option value="30" data-hex="#f6b7c7">Roze</option><option value="21" data-hex="#ffffff">Wit</option><option value="33" data-hex="#a2a9b3">Zilver metalic</option><option value="22" data-hex="#000000">Zwart</option></select>
							<select id="yazirengi2" name="yazirengi2" data-savedval=""><option value="0">bİr seçİm yap</option><option value="24" data-hex="#b5d568">Appelgroen</option><option value="23" data-hex="#fcdb3e">Geel</option><option value="34" data-hex="#a5916e">Goud metallic</option><option value="25" data-hex="#387764">Groen</option><option value="27" data-hex="#294ca0">Koningsblauw</option><option value="29" data-hex="#428ccb">Blauw</option><option value="26" data-hex="#2f3857">Marineblauw</option><option value="31" data-hex="#f4812e">Oranje</option><option value="28" data-hex="#a9cae9">Pastelblauw</option><option value="32" data-hex="#df4640">Rood</option><option value="30" data-hex="#f6b7c7">Roze</option><option value="21" data-hex="#ffffff">Wit</option><option value="33" data-hex="#a2a9b3">Zilver metalic</option><option value="22" data-hex="#000000">Zwart</option></select>
							<select id="yazirengi3" name="yazirengi3" data-savedval=""><option value="0">bİr seçİm yap</option><option value="24" data-hex="#b5d568">Appelgroen</option><option value="23" data-hex="#fcdb3e">Geel</option><option value="34" data-hex="#a5916e">Goud metallic</option><option value="25" data-hex="#387764">Groen</option><option value="27" data-hex="#294ca0">Koningsblauw</option><option value="29" data-hex="#428ccb">Blauw</option><option value="26" data-hex="#2f3857">Marineblauw</option><option value="31" data-hex="#f4812e">Oranje</option><option value="28" data-hex="#a9cae9">Pastelblauw</option><option value="32" data-hex="#df4640">Rood</option><option value="30" data-hex="#f6b7c7">Roze</option><option value="21" data-hex="#ffffff">Wit</option><option value="33" data-hex="#a2a9b3">Zilver metalic</option><option value="22" data-hex="#000000">Zwart</option></select>
						</div>
						<div class="buyukluk">
							<h3>Boyutu</h3>
							<div class="asagiyukari">
								<input name="buyukluk1" value type="number">
							</div>
							<div class="asagiyukari">
								<input name="buyukluk2" value type="number">
							</div>
							<div class="asagiyukari">
								<input name="buyukluk3" value type="number">
							</div>
						</div>
					</div>
					<p>*her kumaŞ yÜzÜne eklenen her renk İçİn 5tl, her bİr kumaŞ yÜzÜne İse ayrı olarak 10 tl ücret eklenir.</p>
				</div>
				<div class="sekme-panel" id="arka_taraf">
					<div class="clearfix">
						<div class="yazilar">
							<h3>YazI</h3>
							<span>1</span>
							<input name="yazi4" type="text" value="">
							<span>2</span>
							<input name="yazi5" type="text" value="">
							<span>3</span>
							<input name="yazi6" type="text" value="">
						</div>
						<div class="yazitipleri">
							<h3>tİpİ</h3>
							<a href="#" class="dgm">bİr seçİm yap</a>
							<input type="hidden" name="yazitipi4" value="">
							<a href="#" class="dgm">bİr seçİm yap</a>
							<input type="hidden" name="yazitipi5" value="">
							<a href="#" class="dgm">bİr seçİm yap</a>
							<input type="hidden" name="yazitipi6" value="">
						</div>
						<div class="yazirenkleri">
							<h3>rengİ</h3>
							<select id="yazirengi4" name="yazirengi4" data-savedval=""><option value="0">bİr seçİm yap</option><option value="24" data-hex="#b5d568">Appelgroen</option><option value="23" data-hex="#fcdb3e">Geel</option><option value="34" data-hex="#a5916e">Goud metallic</option><option value="25" data-hex="#387764">Groen</option><option value="27" data-hex="#294ca0">Koningsblauw</option><option value="29" data-hex="#428ccb">Blauw</option><option value="26" data-hex="#2f3857">Marineblauw</option><option value="31" data-hex="#f4812e">Oranje</option><option value="28" data-hex="#a9cae9">Pastelblauw</option><option value="32" data-hex="#df4640">Rood</option><option value="30" data-hex="#f6b7c7">Roze</option><option value="21" data-hex="#ffffff">Wit</option><option value="33" data-hex="#a2a9b3">Zilver metalic</option><option value="22" data-hex="#000000">Zwart</option></select>
							<select id="yazirengi5" name="yazirengi5" data-savedval=""><option value="0">bİr seçİm yap</option><option value="24" data-hex="#b5d568">Appelgroen</option><option value="23" data-hex="#fcdb3e">Geel</option><option value="34" data-hex="#a5916e">Goud metallic</option><option value="25" data-hex="#387764">Groen</option><option value="27" data-hex="#294ca0">Koningsblauw</option><option value="29" data-hex="#428ccb">Blauw</option><option value="26" data-hex="#2f3857">Marineblauw</option><option value="31" data-hex="#f4812e">Oranje</option><option value="28" data-hex="#a9cae9">Pastelblauw</option><option value="32" data-hex="#df4640">Rood</option><option value="30" data-hex="#f6b7c7">Roze</option><option value="21" data-hex="#ffffff">Wit</option><option value="33" data-hex="#a2a9b3">Zilver metalic</option><option value="22" data-hex="#000000">Zwart</option></select>
							<select id="yazirengi6" name="yazirengi6" data-savedval=""><option value="0">bİr seçİm yap</option><option value="24" data-hex="#b5d568">Appelgroen</option><option value="23" data-hex="#fcdb3e">Geel</option><option value="34" data-hex="#a5916e">Goud metallic</option><option value="25" data-hex="#387764">Groen</option><option value="27" data-hex="#294ca0">Koningsblauw</option><option value="29" data-hex="#428ccb">Blauw</option><option value="26" data-hex="#2f3857">Marineblauw</option><option value="31" data-hex="#f4812e">Oranje</option><option value="28" data-hex="#a9cae9">Pastelblauw</option><option value="32" data-hex="#df4640">Rood</option><option value="30" data-hex="#f6b7c7">Roze</option><option value="21" data-hex="#ffffff">Wit</option><option value="33" data-hex="#a2a9b3">Zilver metalic</option><option value="22" data-hex="#000000">Zwart</option></select>
						</div>
						<div class="buyukluk">
							<h3>Boyutu</h3>
							<div class="asagiyukari">
								<input name="buyukluk4" value type="number">
							</div>
							<div class="asagiyukari">
								<input name="buyukluk5" value type="number">
							</div>
							<div class="asagiyukari">
								<input name="buyukluk6" value type="number">
							</div>
						</div>
					</div>
					<p>*her kumaŞ yÜzÜne eklenen her renk İçİn 5tl, her bİr kumaŞ yÜzÜne İse ayrı olarak 10 tl ücret eklenir.</p>
				</div>
			</div>
			<div class="dogrulama"></div>
			<input type="hidden" name="prev-data-on" id="prev-data-on">
			<input type="hidden" name="prev-data-arka" id="prev-data-arka">
			<input type="hidden" name="aantal" value="1">
			<input type="hidden" name="productid" value="1">
		<% end %>
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
	<%= javascript_include_tag "store/bootstrap-tab", "store/customcb", "store/social", "store/product_page" %>
<% end %>					 	
					 	},
					 	:original => %{b05ac497efeeebd4464f29891fd2c4a0f60c24d9})