<?php

namespace App\Templates\Data;

use App\Models\Template;
use App\Templates\Components\Background;
use App\Templates\Components\Button;
use App\Templates\Components\EditableField;
use App\Templates\Components\Text;

class Template02 extends Template
{
    public static $category = 'Wedding & Engagement';
    private static $partials = [
        "top" => [
            "src" => "/assets/partials/template-02/tm.webp",
            "style" => [
                "position" => "absolute",
                "top" => "0",
                "left" => "0",
            ],
        ],
        "bottom" => [
            "src" => "",
            "style" => [
                "position" => "absolute",
                "bottom" => "0",
                "left" => "0",
            ],
        ],
        "left" => [
            "src" => "/assets/partials/template-02/bl-1.webp",
            "style" => [
                "position" => "absolute",
                "bottom" => "0",
                "left" => "0",
                "height" => "50%",
            ],
            "navigation" => "h-full"
        ],
        "right" => [
            "src" => "/assets/partials/template-02/br-1.webp",
            "style" => [
                "position" => "absolute",
                "bottom" => "0",
                "right" => "0",
                "height" => "50%"
            ],
            "navigation" => "h-full"
        ],
        "topLeft" => [
            "src" => "",
            "style" => [
                "position" => "absolute",
                "top" => "0",
                "left" => "0",
            ],
        ],
        "topRight" => [
            "src" => "",
            "style" => [
                "position" => "absolute",
                "top" => "0",
                "right" => "0",
            ],
        ],
        "bottomLeft" => [
            "src" => "",
            "style" => [
                "position" => "absolute",
                "bottom" => "0",
                "left" => "0",
            ],
        ],
        "bottomRight" => [
            "src" => "",
            "style" => [
                "position" => "absolute",
                "bottom" => "0",
                "right" => "0",
            ],
        ],
    ];
    private static $music = "/assets/sound/halal-bihalal.mp3";
    private static $primaryColor = "#306481";
    private static $secondaryColor = "white";

    public function __construct()
    {
        $title = new Text("Title", "Halal Bihalal", 72, self::$primaryColor, "Kaushan Script", ["width" => "90%", "text-align" => "center", "marginRight" => "20px", "lineHeight" => "1.2em", "marginBottom" => "15%", "font-weight" => "bold"]);
        $subtitle = new Text("Subtitle", "Eid Mubarak", 16, self::$primaryColor, "Merienda", ["marginBottom" => "2rem", "marginTop" => "2rem"]);
        $open_button = new Button("Open Button", "Open Invitation", 12, "white", self::$primaryColor);
        $wish = new Text("Ucapan", "Semoga Ramadan yang telah kita lalui telah meningkatkan keimanan dan ketakwaan kita kepada Allah SWT. Dalam semangat persaudaraan dan kebersamaan, mari kita bersilaturahmi dan memaafkan satu sama lain dalam acara halal bihalal ini.", 14, "black", "Merienda");
        $thanks = new Text("Thanks", "Terima kasih atas kehadiran anda. Semoga silaturahmi kita terus terjaga dan diberkahi Allah SWT.", 14, "black", "Merienda");
        $background = new Background('/assets/partials/template-02/bg.webp', .8, "cover", "center");

        $data = [
            "date" => now()->setDay(30),
            "location" => "Jl. Raya Bogor, Jakarta",
            "navigation" => [
                "primary" => "#ffffff",
                "secondary" => self::$primaryColor,
            ],
            "opening" => [
                "title" => $title->render(),
                "subtitle" => $subtitle->render(),
                "button" => $open_button->render(),
            ],
            "rsvp" => [
                "wish" => $wish->render(),
                "thanks" => $thanks->render(),
            ],
            "background" => $background->render()
        ];

        $this->setOption("backgroundColor", "#306481");
        $this->setOption("primaryColor", self::$primaryColor);
        $this->setOption("containerColor", "#ffffff");

        $data['options'] = self::$options;
        $data['partials'] = self::$partials;
        $data['music'] = self::$music;

        $editableFields = [
            "opening.title.value" => new EditableField("text", "Judul Opening"),
            "opening.button.value" => new EditableField("text", "Teks Tombol Opening"),
            "rsvp.wish.value" => new EditableField("textarea", "Teks Ucapan"),
            "rsvp.thanks.value" => new EditableField("textarea", "Teks Terima Kasih"),
            "date" => new EditableField("date", "Tanggal Acara"),
            "location" => new EditableField("text", "Link Google Maps Lokasi Acara"),
        ];

        $this->update($data);
        $this->setEditableField($editableFields);
    }
}
