Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2478271456
	for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 04:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776572792; cv=none; b=YU37ZpnRoDeDtkJrX/fUl5cigY3T0zg+SiDLCCRfIJR4pylmHG4lmBModuJ0IYF6XXTA7RYIxDcYIo+gC2pqiVpG8BGER2buMV0i8CwPjfFckcb6OSVCvzeaGfGabGvjHpVukaf3f7O1a4vNRtUW7Q/MJpZQbKvZMKcUSs9+Ceo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776572792; c=relaxed/simple;
	bh=L4XGYV1xGNK5tvTGZ+Q0ZsLPHiEPp41+QXbzo0cVLdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L8Lx9Pelj+Kkc83qwjxw05O67Qo5gk7faA8Ns883EReFnBi6HH7h9P5LrBfWOxFcxHUurNM1UGZRwnuaTaJUqSfgbAOMRbVvS/Tz3uwlWtJaSgR7qG2J5hqcV4WT00vGP9xnzt7KysFlibTHyloFYa2hl//z5QDW2NFcTrKoxP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMyOE43H; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMyOE43H"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b6b0500e06so3774584eec.1
        for <linux-doc@vger.kernel.org>; Sat, 18 Apr 2026 21:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776572788; x=1777177588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0tmU4kwx0IKZDOyDiuG2KSwchT5ymVC5ZFjoriu4A8=;
        b=QMyOE43H4iUNV1anUbcHpCfMKqRDe4wZw7DxG6jzz1U8p2Vf4ZrU0/w4EAT0eji5cZ
         jVhHuhWT7PhcY/pgjKYs4IQb5yyU9Ef4aIjZMi704EUig4A0JmEEytKZwrBv232/SVAW
         gkDOfhrYMxdgW6wHo4rhAj8aB/UBrTJfIb6ewncM193HncTYfLTX+pSipFsacSpn/u+B
         QlaLEs/dkATRSEPfcYBn3kUoI5jsTy4T+D2OADPyWFUfbU36ezGJXdOiG6ZmaqmIfrc7
         u41joCjTSR/ZpEulc0q78ZrffhrYiVOurcKlB3kX/9j/ewbBkuX9lSZvKXt66ZFjwtc+
         t6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776572788; x=1777177588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U0tmU4kwx0IKZDOyDiuG2KSwchT5ymVC5ZFjoriu4A8=;
        b=sU5xI0fdK13w+7ECpNzGReTdCgItjNc5ek3U/Ka+YHdr4jx5aAt8BV4/+qZgGRXzYD
         V1lF8biNTfPtCi8BTQe69FyjeQRMVRlJGTAO/PPS7fU951NEu1KUIDDnnxnUk2CoOW/m
         wgWLOzja9+UyvYkU/c7jDr1qsVRpxZ4G3kXE0duE4xHOARhiRiUysMlsVxonREyuMqm7
         +TSB3Q9yY3tuljvOi2h5rIiM0wkaWMZxUpFzlNhXwR95lV47vknb3enHnLw/4xAt3S3G
         N8wr6DtZ5IQEIBklR2DMT+6VlC4ENJK06I7dnrtekWlwlGlO0hEHAslytTr8WrbZQrMk
         pXeA==
X-Forwarded-Encrypted: i=1; AFNElJ+X5kEN/dJv5NVROGScIEFRkGpnD3vjHK0upr66kOAbBWg2f6VSK5IwesAwUU3I4XI5xgY8x+Rv12A=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp7jDas5kliwaR66b59XAQ1CZeByZRJ93jPMA/OhekjOSLWaZ6
	Dt7OTHF8UuMVYstBFzZ7rBxNNoNZkTWW/WAHBM3k5Xd0cQPUuOIT/ayLvwyARw==
X-Gm-Gg: AeBDieuSog/O4IVDMkeklIW4SYIcy7V8hJaUa7OgjjWvjzBhc2o/H+8xdK4a1QT3nEj
	bOR2cZxGFCX1oqxpfyUJT6RvbNn5o+LVTzCGUl9VyE0GYusFeU+a2/dcea0QpqF/Aks6piG79jg
	ahVIqZOcYS1zwks8Utke/tVlq+pSxfhcukhxLkjDUsDWto3nGf1uwgkmXIbwlXe109GDacPD+cm
	dtY8i7tjHEC4GGZbSfOIoKcN76q7hYUV1V9QY+KIjbQ2y9lCotgMLR9MIBJWvOIC1bdLlKGHSFn
	Knw5wkKfO5jBHcZ2dNfCysSHlwl0oXav10C3ZWszbis9vSHs02nPcUmzhVrnr/ML4x2XVMyfkC3
	Jk/WwPgPw8G0d6FX8QFXxxj7DzsX7TYUKXTcY2nWme3CoJGRAkzAoyRyQ4XmgWVLe14VVtaKZnN
	VQm3vmHrIg6PQeFTAjceHFEqGUQXXzNTO68VP2AysaqWKuTaGxrqZsSb8RC4llowKrhnJptyrTM
	2YC00Q5BCtB13Yv5TjatIUZow==
X-Received: by 2002:a05:693c:2b08:b0:2c1:7afc:df06 with SMTP id 5a478bee46e88-2e464ea7057mr4009022eec.5.1776572787893;
        Sat, 18 Apr 2026 21:26:27 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53dcb487bsm8796469eec.31.2026.04.18.21.26.27
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
Subject: [PATCH v4 2/5] HID: hid-oxp: Add Second Generation RGB Control
Date: Sat, 18 Apr 2026 21:26:21 -0700
Message-ID: <20260419042624.625746-3-derekjohn.clark@gmail.com>
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
index f72bc74a7e6e..835de2118e3c 100644
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
@@ -122,6 +126,22 @@ struct oxp_gen_1_rgb_report {
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
@@ -162,6 +182,44 @@ static int oxp_hid_raw_event_gen_1(struct hid_device *hdev,
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
@@ -172,6 +230,8 @@ static int oxp_hid_raw_event(struct hid_device *hdev, struct hid_report *report,
 	switch (up) {
 	case GEN1_USAGE_PAGE:
 		return oxp_hid_raw_event_gen_1(hdev, report, data, size);
+	case GEN2_USAGE_PAGE:
+		return oxp_hid_raw_event_gen_2(hdev, report, data, size);
 	default:
 		break;
 	}
@@ -217,6 +277,18 @@ static int oxp_gen_1_property_out(enum oxp_function_index fid, u8 *data,
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
@@ -231,6 +303,11 @@ static int oxp_rgb_status_store(u8 enabled, u8 speed, u8 brightness)
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
@@ -245,6 +322,9 @@ static ssize_t oxp_rgb_status_show(void)
 	case GEN1_USAGE_PAGE:
 		data = (u8[1]) { OXP_GET_PROPERTY };
 		return oxp_gen_1_property_out(OXP_FID_GEN1_RGB_SET, data, 1);
+	case GEN2_USAGE_PAGE:
+		data = (u8[3]) { OXP_GET_PROPERTY, 0x00, 0x02 };
+		return oxp_gen_2_property_out(OXP_FID_GEN2_STATUS_EVENT, data, 3);
 	default:
 		return -ENODEV;
 	}
@@ -275,6 +355,16 @@ static int oxp_rgb_color_set(void)
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
@@ -311,6 +401,10 @@ static int oxp_rgb_effect_set(u8 effect)
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
@@ -559,6 +653,56 @@ static struct led_classdev_mc oxp_cdev_rgb = {
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
@@ -566,6 +710,10 @@ static int oxp_cfg_probe(struct hid_device *hdev, u16 up)
 	hid_set_drvdata(hdev, &drvdata);
 	mutex_init(&drvdata.cfg_mutex);
 	drvdata.hdev = hdev;
+
+	if (up == GEN2_USAGE_PAGE && oxp_hybrid_mcu_device())
+		goto skip_rgb;
+
 	drvdata.led_mc = &oxp_cdev_rgb;
 
 	INIT_DELAYED_WORK(&drvdata.oxp_rgb_queue, oxp_rgb_queue_fn);
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
@@ -634,6 +784,7 @@ static void oxp_hid_remove(struct hid_device *hdev)
 
 static const struct hid_device_id oxp_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CRSC, USB_DEVICE_ID_ONEXPLAYER_GEN1) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_WCH, USB_DEVICE_ID_ONEXPLAYER_GEN2) },
 	{}
 };
 
-- 
2.53.0

