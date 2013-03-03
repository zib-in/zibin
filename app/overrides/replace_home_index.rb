# encoding: UTF-8
Deface::Override.new(:virtual_path => %{spree/home/index},
					 :name => %{replace_home_index},
					 :replace => %{code[erb-silent]:contains('content_for')},
					 :closing_selector => %{[data-hook="homepage_products"]},
					 :text => %{
<%if !@slider %><a href="/" title="Anasayfa" id="geriana"></a><%end%>			 	
<div id="turuncu">
	<div id="slidertasiyici">
		<div id="slider">
			<div id="tasiyici_anasayfa" <%if !@slider %>class="active"<%end%>>
				<section id="icerik_anasayfa" class="wrap clearfix">
					<div id="resimler">
						<div id="resimler_tasiyici">
							<%= image_tag('store/resim1.png') %>
							<%= image_tag('store/resim2.png') %>
							<%= image_tag('store/resim3.png') %>
							<%= image_tag('store/resim4.png') %>
							<%= image_tag('store/resim5.png') %>
						</div>
					</div>
					<div id="anasayfa_yazi">
						<h1>Kendi tasarımını yolla</h1>
						<h2>En orjinal doğum hediyesini sen ver!</h2>
						<p class="fourth">
							<span>
								<a href="#" title="Bizi takip et">TAKİP ET, EN ORİJİNAL FİKİRLERİ GÖR!</a>
							</span>
							<a href="http://www.facebook.com/pages/Babyshirtsbe/213695152092572" target="_blank" class="sosikon fb"></a>
							<a href="https://plus.google.com/105953333842801299692/posts" target="_blank" class="sosikon gp"></a>
						</p>
					</div>
					<a href="urunler.html" title="Ürünler" id="baslangic">Başla</a>
				</section>
			</div>
			<div id="tasiyici_baslangic" <%if @slider%>class="active"<%end%>>
				<section id="icerik_baslangic" class="wrap">
					<h1>TASARLAMAK İSTEDİĞİNİZ ÜRÜNÜ SEÇİN</h1>
					<ul id="urunler">
						<li class="zibin">
							<a href="/zibin.html" title="Zıbın - Kendin tasarla - En iyi doğum hediyesi!">Zıbın</a>
							<p class="fiyat_etiketi">16.00 TL</p>
						</li>
						<li class="sapka">
							<a href="/sapka.html" title="Şapka - Kendin tasarla - En iyi doğum hediyesi!">Şapka</a>
							<p class="fiyat_etiketi">16.00 TL</p>
						</li>
						<li class="tshirt">
							<a href="/tshirt.html" title="Kendi zıbınını tasarla - En iyi doğum hediyesi!">T-shirt</a>
							<p class="fiyat_etiketi">16.00 TL</p>
						</li>
					</ul>
				</section>
			</div>
		</div>
	</div>
</div>
<ul id="assets" class="wrap clearfix">
	<li class="birinci">
		<a>UYGUN FİYAT</a>
	</li>
	<li class="ikinci">
		<a>HIZLI & KOLAY</a>
	</li>
	<li class="ucuncu">
		<a>BİRÇOK RENK & YAZI TİPİ</a>
	</li>
	<li class="dorduncu">
		<a>ŞIK HEDİYE PAKETİ</a>
	</li>
	<li class="besinci">
		<a>BEDAVA KARGO*</a>
	</li>
	<li class="altinci son">
		<a>ORGANİK ÜRÜN & DÜRÜST TİCARET</a>
	</li>
</ul>
<% content_for :belgesonu do %>
	<%= javascript_include_tag "store/main", "store/social" %>
<% end %>
					 })