<?php echo $header; ?>
<div class="container">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
	<div class="row">
		<?php echo $column_left; ?>
		<?php if ($column_left && $column_right) { ?>
		<?php $class = 'col-sm-6'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'col-sm-9'; ?>
		<?php } else { ?>
		<?php $class = 'col-sm-12'; ?>
		<?php } ?>
		<div id="content" class="<?php echo $class; ?>">
			<?php echo $content_top; ?>
			<div class="row">
				<?php if ($column_left || $column_right) { ?>
				<?php $class = 'col-sm-6'; ?>
				<?php } else { ?>
				<?php $class = 'col-sm-6 col-lg-8'; ?>
				<?php } ?>
				<div class="<?php echo $class; ?> product_page-left">
					<div class="product-gallery">
						<?php if ($images) { ?>
						<div class="row">
							<div class="col-lg-10 pull-right hidden-xs hidden-sm hidden-md">
								<img id="productZoom" src="<?php echo $images[0]['thumb']; ?>" data-zoom-image="<?php echo $images[0]['popup']; ?>"/>
							</div>
							<div class="col-lg-2 hidden-xs hidden-sm hidden-md image-thumb">
								<ul id="productGallery" class="image-additional" data-slide-width="<?php echo $image_additional_width; ?>">
									<?php foreach ($images as $image) { ?>
									<li>
										<a href="#" data-image="<?php echo $image['thumb']; ?>" data-zoom-image="<?php echo $image['popup']; ?>">
											<img src="<?php echo $image['additional']; ?>" alt="<?php echo $heading_title; ?>" />
										</a>
									</li>
									<?php } ?>
								</ul>
							</div>
							<div class="col-xs-12 hidden-lg image-thumb">
								<ul id="productFullGallery" class="image-additional" data-slide-width="<?php echo $image_additional_width; ?>">
									<?php foreach ($images as $image) { ?>
									<li>
										<a href="<?php echo $image['thumb']; ?>">
											<img src="<?php echo $image['thumb']; ?>" alt="<?php echo $heading_title; ?>" />
										</a>
									</li>
									<?php } ?>
								</ul>
							</div>
						</div>
						<?php } ?>
					</div>
				</div>
				<?php if ($column_left || $column_right) { ?>
				<?php $class = 'col-sm-6'; ?>
				<?php } else { ?>
				<?php $class = 'col-sm-6 col-lg-4'; ?>
				<?php } ?>
				<div class="<?php echo $class; ?> product_page-right">
					<div class="general_info product-info">
						<h2 class="product-title"><?php echo $heading_title; ?></h2>
						<!-- Prodyuct rating status -->
						<div class="rating-section product-rating-status">
							<?php if ($review_status) { ?>
							<div class="rating">
								<?php for ($i = 1; $i <= 5; $i++) { ?>
								<?php if ($rating < $i) { ?>
								<span class="fa-stack">
									<i class="fa fa-star fa-stack-1x"></i>
								</span>
								<?php } else { ?>
								<span class="fa-stack">
									<i class="fa fa-star fa-stack-1x"></i>
									<i class="fa fa-star star fa-stack-1x"></i>
								</span>
								<?php } ?>
								<?php } ?>
								<span class="review-link review-link-show">
									<a href="#"><?php echo $reviews; ?></a>
								</span>
								<span class="review-link review-link-write">
									<a href="#"><?php echo $text_write; ?></a>
								</span>
							</div>
							<?php } ?>
						</div>
						<?php if ($price) { ?>
						<div class="price-section">
							<span class="price-new"><?php echo $special; ?></span>
							<?php if (!$special) { ?>
							<span class="price-new"><?php echo $price; ?></span>
							<?php } else { ?>
							<span class="price-old"><?php echo $price; ?></span>
							<?php } ?>
							<?php if ($tax) { ?>
							<span class="tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span>
							<?php } ?>
							<div class="reward-block">
								<?php if ($points) { ?>
								<span class="reward"><strong><?php echo $text_points; ?></strong><?php echo $points; ?></span>
								<?php } ?>
								<?php if ($discounts) { ?>
								<?php foreach ($discounts as $discount) { ?>
								<span>
									<strong><?php echo $discount['quantity']; ?><?php echo $text_discount; ?> :</strong>
									<?php echo $discount['price']; ?>
								</span>
								<?php } ?>
								<?php } ?>
							</div>
						</div>
						<?php } ?>
						<ul class="list-unstyled product-section">
							<?php if ($manufacturer) { ?>
							<li><strong><?php echo $text_manufacturer; ?></strong>
								<a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a>
							</li>
							<?php } ?>
							<li>
								<strong><?php echo $text_model; ?></strong>
								<span><?php echo $model; ?></span>
							</li>
							<?php if ($reward) { ?>
							<li>
								<strong><?php echo $text_reward; ?></strong>
								<span><?php echo $reward; ?></span>
							</li>
							<?php } ?>
							<li>
								<strong><?php echo $text_stock; ?></strong>
								<span class="<?php echo($stock_status <= 0 ? 'out-stock' : 'stock'); ?>"><?php echo $stock; ?></span>
							</li>
						</ul>
					</div>
					<div id="product">
						<?php if ($options) { ?>
						<div class="product-options">
							<h3><?php echo $text_option; ?></h3>
							<?php foreach ($options as $option) { ?>
							<?php if ($option['type'] == 'select') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
								<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
									<option value=""><?php echo $text_select; ?></option>
									<?php foreach ($option['product_option_value'] as $option_value) { ?>
									<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
										<?php if ($option_value['price']) { ?>
										(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
										<?php } ?>
									</option>
									<?php } ?>
								</select>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'radio') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								<label class="control-label"><?php echo $option['name']; ?></label>
								<div id="input-option<?php echo $option['product_option_id']; ?>">
									<?php foreach ($option['product_option_value'] as $option_value) { ?>
									<div class="radio">
										<label>
											<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
											<?php echo $option_value['name']; ?>
											<?php if ($option_value['price']) { ?>
											(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
											<?php } ?>
										</label>
									</div>
									<?php } ?>
								</div>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'checkbox') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								<label class="control-label"><?php echo $option['name']; ?></label>
								<div id="input-option<?php echo $option['product_option_id']; ?>">
									<?php foreach ($option['product_option_value'] as $option_value) { ?>
									<div class="checkbox">
										<label>
											<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
											<?php if ($option_value['image']) { ?>
											<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
											<?php } ?>
											<?php echo $option_value['name']; ?>
											<?php if ($option_value['price']) { ?>
											(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
											<?php } ?>
										</label>
									</div>
									<?php } ?>
								</div>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'image') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								<label class="control-label"><?php echo $option['name']; ?></label>
								<div id="input-option<?php echo $option['product_option_id']; ?>">
									<?php foreach ($option['product_option_value'] as $option_value) { ?>
									<div class="radio">
										<label>
											<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
											<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
											<?php if ($option_value['price']) { ?>
											(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
											<?php } ?>
										</label>
									</div>
									<?php } ?>
								</div>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'text') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
								<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'textarea') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
								<textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'file') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								<label class="control-label"><?php echo $option['name']; ?></label>
								<button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
								<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'date') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
								<div class="input-group date">
									<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
									<span class="input-group-btn">
										<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
									</span>
								</div>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'datetime') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
								<div class="input-group datetime">
									<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
									<span class="input-group-btn">
										<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									</span>
								</div>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'time') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
								<div class="input-group time">
									<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
									<span class="input-group-btn">
										<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									</span>
								</div>
							</div>
							<?php } ?>
							<?php } ?>
						</div>
						<?php } ?>
						<!-- product reccurings -->
						<?php if ($recurrings) { ?>
						<div class="product-reccurings">
							<h3><?php echo $text_payment_recurring ?></h3>
							<div class="form-group required">
								<select name="recurring_id" class="form-control">
									<option value=""><?php echo $text_select; ?></option>
									<?php foreach ($recurrings as $recurring) { ?>
									<option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
									<?php } ?>
								</select>
								<div class="help-block" id="recurring-description"></div>
							</div>
						</div>
						<?php } ?>
						<!-- Add to cart form -->
						<div class="form-group form-horizontal">
							<div class="form-group">
								<div class="col-sm-12 quantity">
									<label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
									<a class="counter counter-minus material-design-horizontal39" href='#'></a>
									<input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control"/>
									<input type="hidden" name="product_id" value="<?php echo $product_id; ?>"/>
									<a class="counter counter-plus material-design-add186" href='#'></a>
									<button <?php echo $stock_status <= 0 ? 'disabled' : ''; ?> type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="product-btn-add"><?php echo $stock_status <= 0 ? $stock : $button_cart; ?></button>
								</div>
							</div>
						</div>
						<ul class="product-buttons">
														<li>
								<button type="button" class="product-btn" onclick="compare.add('<?php echo $product_id; ?>');">
									<i class="fa  fa-retweet"></i>
									<span><?php echo $button_compare; ?></span>
								</button>
							</li>
							<li>
								<button class="product-btn" onclick="wishlist.add('<?php echo $product_id; ?>');"><i
									class="fa fa-heart"></i> <span
									><?php echo $button_wishlist; ?></span>
								</button>
							</li>

						</ul>
						<?php if ($tags) { ?>
						<!-- Product tags -->
						<div class="product-tags">
							<?php echo $text_tags; ?>
							<?php for ($i = 0; $i < count($tags); $i++) { ?>
							<?php if ($i < (count($tags) - 1)) { ?>
							<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
							<?php } else { ?>
							<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
							<?php } ?>
							<?php } ?>
						</div>
						<?php } ?>
						<div class="product-share">
							<!-- AddThis Button BEGIN -->
							<div class="addthis_sharing_toolbox"></div>
							<!-- Go to www.addthis.com/dashboard to customize your tools -->
							<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-55e053ac02ebd38e" async="async"></script>
							<!-- AddThis Button END -->
						</div>
						<?php if ($minimum > 1) { ?>
						<div class="alert alert-info">
							<i class="material-design-round52"></i>
							<?php echo $text_minimum; ?>
						</div>
						<?php } ?>
					</div>
				</div>
			</div>
			<div class="product_tabs">
				<ul class="nav nav-tabs">
					<li class="active">
						<a href="#tab-description" data-toggle="tab">
							<?php echo $tab_description; ?>
						</a>
					</li>
					<?php if ($attribute_groups) { ?>
					<li>
						<a href="#tab-specification" data-toggle="tab">
							<?php echo $tab_attribute; ?>
						</a>
					</li>
					<?php } ?>
					<?php if ($review_status) { ?>
					<li>
						<a href="#tab-review" data-toggle="tab">
							<?php echo $tab_review; ?>
						</a>
					</li>
					<?php } ?>
					<?php if ($video) { ?>
					<li>
						<a href="#tab-video" data-toggle="tab">
							<?php echo $tab_video; ?>
						</a>
					</li>
					<?php } ?>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="tab-description">
						<?php echo $description; ?>
					</div>
					<?php if ($attribute_groups) { ?>
					<div class="tab-pane product-spec product-section" id="tab-specification">
						<table class="table table-bordered">
							<?php foreach ($attribute_groups as $attribute_group) { ?>
							<thead>
								<tr>
									<th colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></th>
								</tr>
							</thead>
							<tbody>
								<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
								<tr>
									<td><?php echo $attribute['name']; ?></td>
									<td><?php echo $attribute['text']; ?></td>
								</tr>
								<?php } ?>
							</tbody>
							<?php } ?>
						</table>
					</div>
					<?php } ?>
					<?php if ($review_status) { ?>
					<div class="tab-pane product-reviews" id="tab-review">
						<form class="form-horizontal" id="form-review">
							<div id="review"></div>
							<div class="review-form-title">
								<h3 class="product-section_title" id="reviews_form_title"><?php echo $text_write; ?></h3>
							</div>
							<div class="product-review-form" id="reviews_form">
								<?php if ($review_guest) { ?>
								<div class="form-group required">
									<div class="col-sm-12">
										<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
										<input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
									</div>
								</div>
								<div class="form-group required">
									<div class="col-sm-12">
										<label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
										<textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
										<div class="help-block"><?php echo $text_note; ?></div>
									</div>
								</div>
								<div class="form-group required">
									<div class="col-sm-12">
										<label class="control-label"><?php echo $entry_rating; ?></label>
										&nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
										<input type="radio" name="rating" value="1" />
										&nbsp;
										<input type="radio" name="rating" value="2" />
										&nbsp;
										<input type="radio" name="rating" value="3" />
										&nbsp;
										<input type="radio" name="rating" value="4" />
										&nbsp;
										<input type="radio" name="rating" value="5" />
										&nbsp;<?php echo $entry_good; ?>
									</div>
								</div>
								<?php echo $captcha; ?>
								<div class="buttons clearfix">
									<div class="pull-right">
										<button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary">
											<?php echo $button_continue; ?>
										</button>
									</div>
								</div>
								<?php } else { ?>
								<?php echo $text_login; ?>
								<?php } ?>
							</div>
						</form>
					</div>
					<?php } ?>
					<?php if ($video) { ?>
					<div id="tab-video" class="tab-pane product-video product-section">
						<div class="r_frame">
							<?php echo $video; ?>
						</div>
						<div class="clearfix"></div>
					</div>
					<?php }?>
				</div>
			</div>
			<!-- related Products -->
			<?php if ($products) { ?>
			<div class="box-heading">
				<h3><?php echo $text_related; ?></h3>
			</div>
			<div class="box-content">
				<div class="box-carousel">
					<?php $pr = 10000; foreach ($products as $product) { $pr++; ?>
					<div class="product-thumb transition <?php if ($product['options']) echo 'options';?>">
						<?php if ($product['options']) { ?>
						<!-- Product options -->
						<div class="product-option-wrap">
							<div class="product-options form-horizontal">
								<div class="options">
									<a class="ajax-overlay_close" href='#'></a>
									<h3><?php echo $text_option; ?></h3>
									<div class="form-group hidden">
										<div class="col-sm-8">
											<input type="text" name="product_id" value="<?php echo $product['product_id'] ?>" class="form-control"/>
										</div>
									</div>
									<?php foreach ($product['options'] as $option) { ?>
									<?php if ($option['type'] == 'select') { ?>
									<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
										<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] . $pr; ?>">
											<?php echo $option['name']; ?>
										</label>
										<div class="col-sm-12">
											<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id'] . $pr; ?>" class="form-control">
												<option value=""><?php echo $text_select; ?></option>
												<?php foreach ($option['product_option_value'] as $option_value) { ?>
												<option value="<?php echo $option_value['product_option_value_id']; ?>">
													<?php echo $option_value['name']; ?>
													<?php if ($option_value['price']) { ?>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)<?php } ?>
												</option>
												<?php } ?>
											</select>
										</div>
									</div>
									<?php } ?>
									<?php if ($option['type'] == 'radio') { ?>
									<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
										<label class="control-label col-sm-12">
											<?php echo $option['name']; ?>
										</label>
										<div class="col-sm-12">
											<div id="input-option<?php echo $option['product_option_id'] . $pr; ?>">
												<?php foreach ($option['product_option_value'] as $option_value) { ?>
												<div class="radio">
													<label for="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id'] . $pr; ?>]">
														<input type="radio" hidden name="option[<?php echo $option['product_option_id']; ?>]" id="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id'] . $pr; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>"/>
														<?php echo $option_value['name']; ?>
														<?php if ($option_value['price']) { ?>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)<?php } ?>
													</label>
												</div>
												<?php } ?>
											</div>
										</div>
									</div>
									<?php } ?>
									<?php if ($option['type'] == 'checkbox') { ?>
									<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
										<label class="control-label col-sm-12">
											<?php echo $option['name']; ?>
										</label>
										<div class="col-sm-12">
											<div id="input-option<?php echo $option['product_option_id'] . $pr; ?>">
												<?php foreach ($option['product_option_value'] as $option_value) { ?>
												<div class="checkbox">
													<label>
														<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>"/>
														<?php echo $option_value['name']; ?>
														<?php if ($option_value['price']) { ?>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)<?php } ?>
													</label>
												</div>
												<?php } ?>
											</div>
										</div>
									</div>
									<?php } ?>
									<?php if ($option['type'] == 'image') { ?>
									<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
										<label class="control-label col-sm-12">
											<?php echo $option['name']; ?>
										</label>
										<div class="col-sm-12">
											<div id="input-option<?php echo $option['product_option_id'] . $pr; ?>">
												<?php foreach ($option['product_option_value'] as $option_value) { ?>
												<div class="radio">
													<label>
														<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>"/>
														<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail"/> <?php echo $option_value['name']; ?>
														<?php if ($option_value['price']) { ?>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)<?php } ?>
													</label>
												</div>
												<?php } ?>
											</div>
										</div>
									</div>
									<?php } ?>
									<?php if ($option['type'] == 'text') { ?>
									<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
										<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] . $pr; ?>">
											<?php echo $option['name']; ?>
										</label>
										<div class="col-sm-12">
											<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id'] . $pr; ?>" class="form-control"/>
										</div>
									</div>
									<?php } ?>
									<?php if ($option['type'] == 'textarea') { ?>
									<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
										<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] . $pr; ?>">
											<?php echo $option['name']; ?>
										</label>
										<div class="col-sm-12">
											<textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id'] . $pr; ?>" class="form-control"><?php echo $option['value']; ?>
											</textarea>
										</div>
									</div>
									<?php } ?>
									<?php if ($option['type'] == 'file') { ?>
									<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
										<label class="control-label col-sm-12">
											<?php echo $option['name']; ?>
										</label>
										<div class="col-sm-12">
											<button type="button" id="button-upload<?php echo $option['product_option_id'] . $pr; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-block btn-default">
												<i class="fa fa-upload"></i>
												<?php echo $button_upload; ?>
											</button>
											<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id'] . $pr; ?>"/>
										</div>
									</div>
									<?php } ?>
									<?php if ($option['type'] == 'date') { ?>
									<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
										<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] . $pr; ?>">
											<?php echo $option['name']; ?>
										</label>
										<div class="col-sm-12">
											<div class="input-group date">
												<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id'] . $pr; ?>" class="form-control"/>
												<span class="input-group-btn">
													<button class="btn btn-default" type="button">
														<i class="fa fa-calendar"></i>
													</button>
												</span>
											</div>
										</div>
									</div>
									<?php } ?>
									<?php if ($option['type'] == 'datetime') { ?>
									<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
										<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] . $pr; ?>"><?php echo $option['name']; ?></label>
										<div class="col-sm-12">
											<div class="input-group datetime">
												<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id'] . $pr; ?>" class="form-control"/>
												<span class="input-group-btn">
													<button type="button" class="btn btn-default">
														<i class="fa fa-calendar"></i>
													</button>
												</span>
											</div>
										</div>
									</div>
									<?php } ?>
									<?php if ($option['type'] == 'time') { ?>
									<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
										<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] . $pr; ?>">
											<?php echo $option['name']; ?>
										</label>
										<div class="col-sm-12">
											<div class="input-group time">
												<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id'] . $pr; ?>" class="form-control"/>
												<span class="input-group-btn">
													<button type="button" class="btn btn-default">
														<i class="fa fa-calendar"></i>
													</button>
												</span>
											</div>
										</div>
									</div>
									<?php } ?>
									<?php } ?>
									<button class="product-btn-add" type="button" onclick="cart.addPopup($(this),'<?php echo $product['product_id']; ?>');">
										<span><?php echo $button_cart; ?></span>
									</button>
								</div>
							</div>
						</div>
						<?php } ?>
						<div class="quick_info">
							<div id="quickview_<?php echo $pr; ?>" class="quickview-style">
								<div class="left col-sm-4">
									<div class="quickview_image image">
										<a href="<?php echo $product['href']; ?>">
											<img alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" src="<?php echo $product['thumb']; ?>"/>
										</a>
									</div>
								</div>
								<div class="right col-sm-8">
									<h2><?php echo $product['name']; ?></h2>
									<div class="inf">
										<?php if ($product['author']) { ?>
										<p class="quickview_manufacture manufacture manufacture">
											<?php echo $text_manufacturer; ?>
											<a href="<?php echo $product['manufacturers']; ?>"><?php echo $product['author']; ?></a>
										</p>
										<?php } ?>
										<?php if ($product['model']) { ?>
										<p class="product_model model">
											<?php echo $text_model; ?> <?php echo $product['model']; ?>
										</p>
										<?php } ?>
										<?php if ($product['price']) { ?>
										<div class="price">
											<?php if (!$product['special']) { ?>
											<?php echo $product['price']; ?>
											<?php } else { ?>
											<span class="price-new"><?php echo $product['special']; ?></span>
											<span class="price-old"><?php echo $product['price']; ?></span>
											<?php } ?>
											<?php if ($product['tax']) { ?>
											<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
											<?php } ?>
										</div>
										<?php } ?>
									</div>
									<?php if ($product['rating']) { ?>
									<div class="rating">
										<?php for ($i = 1; $i <= 5; $i++) { ?>
										<?php if ($product['rating'] < $i) { ?>
										<span class="fa-stack">
											<i class="fa fa-star fa-stack-1x"></i>
										</span>
										<?php } else { ?>
										<span class="fa-stack">
											<i class="fa fa-star fa-stack-1x"></i>
											<i class="fa fa-star star fa-stack-1x"></i>
										</span>
										<?php } ?>
										<?php } ?>
									</div>
									<?php } ?>
									<button class="product-btn-add" data-toggle="tooltip" title="<?php echo $button_cart; ?>" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');">
										<i class="fa fa-shopping-cart"></i>
									</button>
									<ul class="product-buttons">
																				<li>
											<button class="btn btn-icon" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');">
												<i class="fa  fa-retweet"></i>
												<span><?php echo $button_compare; ?></span>
											</button>
										</li>
										<li>
											<button class="btn btn-icon" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
												<i class="fa fa-heart"></i>
												<span><?php echo $button_wishlist; ?></span>
											</button>
										</li>

									</ul>
									<div class="clear"></div>
								</div>
								<div class="col-sm-12">
									<div class="quickview_description description">
										<?php echo $product['description1']; ?>
									</div>
								</div>
							</div>
						</div>
						<?php if ($product['special']) { ?>
						<?php if ($label_sale) { ?>
						<div class="sale">
							<span><?php echo $text_sale; ?></span>
						</div>
						<?php } ?>
						<?php if ($label_discount) { ?>
						<div class="discount">
							<span><?php echo $product['label_discount']; ?></span>
						</div>
						<?php } ?>
						<?php } ?>
						<?php if ($product['label_new']) { ?>
						<div class="new-pr"><span><?php echo $text_new; ?></span></div>
						<?php } ?>
						<div class="image">
							<a class="lazy" style="padding-bottom: <?php echo($product['img-height'] / $product['img-width'] * 100); ?>%" href="<?php echo $product['href']; ?>">
								<img alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" data-src="<?php echo $product['thumb']; ?>" src="#"/>
							</a>
							<a class="quickview" data-toggle="tooltip" title="<?php echo $text_quick; ?>"  data-rel="details" href="#quickview_<?php echo $pr; ?>">
								<i class="fa fa-plus"></i>
							</a>
						</div>
						<div class="caption">
							<div class="name">
								<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
							</div>
							<div class="description"><?php echo $product['description']; ?></div>
							<?php if ($product['rating']) { ?>
							<div class="rating">
								<?php for ($i = 1; $i <= 5; $i++) { ?>
								<?php if ($product['rating'] < $i) { ?>
								<span class="fa-stack">
									<i class="fa fa-star fa-stack-1x"></i>
								</span>
								<?php } else { ?>
								<span class="fa-stack">
									<i class="fa fa-star fa-stack-1x"></i>
									<i class="fa fa-star star fa-stack-1x"></i>
								</span>
								<?php } ?>
								<?php } ?>
							</div>
							<?php } ?>
							<?php if ($product['price']) { ?>
							<div class="price">
								<?php if (!$product['special']) { ?>
								<?php echo $product['price']; ?>
								<?php } else { ?>
								<span class="price-new"><?php echo $product['special']; ?></span> 
								<span class="price-old"><?php echo $product['price']; ?></span>
								<?php } ?>
								<?php if ($product['tax']) { ?>
								<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
								<?php } ?>
							</div>
							<?php } ?>
						</div>
						<div class="cart-button">
								<button class="product-btn-add" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" <?php if (count($product['options']) > 3) { ?> onclick="cart.add('<?php echo $product['product_id']; ?>');" <?php } else { ?> onclick="ajaxAdd($(this),<?php echo $product['product_id'] ?>);" <?php } ?>>
							<i class="fa fa-shopping-cart"></i>
						</button>
							<button class="product-btn" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
								<i class="fa fa-heart"></i>
							</button>
							<button class="product-btn" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');">
								<i class="fa  fa-retweet"></i>
							</button>

						</div>
					</div>
					<?php } ?>
				</div>
			</div>
			<?php } ?>
			<?php echo $content_bottom; ?>
		</div>
		<?php echo $column_right; ?>
	</div>
</div>
<script>
	(function ($) {
		$(document).ready(function () {
			$('.review-link a').click(function (e) {
				e.preventDefault();
				$('.product_tabs a[href="#tab-review"').tab('show');

			})
			$('.review-link-show').click(function () {
				$('html, body').animate({
					'scrollTop': $('.product_tabs').offset().top - ($('#stuck').outerHeight() + 50)
				}, 1000);
			})
			$('.review-link-write').click(function () {
				$('html, body').animate({
					'scrollTop': $('#reviews_form_title').offset().top - ($('#stuck').outerHeight() + 50)
				}, 1000);
				$('#reviews_form_title').addClass('close-tab').parents('#tab-review').find('#reviews_form').slideDown();
			})
			$('.product_tabs li:first-child a').tab('show');
		});
	})(jQuery);

	document.getElementById('input-quantity').onkeypress = function (e) {

		e = e || event;

		if (e.ctrlKey || e.altKey || e.metaKey) return;

		var chr = getChar(e);

		if (chr == null) return;

		if (chr < '0' || chr > '9') {
			return false;
		}

	}

	function getChar(event) {
		if (event.which == null) {
			if (event.keyCode < 32) return null;
			return String.fromCharCode(event.keyCode)
		}

		if (event.which != 0 && event.charCode != 0) {
			if (event.which < 32) return null;
			return String.fromCharCode(event.which)
		}

		return null;
	}
	jQuery('#reviews_form_title').addClass('close-tab');
	jQuery('#reviews_form_title').on("click", function () {
		if (jQuery(this).hasClass('close-tab')) {
			jQuery(this).removeClass('close').parents('#tab-review').find('#reviews_form').slideToggle();
		}
		else {
			jQuery(this).addClass('close-tab').parents('#tab-review').find('#reviews_form').slideToggle();
		}
	})
</script>

<script type="text/javascript">
	$('select[name=\'recurring_id\'], input[name="quantity"]').change(function () {
		$.ajax({
			url: 'index.php?route=product/product/getRecurringDescription',
			type: 'post',
			data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
			dataType: 'json',
			beforeSend: function () {
				$('#recurring-description').html('');
			},
			success: function (json) {
				$('.alert, .text-danger').remove();

				if (json['success']) {
					$('#recurring-description').html(json['success']);
				}
			}
		});
	});
</script>

<script type="text/javascript">
	$('#button-cart').on('click', function () {
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
			dataType: 'json',
			beforeSend: function () {
				$('#button-cart').button('loading');
			},
			complete: function () {
				$('#button-cart').button('reset');
			},
			success: function (json) {
				clearTimeout(timer);
				$('.alert, .text-danger').remove();
				$('.form-group').removeClass('has-error');

				if (json['error']) {
					if (json['error']['option']) {
						for (i in json['error']['option']) {
							var element = $('#input-option' + i.replace('_', '-'));

							if (element.parent().hasClass('input-group')) {
								element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
							} else {
								element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
							}
						}
					}

					if (json['error']['recurring']) {
						$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
					}

					if (json['error']['quantity']){
						$('#content').parent().before('<div class="alert alert-danger"><i class="material-design-cancel19"></i>' + json['error']['quantity'] + ' <button type="button" class="close material-design-close47"></button> </div>');
					}

					$('.text-danger').parent().addClass('has-error');
				}

				if (json['success']) {
					$('#content').parent().before('<div class="alert alert-success"><i class="material-design-verification24"></i> ' + json['success'] + '<button type="button" class="close material-design-close47"></button></div>');


					$('#cart-total').html(json['total']);
					$('#cart-total2').html(json['total2']);
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
				timer = setTimeout(function () {
					$('.alert').addClass('fadeOut');
				}, 4000)
			}
		});
	});
</script>

<script type="text/javascript">
	$('#review').delegate('.pagination a', 'click', function (e) {
		e.preventDefault();

		$('#review').fadeOut('slow');

		$('#review').load(this.href);

		$('#review').fadeIn('slow');
	});

	$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

	$('#button-review').on('click', function () {
		$.ajax({
			url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
			type: 'post',
			dataType: 'json',
			data: $("#form-review").serialize(),
			beforeSend: function () {
				$('#button-review').button('loading');
			},
			complete: function () {
				$('#button-review').button('reset');
			},
			success: function (json) {
				$('.alert-success, .alert-danger').remove();

				if (json['error']) {
					$('#review').after('<div class="alert alert-danger"><i class="material-design-cancel19"></i> ' + json['error'] + '</div>');
				}

				if (json['success']) {
					$('#review').after('<div class="alert alert-success"><i class="material-design-verification24"></i> ' + json['success'] + '</div>');

					$('input[name=\'name\']').val('');
					$('textarea[name=\'text\']').val('');
					$('input[name=\'rating\']:checked').prop('checked', false);
				}
			}
		});
	});
</script>

<script type="text/javascript">
	var disqus_shortname = 'thtest123';

	(function () {
		var s = document.createElement('script');
		s.async = true;
		s.type = 'text/javascript';
		s.src = '//' + disqus_shortname + '.disqus.com/count.js';
		(document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
	}());
</script>
<?php echo $footer; ?>