<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-tm_slideshow" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary">
					<i class="fa fa-save"></i>
				</button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default">
					<i class="fa fa-reply"></i>
				</a>
			</div>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if ($error_warning) { ?>
		<div class="alert alert-danger">
			<i class="fa fa-exclamation-circle"></i>
			<?php echo $error_warning; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-pencil"></i>
					<?php echo $text_edit; ?>
				</h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-tm_slideshow" class="form-horizontal">
					<div class="panel-group" id="general-accordion">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#general-accordion" href="#collapse">
										<?php echo $text_general_settings; ?>
									</a>
								</h4>
							</div>
							<div id="collapse" class="panel-collapse collapse in">
								<div class="panel-body">
									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
										<div class="col-sm-10">
											<input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
											<?php if ($error_name) { ?>
											<div class="text-danger"><?php echo $error_name; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
										<div class="col-sm-10">
											<select name="status" id="input-status" class="form-control">
												<?php if ($status) { ?>
												<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
												<option value="0"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
												<option value="1"><?php echo $text_enabled; ?></option>
												<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
										<div class="col-sm-10">
											<input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
											<?php if ($error_width) { ?>
											<div class="text-danger"><?php echo $error_width; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
										<div class="col-sm-10">
											<input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
											<?php if ($error_height) { ?>
											<div class="text-danger"><?php echo $error_height; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="input-min_height"><?php echo $entry_min_height; ?></label>
										<div class="col-sm-10">
											<input type="text" name="min_height" value="<?php echo $min_height; ?>" placeholder="<?php echo $entry_min_height; ?>" id="input-min_height" class="form-control" />
											<?php if ($error_min_height) { ?>
											<div class="text-danger"><?php echo $error_min_height; ?></div>
											<?php } ?>
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-effect">
											<?php echo $entry_effect; ?>
										</label>
										<div class="col-sm-10">
											<select name="effect" id="input-effect" class="form-control">
												<option value="0" <?php if ($effect == "0") { ?> selected="selected" <?php } ?>><?php echo $text_slide; ?></option>
												<option value="1" <?php if ($effect == "1") { ?> selected="selected" <?php } ?>><?php echo $text_fade; ?></option>
												<option value="2" <?php if ($effect == "2") { ?> selected="selected" <?php } ?>><?php echo $text_cube; ?></option>
												<option value="3" <?php if ($effect == "3") { ?> selected="selected" <?php } ?>><?php echo $text_coverflow; ?></option>
												<option value="4" <?php if ($effect == "4") { ?> selected="selected" <?php } ?>><?php echo $text_flip; ?></option>
											</select>
										</div>
									</div>
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="input-speed"><?php echo $entry_speed; ?></label>
										<div class="col-sm-10">
											<input type="text" name="speed" value="<?php echo $speed; ?>" placeholder="<?php echo $entry_speed; ?>" id="input-speed" class="form-control" />
											<?php if ($error_speed) { ?>
											<div class="text-danger"><?php echo $error_speed; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">
											<?php echo $entry_autoplay; ?>
										</label>
										<div class="col-sm-10">
											<?php if ($autoplay) { ?>
											<label class="radio-inline">
												<input type="radio" name="autoplay" value="1" checked="checked" />
												<?php echo $text_yes; ?>
											</label>
											<label class="radio-inline">
												<input type="radio" name="autoplay" value="0" />
												<?php echo $text_no; ?>
											</label>
											<?php } else { ?>
											<label class="radio-inline">
												<input type="radio" name="autoplay" value="1" />
												<?php echo $text_yes; ?>
											</label>
											<label class="radio-inline">
												<input type="radio" name="autoplay" value="0" checked="checked" />
												<?php echo $text_no; ?>
											</label>
											<?php } ?>
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-2 control-label">
											<?php echo $entry_keyboard_control; ?>
										</label>
										<div class="col-sm-10">
											<?php if ($keyboard_control) { ?>
											<label class="radio-inline">
												<input type="radio" name="keyboard_control" value="1" checked="checked" />
												<?php echo $text_yes; ?>
											</label>
											<label class="radio-inline">
												<input type="radio" name="keyboard_control" value="0" />
												<?php echo $text_no; ?>
											</label>
											<?php } else { ?>
											<label class="radio-inline">
												<input type="radio" name="keyboard_control" value="1" />
												<?php echo $text_yes; ?>
											</label>
											<label class="radio-inline">
												<input type="radio" name="keyboard_control" value="0" checked="checked" />
												<?php echo $text_no; ?>
											</label>
											<?php } ?>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">
											<?php echo $entry_mousewheel_control; ?>
										</label>
										<div class="col-sm-10">
											<?php if ($mousewheel_control) { ?>
											<label class="radio-inline">
												<input type="radio" name="mousewheel_control" value="1" checked="checked" />
												<?php echo $text_yes; ?>
											</label>
											<label class="radio-inline">
												<input type="radio" name="mousewheel_control" value="0" />
												<?php echo $text_no; ?>
											</label>
											<?php } else { ?>
											<label class="radio-inline">
												<input type="radio" name="mousewheel_control" value="1" />
												<?php echo $text_yes; ?>
											</label>
											<label class="radio-inline">
												<input type="radio" name="mousewheel_control" value="0" checked="checked" />
												<?php echo $text_no; ?>
											</label>
											<?php } ?>
										</div>
									</div>
									<div class="form-group mousewheel-options <?php echo $mousewheel_control ? '' : 'hidden'; ?>">
										<label class="col-sm-2 control-label">
											<?php echo $entry_mousewheel_release_on_edges; ?>
										</label>
										<div class="col-sm-10">
											<?php if ($mousewheel_release_on_edges) { ?>
											<label class="radio-inline">
												<input type="radio" name="mousewheel_release_on_edges" value="1" checked="checked" />
												<?php echo $text_yes; ?>
											</label>
											<label class="radio-inline">
												<input type="radio" name="mousewheel_release_on_edges" value="0" />
												<?php echo $text_no; ?>
											</label>
											<?php } else { ?>
											<label class="radio-inline">
												<input type="radio" name="mousewheel_release_on_edges" value="1" />
												<?php echo $text_yes; ?>
											</label>
											<label class="radio-inline">
												<input type="radio" name="mousewheel_release_on_edges" value="0" checked="checked" />
												<?php echo $text_no; ?>
											</label>
											<?php } ?>
										</div>
									</div>
									<fieldset>
										<legend><?php echo $entry_navigation; ?></legend>
										<div class="form-group">
											<label class="col-sm-2 control-label">
												<?php echo $entry_next_button; ?>
											</label>
											<div class="col-sm-10">
												<?php if ($next_button) { ?>
												<label class="radio-inline">
													<input type="radio" name="next_button" value="1" checked="checked" />
													<?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="next_button" value="0" />
													<?php echo $text_no; ?>
												</label>
												<?php } else { ?>
												<label class="radio-inline">
													<input type="radio" name="next_button" value="1" />
													<?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="next_button" value="0" checked="checked" />
													<?php echo $text_no; ?>
												</label>
												<?php } ?>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">
												<?php echo $entry_prev_button; ?>
											</label>
											<div class="col-sm-10">
												<?php if ($prev_button) { ?>
												<label class="radio-inline">
													<input type="radio" name="prev_button" value="1" checked="checked" />
													<?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="prev_button" value="0" />
													<?php echo $text_no; ?>
												</label>
												<?php } else { ?>
												<label class="radio-inline">
													<input type="radio" name="prev_button" value="1" />
													<?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="prev_button" value="0" checked="checked" />
													<?php echo $text_no; ?>
												</label>
												<?php } ?>
											</div>
										</div>
									</fieldset>
									<fieldset>
										<legend><?php echo $entry_pagination; ?></legend>
										<div class="form-group">
											<label class="col-sm-2 control-label">
												<?php echo $entry_pagination; ?>
											</label>
											<div class="col-sm-10">
												<?php if ($pagination) { ?>
												<label class="radio-inline">
													<input type="radio" name="pagination" value="1" checked="checked" />
													<?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="pagination" value="0" />
													<?php echo $text_no; ?>
												</label>
												<?php } else { ?>
												<label class="radio-inline">
													<input type="radio" name="pagination" value="1" />
													<?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="pagination" value="0" checked="checked" />
													<?php echo $text_no; ?>
												</label>
												<?php } ?>
											</div>
										</div>
										<div class="form-group pagination-option <?php echo $pagination ? '' : 'hidden'; ?>">
											<label class="col-sm-2 control-label">
												<?php echo $entry_pagination_clickable; ?>
											</label>
											<div class="col-sm-10">
												<?php if ($pagination_clickable) { ?>
												<label class="radio-inline">
													<input type="radio" name="pagination_clickable" value="1" checked="checked" />
													<?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="pagination_clickable" value="0" />
													<?php echo $text_no; ?>
												</label>
												<?php } else { ?>
												<label class="radio-inline">
													<input type="radio" name="pagination_clickable" value="1" />
													<?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="pagination_clickable" value="0" checked="checked" />
													<?php echo $text_no; ?>
												</label>
												<?php } ?>
											</div>
										</div>
										<div class="form-group pagination-option <?php echo $pagination ? '' : 'hidden'; ?>">
											<label class="col-sm-2 control-label">
												<?php echo $entry_pagination_bullet_render; ?>
											</label>
											<div class="col-sm-10">
												<?php if ($pagination_bullet_render) { ?>
												<label class="radio-inline">
													<input type="radio" name="pagination_bullet_render" value="1" checked="checked" />
													<?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="pagination_bullet_render" value="0" />
													<?php echo $text_no; ?>
												</label>
												<?php } else { ?>
												<label class="radio-inline">
													<input type="radio" name="pagination_bullet_render" value="1" />
													<?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="pagination_bullet_render" value="0" checked="checked" />
													<?php echo $text_no; ?>
												</label>
												<?php } ?>
											</div>
										</div>
									</fieldset>
									<fieldset>
										<legend><?php echo $entry_scrollbar; ?></legend>
										<div class="form-group">
											<label class="col-sm-2 control-label">
												<?php echo $entry_scrollbar; ?>
											</label>
											<div class="col-sm-10">
												<?php if ($scrollbar) { ?>
												<label class="radio-inline">
													<input type="radio" name="scrollbar" value="1" checked="checked" />
													<?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="scrollbar" value="0" />
													<?php echo $text_no; ?>
												</label>
												<?php } else { ?>
												<label class="radio-inline">
													<input type="radio" name="scrollbar" value="1" />
													<?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="scrollbar" value="0" checked="checked" />
													<?php echo $text_no; ?>
												</label>
												<?php } ?>
											</div>
										</div>
										<div class="form-group scrollbar-option <?php echo $scrollbar ? '' : 'hidden'; ?>">
											<label class="col-sm-2 control-label">
												<?php echo $entry_scrollbar_draggable; ?>
											</label>
											<div class="col-sm-10">
												<?php if ($scrollbar_draggable) { ?>
												<label class="radio-inline">
													<input type="radio" name="scrollbar_draggable" value="1" checked="checked" />
													<?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="scrollbar_draggable" value="0" />
													<?php echo $text_no; ?>
												</label>
												<?php } else { ?>
												<label class="radio-inline">
													<input type="radio" name="scrollbar_draggable" value="1" />
													<?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="scrollbar_draggable" value="0" checked="checked" />
													<?php echo $text_no; ?>
												</label>
												<?php } ?>
											</div>
										</div>
									</fieldset>
									<div class="form-group">
										<hr>
										<label class="col-sm-2 control-label">
											<?php echo $entry_loop; ?>
										</label>
										<div class="col-sm-10">
											<?php if ($loop) { ?>
											<label class="radio-inline">
												<input type="radio" name="loop" value="1" checked="checked" />
												<?php echo $text_yes; ?>
											</label>
											<label class="radio-inline">
												<input type="radio" name="loop" value="0" />
												<?php echo $text_no; ?>
											</label>
											<?php } else { ?>
											<label class="radio-inline">
												<input type="radio" name="loop" value="1" />
												<?php echo $text_yes; ?>
											</label>
											<label class="radio-inline">
												<input type="radio" name="loop" value="0" checked="checked" />
												<?php echo $text_no; ?>
											</label>
											<?php } ?>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<fieldset>
						<legend><?php echo $text_slides_settings; ?></legend>
						<div class="panel-group" id="slide-accordion">
							<?php if (isset($slides) && $slides) { ?>
							<?php for ($s = 0; $s < sizeof($slides); $s++) { ?>
							<div id="slide-<?php echo $s; ?>" class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#slide-accordion" href="#collapse-<?php echo $s; ?>">
											<?php echo $entry_slide . ' ' . ($s + 1); ?>
										</a>
									</h4>
								</div>
								<div id="collapse-<?php echo $s; ?>" class="panel-collapse collapse">
									<div class="panel-body">
										<div class="form-group">
											<label class="col-sm-2 control-label">
												<?php echo $entry_slide_type; ?>
											</label>
											<div class="col-sm-10">
												<?php if ($slides[$s]['slide_type']) { ?>
												<label class="radio-inline">
													<input type="radio" name="slides[<?php echo $s; ?>][slide_type]" value="1" checked="checked" />
													<?php echo $text_video; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="slides[<?php echo $s; ?>][slide_type]" value="0" />
													<?php echo $text_image; ?>
												</label>
												<?php } else { ?>
												<label class="radio-inline">
													<input type="radio" name="slides[<?php echo $s; ?>][slide_type]" value="1" />
													<?php echo $text_video; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="slides[<?php echo $s; ?>][slide_type]" value="0" checked="checked" />
													<?php echo $text_image; ?>
												</label>
												<?php } ?>
											</div>
										</div>
										<div class="form-group video-options <?php echo $slides[$s]['slide_type'] ? '' : 'hidden'; ?>">
											<label class="col-sm-2 control-label">
												<?php echo $entry_video_loop; ?>
											</label>
											<div class="col-sm-10">
												<?php if ($slides[$s]['video_loop']) { ?>
												<label class="radio-inline">
													<input type="radio" name="slides[<?php echo $s; ?>][video_loop]" value="1" checked="checked" />
													<?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="slides[<?php echo $s; ?>][video_loop]" value="0" />
													<?php echo $text_no; ?>
												</label>
												<?php } else { ?>
												<label class="radio-inline">
													<input type="radio" name="slides[<?php echo $s; ?>][video_loop]" value="1" />
													<?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="slides[<?php echo $s; ?>][video_loop]" value="0" checked="checked" />
													<?php echo $text_no; ?>
												</label>
												<?php } ?>
											</div>
										</div>
										<div class="form-group video-options <?php echo $slides[$s]['slide_type'] ? '' : 'hidden'; ?>">
											<label class="col-sm-2 control-label">
												<?php echo $entry_video_autoplay; ?>
											</label>
											<div class="col-sm-10">
												<?php if ($slides[$s]['video_autoplay']) { ?>
												<label class="radio-inline">
													<input type="radio" name="slides[<?php echo $s; ?>][video_autoplay]" value="1" checked="checked" />
													<?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="slides[<?php echo $s; ?>][video_autoplay]" value="0" />
													<?php echo $text_no; ?>
												</label>
												<?php } else { ?>
												<label class="radio-inline">
													<input type="radio" name="slides[<?php echo $s; ?>][video_autoplay]" value="1" />
													<?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="slides[<?php echo $s; ?>][video_autoplay]" value="0" checked="checked" />
													<?php echo $text_no; ?>
												</label>
												<?php } ?>
											</div>
										</div>
										<div class="form-group required video-options <?php echo $slides[$s]['slide_type'] ? '' : 'hidden'; ?>">
											<label class="col-sm-2 control-label" for="input-video_playback_rate-<?php echo $s; ?>">
												<?php echo $entry_video_playback_rate; ?>
											</label>
											<div class="col-sm-10">
												<input type="text" name="slides[<?php echo $s; ?>][video_playback_rate]" value="<?php echo $slides[$s]['video_playback_rate'] ?>" placeholder="<?php echo $entry_video_playback_rate; ?>" id="input-video_playback_rate-<?php echo $s; ?>" class="form-control" />
												<?php if (isset($error_video_playback_rate[$s])) { ?>
												<div class="text-danger"><?php echo $error_video_playback_rate[$s]; ?></div>
												<?php } ?>
											</div>
										</div>
										<div class="form-group video-options <?php echo $slides[$s]['slide_type'] ? '' : 'hidden'; ?>">
											<label class="col-sm-2 control-label">
												<?php echo $entry_video_muted; ?>
											</label>
											<div class="col-sm-10">
												<?php if ($slides[$s]['video_muted']) { ?>
												<label class="radio-inline">
													<input type="radio" name="slides[<?php echo $s; ?>][video_muted]" value="1" checked="checked" />
													<?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="slides[<?php echo $s; ?>][video_muted]" value="0" />
													<?php echo $text_no; ?>
												</label>
												<?php } else { ?>
												<label class="radio-inline">
													<input type="radio" name="slides[<?php echo $s; ?>][video_muted]" value="1" />
													<?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="slides[<?php echo $s; ?>][video_muted]" value="0" checked="checked" />
													<?php echo $text_no; ?>
												</label>
												<?php } ?>
											</div>
										</div>
										<div class="form-group required volume-options <?php echo $slides[$s]['video_muted'] ? 'hidden' : ''; ?>">
											<label class="col-sm-2 control-label" for="input-video_volume-<?php echo $s; ?>">
												<?php echo $entry_video_volume; ?>
											</label>
											<div class="col-sm-10">
												<input type="text" name="slides[<?php echo $s; ?>][video_volume]" value="<?php echo $slides[$s]['video_volume'] ?>" placeholder="<?php echo $entry_video_volume; ?>" id="input-video_volume-<?php echo $s; ?>" class="form-control" />
												<?php if (isset($error_video_volume[$s])) { ?>
												<div class="text-danger"><?php echo $error_video_volume[$s]; ?></div>
												<?php } ?>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-image-<?php echo $s; ?>">
												<?php echo $entry_image; ?>
											</label>
											<div class="col-sm-10">
												<a href="" id="thumb-image-<?php echo $s; ?>" data-toggle="image" class="img-thumbnail">
													<img src="<?php echo $slides[$s]['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" />
												</a>
												<input type="hidden" name="slides[<?php echo $s; ?>][image]" value="<?php echo $slides[$s]['image']; ?>" id="input-image-<?php echo $s; ?>" />
											</div>
										</div>
										<div class="tab-pane">
											<div class="row">
												<div class="col-sm-10 col-sm-offset-2">
													<ul class="nav nav-tabs" id="language-<?php echo $s; ?>">
														<?php foreach ($languages as $language) { ?>
														<li>
															<a href="#language-<?php echo $s . '-' . $language['language_id']; ?>" data-toggle="tab">
																<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
																<?php echo $language['name']; ?>
															</a>
														</li>
														<?php } ?>
													</ul>
												</div>
											</div>
											<div class="tab-content">
												<?php foreach ($languages as $language) { ?>
												<div class="tab-pane" id="language-<?php echo $s . '-' . $language['language_id']; ?>">
													<div class="form-group">
														<label class="col-sm-2 control-label" for="input-title-<?php echo $s . '-' . $language['language_id']; ?>">
															<?php echo $entry_title; ?>
														</label>
														<div class="col-sm-10">
															<input type="text" name="slides[<?php echo $s; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo $slides[$s]['title'][$language['language_id']]; ?>" placeholder="<?php echo $entry_title; ?>" id="input-title-<?php echo $s . '-' . $language['language_id']; ?>" class="form-control" />
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label" for="input-description-<?php echo $s . '-' . $language['language_id']; ?>">
															<?php echo $entry_description; ?>
														</label>
														<div class="col-sm-10">
															<textarea name="slides[<?php echo $s; ?>][description][<?php echo $language['language_id']; ?>]" placeholder="<?php echo $entry_description; ?>" id="input-description-<?php echo $s . '-' . $language['language_id']; ?>" class="form-control">
																<?php echo isset($slides[$s]['description'][$language['language_id']]) ? $slides[$s]['description'][$language['language_id']] : ''; ?>
															</textarea>
														</div>
													</div>
												</div>
												<?php } ?>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-link-<?php echo $s; ?>"><?php echo $entry_link; ?></label>
											<div class="col-sm-10">
												<input type="text" name="slides[<?php echo $s; ?>][link]" value="<?php echo $slides[$s]['link']; ?>" placeholder="<?php echo $entry_link; ?>" id="input-link-<?php echo $s; ?>" class="form-control" />
											</div>
										</div>
									</div>
									<div class="panel-footer text-right">
										<button type="button" onclick="removeSlide($(this));" data-toggle="tooltip" title="<?php echo $text_remove_slide; ?>" class="btn btn-danger">
											<i class="fa fa-minus-circle"></i>
										</button>
									</div>
								</div>
							</div>
							<?php } ?>
							<?php } ?>
						</div>
					</fieldset>
					<div class="form-group">
						<div class="col-sm-12 text-right">
							<button type="button" onclick="addSlide();" data-toggle="tooltip" title="<?php echo $text_add_slide; ?>" class="btn btn-primary">
								<i class="fa fa-plus-circle"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>
<script type="text/javascript">

	var slides_count;

	$(document).ready(function(){

		$('[name=\'pagination\']').on('click', function(){
			toggle($(this), "1", $('.pagination-option'));
		});
		$('[name=\'scrollbar\']').on('click', function(){
			toggle($(this), "1", $('.scrollbar-option'));
		});
		$('[name=\'mousewheel_control\']').on('click', function(){
			toggle($(this), "1", $('.mousewheel-options'));
		});
		$('#slide-accordion').delegate('[name*=slide_type]', 'click', function(){
			toggle($(this), "1", $(this).closest('.panel-body').find('.video-options'));
		});
		$('#slide-accordion').delegate('[name*=video_muted]', 'click', function(){
			toggle($(this), "0", $(this).closest('.panel-body').find('.volume-options'));
		});
		UpdateDescription();
	});

	function addSlide() {
		if ($('#slide-accordion').find('[id^="slide-"]').length) {
			slides_count = $('#slide-accordion').find('[id^="slide-"]:last').attr('id').split("-")[1];
			slides_count++;
		}
		else {
			slides_count = 0;
		}
		html =  '<div id="slide-' + slides_count + '" class="panel panel-default">';
		html += '	<div class="panel-heading">';
		html += '		<h4 class="panel-title">';
		html += '			<a data-toggle="collapse" data-parent="#slide-accordion" href="#collapse-' + slides_count + '">';
		html += '				<?php echo $entry_slide ?> ' + (slides_count + 1) + '';
		html += '			</a>';
		html += '		</h4>';
		html += '	</div>';
		html += '	<div id="collapse-' + slides_count + '" class="panel-collapse collapse">';
		html += '		<div class="panel-body">';
		html += '			<div class="form-group">';
		html += '				<label class="col-sm-2 control-label">';
		html += '					<?php echo $entry_slide_type; ?>';
		html += '				</label>';
		html += '				<div class="col-sm-10">';
		html += '					<label class="radio-inline">';
		html += '						<input type="radio" name="slides[' + slides_count + '][slide_type]" value="1" />';
		html += '						<?php echo $text_video; ?>';
		html += '					</label>';
		html += '					<label class="radio-inline">';
		html += '						<input type="radio" name="slides[' + slides_count + '][slide_type]" value="0" checked="checked"/>';
		html += '						<?php echo $text_image; ?>';
		html += '					</label>';
		html += '				</div>';
		html += '			</div>';
		html += '			<div class="form-group video-options hidden">';
		html += '				<label class="col-sm-2 control-label">';
		html += '					<?php echo $entry_video_loop; ?>';
		html += '				</label>';
		html += '				<div class="col-sm-10">';
		html += '					<label class="radio-inline">';
		html += '						<input type="radio" name="slides[' + slides_count + '][video_loop]" value="1" />';
		html += '						<?php echo $text_yes; ?>';
		html += '					</label>';
		html += '					<label class="radio-inline">';
		html += '						<input type="radio" name="slides[' + slides_count + '][video_loop]" value="0" checked="checked" />';
		html += '						<?php echo $text_no; ?>';
		html += '					</label>';
		html += '				</div>';
		html += '			</div>';
		html += '			<div class="form-group video-options hidden">';
		html += '				<label class="col-sm-2 control-label">';
		html += '					<?php echo $entry_video_autoplay; ?>';
		html += '				</label>';
		html += '				<div class="col-sm-10">';
		html += '					<label class="radio-inline">';
		html += '						<input type="radio" name="slides[' + slides_count + '][video_autoplay]" value="1" />';
		html += '						<?php echo $text_yes; ?>';
		html += '					</label>';
		html += '					<label class="radio-inline">';
		html += '						<input type="radio" name="slides[' + slides_count + '][video_autoplay]" value="0" checked="checked" />';
		html += '						<?php echo $text_no; ?>';
		html += '					</label>';
		html += '				</div>';
		html += '			</div>';
		html += '			<div class="form-group required video-options hidden">';
		html += '				<label class="col-sm-2 control-label" for="input-video_playback_rate-' + slides_count + '">';
		html += '					<?php echo $entry_video_playback_rate; ?>';
		html += '				</label>';
		html += '				<div class="col-sm-10">';
		html += '					<input type="text" name="slides[' + slides_count + '][video_playback_rate]" value="" placeholder="<?php echo $entry_video_playback_rate; ?>" id="input-video_playback_rate-' + slides_count + '" class="form-control" />';
		html += '				</div>';
		html += '			</div>';
		html += '			<div class="form-group video-options hidden">';
		html += '				<label class="col-sm-2 control-label">';
		html += '					<?php echo $entry_video_muted; ?>';
		html += '				</label>';
		html += '				<div class="col-sm-10">';
		html += '					<label class="radio-inline">';
		html += '						<input type="radio" name="slides[' + slides_count + '][video_muted]" value="1" checked="checked" />';
		html += '						<?php echo $text_yes; ?>';
		html += '					</label>';
		html += '					<label class="radio-inline">';
		html += '						<input type="radio" name="slides[' + slides_count + '][video_muted]" value="0" />';
		html += '						<?php echo $text_no; ?>';
		html += '					</label>';
		html += '				</div>';
		html += '			</div>';
		html += '			<div class="form-group required volume-options hidden">';
		html += '				<label class="col-sm-2 control-label" for="input-video_volume-' + slides_count + '">';
		html += '					<?php echo $entry_video_volume; ?>';
		html += '				</label>';
		html += '				<div class="col-sm-10">';
		html += '					<input type="text" name="slides[' + slides_count + '][video_volume]" value="" placeholder="<?php echo $entry_video_volume; ?>" id="input-video_volume-' + slides_count + '" class="form-control" />';
		html += '				</div>';
		html += '			</div>';
		html += '			<div class="form-group">';
		html += '				<label class="col-sm-2 control-label" for="input-image-' + slides_count + '">';
		html += '					<?php echo $entry_image; ?>';
		html += '				</label>';
		html += '				<div class="col-sm-10">';
		html += '					<a href="" id="thumb-image-' + slides_count + '" data-toggle="image" class="img-thumbnail">';
		html += '						<img src="<?php echo $placeholder; ?>" alt="" title="" placeholder="<?php echo $placeholder; ?>" />';
		html += '					</a>';
		html += '					<input type="hidden" name="slides[' + slides_count + '][image]" value="" id="input-image-' + slides_count + '" />';
		html += '				</div>';
		html += '			</div>';
		html += '			<div class="tab-pane">';
		html += '				<div class="row">';
		html += '					<div class="col-sm-10 col-sm-offset-2">';
		html += '						<ul class="nav nav-tabs" id="language-' + slides_count + '">';
		html += '							<?php foreach ($languages as $language) { ?>';
		html += '							<li>';
		html += '								<a href="#language-' + slides_count + '-' + '<?php echo $language['language_id']; ?>" data-toggle="tab">';
		html += '									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />';
		html += '									<?php echo $language['name']; ?>';
		html += '								</a>';
		html += '							</li>';
		html += '							<?php } ?>';
		html += '						</ul>';
		html += '					</div>';
		html += '				</div>';
		html += '				<div class="tab-content">';
		html += '					<?php foreach ($languages as $language) { ?>';
		html += '					<div class="tab-pane" id="language-' + slides_count + '-' + '<?php echo $language['language_id']; ?>">';
		html += '						<div class="form-group">';
		html += '							<label class="col-sm-2 control-label" for="input-title-' + slides_count + '-' + '<?php echo $language['language_id']; ?>">';
		html += '								<?php echo $entry_title; ?>';
		html += '							</label>';
		html += '							<div class="col-sm-10">';
		html += '								<input type="text" name="slides[' + slides_count + '][title][<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_title; ?>" id="input-title-' + slides_count + '-' + '<?php echo $language['language_id']; ?>" class="form-control" />';
		html += '							</div>';
		html += '						</div>';
		html += '						<div class="form-group">';
		html += '							<label class="col-sm-2 control-label" for="input-description-' + slides_count + '-' + '<?php echo $language['language_id']; ?>">';
		html += '								<?php echo $entry_description; ?>';
		html += '							</label>';
		html += '							<div class="col-sm-10">';
		html += '								<textarea name="slides[' + slides_count + '][description][<?php echo $language['language_id']; ?>]" placeholder="<?php echo $entry_description; ?>" id="input-description-' + slides_count + '-' + '<?php echo $language['language_id']; ?>" class="form-control">';
		html += '								</textarea>';
		html += '							</div>';
		html += '						</div>';
		html += '					</div>';
		html += '					<?php } ?>';
		html += '				</div>';
		html += '			</div>';
		html += '			<div class="form-group">';
		html += '				<label class="col-sm-2 control-label" for="input-link-' + slides_count + '"><?php echo $entry_link; ?></label>';
		html += '				<div class="col-sm-10">';
		html += '					<input type="text" name="slides[' + slides_count + '][link]" value="" placeholder="<?php echo $entry_link; ?>" id="input-link-' + slides_count + '" class="form-control" />';
		html += '				</div>';
		html += '			</div>';
		html += '		</div>';
		html += '		<div class="panel-footer text-right">';
		html += '			<button type="button" onclick="removeSlide($(this));" data-toggle="tooltip" title="<?php echo $text_remove_slide; ?>" class="btn btn-danger">';
		html += '				<i class="fa fa-minus-circle"></i>';
		html += '			</button>';
		html += '		</div>';
		html += '	</div>';
		html += '</div>';
		$('#slide-accordion').append(html);
		UpdateDescription();
	}

	function removeSlide(e) {
		e.closest('[id*="slide-"]').remove();
	}

	function UpdateDescription() {
		if (!$('#slide-accordion').find('.nav').hasClass('active')) {
			$('#slide-accordion').find('.nav').find('a:first').tab('show');
		}
		$('#slide-accordion').find('.tab-content').find('[id^="input-description"]').each(function(){
			if (!$(this).attr('style')) {
				$(this).summernote({height: 300});
			}
		});
	}

	function toggle(e1, v, e2){
		if (e1.val() == v) {
			e2.removeClass('hidden');
		} else {
			e2.addClass('hidden');
		}
	}
</script>