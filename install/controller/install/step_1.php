<?php
class ControllerInstallStep1 extends Controller {
	public function index() {
		$this->language->load('install/step_1');
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$this->response->redirect($this->url->link('install/step_2'));
		}

		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_step_1'] = $this->language->get('text_step_1');
		$data['text_terms'] = $this->language->get('text_terms');

		$data['button_continue'] = $this->language->get('button_continue');

		$data['action'] = $this->url->link('install/step_1');

		$data['footer'] = $this->load->controller('commons/footer');
		$data['header'] = $this->load->controller('commons/header');
		$data['column_left'] = $this->load->controller('commons/column_left');

		$this->response->setOutput($this->load->view('install/step_1', $data));
	}
}