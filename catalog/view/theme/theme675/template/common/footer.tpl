<footer>
	<div class="footer-skew">
	<div class="footer">
	<div class="container">
		<div class="row">
			<?php if ($informations) { ?>
			<div class="col-xs-6 col-sm-6 col-md-2">
				<h5><?php echo $text_information; ?></h5>
				<ul class="list-unstyled">
					<?php foreach ($informations as $information) { ?>
					<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
					<?php } ?>
					<?php if(isset($simple_blog_found)) { ?>
					<li><a href="<?php echo $simple_blog; ?>"><?php echo $simple_blog_footer_heading; ?></a></li>
					<?php } ?>
				</ul>
				<h5><?php echo $text_account; ?></h5>
				<ul class="list-unstyled">
					<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
					<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
					<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
				</ul>
			</div>
			<?php } ?>
			<div class="col-xs-6 col-sm-6 col-md-2">
				<h5><?php echo $text_service; ?></h5>
				<ul class="list-unstyled">
					<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
					<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
					<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
				</ul>
				<h5><?php echo $text_extra; ?></h5>
				<ul class="list-unstyled">
					<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
					<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
					<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
					<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
					<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
				</ul>
			</div>
			<?php if ($footer_top) { ?>
				<?php echo $footer_top; ?>
			<?php } ?>
			<!--
			<div class="col-xs-6 col-sm-4 col-md-2">
				<div class="footer_box">
					<h5><?php echo $text_contact; ?></h5>
					<address>
						<span class="fa fa-map-marker">
							<a href="//www.google.com/maps/?q=<?php echo $geocode ? str_replace(' ', '+', $geocode) : str_replace(' ', '+', strip_tags($address)); ?>" target="_blank">
								<?php echo $address ?>
							</a>
						</span>
						<dl>
							<dt><?php echo $text_email; ?></dt>
							<dd><a href="mailto:<?php echo $email; ?> "><?php echo $email; ?></a></dd>
						</dl>
						<dl>
							<dt><?php echo $text_telephone; ?></dt>
							<dd><a href="callto:<?php echo $telephone; ?>"><?php echo $telephone; ?></a></dd>
						</dl>
						<?php if ($fax) { ?>
						<dl>
							<dt><?php echo $text_fax; ?></dt>
							<dd><a href="callto:<?php echo $fax; ?>"><?php echo $fax; ?></a></dd>
						</dl>
						<?php } ?>
					</address>
					<p><?php echo $open; ?></p>
				</div>
			</div>
			-->
		</div>
		<div class="copyright">
			<?php echo $powered; ?><!-- [[%FOOTER_LINK]] -->
		</div>
	</div>
	</div>
	</div>
	<?php if ($bottom) { ?>
		<section class="bottom"><?php echo $bottom; ?></section>
	<?php } ?>
</footer>
<div class="ajax-overlay"></div>
</div>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/device.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/livesearch.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/common.js" type="text/javascript"></script>
<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/script.js" type="text/javascript"></script>
</body></html>