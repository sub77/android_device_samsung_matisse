## TWRP device tree for Samsung Galaxy Note 4 (Snapdragon)
## matissexx, matissedt, matissetmo, matissecan, matissespr, matisseusc, matissevzw, matisseatt

Add to `.repo/local_manifests/matisse.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
	<project path="device/samsung/matisse" name="android_device_samsung_matisse" remote="TeamWin" revision="android-6.0" />
</manifest>
```

Then run `repo sync` to check it out.

To build:

```sh
. build/envsetup.sh
lunch omni_matisse-eng
make -j5 recoveryimage
```

Kernel sources are available at: https://github.com/underscoremone/android_kernel_samsung_matisse/tree/cm-14.1

