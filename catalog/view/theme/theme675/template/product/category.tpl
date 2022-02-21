<?php echo $header; ?>
<div class="container">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
	<div class="row"><?php echo $column_left; ?>
		<?php if ($column_left && $column_right) { ?>
		<?php $class = 'col-sm-6'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'col-sm-9'; ?>
		<?php } else { ?>
		<?php $class = 'col-sm-12'; ?>
		<?php } ?>
		<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
			<h2><?php echo $heading_title; ?></h2>
			<?php if ($thumb || $description) { ?>
			<div class="row">
				<?php if ($thumb) { ?>
				<div class="col-sm-3">
					<img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" />
				</div>
				<?php } ?>
				<?php if ($description) { ?>
				<div class="<?php echo $thumb ? 'col-sm-9' : 'col-sm-12'; ?>">
					<?php echo $description; ?>
				</div>
				<?php } ?>
			</div>
			<hr>
			<?php } ?>
			<?php if ($categories) { ?>
			<h3><?php echo $text_refine; ?></h3>
			<div class="row">
				<ul class="box-subcat">
					<?php foreach ($categories as $category) { ?>
					<li class="col-sm-3">
						<div class="thumb">
							<?php if ($category['thumb']) { ?>
							<div class="image"><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" /></a></div>
							<?php } ?>
							<div class="name subcatname"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></div>
						</div>
					</li>
					<?php } ?>
				</ul>
			</div>
			<?php } ?>
			<?php if ($products) { ?>
			<div class="product-filter clearfix">
				<div class="product-filter_elem">
					<div class="button-view">
						<button type="button" id="list-view" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="material-design-view12"></i></button>
						<button type="button" id="grid-view" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="material-design-two375"></i></button>
					</div>
				</div>
				<div class="product-filter_elem sort">
					<label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
					<select id="input-sort" onchange="location = this.value;">
						<?php foreach ($sorts as $sorts) { ?>
						<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
						<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
						<?php } ?>
						<?php } ?>
					</select>
				</div>
				<div class="product-filter_elem show pull-right">
					<label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
					<select id="input-limit" onchange="location = this.value;">
						<?php foreach ($limits as $limits) { ?>
						<?php if ($limits['value'] == $limit) { ?>
						<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
						<?php } ?>
						<?php } ?>
					</select>
				</div>
				<div class="product-filter_elem">
					<div class="button-view">
						<a href="<?php echo $compare; ?>" id="compare-total" class="compare-total material-design-shuffle24" data-toggle="tooltip" title="<?php echo $text_compare; ?>"><span><?php echo $text_compare; ?></span>
						</a>
					</div>
				</div>
			</div>
			<div class="row">
				<?php $pr = 10000; $clr = 0; foreach ($products as $product) { $pr++; $clr++; ?>
				<div class="product-layout product-list col-xs-12" <?php echo (($class == 'col-sm-9' && $clr%3 == 0) || ($class == 'col-sm-6' && $clr%2 == 0) || ($class == 'col-sm-12' && $clr%4 == 0)) ? 'data-clear=""' : ''; ?>>
					<div class="product-thumb transition <?php if ($product['options']) echo 'options'; ?>">
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
										<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] . $pr; ?>"><?php echo $option['name']; ?></label>
										<div class="col-sm-12">
											<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id'] . $pr; ?>" class="form-control">
												<option value=""><?php echo $text_select; ?></option>
												<?php foreach ($option['product_option_value'] as $option_value) { ?>
												<option value="<?php echo $option_value['product_option_value_id']; ?>">
													<?php echo $option_value['name']; ?>
													<?php if ($option_value['price']) { ?>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
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
														<?php if ($option_value['price']) { ?>
														(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
														<?php } ?>
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
														<?php if ($option_value['price']) { ?>
														(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
														<?php } ?>
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
														<?php if ($option_value['price']) { ?>
														(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
														<?php } ?>
													</label>
												</div>
												<?php } ?>
											</div>
										</div>
									</div>
									<?php } ?>
									<?php if ($option['type'] == 'text') { ?>
									<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
										<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] . $pr; ?>"><?php echo $option['name']; ?></label>
										<div class="col-sm-12">
											<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id'] . $pr; ?>" class="form-control"/>
										</div>
									</div>
									<?php } ?>
									<?php if ($option['type'] == 'textarea') { ?>
									<div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
										<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] . $pr; ?>"><?php echo $option['name']; ?></label>
										<div class="col-sm-12">
											<textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id'] . $pr; ?>" class="form-control">
												<?php echo $option['value']; ?>
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
										<label class="control-label col-sm-12" for="input-option<?php echo $option['product_option_id'] . $pr; ?>">
											<?php echo $option['name']; ?>
										</label>
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
										<span><?php echo $button_cart; ?></span>
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
							<a class="lazy" style="padding-bottom: <?php echo ($product['img-height']/$product['img-width']*100); ?>%" href="<?php echo $product['href']; ?>">
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
							<div class="description">
								<?php echo $product['description']; ?>
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
									<i class="fa fa-star star  fa-stack-1x"></i>
								</span>
								<?php } ?>
								<?php } ?>
							</div>
							<?php } ?>
							<?php if ($product['price']) { ?>
							<div class="price price-product">
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
						<div class="aside">
							<button class="product-btn-add" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" <?php if (count($product['options']) > 3) { ?> onclick="cart.add('<?php echo $product['product_id']; ?>');" <?php } else { ?> onclick="ajaxAdd($(this),<?php echo $product['product_id'] ?>);" <?php } ?>>
							<i class="fa fa-shopping-cart"></i>
						</button>
														<button class="product-btn" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');">
								<i class="fa  fa-retweet"></i>
								<span><?php echo $button_compare; ?></span>
							</button>
							<button class="product-btn" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
								<i class="fa fa-heart"></i>
								<span><?php echo $button_wishlist; ?></span>
							</button>

						</div>
					</div>
					<div class="clear"></div>
				</div>
				<?php } ?>
			</div>
			<div class="row">
				<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
				<div class="col-sm-6 text-right"><?php echo $results; ?></div>
			</div>
			<?php } ?>
			<?php if (!$categories && !$products) { ?>
			<p><?php echo $text_empty; ?></p>
			<div class="buttons">
				<div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
			</div>
			<?php } ?>
			<?php echo $content_bottom; ?>
		</div>
		<?php echo $column_right; ?>
	</div>
</div>
<?php echo $footer; ?>
