<?php if (count($languages) > 1) { ?>
<div class="box-language">
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-language">
		<div class="btn-group toggle-wrap">
			<span class="toggle">
				<?php foreach ($languages as $language) { ?>
				<?php if ($language['code'] == $code) { ?>
				<img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>">
				<?php echo $language['name']; ?>
				<?php } ?>
				<?php } ?>
				<span class="hidden-xs hidden-sm hidden-md hidden"><?php echo $text_language; ?></span>
			</span>
			<ul class="toggle_cont pull-right">
				<?php foreach ($languages as $language) { ?>
				<?php if ($language['code'] == $code) { ?>
				<li>
					<button class="language-select selected" type="button" name="<?php echo $language['code']; ?>">
						<img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" />
						<?php echo $language['name']; ?>
					</button>
				</li>
				<?php } else { ?>
				<li>
					<button class="language-select" type="button" name="<?php echo $language['code']; ?>">
						<img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" />
						<?php echo $language['name']; ?>
					</button>
				</li>
				<?php } ?>
				<?php } ?>
			</ul>
		</div>
		<input type="hidden" name="code" value="" />
		<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
	</form>
</div>
<?php } ?>
