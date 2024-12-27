import subprocess

from colors import colors
from libqtile.lazy import lazy
from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration

widgetDecorations = {
    "background": colors[0],
    "foreground": colors[1],
    "decorations": [
        RectDecoration(use_widget_background=True, radius=12, filled=True, group=True),
    ],
}


def bright():
    result = subprocess.run(["brightnessctl", "g"], capture_output=True, text=True)
    max_brightness = subprocess.run(
        ["brightnessctl", "m"], capture_output=True, text=True
    )

    current_brightness = int(result.stdout.strip())
    max_brightness = int(max_brightness.stdout.strip())
    brightness_percentage = int((current_brightness / max_brightness) * 100)

    if brightness_percentage > 75:
        icon = "🌞"
    elif brightness_percentage > 50:
        icon = "🌤️"
    elif brightness_percentage > 25:
        icon = "🌥️"
    else:
        icon = "🌙"
    return f"{icon} {brightness_percentage}%"


def batt():
    result = subprocess.run(["acpi"], capture_output=True, text=True)
    if result.returncode != 0:
        return "󰂃  N/A"

    output = result.stdout.strip().split(", ")
    battery_percentage = int(output[1].replace("%", "").strip())
    battery_state = output[0].split()[-1]
    if battery_percentage > 80:
        icon = "  "
        color = "lime"
    elif battery_percentage > 60:
        icon = "  "
        color = "palegreen"
    elif battery_percentage > 40:
        icon = "  "
        color = "gold"
    elif battery_percentage > 20:
        icon = "  "
        color = "orange"
    else:
        icon = "  "
        color = "red"

    if battery_state == "Charging":
        icon = "⚡ " + icon
        color = "cyan"

    return f'<span foreground="{color}">{icon}  {battery_percentage}%</span>'


def vol():
    try:
        result = subprocess.run(
            ["pactl", "get-sink-volume", "@DEFAULT_SINK@"],
            capture_output=True,
            text=True,
            check=True,
        )
        volume_info = result.stdout.strip().split()
        volume_percentage = int(volume_info[4][:-1])
        if volume_percentage == 0:
            icon = "  "
            color = "red"
        elif volume_percentage > 105:
            icon = "󰕾  "
            color = "red"
        elif volume_percentage > 75:
            icon = "󰕾  "
            color = "orange"
        elif volume_percentage > 50:
            icon = "󰕾  "
            color = "white"
        elif volume_percentage > 25:
            icon = "󰖀  "
            color = "orange"
        else:
            icon = "󰕿  "
            color = "red"

        return f'<span foreground="{color}">{icon} {volume_percentage}%</span>'

    except subprocess.CalledProcessError:
        return "󰕿  N/A"


def main():
    return [
        widget.Clock(
            format=" %b %e      %H:%M  ",
            **widgetDecorations,
        ),
        widget.Spacer(
            length=10,
        ),
        widget.GenPollText(
            update_interval=0.1,
            func=vol,
            mouse_callbacks={
                "Button4": lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5% "),
                "Button5": lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%"),
            },
            **widgetDecorations,
        ),
        widget.Spacer(),
        widget.GroupBox(
            hide_unused=True,
            highlight_method="text",
            fontsize=18,
            padding=5,
            disable_drag=True,
            **widgetDecorations,
        ),
        widget.Spacer(
            length=10,
        ),
        widget.TaskList(
            icon_size=24,
            parse_text=lambda _: "",
            padding=2,
            highlight_method="text",
            txt_floating="󱂬 ",
            txt_maximized="󰏋 ",
            txt_minimized="󰖰 ",
        ),
        widget.Prompt(**widgetDecorations),
        widget.Spacer(
            length=10,
        ),
        widget.Systray(
            padding=10,
        ),
        widget.Spacer(
            length=10,
        ),
        widget.GenPollText(
            func=batt,
            format="{}",
            update_interval=0.1,
            **widgetDecorations,
        ),
        widget.Spacer(
            length=10,
        ),
        widget.GenPollText(
            func=bright,
            format="{}",
            update_interval=0.1,
            mouse_callbacks={
                "Button4": lazy.spawn("brightnessctl set +5%"),
                "Button5": lazy.spawn("brightnessctl set 5%-"),
            },
            **widgetDecorations,
        ),
    ]


def misc():
    return [
        widget.Clock(
            format=" %b %e     %H:%M ",
            **widgetDecorations,
        ),
        widget.Spacer(),
        widget.GroupBox(
            hide_unused=True,
            highlight_method="text",
            fontsize=18,
            padding=5,
            disable_drag=True,
            **widgetDecorations,
        ),
        widget.Spacer(
            length=10,
        ),
        widget.TaskList(
            icon_size=24,
            parse_text=lambda _: "",
            padding=2,
            highlight_method="text",
            txt_floating="󱂬 ",
            txt_maximized="󰏋 ",
            txt_minimized="󰖰 ",
        ),
    ]
