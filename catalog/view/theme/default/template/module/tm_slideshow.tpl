<div class="swiper-container swiper-slider" data-loop="<?php echo $loop; ?>" data-autoplay="<?php echo $autoplay; ?>" data-height="<?php echo $height . 'px'; ?>" data-min-height="<?php echo $min_height . 'px'; ?>" data-slide-effect="<?php echo $effect; ?>"
	data-slide-speed="<?php echo $speed . 'ms' ?>" data-keyboard="<?php echo $keyboard_control; ?>" data-mousewheel="<?php echo $mousewheel_control; ?>"
	data-mousewheel-release="<?php echo $mousewheel_release_on_edges; ?>">

	<div class="swiper-wrapper">
		<?php if (isset($slides) && $slides) { ?>
		<?php foreach ($slides as $slide) { ?>
		<?php if ($slide['slide_type']) { ?>

		<div class="swiper-slide <?php echo $slide['title']; ?> vide" data-vide-bg="<?php echo $slide['video']; ?>"
			data-vide-options="playbackRate: <?php echo $slide['video_playback_rate']; ?>, autoplay: <?php echo $slide['video_autoplay']; ?>,
			loop: <?php echo $slide['video_loop']; ?>, <?php echo $slide['video_muted'] ? '' : 'volume: ' . $slide['video_volume'] . ','; ?>
			muted: <?php echo $slide['video_muted']; ?>">
			<?php if ($slide['link']) { ?>
			<a href="<?php echo $slide['link']; ?>" class="swiper-slide__link">
				<?php echo $slide['description']; ?>
			</a>
			<?php } else { ?>
			<?php echo $slide['description']; ?>
			<?php } ?>
		</div>

		<?php } else { ?>

		<div class="swiper-slide <?php echo $slide['title']; ?>" data-slide-bg="<?php echo $slide['image']; ?>">
			<?php if ($slide['link']) { ?>
			<a href="<?php echo $slide['link']; ?>" class="swiper-slide__link">
				<?php echo $slide['description']; ?>
			</a>
			<?php } else { ?>
			<?php echo $slide['description']; ?>
			<?php } ?>
		</div>

		<?php } ?>
		<?php } ?>
		<?php } ?>
	</div>

	<?php if ($pagination) { ?>
	<div class="swiper-pagination" data-index-bullet="<?php echo $pagination_bullet_render; ?>" data-clickable="<?php echo $pagination_clickable; ?>"></div>
	<?php } ?>

	<?php if ($next_button) { ?>
	<div class="swiper-button-next"></div>
	<?php } ?>

	<?php if ($prev_button) { ?>
	<div class="swiper-button-prev"></div>
	<?php } ?>

	<?php if ($scrollbar && $loop === "false") { ?>
	<div class="swiper-scrollbar" data-draggable="<?php echo $scrollbar_draggable; ?>"></div>
	<?php } ?>
</div>