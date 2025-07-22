<?php

namespace App\Templates\Components;

class Button
{

    public $label = "Text";
    public $text = "Hello World";
    public $size = 12;
    public $color = "#000000";
    public $background = "#FFFFFF";
    public $type = "rounded-full";
    public $fontFamily = "Arial";
    public static $component = "button";

    public function __construct($label, $text, $size, $color, $background, $fontFamily = "Arial")
    {
        $this->label = $label;
        $this->text = $text;
        $this->size = $size;
        $this->color = $color;
        $this->background = $background;
        $this->fontFamily = $fontFamily;
    }

    public function render()
    {
        return [
            "label" => $this->label,
            "component" => self::$component,
            "value" => $this->text,
            "type" => $this->type,
            "style" => [
                "fontSize" => $this->size . "px",
                "color" => $this->color,
                "background" => $this->background,
                "fontFamily" => $this->fontFamily
            ]
        ];
    }
}
