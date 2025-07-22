<?php

namespace App\Templates\Components;

class Content
{

    public $label = "Content";
    public $contents = "<p>Hello World</p>";
    public $font = "Arial";
    public static $component = "content";

    public function __construct($label, $contents, $font)
    {
        $this->label = $label;
        $this->contents = $contents;
        $this->font = $font;
    }

    public function render()
    {
        return [
            "label" => $this->label,
            "component" => self::$component,
            "value" => $this->contents,
            "style" => [
                "fontFamily" => $this->font
            ]
        ];
    }
}
