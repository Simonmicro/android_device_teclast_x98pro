# Teclast x98 Pro Device Tree

* Add this into `devices/teclast/x98pro`.
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
* The `system.prop` modifies the volume stepping to 25...
* Netflix? Well, due missing DRM only `com.netflix.mediaclient_4.16.1_build_15145-15145_minAPI19(armeabi-v7a)(nodpi)_apkmirror.com.apk` works...

## How to compile it yourself
...just some commands...

```bash
repo init -u git://git.osdn.net/gitroot/android-x86/manifest -b pie-x86 --partial-clone
repo sync
source build/envsetup.sh
lunch
```

Now build it with `m` or `m iso_img`!

### Include OpenGapps
Add OpenGapps to `.repo/manifests/andoid` -> https://github.com/opengapps/aosp_build
```bash
repo sync
curl https://github.com/cwhuang/aosp_build/commit/384cdac7930e7a2b67fd287cfae943fdaf7e5ca3.patch | git -C vendor/opengapps/build apply -v --index
curl https://github.com/cwhuang/aosp_build/commit/3bb6f0804fe5d516b6b0bc68d8a45a2e57f147d5.patch | git -C vendor/opengapps/build apply -v --index
```
Then for every folder in vendor/opengapps/sources run the following:
```bash
git lfs install
git lfs pull
```
Also make sure to comment the gapps support from the device tree in... Now rebuild it and enjoy!
_When you get uncertified errors (which should be fixed by the system.prop file in the tree): https://www.technobaboy.com/2020/03/07/how-to-fix-device-is-not-play-protect-certified/_
