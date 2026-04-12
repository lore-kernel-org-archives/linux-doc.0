Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8E237B409
	for <linux-doc@vger.kernel.org>; Sun, 12 Apr 2026 21:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776029691; cv=none; b=AhoWUQvCc7lYfZ3YujYRi9dZBKizlZ3fmzcZ6j+jNUG1+ozTrX5oZRa9DD9tQfPOTa4ZG59egQwvGdS7FwQY6CT7b55Su1/E/+AzD1E6rAwFM+cc+9vYaNhwnHeMrFWlVD6SM8J/BsMUnwosA4RCDZu+FV8QKwm/V+ljLmIqIoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776029691; c=relaxed/simple;
	bh=tiStYgWYJFq58bGH7lQyClPfoEl6n2mzImPJEUjvm30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h7fTPQr2lvv0RdsOaPzY0CmY2Kfa6HyhbK1jAQlfdceyQFXzoA9AJ3zLhauXChCBvynrSanlPVYpTou9odLe0e6wRhgjaTUlg4wC+9NrOOKZPKPJcB93gpJfWqNnXf11ttdeAE/trwcZgkAr8zEsq7cUE1opCC+inR4O2zXlU7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nmh7oYpR; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nmh7oYpR"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1274204434bso2112897c88.1
        for <linux-doc@vger.kernel.org>; Sun, 12 Apr 2026 14:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776029689; x=1776634489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ey9dfIkhMREe99F7ZTwwH+2a3vv6tO5+2fxe0rGImkg=;
        b=Nmh7oYpRq426pok4gEe5+FkLQcxt+TuwIRcAayRvOuy6yTOxbdp3sB2k3XxVEoIYwb
         HfREx3ZqchO+ysn9BteQxJxf9fWzLiUyoW4Njqxe8wkEL5J4LwGsRyAt8L0lfQU96SEs
         DNGC4LLLtwzUr2iIknSJn0fYyt7aeZQmCMOEi15CYAPG4CB3mR1A8NJHctcAnJRWmvh1
         Z0yooIZPPfWzTJowHB5Wb7BpJONaA9BtOUku1NkYyrwxppYWwXLHM/HDzfA8GCHDsQ2R
         sjmqHw8hwKdXji8Q7Xbdd1VoAFaAhd8rXPy8fjqlqwQGLNWLYmVigNMFdhre4KkZfAoA
         P7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776029689; x=1776634489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ey9dfIkhMREe99F7ZTwwH+2a3vv6tO5+2fxe0rGImkg=;
        b=b+ay372AcXGDqEGrSbgkEOH1WjqqvSoWHcGz2/NT/4vYRttrcVYj5GNvRnnVeieyLk
         1ItAOwjI564gmgC2IzGxfcRRbPfXIDIz88k1tRaYqosjEWsg4aueVjJMT3SuIYzITvNo
         Arw5bPuaiw4w+oTT6TsVDZsCE2aCLiTJM7GP6M4zlk3pseVlXxl+fikpds5pDfsCwLdS
         mbAeFS3ldTT6lZklyLNbkXh1qUrCq2ei++Qfarm2z9gBzYDpwg0AJOnYch2DUauV82jA
         xeq+KS1X1MiUTatbZOnnmF9YIgBL6V93ZTOowwnN8FTeAMH089GooQth7uoECZcHkPjA
         3hIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKfmvEWBcFM6HxDHJBeUVXTc+ZvA7WDXHev85U+k2n2IDLXDMSMfKII4u6ZtWsyvr9OipyB3tceZA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz79eL8BvmElp/S+a+cGTZflhgN6JyvRvFQv4bXdP2WM8BehiC6
	XYiDlMvL4D/6DJGNPKutPQTbHviR4BxZFnGPSkpiby/UKxrfpTtWMqtN
X-Gm-Gg: AeBDievz1XFMEPm+ATz7P0C0c13XFiMbwY+8ZaMMmt5ld044pQ7T8d4ICd6UIgHwhun
	6aTH4F0A5q4E/B/RJ9H8ymRIMDTSvsOQrjEig4thCDRQ7lEf3mBMmF5tHfeVwPgYNALAfSY5dfS
	n6cpzJeed915bhcT7gsa8nwU24rkuR5nR7Xo972SOSN7Ig0rY1mQD3aemDntAqs/gNPS1zZFlPg
	xLACduwAkDZfjLh2w9YYGl2iMgdgCwlnYWl5RHf9sm3YaRq7Kxkja5KgfZVE2d2pNrdH0quXDf1
	ToV9idc6yIFcimFctKLqCdVp5YguQrxhTFcXtJARVIgaHC8DIlEo1gwGFpddo8SSPiyTekiBLNn
	aX4ik6cjKTwUXVbgjHFG/TU1ez3OPEj722v6BmkAutvru4Nc4c+0fwvmvvJD/mAUuQQ6TE+tZha
	kCaTgR7z5erxzSkGCm+QVaJ/Nivmuex8yJUaeMVpQyAM0urXIG7tmWtdIEk6XkbMO4QdXyEKVkS
	pdH
X-Received: by 2002:a05:7022:6b8c:b0:12c:4931:c488 with SMTP id a92af1059eb24-12c4931c533mr1741098c88.14.1776029689064;
        Sun, 12 Apr 2026 14:34:49 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c345b5b9dsm10631736c88.7.2026.04.12.14.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 14:34:48 -0700 (PDT)
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
Subject: [PATCH v3 2/5] HID: hid-oxp: Add Second Generation RGB Control
Date: Sun, 12 Apr 2026 21:34:41 +0000
Message-ID: <20260412213444.2231505-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412213444.2231505-1-derekjohn.clark@gmail.com>
References: <20260412213444.2231505-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for the second generation of RGB Control for OneXPlayer
devices. The interface mirrors the first generation, with some
differences to how messages are formatted.

Some devices have both a GEN1 MCU for RGB control and a GEN2 MCU for
button mapping. To avoid conflicts, quirk these devices to skip RGB
setup for the GEN2_USAGE_PAGE.

Reviewed-by: Zhouwang Huang <honjow311@gmail.com>
Tested-by: Zhouwang Huang <honjow311@gmail.com>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v2:
  - Add DMI quirks table.
---
 drivers/hid/Kconfig   |   1 +
 drivers/hid/hid-ids.h |   3 +
 drivers/hid/hid-oxp.c | 151 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 155 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 2deaec9f467d..b779088b80b6 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -924,6 +924,7 @@ config HID_OXP
 	depends on USB_HID
 	depends on LEDS_CLASS
 	depends on LEDS_CLASS_MULTICOLOR
+	depends on DMI
 	help
 	  Say Y here if you would like to enable support for OneXPlayer handheld
 	  devices that come with RGB LED rings around the joysticks and macro buttons.
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index dcc5a3a70eaf..0d1ff879e959 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1134,6 +1134,9 @@
 #define USB_VENDOR_ID_CRSC			0x1a2c
 #define USB_DEVICE_ID_ONEXPLAYER_GEN1		0xb001
 
+#define USB_VENDOR_ID_WCH			0x1a86
+#define USB_DEVICE_ID_ONEXPLAYER_GEN2		0xfe00
+
 #define USB_VENDOR_ID_ONTRAK		0x0a07
 #define USB_DEVICE_ID_ONTRAK_ADU100	0x0064
 
diff --git a/drivers/hid/hid-oxp.c b/drivers/hid/hid-oxp.c
index c4219ecd8d71..25214356163e 100644
--- a/drivers/hid/hid-oxp.c
+++ b/drivers/hid/hid-oxp.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/dev_printk.h>
 #include <linux/device.h>
+#include <linux/dmi.h>
 #include <linux/hid.h>
 #include <linux/jiffies.h>
 #include <linux/kstrtox.h>
@@ -24,12 +25,15 @@
 #define OXP_PACKET_SIZE 64
 
 #define GEN1_MESSAGE_ID	0xff
+#define GEN2_MESSAGE_ID	0x3f
 
 #define GEN1_USAGE_PAGE	0xff01
+#define GEN2_USAGE_PAGE	0xff00
 
 enum oxp_function_index {
 	OXP_FID_GEN1_RGB_SET =		0x07,
 	OXP_FID_GEN1_RGB_REPLY =	0x0f,
+	OXP_FID_GEN2_STATUS_EVENT =	0xb8,
 };
 
 static struct oxp_hid_cfg {
@@ -121,6 +125,22 @@ struct oxp_gen_1_rgb_report {
 	u8 blue;
 } __packed;
 
+struct oxp_gen_2_rgb_report {
+	u8 report_id;
+	u8 header_id;
+	u8 padding_2;
+	u8 message_id;
+	u8 padding_4[2];
+	u8 enabled;
+	u8 speed;
+	u8 brightness;
+	u8 red;
+	u8 green;
+	u8 blue;
+	u8 padding_12[3];
+	u8 effect;
+} __packed;
+
 static u16 get_usage_page(struct hid_device *hdev)
 {
 	return hdev->collection[0].usage >> 16;
@@ -161,6 +181,44 @@ static int oxp_hid_raw_event_gen_1(struct hid_device *hdev,
 	return 0;
 }
 
+static int oxp_hid_raw_event_gen_2(struct hid_device *hdev,
+				   struct hid_report *report, u8 *data,
+				   int size)
+{
+	struct led_classdev_mc *led_mc = drvdata.led_mc;
+	struct oxp_gen_2_rgb_report *rgb_rep;
+
+	if (data[0] != OXP_FID_GEN2_STATUS_EVENT)
+		return 0;
+
+	if (data[3] != OXP_GET_PROPERTY)
+		return 0;
+
+	rgb_rep = (struct oxp_gen_2_rgb_report *)data;
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
 static int oxp_hid_raw_event(struct hid_device *hdev, struct hid_report *report,
 			     u8 *data, int size)
 {
@@ -171,6 +229,8 @@ static int oxp_hid_raw_event(struct hid_device *hdev, struct hid_report *report,
 	switch (up) {
 	case GEN1_USAGE_PAGE:
 		return oxp_hid_raw_event_gen_1(hdev, report, data, size);
+	case GEN2_USAGE_PAGE:
+		return oxp_hid_raw_event_gen_2(hdev, report, data, size);
 	default:
 		break;
 	}
@@ -216,6 +276,18 @@ static int oxp_gen_1_property_out(enum oxp_function_index fid, u8 *data,
 	return mcu_property_out(header, header_size, data, data_size, NULL, 0);
 }
 
+static int oxp_gen_2_property_out(enum oxp_function_index fid, u8 *data,
+				  u8 data_size)
+{
+	u8 header[] = { fid, GEN2_MESSAGE_ID, 0x01 };
+	u8 footer[] = { GEN2_MESSAGE_ID, fid };
+	size_t header_size = ARRAY_SIZE(header);
+	size_t footer_size = ARRAY_SIZE(footer);
+
+	return mcu_property_out(header, header_size, data, data_size, footer,
+				footer_size);
+}
+
 static int oxp_rgb_status_store(u8 enabled, u8 speed, u8 brightness)
 {
 	u16 up = get_usage_page(drvdata.hdev);
@@ -230,6 +302,11 @@ static int oxp_rgb_status_store(u8 enabled, u8 speed, u8 brightness)
 		if (drvdata.rgb_effect == OXP_EFFECT_MONO_LIST)
 			data[3] = 0x04;
 		return oxp_gen_1_property_out(OXP_FID_GEN1_RGB_SET, data, 4);
+	case GEN2_USAGE_PAGE:
+		data = (u8[6]) { OXP_SET_PROPERTY, 0x00, 0x02, enabled, speed, brightness };
+		if (drvdata.rgb_effect == OXP_EFFECT_MONO_LIST)
+			data[5] = 0x04;
+		return oxp_gen_2_property_out(OXP_FID_GEN2_STATUS_EVENT, data, 6);
 	default:
 		return -ENODEV;
 	}
@@ -244,6 +321,9 @@ static ssize_t oxp_rgb_status_show(void)
 	case GEN1_USAGE_PAGE:
 		data = (u8[1]) { OXP_GET_PROPERTY };
 		return oxp_gen_1_property_out(OXP_FID_GEN1_RGB_SET, data, 1);
+	case GEN2_USAGE_PAGE:
+		data = (u8[3]) { OXP_GET_PROPERTY, 0x00, 0x02 };
+		return oxp_gen_2_property_out(OXP_FID_GEN2_STATUS_EVENT, data, 3);
 	default:
 		return -ENODEV;
 	}
@@ -274,6 +354,16 @@ static int oxp_rgb_color_set(void)
 			data[3 * i + 3] = blue;
 		}
 		return oxp_gen_1_property_out(OXP_FID_GEN1_RGB_SET, data, size);
+	case GEN2_USAGE_PAGE:
+		size = 57;
+		data = (u8[57]) { OXP_EFFECT_MONO_TRUE, 0x00, 0x02 };
+
+		for (i = 1; i < size / 3; i++) {
+			data[3 * i] = red;
+			data[3 * i + 1] = green;
+			data[3 * i + 2] = blue;
+		}
+		return oxp_gen_2_property_out(OXP_FID_GEN2_STATUS_EVENT, data, size);
 	default:
 		return -ENODEV;
 	}
@@ -310,6 +400,10 @@ static int oxp_rgb_effect_set(u8 effect)
 			data = (u8[1]) { effect };
 			ret = oxp_gen_1_property_out(OXP_FID_GEN1_RGB_SET, data, 1);
 			break;
+		case GEN2_USAGE_PAGE:
+			data = (u8[3]) { effect, 0x00, 0x02 };
+			ret = oxp_gen_2_property_out(OXP_FID_GEN2_STATUS_EVENT, data, 3);
+			break;
 		default:
 			ret = -ENODEV;
 		}
@@ -560,6 +654,56 @@ static struct led_classdev_mc oxp_cdev_rgb = {
 	.subled_info = oxp_rgb_subled_info,
 };
 
+struct quirk_entry {
+	bool hybrid_mcu;
+};
+
+static struct quirk_entry quirk_hybrid_mcu = {
+	.hybrid_mcu = true,
+};
+
+static const struct dmi_system_id oxp_hybrid_mcu_list[] = {
+	{
+		.ident = "OneXPlayer Apex",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER APEX"),
+		},
+		.driver_data = &quirk_hybrid_mcu,
+	},
+	{
+		.ident = "OneXPlayer G1 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER G1 A"),
+		},
+		.driver_data = &quirk_hybrid_mcu,
+	},
+	{
+		.ident = "OneXPlayer G1 Intel",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER G1 i"),
+		},
+		.driver_data = &quirk_hybrid_mcu,
+	},
+	{},
+};
+
+static bool oxp_hybrid_mcu_device(void)
+{
+	const struct dmi_system_id *dmi_id;
+	struct quirk_entry *quirks;
+
+	dmi_id = dmi_first_match(oxp_hybrid_mcu_list);
+	if (!dmi_id)
+		return false;
+
+	quirks = dmi_id->driver_data;
+
+	return quirks->hybrid_mcu;
+}
+
 static int oxp_cfg_probe(struct hid_device *hdev, u16 up)
 {
 	int ret;
@@ -567,6 +711,10 @@ static int oxp_cfg_probe(struct hid_device *hdev, u16 up)
 	hid_set_drvdata(hdev, &drvdata);
 	mutex_init(&drvdata.cfg_mutex);
 	drvdata.hdev = hdev;
+
+	if (up == GEN2_USAGE_PAGE && oxp_hybrid_mcu_device())
+		goto skip_rgb;
+
 	drvdata.led_mc = &oxp_cdev_rgb;
 
 	ret = devm_led_classdev_multicolor_register(&hdev->dev, &oxp_cdev_rgb);
@@ -585,6 +733,7 @@ static int oxp_cfg_probe(struct hid_device *hdev, u16 up)
 		dev_warn(drvdata.led_mc->led_cdev.dev,
 			 "Failed to query RGB initial state: %i\n", ret);
 
+skip_rgb:
 	return 0;
 }
 
@@ -613,6 +762,7 @@ static int oxp_hid_probe(struct hid_device *hdev,
 
 	switch (up) {
 	case GEN1_USAGE_PAGE:
+	case GEN2_USAGE_PAGE:
 		ret = oxp_cfg_probe(hdev, up);
 		if (ret) {
 			hid_hw_close(hdev);
@@ -633,6 +783,7 @@ static void oxp_hid_remove(struct hid_device *hdev)
 
 static const struct hid_device_id oxp_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CRSC, USB_DEVICE_ID_ONEXPLAYER_GEN1) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_WCH, USB_DEVICE_ID_ONEXPLAYER_GEN2) },
 	{}
 };
 
-- 
2.53.0

