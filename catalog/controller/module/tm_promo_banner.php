<?php
class ControllerModuleTMPromoBanner extends Controller {
	public function index($setting) {
		static $module = 0;
		$this->load->language('module/tm_countdown');
		$this->load->model('tool/image');

		$data['cookie'] = $setting['cookie'];
		$data['date']   = $setting['date'];
		$data['type']   = $setting['type'];

		if (strip_tags(html_entity_decode($setting['description'][$this->config->get('config_language_id')]['description']))) {
			$data['description'] = html_entity_decode($setting['description'][$this->config->get('config_language_id')]['description']);
		} else {
			$data['description'] = '';
		}

		$data['days_title']    = $setting['description'][$this->config->get('config_language_id')]['days_title'] ? $setting['description'][$this->config->get('config_language_id')]['days_title'] : 'Days';
		$data['hours_title']   = $setting['description'][$this->config->get('config_language_id')]['hours_title'] ? $setting['description'][$this->config->get('config_language_id')]['hours_title'] : 'Hours';
		$data['minutes_title'] = $setting['description'][$this->config->get('config_language_id')]['minutes_title'] ? $setting['description'][$this->config->get('config_language_id')]['minutes_title'] : 'Minutes';
		$data['seconds_title'] = $setting['description'][$this->config->get('config_language_id')]['seconds_title'] ? $setting['description'][$this->config->get('config_language_id')]['seconds_title'] : 'Seconds';

		if (is_file(DIR_IMAGE . $setting['bg']) && $setting['bg']) {
			$data['background'] = $this->model_tool_image->resize($setting['bg'], $setting['bg_width'], $setting['bg_height']);
		} else {
			$data['background'] = '';
		}

		if (is_file(DIR_IMAGE . $setting['image']) && $setting['image']) {
			$data['image'] = $this->model_tool_image->resize($setting['image'], $setting['image_width'], $setting['image_height']);
			$data['image_width'] = $setting['image_width'];
		} else {
			$data['image'] = '';
		}

		if ($setting['type'] == 1) {

			$this->document->addScript('catalog/view/theme/' . $this->config->get($this->config->get('config_theme') . '_directory') . '/js/tmpromobanner/TimeCircles.min.js');

			$data['animation']       = $setting['animation'] ? 'ticks' : 'smooth';
			$data['direction']       = $setting['animation_direction'] ? 'Counter-clockwise' : 'Clockwise';

			$data['days_color']      = $setting['days_color'];
			$data['hours_color']     = $setting['hours_color'];
			$data['minutes_color']   = $setting['minutes_color'];
			$data['seconds_color']   = $setting['seconds_color'];

			$data['show_days']       = $setting['show_days'] ? 'true' : 'false';
			$data['show_hours']      = $setting['show_hours'] ? 'true' : 'false';
			$data['show_minutes']    = $setting['show_minutes'] ? 'true' : 'false';
			$data['show_seconds']    = $setting['show_seconds'] ? 'true' : 'false';

			$data['radial_bg_color'] = $setting['radial_bg_color'];
			$data['fg_width']        = $setting['fg_width'];
			$data['radial_bg_width'] = $setting['radial_bg_width'];
			$data['count']           = $setting['show_days'] + $setting['show_hours'] + $setting['show_minutes'] + $setting['show_seconds'];

		} else {
			$this->document->addScript('catalog/view/theme/' . $this->config->get($this->config->get('config_theme') . '_directory') . '/js/tmpromobanner/jquery.countdown.min.js');
		}

		$data['module'] = $module++;

		return $this->load->view('module/tm_promo_banner', $data);
	}
}
