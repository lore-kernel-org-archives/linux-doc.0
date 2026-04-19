Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884F41D8E01
	for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 04:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776572793; cv=none; b=vGP1+M3oRQGIsrVVGFTJ+vb+SrIFzA5XwSCgEmtajB3qrSDuc6fypXl0fAOC5EJld84YSm/Jw6tSOUlwNlaGKwuxgoXd5nUtQqDILrhTmyOr1KOCJUhk6kYqMRxkO/E5Kvp1N2cp34DBGs0GfVIa/xe+wJIysrYLSkaSZdNPgRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776572793; c=relaxed/simple;
	bh=FfeemacpmkiAeAi8ML14/RSj3gpPVIHzfAivZosCjXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IBdTUI+UFmK6h5NXrn2BRBs5ofoqZ+9eJLsPF8x6FxwZp1U68dqo1MTxrnmgxm/U45fefFZapibM94F0rTlWublqobbf75xWn8YC+zT/iDaqu7EwUC6sLobzu7R8IfaWnuB9HU+LzVeRAJyW4Bmdeu+jlJVmMNZsw99AKe6CcFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJPMXMw/; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJPMXMw/"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso1689772eec.0
        for <linux-doc@vger.kernel.org>; Sat, 18 Apr 2026 21:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776572787; x=1777177587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAvY3pnahmg/h6/OPayXStEZ6mAEg25Wq+PDNaLAalA=;
        b=jJPMXMw/GlVhQ6Ri+X9tzwDn60IT1aQQjSFFzthMKn7j/zZkOLIFlCBY9kAjfYDESI
         cTqnSgzrPzsg3BjGFNPS+jN+aCJteZ+ZwYMv2UNkoDXyIpuGRQSG180hOUHt21135O7F
         O9b6dciyv76TNl3KUaPQeRSSTVjgnIWbsitBL4ww2WqVm6V2NurhBPeHMRCIwUbxAS5p
         hxvLn2p1/FIByW18RtFRQc3u3AfdoOMUJwjvNrHuQb+Z1JX0JpkRZbgZxenQH+RFAQtB
         EjQrTrdUtFjOATGwrGFvd/Z4J0qXh2R/3jCIlhNdMPtoyIREre1Xtv/R56Ig5IhCgZZu
         3/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776572787; x=1777177587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eAvY3pnahmg/h6/OPayXStEZ6mAEg25Wq+PDNaLAalA=;
        b=MO9wnSqTpHVnQ78nLNAY6gR+P6ckMASwlM0j0GksyFal+787Z7e6D9WvU5lT2wkRVk
         H+oAZpLfJq4BoPfUE8hBIMOj3VhgcAnXomZJIt6vDMVLJxW61JFYu4qMztsobeBkp0wR
         /vuOYlmtNb5pwr121/+bSczKtAgS1j3TbMJcriXL5fzoHBJXpFIMxFXs0LM1bJzPXx3p
         2zYp8wI34ZpVoEdoQBf21yeqlMxK7f+B1NfiXuAjDIyfeDwxC7meqHDSshTNPy4MIOPE
         8D/VSIpPX9lZ7/SEk2r/6rsl4RmLu0McHG12/3bREjvuE9vJjZp4yAlKncT+qTUHXLqk
         UizQ==
X-Forwarded-Encrypted: i=1; AFNElJ9M+9rFWQLIPzSG7vNP/MZ3CDxtvj2qvA1Izdb8lZcrObB51FMZi/rcyk4wt8m7VXfM2e6Ba7ymSWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyIz1vWsApLHUYvnFsWAJtidic300CwaRSq3Rkrr2nnPDo4d9x
	JWj5KYBSP5RvTcUxRFQ7yDg11JfDf9JFiPQnePhNxV1DC872Xq11RQLJ
X-Gm-Gg: AeBDiescziuaeG9Qx2eulBgvZ0YYPX+Hdfz9Cct+Z+Lc6DAXgx/rvTxt96V6ZFBlqNA
	n3eB+aBFMIU1Fk8h6ym/xNchTNRh3aRX60oEh73insO6I4PQX0576cHc0izWLUuB9onjQXjQcN7
	bb9JFTDq9n7/P2WLjgMbDgr/2YTcuVoYARtwN3qJ+HCngn7l+kSAwHn63MlvFY+RWFsCTQjfvde
	aaWAX3DQhonDWwf10cgl9eZJYQv9H6Y201FFoodfOo+94JuImFpWGVce9hu819icO6zDt6mgprN
	2/E9ugIPXMpZ4LcRE4Yo5LcKFm8MSEe+bfdWFFbJE5eJe5HitP6Ouf+lDuMqdeh879+cak59ugi
	wK68PjttIgYhkNeWvRTKWB/6GL6+AN69AtDw5QQWBdkRks3Joaf9m3rLFekOLZvC0Johywb65Go
	R5cDDchMpfhx3cuwZ0BexexgksksdiV8H8UMLTK0Xl4xuauufeGrfa4YNieEktDfSY9/xnq89qk
	rll2zKmXTPm8mg=
X-Received: by 2002:a05:7300:ad2d:b0:2d9:1c9d:fc22 with SMTP id 5a478bee46e88-2e43ca252ffmr3369663eec.21.1776572787297;
        Sat, 18 Apr 2026 21:26:27 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53dcb487bsm8796469eec.31.2026.04.18.21.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 21:26:27 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Lambert Fan <fanzhaoming@anopc.com>,
	Zhouwang Huang <honjow311@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] HID: hid-oxp: Add OneXPlayer configuration driver
Date: Sat, 18 Apr 2026 21:26:20 -0700
Message-ID: <20260419042624.625746-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260419042624.625746-1-derekjohn.clark@gmail.com>
References: <20260419042624.625746-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds OneXPlayer HID configuration driver. In this initial driver patch,
add the RGB interface for the first generation of HID based RGB control.

This interface provides the following attributes:
- brightness: provided by the LED core, this works in a fairly unique
  way on this device. The hardware accepts 5 brightness values (0-4),
  which affects the brightness of the multicolor and animated effects
  built into the MCU firmware. For monocolor settings, the device
  expects the hardware brightness value to be pushed to maximum, then we
  apply brightness adjustments mathematically based on % (0-100). This
  leads to some odd conversion as we need the brightness slider to reach
  the full range, but it has no affect when incrementing between the
  division points for other effects.
- multi-intensity: provided by the LED core for red, green, and blue.
- effect: Allows the MCU to set 19 individual effects.
- effect_index: Lists the 19 valid effect names for the interface.
- enabled: Allows the MCU to toggle the RGB interface on/off.
- enabled_index: Lists the valid states for enabled.
- speed: Allows the MCU to set the animation rate for the various
  effects.
- speed_range: Lists the valid range of speed (0-9).

The MCU also has a few odd quirks that make sending multiple synchronous
events challenging. It will essentially freeze if it receives another
message before it has finished processing the last command. It also will
not reply if you wait on it using a completion. To get around this, we
do a 200ms sleep inside a work queue thread and debounce all but the most
recent message using a 50ms mod_delayed_work. This will cache the last
write, queue the work, then return so userspace can release its write
thread. The work queue is only used for brightness/multi-intensity as
that is the path likely to receive rapid successive writes.

Reviewed-by: Zhouwang Huang <honjow311@gmail.com>
Tested-by: Zhouwang Huang <honjow311@gmail.com>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v4:
  - Make oxp_rgb_queue delayed work struct part of drvdata and properly
    init, add cancel during remove.
---
 MAINTAINERS           |   6 +
 drivers/hid/Kconfig   |  12 +
 drivers/hid/Makefile  |   1 +
 drivers/hid/hid-ids.h |   3 +
 drivers/hid/hid-oxp.c | 652 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 674 insertions(+)
 create mode 100644 drivers/hid/hid-oxp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 6f6517bf4f97..dae814192fa4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19707,6 +19707,12 @@ S:	Maintained
 F:	drivers/mtd/nand/onenand/
 F:	include/linux/mtd/onenand*.h
 
+ONEXPLAYER HID DRIVER
+M:	Derek J. Clark <derekjohn.clark@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	drivers/hid/hid-oxp.c
+
 ONEXPLAYER PLATFORM EC DRIVER
 M:	Antheas Kapenekakis <lkml@antheas.dev>
 M:	Derek John Clark <derekjohn.clark@gmail.com>
diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 3c034cd32fa8..2deaec9f467d 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -919,6 +919,18 @@ config HID_ORTEK
 	   - Ortek WKB-2000
 	   - Skycable wireless presenter
 
+config HID_OXP
+	tristate "OneXPlayer handheld controller configuration support"
+	depends on USB_HID
+	depends on LEDS_CLASS
+	depends on LEDS_CLASS_MULTICOLOR
+	help
+	  Say Y here if you would like to enable support for OneXPlayer handheld
+	  devices that come with RGB LED rings around the joysticks and macro buttons.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called hid-oxp.
+
 config HID_PANTHERLORD
 	tristate "Pantherlord/GreenAsia game controller"
 	help
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 03ef72ec4499..bda8a24c9257 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -99,6 +99,7 @@ obj-$(CONFIG_HID_NTI)			+= hid-nti.o
 obj-$(CONFIG_HID_NTRIG)		+= hid-ntrig.o
 obj-$(CONFIG_HID_NVIDIA_SHIELD)	+= hid-nvidia-shield.o
 obj-$(CONFIG_HID_ORTEK)		+= hid-ortek.o
+obj-$(CONFIG_HID_OXP)		+= hid-oxp.o
 obj-$(CONFIG_HID_PRODIKEYS)	+= hid-prodikeys.o
 obj-$(CONFIG_HID_PANTHERLORD)	+= hid-pl.o
 obj-$(CONFIG_HID_PENMOUNT)	+= hid-penmount.o
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 5bad81222c6e..dcc5a3a70eaf 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1131,6 +1131,9 @@
 #define USB_VENDOR_ID_NVIDIA				0x0955
 #define USB_DEVICE_ID_NVIDIA_THUNDERSTRIKE_CONTROLLER	0x7214
 
+#define USB_VENDOR_ID_CRSC			0x1a2c
+#define USB_DEVICE_ID_ONEXPLAYER_GEN1		0xb001
+
 #define USB_VENDOR_ID_ONTRAK		0x0a07
 #define USB_DEVICE_ID_ONTRAK_ADU100	0x0064
 
diff --git a/drivers/hid/hid-oxp.c b/drivers/hid/hid-oxp.c
new file mode 100644
index 000000000000..f72bc74a7e6e
--- /dev/null
+++ b/drivers/hid/hid-oxp.c
@@ -0,0 +1,652 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  HID driver for OneXPlayer gamepad configuration devices.
+ *
+ *  Copyright (c) 2026 Valve Corporation
+ */
+
+#include <linux/array_size.h>
+#include <linux/cleanup.h>
+#include <linux/delay.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/hid.h>
+#include <linux/jiffies.h>
+#include <linux/kstrtox.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/mutex.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#include "hid-ids.h"
+
+#define OXP_PACKET_SIZE 64
+
+#define GEN1_MESSAGE_ID	0xff
+
+#define GEN1_USAGE_PAGE	0xff01
+
+enum oxp_function_index {
+	OXP_FID_GEN1_RGB_SET =		0x07,
+	OXP_FID_GEN1_RGB_REPLY =	0x0f,
+};
+
+static struct oxp_hid_cfg {
+	struct delayed_work oxp_rgb_queue;
+	struct led_classdev_mc *led_mc;
+	struct hid_device *hdev;
+	struct mutex cfg_mutex; /*ensure single synchronous output report*/
+	u8 rgb_brightness;
+	u8 rgb_effect;
+	u8 rgb_speed;
+	u8 rgb_en;
+} drvdata;
+
+enum oxp_feature_en_index {
+	OXP_FEAT_DISABLED,
+	OXP_FEAT_ENABLED,
+};
+
+static const char *const oxp_feature_en_text[] = {
+	[OXP_FEAT_DISABLED] = "false",
+	[OXP_FEAT_ENABLED] = "true",
+};
+
+enum oxp_rgb_effect_index {
+	OXP_UNKNOWN,
+	OXP_EFFECT_AURORA,
+	OXP_EFFECT_BIRTHDAY,
+	OXP_EFFECT_FLOWING,
+	OXP_EFFECT_CHROMA_1,
+	OXP_EFFECT_NEON,
+	OXP_EFFECT_CHROMA_2,
+	OXP_EFFECT_DREAMY,
+	OXP_EFFECT_WARM,
+	OXP_EFFECT_CYBERPUNK,
+	OXP_EFFECT_SEA,
+	OXP_EFFECT_SUNSET,
+	OXP_EFFECT_COLORFUL,
+	OXP_EFFECT_MONSTER,
+	OXP_EFFECT_GREEN,
+	OXP_EFFECT_BLUE,
+	OXP_EFFECT_YELLOW,
+	OXP_EFFECT_TEAL,
+	OXP_EFFECT_PURPLE,
+	OXP_EFFECT_FOGGY,
+	OXP_EFFECT_MONO_LIST, /* placeholder for effect_index_show */
+};
+
+/* These belong to rgb_effect_index, but we want to hide them from
+ * rgb_effect_text
+ */
+
+#define OXP_GET_PROPERTY 0xfc
+#define OXP_SET_PROPERTY 0xfd
+#define OXP_EFFECT_MONO_TRUE 0xfe /* actual index for monocolor */
+
+static const char *const oxp_rgb_effect_text[] = {
+	[OXP_UNKNOWN] = "unknown",
+	[OXP_EFFECT_AURORA] = "aurora",
+	[OXP_EFFECT_BIRTHDAY] = "birthday_cake",
+	[OXP_EFFECT_FLOWING] = "flowing_light",
+	[OXP_EFFECT_CHROMA_1] = "chroma_popping",
+	[OXP_EFFECT_NEON] = "neon",
+	[OXP_EFFECT_CHROMA_2] = "chroma_breathing",
+	[OXP_EFFECT_DREAMY] = "dreamy",
+	[OXP_EFFECT_WARM] = "warm_sun",
+	[OXP_EFFECT_CYBERPUNK] = "cyberpunk",
+	[OXP_EFFECT_SEA] = "sea_foam",
+	[OXP_EFFECT_SUNSET] = "sunset_afterglow",
+	[OXP_EFFECT_COLORFUL] = "colorful",
+	[OXP_EFFECT_MONSTER] = "monster_woke",
+	[OXP_EFFECT_GREEN] = "green_breathing",
+	[OXP_EFFECT_BLUE] = "blue_breathing",
+	[OXP_EFFECT_YELLOW] = "yellow_breathing",
+	[OXP_EFFECT_TEAL] = "teal_breathing",
+	[OXP_EFFECT_PURPLE] = "purple_breathing",
+	[OXP_EFFECT_FOGGY] = "foggy_haze",
+	[OXP_EFFECT_MONO_LIST] = "monocolor",
+};
+
+struct oxp_gen_1_rgb_report {
+	u8 report_id;
+	u8 message_id;
+	u8 padding_2[2];
+	u8 effect;
+	u8 enabled;
+	u8 speed;
+	u8 brightness;
+	u8 red;
+	u8 green;
+	u8 blue;
+} __packed;
+
+static u16 get_usage_page(struct hid_device *hdev)
+{
+	return hdev->collection[0].usage >> 16;
+}
+
+static int oxp_hid_raw_event_gen_1(struct hid_device *hdev,
+				   struct hid_report *report, u8 *data,
+				   int size)
+{
+	struct led_classdev_mc *led_mc = drvdata.led_mc;
+	struct oxp_gen_1_rgb_report *rgb_rep;
+
+	if (data[1] != OXP_FID_GEN1_RGB_REPLY)
+		return 0;
+
+	rgb_rep = (struct oxp_gen_1_rgb_report *)data;
+	/* Ensure we save monocolor as the list value */
+	drvdata.rgb_effect = rgb_rep->effect == OXP_EFFECT_MONO_TRUE ?
+			     OXP_EFFECT_MONO_LIST :
+			     rgb_rep->effect;
+	drvdata.rgb_speed = rgb_rep->speed;
+	drvdata.rgb_en = rgb_rep->enabled == 0 ? OXP_FEAT_DISABLED :
+						 OXP_FEAT_ENABLED;
+	drvdata.rgb_brightness = rgb_rep->brightness;
+	led_mc->led_cdev.brightness = rgb_rep->brightness / 4 *
+				      led_mc->led_cdev.max_brightness;
+	/* If monocolor had less than 100% brightness on the previous boot,
+	 * there will be no reliable way to determine the real intensity.
+	 * Since intensity scaling is used with a hardware brightness set at max,
+	 * our brightness will always look like 100%. Use the last set value to
+	 * prevent successive boots from lowering the brightness further.
+	 * Brightness will be "wrong" but the effect will remain the same visually.
+	 */
+	led_mc->subled_info[0].intensity = rgb_rep->red;
+	led_mc->subled_info[1].intensity = rgb_rep->green;
+	led_mc->subled_info[2].intensity = rgb_rep->blue;
+
+	return 0;
+}
+
+static int oxp_hid_raw_event(struct hid_device *hdev, struct hid_report *report,
+			     u8 *data, int size)
+{
+	u16 up = get_usage_page(hdev);
+
+	dev_dbg(&hdev->dev, "raw event data: [%*ph]\n", OXP_PACKET_SIZE, data);
+
+	switch (up) {
+	case GEN1_USAGE_PAGE:
+		return oxp_hid_raw_event_gen_1(hdev, report, data, size);
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mcu_property_out(u8 *header, size_t header_size, u8 *data,
+			    size_t data_size, u8 *footer, size_t footer_size)
+{
+	unsigned char *dmabuf __free(kfree) = kzalloc(OXP_PACKET_SIZE, GFP_KERNEL);
+	int ret;
+
+	if (!dmabuf)
+		return -ENOMEM;
+
+	if (header_size + data_size + footer_size > OXP_PACKET_SIZE)
+		return -EINVAL;
+
+	guard(mutex)(&drvdata.cfg_mutex);
+	memcpy(dmabuf, header, header_size);
+	memcpy(dmabuf + header_size, data, data_size);
+	if (footer_size)
+		memcpy(dmabuf + OXP_PACKET_SIZE - footer_size, footer, footer_size);
+
+	dev_dbg(&drvdata.hdev->dev, "raw data: [%*ph]\n", OXP_PACKET_SIZE, dmabuf);
+
+	ret = hid_hw_output_report(drvdata.hdev, dmabuf, OXP_PACKET_SIZE);
+	if (ret < 0)
+		return ret;
+
+	/* MCU takes 200ms to be ready for another command. */
+	msleep(200);
+	return ret == OXP_PACKET_SIZE ? 0 : -EIO;
+}
+
+static int oxp_gen_1_property_out(enum oxp_function_index fid, u8 *data,
+				  u8 data_size)
+{
+	u8 header[] = { fid, GEN1_MESSAGE_ID };
+	size_t header_size = ARRAY_SIZE(header);
+
+	return mcu_property_out(header, header_size, data, data_size, NULL, 0);
+}
+
+static int oxp_rgb_status_store(u8 enabled, u8 speed, u8 brightness)
+{
+	u16 up = get_usage_page(drvdata.hdev);
+	u8 *data;
+
+	/* Always default to max brightness and use intensity scaling when in
+	 * monocolor mode.
+	 */
+	switch (up) {
+	case GEN1_USAGE_PAGE:
+		data = (u8[4]) { OXP_SET_PROPERTY, enabled, speed, brightness };
+		if (drvdata.rgb_effect == OXP_EFFECT_MONO_LIST)
+			data[3] = 0x04;
+		return oxp_gen_1_property_out(OXP_FID_GEN1_RGB_SET, data, 4);
+	default:
+		return -ENODEV;
+	}
+}
+
+static ssize_t oxp_rgb_status_show(void)
+{
+	u16 up = get_usage_page(drvdata.hdev);
+	u8 *data;
+
+	switch (up) {
+	case GEN1_USAGE_PAGE:
+		data = (u8[1]) { OXP_GET_PROPERTY };
+		return oxp_gen_1_property_out(OXP_FID_GEN1_RGB_SET, data, 1);
+	default:
+		return -ENODEV;
+	}
+}
+
+static int oxp_rgb_color_set(void)
+{
+	u8 max_br = drvdata.led_mc->led_cdev.max_brightness;
+	u8 br = drvdata.led_mc->led_cdev.brightness;
+	u16 up = get_usage_page(drvdata.hdev);
+	u8 green, red, blue;
+	size_t size;
+	u8 *data;
+	int i;
+
+	red = br * drvdata.led_mc->subled_info[0].intensity / max_br;
+	green = br * drvdata.led_mc->subled_info[1].intensity / max_br;
+	blue = br * drvdata.led_mc->subled_info[2].intensity / max_br;
+
+	switch (up) {
+	case GEN1_USAGE_PAGE:
+		size = 55;
+		data = (u8[55]) { OXP_EFFECT_MONO_TRUE };
+
+		for (i = 0; i < (size - 1) / 3; i++) {
+			data[3 * i + 1] = red;
+			data[3 * i + 2] = green;
+			data[3 * i + 3] = blue;
+		}
+		return oxp_gen_1_property_out(OXP_FID_GEN1_RGB_SET, data, size);
+	default:
+		return -ENODEV;
+	}
+}
+
+static int oxp_rgb_effect_set(u8 effect)
+{
+	u16 up = get_usage_page(drvdata.hdev);
+	u8 *data;
+	int ret;
+
+	switch (effect) {
+	case OXP_EFFECT_AURORA:
+	case OXP_EFFECT_BIRTHDAY:
+	case OXP_EFFECT_FLOWING:
+	case OXP_EFFECT_CHROMA_1:
+	case OXP_EFFECT_NEON:
+	case OXP_EFFECT_CHROMA_2:
+	case OXP_EFFECT_DREAMY:
+	case OXP_EFFECT_WARM:
+	case OXP_EFFECT_CYBERPUNK:
+	case OXP_EFFECT_SEA:
+	case OXP_EFFECT_SUNSET:
+	case OXP_EFFECT_COLORFUL:
+	case OXP_EFFECT_MONSTER:
+	case OXP_EFFECT_GREEN:
+	case OXP_EFFECT_BLUE:
+	case OXP_EFFECT_YELLOW:
+	case OXP_EFFECT_TEAL:
+	case OXP_EFFECT_PURPLE:
+	case OXP_EFFECT_FOGGY:
+		switch (up) {
+		case GEN1_USAGE_PAGE:
+			data = (u8[1]) { effect };
+			ret = oxp_gen_1_property_out(OXP_FID_GEN1_RGB_SET, data, 1);
+			break;
+		default:
+			ret = -ENODEV;
+		}
+		break;
+	case OXP_EFFECT_MONO_LIST:
+		ret = oxp_rgb_color_set();
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ret)
+		return ret;
+
+	drvdata.rgb_effect = effect;
+
+	return 0;
+}
+
+static ssize_t enabled_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	int ret;
+	u8 val;
+
+	ret = sysfs_match_string(oxp_feature_en_text, buf);
+	if (ret < 0)
+		return ret;
+	val = ret;
+
+	ret = oxp_rgb_status_store(val, drvdata.rgb_speed,
+				   drvdata.rgb_brightness);
+	if (ret)
+		return ret;
+
+	drvdata.rgb_en = val;
+	return count;
+}
+
+static ssize_t enabled_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	int ret;
+
+	ret = oxp_rgb_status_show();
+	if (ret)
+		return ret;
+
+	if (drvdata.rgb_en >= ARRAY_SIZE(oxp_feature_en_text))
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%s\n", oxp_feature_en_text[drvdata.rgb_en]);
+}
+static DEVICE_ATTR_RW(enabled);
+
+static ssize_t enabled_index_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	size_t count = 0;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(oxp_feature_en_text); i++)
+		count += sysfs_emit_at(buf, count, "%s ", oxp_feature_en_text[i]);
+
+	if (count)
+		buf[count - 1] = '\n';
+
+	return count;
+}
+static DEVICE_ATTR_RO(enabled_index);
+
+static ssize_t effect_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
+{
+	int ret;
+	u8 val;
+
+	ret = sysfs_match_string(oxp_rgb_effect_text, buf);
+	if (ret < 0)
+		return ret;
+
+	val = ret;
+
+	ret = oxp_rgb_status_store(drvdata.rgb_en, drvdata.rgb_speed,
+				   drvdata.rgb_brightness);
+	if (ret)
+		return ret;
+
+	ret = oxp_rgb_effect_set(val);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t effect_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	int ret;
+
+	ret = oxp_rgb_status_show();
+	if (ret)
+		return ret;
+
+	if (drvdata.rgb_effect >= ARRAY_SIZE(oxp_rgb_effect_text))
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%s\n", oxp_rgb_effect_text[drvdata.rgb_effect]);
+}
+
+static DEVICE_ATTR_RW(effect);
+
+static ssize_t effect_index_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	size_t count = 0;
+	unsigned int i;
+
+	for (i = 1; i < ARRAY_SIZE(oxp_rgb_effect_text); i++)
+		count += sysfs_emit_at(buf, count, "%s ", oxp_rgb_effect_text[i]);
+
+	if (count)
+		buf[count - 1] = '\n';
+
+	return count;
+}
+static DEVICE_ATTR_RO(effect_index);
+
+static ssize_t speed_store(struct device *dev, struct device_attribute *attr,
+			   const char *buf, size_t count)
+{
+	int ret;
+	u8 val;
+
+	ret = kstrtou8(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	if (val > 9)
+		return -EINVAL;
+
+	ret = oxp_rgb_status_store(drvdata.rgb_en, val, drvdata.rgb_brightness);
+	if (ret)
+		return ret;
+
+	drvdata.rgb_speed = val;
+	return count;
+}
+
+static ssize_t speed_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
+{
+	int ret;
+
+	ret = oxp_rgb_status_show();
+	if (ret)
+		return ret;
+
+	if (drvdata.rgb_speed > 9)
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%hhu\n", drvdata.rgb_speed);
+}
+static DEVICE_ATTR_RW(speed);
+
+static ssize_t speed_range_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "0-9\n");
+}
+static DEVICE_ATTR_RO(speed_range);
+
+static void oxp_rgb_queue_fn(struct work_struct *work)
+{
+	unsigned int max_brightness = drvdata.led_mc->led_cdev.max_brightness;
+	unsigned int brightness = drvdata.led_mc->led_cdev.brightness;
+	u8 val = 4 * brightness / max_brightness;
+	int ret;
+
+	if (drvdata.rgb_brightness != val) {
+		ret = oxp_rgb_status_store(drvdata.rgb_en, drvdata.rgb_speed, val);
+		if (ret)
+			dev_err(drvdata.led_mc->led_cdev.dev,
+				"Error: Failed to write RGB Status: %i\n", ret);
+
+		drvdata.rgb_brightness = val;
+	}
+
+	if (drvdata.rgb_effect != OXP_EFFECT_MONO_LIST)
+		return;
+
+	ret = oxp_rgb_effect_set(drvdata.rgb_effect);
+	if (ret)
+		dev_err(drvdata.led_mc->led_cdev.dev, "Error: Failed to write RGB color: %i\n",
+			ret);
+}
+
+static void oxp_rgb_brightness_set(struct led_classdev *led_cdev,
+				   enum led_brightness brightness)
+{
+	led_cdev->brightness = brightness;
+	mod_delayed_work(system_wq, &drvdata.oxp_rgb_queue, msecs_to_jiffies(50));
+}
+
+static struct attribute *oxp_rgb_attrs[] = {
+	&dev_attr_effect.attr,
+	&dev_attr_effect_index.attr,
+	&dev_attr_enabled.attr,
+	&dev_attr_enabled_index.attr,
+	&dev_attr_speed.attr,
+	&dev_attr_speed_range.attr,
+	NULL,
+};
+
+static const struct attribute_group oxp_rgb_attr_group = {
+	.attrs = oxp_rgb_attrs,
+};
+
+static struct mc_subled oxp_rgb_subled_info[] = {
+	{
+		.color_index = LED_COLOR_ID_RED,
+		.intensity = 0x24,
+		.channel = 0x1,
+	},
+	{
+		.color_index = LED_COLOR_ID_GREEN,
+		.intensity = 0x22,
+		.channel = 0x2,
+	},
+	{
+		.color_index = LED_COLOR_ID_BLUE,
+		.intensity = 0x99,
+		.channel = 0x3,
+	},
+};
+
+static struct led_classdev_mc oxp_cdev_rgb = {
+	.led_cdev = {
+		.name = "oxp:rgb:joystick_rings",
+		.color = LED_COLOR_ID_RGB,
+		.brightness = 0x64,
+		.max_brightness = 0x64,
+		.brightness_set = oxp_rgb_brightness_set,
+	},
+	.num_colors = ARRAY_SIZE(oxp_rgb_subled_info),
+	.subled_info = oxp_rgb_subled_info,
+};
+
+static int oxp_cfg_probe(struct hid_device *hdev, u16 up)
+{
+	int ret;
+
+	hid_set_drvdata(hdev, &drvdata);
+	mutex_init(&drvdata.cfg_mutex);
+	drvdata.hdev = hdev;
+	drvdata.led_mc = &oxp_cdev_rgb;
+
+	INIT_DELAYED_WORK(&drvdata.oxp_rgb_queue, oxp_rgb_queue_fn);
+	ret = devm_led_classdev_multicolor_register(&hdev->dev, &oxp_cdev_rgb);
+	if (ret)
+		return dev_err_probe(&hdev->dev, ret,
+				     "Failed to create RGB device\n");
+
+	ret = devm_device_add_group(drvdata.led_mc->led_cdev.dev,
+				    &oxp_rgb_attr_group);
+	if (ret)
+		return dev_err_probe(drvdata.led_mc->led_cdev.dev, ret,
+				     "Failed to create RGB configuration attributes\n");
+
+	ret = oxp_rgb_status_show();
+	if (ret)
+		dev_warn(drvdata.led_mc->led_cdev.dev,
+			 "Failed to query RGB initial state: %i\n", ret);
+
+	return 0;
+}
+
+static int oxp_hid_probe(struct hid_device *hdev,
+			 const struct hid_device_id *id)
+{
+	int ret;
+	u16 up;
+
+	ret = hid_parse(hdev);
+	if (ret)
+		return dev_err_probe(&hdev->dev, ret, "Failed to parse HID device\n");
+
+	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+	if (ret)
+		return dev_err_probe(&hdev->dev, ret, "Failed to start HID device\n");
+
+	ret = hid_hw_open(hdev);
+	if (ret) {
+		hid_hw_stop(hdev);
+		return dev_err_probe(&hdev->dev, ret, "Failed to open HID device\n");
+	}
+
+	up = get_usage_page(hdev);
+	dev_dbg(&hdev->dev, "Got usage page %04x\n", up);
+
+	switch (up) {
+	case GEN1_USAGE_PAGE:
+		ret = oxp_cfg_probe(hdev, up);
+		if (ret) {
+			hid_hw_close(hdev);
+			hid_hw_stop(hdev);
+		}
+
+		return ret;
+	default:
+		return 0;
+	}
+}
+
+static void oxp_hid_remove(struct hid_device *hdev)
+{
+	cancel_delayed_work(&drvdata.oxp_rgb_queue);
+	hid_hw_close(hdev);
+	hid_hw_stop(hdev);
+}
+
+static const struct hid_device_id oxp_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CRSC, USB_DEVICE_ID_ONEXPLAYER_GEN1) },
+	{}
+};
+
+MODULE_DEVICE_TABLE(hid, oxp_devices);
+static struct hid_driver hid_oxp = {
+	.name = "hid-oxp",
+	.id_table = oxp_devices,
+	.probe = oxp_hid_probe,
+	.remove = oxp_hid_remove,
+	.raw_event = oxp_hid_raw_event,
+};
+module_hid_driver(hid_oxp);
+
+MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
+MODULE_DESCRIPTION("Driver for OneXPlayer HID Interfaces");
+MODULE_LICENSE("GPL");
-- 
2.53.0

