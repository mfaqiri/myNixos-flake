{ pkgs, ...}: {

  environment.systemPackages = with pkgs; [
	pavucontrol
	ardour
	spotify
	ffmpeg
    ];

  environment.etc."wireplumber/main.lua.d/99-alsa-config.conf".text = ''
  -- prepend, otherwise the change-nothing stock config will match first:
  table.insert(alsa_monitor.rules, 1, {
    matches = {
    {
      -- Matches all sinks.
      { "node.name", "matches", "alsa_output.*"},
    },
  }
   apply_properties = {
     ["api.alsa.headroom"] = 1024,
   },
  })
  '';

  services.pipewire = {
	enable = true;
	pulse.enable = true;
	jack.enable = true;
	alsa = {
		enable = true;
		support32Bit = true;
	};

	extraConfig = {
		pipewire = {

       "91-null-sinks" = {
            "context.objects" = [
              {
                # A default dummy driver. This handles nodes marked with the "node.always-driver"
                # properyty when no other driver is currently active. JACK clients need this.
                factory = "spa-node-factory";
                args = {
                  "factory.name" = "support.node.driver";
                  "node.name" = "Dummy-Driver";
                  "priority.driver" = 8000;
                };
              }
              {
                factory = "adapter";
                args = {
                  "factory.name" = "support.null-audio-sink";
                  "node.name" = "Microphone-Proxy";
                  "node.description" = "Microphone";
                  "media.class" = "Audio/Source/Virtual";
                  "audio.position" = "MONO";
                };
              }
              {
                factory = "adapter";
                args = {
                  "factory.name" = "support.null-audio-sink";
                  "node.name" = "Main-Output-Proxy";
                  "node.description" = "Main Output";
                  "media.class" = "Audio/Sink";
                  "audio.position" = "FL,FR";
                };
              }
            ];
          };
       



                "92-low-latency" = {
			"context.properties" = {
				"default.clock.rate" = 48000;
				"default.clock.quantum" = 32;
				"default.clock.min-quantum" = 16;
				"default.clock.max-quantum" = 768;
			};
		};
            };

		pipewire-pulse."92-low-latency" = {
			"context.properties" = [
				{
					name = "libpipewire-module-protocol-pulse";
					args = { };
				}
			];
			"pulse.properties" = {
				"pulse.min.req" = "32/48000";
				"pulse.default.req" = "32/48000";
				"pulse.max.req" = "32/48000";
				"pulse.min.quantum" = "16/48000";
				"pulse.max.quantum" = "768/48000";
			};
			"stream.properties" = {
				"node.latency" = "32/48000";
				"resample.quality" = 1;
			};
		pipewire."99-custom" = {
			    "context.modules" = [
			    {
			    name = "libpipewire-module-rt";
			    args = {
			      "nice.level" = -11;
			      "rt.prio" = 19;
			    };
			    }
			    ];
			  };
		};
	};

	wireplumber.extraConfig."99-alsa-lowlatency" = {
		alsa_monitor.rules = {
		matches = [ "node.name" "matches" "alsa_output.usb*" ];
		apply_properties = {
		"audio.format" = "S32LE";
		"audio.rate" = "96000";
		"api.alsa.period-size" = 2;
		# "api.alsa.disable-batch" = true;
		};
	};
    };

  };
}
