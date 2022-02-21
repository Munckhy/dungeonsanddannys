<!-- TM Promo Banner -->
<?php if (date('Y-m-d H:i:s') < date('Y-m-d H:i:s', strtotime($date))) { ?>
	<div class="tm-promo-banner-<?php echo $module ?>" <?php echo $background ? 'style="background-image: url(' . $background . ');"' : ''; ?>>
		<div class="tm-promo-banner__cont">
			<?php if ($image) { ?>
			<div class="tm-promo-banner__image">
				<img src="<?php echo $image; ?>" alt="" style="max-width: <?php echo $image_width . 'px;' ?>">
			</div>
			<?php } ?>
			<?php if ($description) { ?>
			<div class="tm-promo-banner__description">
				<?php echo $description; ?>
			</div>
			<?php } ?>
			<div class="tm-promo-banner__countdown">
				<?php if ($type == 1) { ?>
				<div id="tm-promo-banner__radial-countdown-<?php echo $module; ?>" class="radial-countdown" data-date="<?php echo $date ?>"></div>
				<?php } else { ?>
				<div id="tm-promo-banner__countdown-<?php echo $module; ?>" class="simple-countdown" data-date="<?php echo $date ?>">
					<div class="cell days"><span class="number"></span> <?php echo $days_title; ?></div>
					<div class="cell hours"><span class="number"></span> <?php echo $hours_title; ?></div>
					<div class="cell minutes"><span class="number"></span> <?php echo $minutes_title; ?></div>
					<div class="cell seconds"><span class="number"></span> <?php echo $seconds_title; ?></div>
				</div>
				<?php } ?>
			</div>
		</div>
		<a href="#" class="tm-promo-banner__close-btn">
			<i class="material-design-close47"></i>
		</a>
	</div>
	<!-- END TM Promo Banner-->
	<?php if ($type == 1) { ?>
	<script>
		var obj = jQuery("#tm-promo-banner__radial-countdown-<?php echo $module; ?>"),
		timesettings = {
			Days: {
				color: '<?php echo $days_color ?>',
				show: <?php echo $show_days; ?>,
				text: '<?php echo $days_title; ?>'
			},
			Hours: {
				color: '<?php echo $hours_color ?>',
				show: <?php echo $show_hours; ?>,
				text: '<?php echo $hours_title; ?>'
			},
			Minutes: {
				color: '<?php echo $minutes_color ?>',
				show: <?php echo $show_minutes; ?>,
				text: '<?php echo $minutes_title; ?>'
			},
			Seconds: {
				color: '<?php echo $seconds_color ?>',
				show: <?php echo $show_seconds; ?>,
				text: '<?php echo $seconds_title; ?>'

			}
		},
		settings = {
			animation: '<?php echo $animation; ?>',
			direction: '<?php echo $direction; ?>',
			circle_bg_color: '<?php echo $radial_bg_color ?>',
			fg_width: <?php echo $fg_width; ?>,
			bg_width: <?php echo $radial_bg_width; ?>,
			count_past_zero: false,
			time: timesettings
		};
		jQuery(document).ready(function () {
			obj.TimeCircles(settings);
		});

		<?php if ($count > 2) { ?>
			jQuery(window).on('resize', function (event) {
				<?php if ($count > 3) { ?>
					if (jQuery(window).width() > 767) {
						obj.TimeCircles({
							time: {
								Minutes: {show: true},
								Seconds: {show: true}
							}
						}).rebuild();
					} else if (jQuery(window).width() > 479) {
						obj.TimeCircles({
							time: {
								Minutes: {show: true},
								Seconds: {show: false}
							}
						}).rebuild();
					} else {
						obj.TimeCircles({
							time: {
								Minutes: {show: false},
								Seconds: {show: false}
							}
						}).rebuild();
					}
					<?php }else{ ?>

						if (jQuery(window).width() > 479) {
							obj.TimeCircles({
								time: {
									<?php if ($show_seconds == 'true'){ ?>
										Seconds: {show: true}
										<?php }else{ ?>
											Minutes: {show: true}
											<?php } ?>
										}
									}).rebuild();
						} else {
							obj.TimeCircles({
								time: {
									<?php if ($show_seconds == 'true'){ ?>
										Seconds: {show: false}
										<?php }else{ ?>
											Minutes: {show: false}
											<?php } ?>
										}
									}).rebuild();
						}
						<?php } ?>
					});
<?php }else{ ?>
	jQuery(window).on('resize', function (event) {
		obj.TimeCircles().rebuild();
	});
	<?php } ?>
</script>
<?php } else { ?>
<script>
	;(function($){
		var obj = $('#tm-promo-banner__countdown-<?php echo $module; ?>');
		obj.countdown(obj.data('date'), function(event){
			$(this).find('.days > .number').html(event.strftime('%D'));
			$(this).find('.hours > .number').html(event.strftime('%H'));
			$(this).find('.minutes > .number').html(event.strftime('%M'));
			$(this).find('.seconds > .number').html(event.strftime('%S'));
		});
	})(jQuery)
</script>
<?php } ?>
<script>
	$(document).ready(function(){
		var m = <?php echo $cookie; ?>;
		var now = new Date();
		now.setTime(now.getTime() + (m * 60 * 1000));
		var showIt = getCookie('showpromobanner');
		if (showIt !== "false") {
			$('.tm-promo-banner-<?php echo $module ?>').slideDown(500);
		}
		$('.tm-promo-banner__close-btn').click(function (e) {
			e.preventDefault();
			e.stopPropagation();
			$('.tm-promo-banner-<?php echo $module ?>').slideUp(500);
			document.cookie = "showpromobanner=false; expires=" + now.toUTCString() + "; path=/";
		});
	});
	function getCookie(cname) {
		var name = cname + "=";
		var ca = document.cookie.split(';');
		for(var i=0; i<ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0)==' ') c = c.substring(1);
			if (c.indexOf(name) == 0) return c.substring(name.length,c.length);
		}
		return "";
	}
</script>
<?php } ?>