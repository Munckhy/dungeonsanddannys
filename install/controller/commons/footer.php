<?php
class ControllerCommonsFooter extends Controller {
	public function index() {
		$this->language->load('commons/footer');
		
		$data['text_project'] = $this->language->get('text_project');
		$data['text_documentation'] = $this->language->get('text_documentation');
		$data['text_support'] = $this->language->get('text_support');
		$data['text_footer'] = $this->language->get('text_footer');

		return $this->load->view('commons/footer', $data);
	}
}
