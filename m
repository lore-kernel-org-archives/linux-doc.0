Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC66128395
	for <linux-doc@vger.kernel.org>; Sun, 22 Mar 2026 03:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774149382; cv=none; b=rUU0NvH0YexJt9LK8nkocbORRH0WJZ/cG8iiru5KvRozTZK4uVGj5DOEcPpYqRzCePswF1em6VqX7Lo902hYdD4nbWttB/ymnjcmhcoVLoDYM/1s495lUeNNeo0DBg0fIs+ROkPsL3GCUtbYcZpe7I+VCJX/souq01IUpePGF+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774149382; c=relaxed/simple;
	bh=8gNYXpQGmKI1m3W5oqjVsx8k92Qrt1pu/7hbhyiLEXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D34uEGkQC0xYnQnTMfkiXsfCE6ssey3bmZcUEs8c/equSvjcwn+4udYACOlOApimXyBrF2XU6pg1iZOCznrf4jOH2b1ZDel+IIJnRb3sjE90kOfpjLX6cI+U/X5b7eNZMzITKX3dcDcXtDJh5yH5kXefrWgJPI72GGAPXJPhZgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKKwtJyw; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKKwtJyw"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c1092cc08cso4774747eec.1
        for <linux-doc@vger.kernel.org>; Sat, 21 Mar 2026 20:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774149380; x=1774754180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CpOppp7pshHB2mWvGps3l7V3xeQrRabavfMVMwqvkLM=;
        b=bKKwtJywVuCbrGQa/bXHCVoNm2DuyA075XhDNf2Yz6sEctOU3pErCvMAz4vf62lg1Z
         lFmFN3DOB8b1RO9TTrRMrMZgvFgJlQKAxyJvcdMot8Sf2xrkL/6boCmHNLSTLRW1Se8d
         pPUwsHN0Na1WwVW344fROt5k6honayFEbhwNNeDO6pQCFBA39M0QfjwciQYb22gQ/mGk
         8r1AcxAQ/7SQ2MoiYfwrExl8zgpr12VOg+OlT+bjNAswp+3+SMulFHM5QPoHF9ddcXum
         XrxOAQd2zUsnLx2Pig+al5yPHwgQPG2HuTC1ln/dpeuwtwh1r6AGXCq5bpCT8pRhZmh0
         YB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774149380; x=1774754180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CpOppp7pshHB2mWvGps3l7V3xeQrRabavfMVMwqvkLM=;
        b=maC+SXreMxK0xyvHzQbTrkL3Rp2rUfW7XAHV/doWy3WebuRVWD1ey7BSPKwX2nrkDr
         imtdvNwGUe7JkbgxbFyhrJOSiJ4KRSGeuVHLBZYr3YWHWJXprb/eOGP9G60mKDV4DNBT
         doqSQcaxlegHTCMqMXlYyeGPrspj1BaNytgA5J8P14qw5871cC5V+uoUSWquZGX/g8H/
         7k6edxGWDa6WbcG8xO0MrJFC4P7KM74jNPgnp4xbJN+HTOIHqPb5ujJmRFNr/Z9jm7JJ
         RUqW988LDzRn5i44gKKO/mlntC5E2q6kEKdwEGYxmEUxFHYV2oDbO4CyDX6k4vcSRZe8
         4pDg==
X-Forwarded-Encrypted: i=1; AJvYcCW/+o/s6PtnUoqGL3QBbXdmBDT4oExWoyrgb62Z/DupF/1CwAYZdAvm9pwjcc4DlJaBWiV1SfkVlj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbjG1XNMp5KE9TgSmOdJBE8wTBhzWseZe0ljG6iR+GC/8NcKdg
	T0eqxPmH3TKFHs66JC1av/2AKyA6p5Uv+9MoE0/UuE2fRYuhOKhf/R/d
X-Gm-Gg: ATEYQzz14kdT5POGRDXIrFpaC6Vbm+hHEBZy8zn5MGxYThRHDwLxZIkQvZtQjPhJ8BV
	PDhBZ1FviEeNEzqbL1TD1TuR7hF7/F76Asm6JG5TyNLBk8QthITkE7g+7Pxr4P76DrwbnEbz7iY
	TRoZrOFubFDqhidxjfn9lH3oQrJh6gf0os4dqASkfL+iP1Xcp7R6j99BdjEoRQN8s5kc7H1ck33
	56XKnVqXd6z5YN5KPnPMi2jZcFTK/M9Mup9TeLsUdu5c4N27vSqmGji54bPMFNxGdPJLSRE0Ph8
	3dpBB969vmUYkEbIir6wRfbFrjLyAkUBXXup90og0VqfaA44ujjF2iuwmJ7gXSVNLRPmB/SL1rV
	6uv4xpsPaF/xQYmuOeBe0GYpD23zy+2K2rD8vxpGd0qqXi980d+P+aaQKf1saw74r8tQg6JlMmp
	bVwi/w2d7cLaZOLeKcJLjSc+CjkZOh6VyNiBGe8w60dlJltLECCbfcD29E/I6sVQDUEA2GffUSE
	b7DsdMtuZOXjaY=
X-Received: by 2002:a05:7300:e2cc:b0:2c1:27c:75a6 with SMTP id 5a478bee46e88-2c1095fbaa9mr3769234eec.10.1774149379723;
        Sat, 21 Mar 2026 20:16:19 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b31bef1sm11220460eec.26.2026.03.21.20.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 20:16:19 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Lambert Fan <fanzhaoming@anopc.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] HID: hid-oxp: Add Second Generation RGB Control
Date: Sun, 22 Mar 2026 03:16:13 +0000
Message-ID: <20260322031615.1524307-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260322031615.1524307-1-derekjohn.clark@gmail.com>
References: <20260322031615.1524307-1-derekjohn.clark@gmail.com>
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

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-ids.h |  3 ++
 drivers/hid/hid-oxp.c | 96 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 8b272d1ab9ba..b33782ba6556 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1105,6 +1105,9 @@
 #define USB_VENDOR_ID_CRSC			0x1a2c
 #define USB_DEVICE_ID_ONEXPLAYER_GEN1		0xb001
 
+#define USB_VENDOR_ID_WCH			0x1a86
+#define USB_DEVICE_ID_ONEXPLAYER_GEN2		0xfe00
+
 #define USB_VENDOR_ID_ONTRAK		0x0a07
 #define USB_DEVICE_ID_ONTRAK_ADU100	0x0064
 
diff --git a/drivers/hid/hid-oxp.c b/drivers/hid/hid-oxp.c
index 391de2798320..587e0d57c85f 100644
--- a/drivers/hid/hid-oxp.c
+++ b/drivers/hid/hid-oxp.c
@@ -24,12 +24,15 @@
 #define OXP_PACKET_SIZE 64
 
 #define GEN1_MESSAGE_ID	0xff
+#define GEN2_MESSAGE_ID	0x3f
 
 #define GEN1_USAGE_PAGE	0xff01
+#define GEN2_USAGE_PAGE	0xff00
 
 enum oxp_function_index {
 	OXP_FID_GEN1_RGB_SET =		0x07,
 	OXP_FID_GEN1_RGB_REPLY =	0x0f,
+	OXP_FID_GEN2_RGB_EVENT =	0xb8,
 };
 
 static struct oxp_hid_cfg {
@@ -121,6 +124,22 @@ struct oxp_gen_1_rgb_report {
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
@@ -162,6 +181,45 @@ static int oxp_hid_raw_event_gen_1(struct hid_device *hdev,
 	return 0;
 }
 
+static int oxp_hid_raw_event_gen_2(struct hid_device *hdev,
+				   struct hid_report *report, u8 *data,
+				   int size)
+{
+	struct led_classdev_mc *led_mc = drvdata.led_mc;
+	struct oxp_gen_2_rgb_report *rgb_rep;
+
+	if (data[0] != OXP_FID_GEN2_RGB_EVENT)
+		return 0;
+
+	if (data[3] != OXP_GET_PROPERTY)
+		return 0;
+
+	rgb_rep = (struct oxp_gen_2_rgb_report *)data;
+	/* Ensure we save monocolor as the list value */
+	drvdata.rgb_effect =
+		rgb_rep->effect == OXP_EFFECT_MONO_TRUE ?
+				   OXP_EFFECT_MONO_LIST :
+				   rgb_rep->effect;
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
+		return oxp_gen_2_property_out(OXP_FID_GEN2_RGB_EVENT, data, 6);
 	default:
 		return -ENODEV;
 	}
@@ -245,6 +322,9 @@ static ssize_t oxp_rgb_status_show(void)
 	case GEN1_USAGE_PAGE:
 		data = (u8[1]) { OXP_GET_PROPERTY };
 		return oxp_gen_1_property_out(OXP_FID_GEN1_RGB_SET, data, 1);
+	case GEN2_USAGE_PAGE:
+		data = (u8[3]) { OXP_GET_PROPERTY, 0x00, 0x02 };
+		return oxp_gen_2_property_out(OXP_FID_GEN2_RGB_EVENT, data, 3);
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
+		return oxp_gen_2_property_out(OXP_FID_GEN2_RGB_EVENT, data, size);
 	default:
 		return -ENODEV;
 	}
@@ -311,6 +401,10 @@ static int oxp_rgb_effect_set(u8 effect)
 			data = (u8[1]) { effect };
 			ret = oxp_gen_1_property_out(OXP_FID_GEN1_RGB_SET, data, 1);
 			break;
+		case GEN2_USAGE_PAGE:
+			data = (u8[3]) { effect, 0x00, 0x02 };
+			ret = oxp_gen_2_property_out(OXP_FID_GEN2_RGB_EVENT, data, 3);
+			break;
 		default:
 			ret = -ENODEV;
 		}
@@ -614,6 +708,7 @@ static int oxp_hid_probe(struct hid_device *hdev,
 
 	switch (up) {
 	case GEN1_USAGE_PAGE:
+	case GEN2_USAGE_PAGE:
 		ret = oxp_cfg_probe(hdev, up);
 		if (ret) {
 			hid_hw_close(hdev);
@@ -634,6 +729,7 @@ static void oxp_hid_remove(struct hid_device *hdev)
 
 static const struct hid_device_id oxp_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CRSC, USB_DEVICE_ID_ONEXPLAYER_GEN1) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_WCH, USB_DEVICE_ID_ONEXPLAYER_GEN2) },
 	{}
 };
 
-- 
2.53.0

