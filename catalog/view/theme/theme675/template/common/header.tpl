<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="<?php echo $responsive ? 'mobile-responsive-off' : ''; ?>">
<!--<![endif]-->
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title><?php echo $title; ?></title>
	<base href="<?php echo $base; ?>" />
	<?php if ($description) { ?>
	<meta name="description" content="<?php echo $description; ?>" />
	<?php } ?>
	<?php if ($keywords) { ?>
	<meta name="keywords" content= "<?php echo $keywords; ?>" />
	<?php } ?>
	<?php foreach ($add_this_meta as $meta) { ?>
	<meta property="og:<?php echo $meta['property'] ?>" content="<?php echo $meta['content'] ?>" /> 
	<?php } ?>
	<!-- Fonts -->
	<link href='//fonts.googleapis.com/css?family=Merriweather:400,700&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
	<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<!-- END Fonts -->
	<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
	<link href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" rel="stylesheet">
	<link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/stylesheet.css" rel="stylesheet">
	<link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/material-design.css" rel="stylesheet">
	<link href="catalog/view/theme/<?php echo $theme_path; ?>/js/fancybox/jquery.fancybox.css" rel="stylesheet">

	<link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/photoswipe.css" rel="stylesheet">
<!-- 	<link href="catalog/view/theme/<?php echo $theme_path; ?>/js/jquery.bxslider/jquery.bxslider.css" rel="stylesheet"> -->

	<?php foreach ($styles as $style) { ?>
	<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
	<?php } ?>
	<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
	<?php } ?>

	<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
	<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

	<?php foreach ($scripts as $script) { ?>
	<script src="<?php echo $script; ?>" type="text/javascript"></script>
	<?php } ?>
	<?php foreach ($analytics as $analytic) { ?>
	<?php echo $analytic; ?>
	<?php } ?>
</head>
<body class="<?php echo $class; ?>">
	<p id="gl_path" class="hidden"><?php echo $theme_path; ?></p>
	<div id="page">
		<div class="ie-warning">
			<a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
				<img src="catalog/view/theme/<?php echo $theme_path; ?>/image/warning_bar_0000_us.jpg" border="0" height="75" width="1170" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today."/>
			</a>
		</div>
		<header>
			<?php if ($promobanner) { ?>
			    <?php echo $promobanner; ?>
			<?php } ?>
			<div class="top-line">
				<div class="container">
					<div class="fleft">
						<div class="toggle-wrap login-form">
							<a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="toggle">
								<span><?php echo $text_account; ?></span>
								<i class="fa fa-angle-down"></i>
							</a>
							<div class="toggle_cont">
								<h3><?php echo $login_form_title; ?></h3>
								<?php if ($logged) { ?>
									<div><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></div>
									<div><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></div>
									<div><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></div>
									<div><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></div>
									<div><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></div>
								<?php } else { ?>
									<?php echo $login_form; ?>
									<a href="<?php echo $register; ?>"><?php echo $login_register; ?></a>
								<?php } ?>
							</div>
						</div>
						<nav id="top-links" class="nav toggle-wrap">
							<a class="toggle material-design-settings49" href='#'></a>
							<div class="toggle_cont">
								<div class="hidden-block">
									<a href="<?php echo $compare; ?>" id="compare-total2" title="<?php echo $text_compare; ?>">
										<i class="material-design-shuffle24"></i>
										<span><?php echo $text_compare; ?></span>
									</a>
								</div>
								<div class="hidden-block">
									<a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>">
										<i class="fa fa-heart"></i>
										<span>
											<?php echo $text_wishlist; ?>
										</span>
									</a>
								</div>
								<div class="hidden-block-lang">
									<a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>">
										<i class="fa fa-share"></i>
										<span>
											<?php echo $text_checkout; ?>
										</span>
									</a>
								</div>
								<div>
									<?php echo $currency; ?>
								</div>
								<div>
									<?php echo $language; ?>
								</div>
							</div>
						</nav>
					</div>
					<div class="fright">
						<?php echo $search; ?>
						<?php echo $cart; ?>
					</div>
				</div>				
			</div>

			<div id="stuck" class="stuck-menu">
				<?php if ($navigation) { ?>
				<div class="navigation">
					<div class="container">
						<?php echo $navigation;?>
					</div>
				</div>
				<?php } ?>
			</div>

			<div id="logo" class="logo">
				<?php if ($logo) { ?>
				<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
				<?php } else { ?>
				<h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
				<?php } ?>
				<div class="description">
					<?php echo $logo_desc; ?>
				</div>
			</div>

			<?php if ($header_top) { ?>
				<div class="header_modules">
					<?php echo $header_top; ?>
				</div>
			<?php } ?>

			<address>
				<a href="callto:<?php echo $telephone; ?>"><span><?php echo $call_us; ?></span> <?php echo $telephone; ?></a>
			</address>
		</header>