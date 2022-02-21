<?php
class ControllerModuleTmSlideshow extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/tm_slideshow');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('tm_slideshow', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], true));
		}

		$data['heading_title']                     = $this->language->get('heading_title');

		$data['text_edit']                         = $this->language->get('text_edit');
		$data['text_enabled']                      = $this->language->get('text_enabled');
		$data['text_disabled']                     = $this->language->get('text_disabled');
		$data['text_general_settings']             = $this->language->get('text_general_settings');
		$data['text_slides_settings']              = $this->language->get('text_slides_settings');
		$data['text_add_slide']                    = $this->language->get('text_add_slide');
		$data['text_remove_slide']                 = $this->language->get('text_remove_slide');
		$data['text_image']                        = $this->language->get('text_image');
		$data['text_video']                        = $this->language->get('text_video');
		$data['text_yes']                          = $this->language->get('text_yes');
		$data['text_no']                           = $this->language->get('text_no');
		$data['text_vertical']                     = $this->language->get('text_vertical');
		$data['text_horizontal']                   = $this->language->get('text_horizontal');
		$data['text_slide']                        = $this->language->get('text_slide');
		$data['text_fade']                         = $this->language->get('text_fade');
		$data['text_cube']                         = $this->language->get('text_cube');
		$data['text_coverflow']                    = $this->language->get('text_coverflow');
		$data['text_flip']                         = $this->language->get('text_flip');

		$data['entry_name']                        = $this->language->get('entry_name');
		$data['entry_status']                      = $this->language->get('entry_status');
		$data['entry_width']                       = $this->language->get('entry_width');
		$data['entry_height']                      = $this->language->get('entry_height');
		$data['entry_min_height']                  = $this->language->get('entry_min_height');
		$data['entry_image']                       = $this->language->get('entry_image');
		$data['entry_slide']                       = $this->language->get('entry_slide');
		$data['entry_slide_type']                  = $this->language->get('entry_slide_type');
		$data['entry_video_loop']                  = $this->language->get('entry_video_loop');
		$data['entry_video_autoplay']              = $this->language->get('entry_video_autoplay');
		$data['entry_video_muted']                 = $this->language->get('entry_video_muted');
		$data['entry_video_volume']                = $this->language->get('entry_video_volume');
		$data['entry_video_playback_rate']         = $this->language->get('entry_video_playback_rate');
		$data['entry_autoplay']                    = $this->language->get('entry_autoplay');
		$data['entry_effect']                      = $this->language->get('entry_effect');
		$data['entry_speed']                       = $this->language->get('entry_speed');
		$data['entry_keyboard_control']            = $this->language->get('entry_keyboard_control');
		$data['entry_mousewheel_control']          = $this->language->get('entry_mousewheel_control');
		$data['entry_mousewheel_release_on_edges'] = $this->language->get('entry_mousewheel_release_on_edges');
		$data['entry_navigation']                  = $this->language->get('entry_navigation');
		$data['entry_next_button']                 = $this->language->get('entry_next_button');
		$data['entry_prev_button']                 = $this->language->get('entry_prev_button');
		$data['entry_pagination']                  = $this->language->get('entry_pagination');
		$data['entry_pagination_clickable']        = $this->language->get('entry_pagination_clickable');
		$data['entry_pagination_bullet_render']    = $this->language->get('entry_pagination_bullet_render');
		$data['entry_scrollbar']                   = $this->language->get('entry_scrollbar');
		$data['entry_scrollbar_draggable']         = $this->language->get('entry_scrollbar_draggable');
		$data['entry_loop']                        = $this->language->get('entry_loop');
		$data['entry_description']                 = $this->language->get('entry_description');
		$data['entry_title']                       = $this->language->get('entry_title');
		$data['entry_link']                        = $this->language->get('entry_link');

		$data['button_save']                       = $this->language->get('button_save');
		$data['button_cancel']                     = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['width'])) {
			$data['error_width'] = $this->error['width'];
		} else {
			$data['error_width'] = '';
		}

		if (isset($this->error['height'])) {
			$data['error_height'] = $this->error['height'];
		} else {
			$data['error_height'] = '';
		}

		if (isset($this->error['min_height'])) {
			$data['error_min_height'] = $this->error['min_height'];
		} else {
			$data['error_min_height'] = '';
		}

		if (isset($this->error['speed'])) {
			$data['error_speed'] = $this->error['speed'];
		} else {
			$data['error_speed'] = '';
		}

		if (isset($this->error['video_volume'])) {
			$data['error_video_volume'] = $this->error['video_volume'];
		} else {
			$data['error_video_volume'] = '';
		}

		if (isset($this->error['video_playback_rate'])) {
			$data['error_video_playback_rate'] = $this->error['video_playback_rate'];
		} else {
			$data['error_video_playback_rate'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
			);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true)
			);


		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/html', 'token=' . $this->session->data['token'], true)
				);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/tm_slideshow', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
				);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/tm_slideshow', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('module/tm_slideshow', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], true);
		
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
		
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}

		if (isset($this->request->post['width'])) {
			$data['width'] = $this->request->post['width'];
		} elseif (!empty($module_info)) {
			$data['width'] = $module_info['width'];
		} else {
			$data['width'] = '2048';
		}

		if (isset($this->request->post['height'])) {
			$data['height'] = $this->request->post['height'];
		} elseif (!empty($module_info)) {
			$data['height'] = $module_info['height'];
		} else {
			$data['height'] = '600';
		}

		if (isset($this->request->post['min_height'])) {
			$data['min_height'] = $this->request->post['min_height'];
		} elseif (!empty($module_info)) {
			$data['min_height'] = $module_info['min_height'];
		} else {
			$data['min_height'] = '350';
		}

		if (isset($this->request->post['autoplay'])) {
			$data['autoplay'] = $this->request->post['autoplay'];
		} elseif (!empty($module_info)) {
			$data['autoplay'] = $module_info['autoplay'];
		} else {
			$data['autoplay'] = '0';
		}

		if (isset($this->request->post['effect'])) {
			$data['effect'] = $this->request->post['effect'];
		} elseif (!empty($module_info)) {
			$data['effect'] = $module_info['effect'];
		} else {
			$data['effect'] = '1';
		}

		if (isset($this->request->post['speed'])) {
			$data['speed'] = $this->request->post['speed'];
		} elseif (!empty($module_info)) {
			$data['speed'] = $module_info['speed'];
		} else {
			$data['speed'] = '600';
		}

		if (isset($this->request->post['keyboard_control'])) {
			$data['keyboard_control'] = $this->request->post['keyboard_control'];
		} elseif (!empty($module_info)) {
			$data['keyboard_control'] = $module_info['keyboard_control'];
		} else {
			$data['keyboard_control'] = '0';
		}

		if (isset($this->request->post['mousewheel_control'])) {
			$data['mousewheel_control'] = $this->request->post['mousewheel_control'];
		} elseif (!empty($module_info)) {
			$data['mousewheel_control'] = $module_info['mousewheel_control'];
		} else {
			$data['mousewheel_control'] = '0';
		}

		if (isset($this->request->post['mousewheel_release_on_edges'])) {
			$data['mousewheel_release_on_edges'] = $this->request->post['mousewheel_release_on_edges'];
		} elseif (!empty($module_info)) {
			$data['mousewheel_release_on_edges'] = $module_info['mousewheel_release_on_edges'];
		} else {
			$data['mousewheel_release_on_edges'] = '0';
		}

		if (isset($this->request->post['next_button'])) {
			$data['next_button'] = $this->request->post['next_button'];
		} elseif (!empty($module_info)) {
			$data['next_button'] = $module_info['next_button'];
		} else {
			$data['next_button'] = '0';
		}

		if (isset($this->request->post['prev_button'])) {
			$data['prev_button'] = $this->request->post['prev_button'];
		} elseif (!empty($module_info)) {
			$data['prev_button'] = $module_info['prev_button'];
		} else {
			$data['prev_button'] = '0';
		}

		if (isset($this->request->post['pagination'])) {
			$data['pagination'] = $this->request->post['pagination'];
		} elseif (!empty($module_info)) {
			$data['pagination'] = $module_info['pagination'];
		} else {
			$data['pagination'] = '0';
		}

		if (isset($this->request->post['pagination_bullet_render'])) {
			$data['pagination_bullet_render'] = $this->request->post['pagination_bullet_render'];
		} elseif (!empty($module_info)) {
			$data['pagination_bullet_render'] = $module_info['pagination_bullet_render'];
		} else {
			$data['pagination_bullet_render'] = '0';
		}

		if (isset($this->request->post['pagination_clickable'])) {
			$data['pagination_clickable'] = $this->request->post['pagination_clickable'];
		} elseif (!empty($module_info)) {
			$data['pagination_clickable'] = $module_info['pagination_clickable'];
		} else {
			$data['pagination_clickable'] = '0';
		}

		if (isset($this->request->post['scrollbar'])) {
			$data['scrollbar'] = $this->request->post['scrollbar'];
		} elseif (!empty($module_info)) {
			$data['scrollbar'] = $module_info['scrollbar'];
		} else {
			$data['scrollbar'] = '0';
		}

		if (isset($this->request->post['scrollbar_draggable'])) {
			$data['scrollbar_draggable'] = $this->request->post['scrollbar_draggable'];
		} elseif (!empty($module_info)) {
			$data['scrollbar_draggable'] = $module_info['scrollbar_draggable'];
		} else {
			$data['scrollbar_draggable'] = '0';
		}

		if (isset($this->request->post['loop'])) {
			$data['loop'] = $this->request->post['loop'];
		} elseif (!empty($module_info)) {
			$data['loop'] = $module_info['loop'];
		} else {
			$data['loop'] = '0';
		}

		if (isset($this->request->post['slides'])) {
			$slides = $this->request->post['slides'];
		} elseif (!empty($module_info['slides'])) {
			$slides = $module_info['slides'];
		} else {
			$slides = array();
		}

		$this->load->model('tool/image');

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		foreach ($slides as $slide) {
			if (is_file(DIR_IMAGE . $slide['image'])) {
				$image = $slide['image'];
				$thumb = $slide['image'];
			} else {
				$image = '';
				$thumb = 'no_image.png';
			}

			$data['slides'][] = array(
				'image'               => $image,
				'thumb'               => $this->model_tool_image->resize($thumb, 100, 100),
				'slide_type'          => $slide['slide_type'],
				'video_loop'          => $slide['video_loop'],
				'video_autoplay'      => $slide['video_autoplay'],
				'video_playback_rate' => $slide['video_playback_rate'],
				'video_volume'        => $slide['video_volume'],
				'video_muted'         => $slide['video_muted'],
				'title'               => $slide['title'],
				'description'         => $slide['description'],
				'link'                => $slide['link']
				);
		}

		$this->load->model('localisation/language');
		$data['languages']   = $this->model_localisation_language->getLanguages();

		$data['header']      = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer']      = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/tm_slideshow', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/tm_slideshow')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (!is_numeric($this->request->post['width']) || $this->request->post['width'] < 1) {
			$this->error['width'] = $this->language->get('error_width');
		}

		if (!is_numeric($this->request->post['height']) || $this->request->post['height'] < 1) {
			$this->error['height'] = $this->language->get('error_height');
		}

		if (!is_numeric($this->request->post['min_height']) || $this->request->post['min_height'] < 1) {
			$this->error['min_height'] = $this->language->get('error_min_height');
		}

		if (!is_numeric($this->request->post['speed'])) {
			$this->error['speed'] = $this->language->get('error_speed');
		}

		if (isset($this->request->post['slides'])) {
			$i = 0; foreach ($this->request->post['slides'] as $slide) {
				if (($slide['slide_type'] && !$slide['video_muted']) && (!is_numeric($slide['video_volume']) || $slide['video_volume'] > 1 || $slide['video_volume'] < 0)) {
					$this->error['video_volume'][$i] = $this->language->get('error_video_volume');
				}

				if (($slide['slide_type']) && (!is_numeric($slide['video_playback_rate']) || $slide['video_playback_rate'] < 0 )) {
					$this->error['video_playback_rate'][$i] = $this->language->get('error_video_playback_rate');
				}
				$i++;
			}
		}
		return !$this->error;
	}
}