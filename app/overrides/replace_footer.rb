# encoding: UTF-8
Deface::Override.new(:virtual_path => %{spree/shared/_footer},
					 :name => %{replace_footer},
					 :replace => %{footer},
					 :text => %{
<footer>
	<div class="content wrap clearfix">
		<a href="https://twitter.com/share" class="twitter-share-button" data-url="http://zib.in" data-text="Bebeğin için tasarla!" data-lang="tr">Tweetle</a>
		<div class="fb-like" data-href="http://zib.in" data-send="false" data-layout="button_count" data-width="450" data-show-faces="true" data-font="lucida grande" data-action="recommend"></div>
		<%= image_tag("store/odemesecenekleri.png", :alt => "visa - mastercard - paypal - at - bok", :id => "odemesecenekleri") %>
		<p class="left">
			Copyright &copy; 2013 - Her hakkı saklıdır. <br />
			Zibin.com, bebeği sevindir!
		</p>
		<p class="right">
			<a href="/sss.html" title="Sık Sorulan Sorular">Sık Sorulan Sorular</a> - 
			<a href="/iade_sartlari.html" title="İade Şartları">İade Şartları</a> - 
			<a href="/ilginc_adresler.html" title="İlginç Adresler">İlginç Adresler</a> - 
			<a href="/urun_kalitesi.html" title="Ürün Kalitesi">Ürün Kalitesi</a> - 
			<a href="/iletisim.html" title="Bize Ulaşın">Bize Ulaşın</a>
		</p>
	</div>
</footer> })