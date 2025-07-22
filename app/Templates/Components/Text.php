<?php

namespace App\Templates\Components;

class Text
{

    public $label = "Text";
    public $text = "Hello World";
    public $size = 12;
    public $color;
    public $font;
    public static $component = "text";
    public $style = [];

    public function __construct($label, $text, $size, $color = "inherit", $font = "inherit", $style = [])
    {
        $this->label = $label;
        $this->text = $text;
        $this->size = $size;
        $this->color = $color;
        $this->font = $font;
        $this->style = $style;
    }

    public function render()
    {
        $data = [
            "label" => $this->label,
            "component" => self::$component,
            "value" => $this->text,
            "style" => [
                "fontSize" => $this->size . "px",
                "color" => $this->color,
                "fontFamily" => $this->font
            ]
        ];

        if (count($this->style) > 0) {
            $data['style'] = array_merge($data['style'], $this->style);
        }

        return $data;
    }
}
