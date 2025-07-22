<?php

namespace App\Providers;

class TemplateProvider
{
    private $templates = [];

    public function __construct()
    {
        $this->loadTemplates();
    }

    public function loadTemplates()
    {
        $templates = json_decode(file_get_contents(resource_path('js/data/templates.json')), true);

        foreach ($templates as $template) {
            $class = 'App\Templates\Data\\' . $template['class'];
            $class = new $class();
            $template['data'] = $class->render();
            $template['editable_fields'] = $class->getEditableField();
            $this->templates[] = $template;
        }
    }

    public function getTemplates()
    {
        return $this->templates;
    }

    public function list()
    {
        return json_decode(file_get_contents(resource_path('js/data/templates.json')), true);
    }
}
