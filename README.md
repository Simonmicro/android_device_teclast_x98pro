# Teclast x98 Pro Device Tree

* This has been tested with Android-x86 9!
* You may need to patch the kernel driver for the touch input by yourself! For this just apply my patch inside the kernel tree:
```diff
diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index f8dd416c89b2..7668174b62ed 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -136,6 +136,16 @@ static const struct dmi_system_id rotated_screen[] = {
                        DMI_MATCH(DMI_BIOS_DATE, "12/19/2014"),
                },
        },
+       {
+               .ident = "Teclast X98 Pro",
+               .matches = {
+                       /* Only match bios date, because the manufacturers bios
+                        * does not report the board name at all (sometimes)...
+                        */
+                       DMI_MATCH(DMI_BOARD_VENDOR, "TECLAST"),
+                       DMI_MATCH(DMI_BIOS_DATE, "10/28/2015"),
+               },
+       },
        {
                .ident = "WinBook TW100",
                .matches = {
```
* You may want to add an other boot animation (code is commented), just select one from [here](https://forum.xda-developers.com/android/themes/alienware-t3721978)...
* This tree has some example support for OpenGapps
* The fingerprint of this build has not been altered to mimic the original shipped software (yet). When you have it: Please open an issue, so I can add it.
* The `system.prop` modifies the volume stepping to 25...
