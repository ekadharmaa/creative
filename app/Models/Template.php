<?php

namespace App\Models;

class Template
{
    public $data;
    public $editable_field;

    public static $gallery = [
        "/assets/partials/galeri/01.jpg",
        "/assets/partials/galeri/02.jpg",
        "/assets/partials/galeri/03.jpg",
        "/assets/partials/galeri/04.jpg",
    ];

    public static $options = [
        "primaryColor" => "black",
        "secondaryColor" => "white",
        "backgroundColor" => "white",
        "primaryFont" => "Arial",
        "secondaryFont" => "Arial",
    ];

    public function render()
    {
        return $this->data;
    }

    public function __encode()
    {
        return json_encode($this->data);
    }

    public function update($data)
    {
        $this->data = $data;
    }

    public static function setOption($key, $value)
    {
        self::$options[$key] = $value;
    }

    public function setPartial($value)
    {
        $this->data['partial'] = $value;
    }

    public function setEditableField($value)
    {
        $this->editable_field = $value;
    }

    public function getEditableField()
    {
        return $this->editable_field;
    }
}
