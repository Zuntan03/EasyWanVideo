import json
import os
import sys


class ComfyUiConfig:
    DEBUG_MODE = False

    def __init__(self, cfg_path):
        self.updaters = {
            "0.0.0": self.update_0_0_0,
        }

        os.makedirs(os.path.dirname(cfg_path), exist_ok=True)
        if not os.path.exists(cfg_path):
            with open(cfg_path, "w", encoding="utf-8") as f:
                json.dump(
                    {
                        "Comfy.InvertMenuScrolling": True,
                        "Comfy.Workflow.SortNodeIdOnSave": True,
                        "pysssss.AutoCompleter": True,
                        "pysssss.ModelInfo.NsfwLevel": "XXX",
                        "pysssss.SnapToGrid": True,
                    },
                    f,
                )

        with open(cfg_path, "r+", encoding="utf-8") as f:
            cfg = json.load(f)
            if "easy_wan_video_config_version" not in cfg:
                cfg["easy_wan_video_config_version"] = "0.0.0"

            if self.DEBUG_MODE:
                cfg["easy_wan_video_config_version"] = "0.0.0"

            if self.update(cfg):
                f.seek(0)
                json.dump(cfg, f, indent=4)
                f.truncate()

    def update(self, cfg):
        version = cfg["easy_wan_video_config_version"]
        if version not in self.updaters:
            return False
        self.updaters[version](cfg)
        self.update(cfg)
        return True

    def update_0_0_0(self, cfg):
        cfg["easy_wan_video_config_version"] = "0.1.0"


if __name__ == "__main__":
    comfy_ui_config = ComfyUiConfig(sys.argv[1])
