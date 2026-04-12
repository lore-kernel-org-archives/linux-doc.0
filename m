Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE47D37C939
	for <linux-doc@vger.kernel.org>; Sun, 12 Apr 2026 21:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776029693; cv=none; b=bPirUGCTSNrPLt17vL6x5ZtvJ6Yhbl1EUJcvFod0oZ8+rpRRSo/+fEeQg2uKO7KPRU+Z6fbdve0E1H6qUy5zyHduo5r7tqny/nZ0BeSWglgm1LA2F++y9aSlbTOFexNvraogs10GGY8q4IR5wYqZ9HKlFW3OiHho2KbVX9Kyzek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776029693; c=relaxed/simple;
	bh=2AGszRwHKTSDt/GHBeWYWXUzp1RHL73AGLPVW8OTujw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iotr0vlhtZk9qkZWeQoavp9DCrtfltEcIx+HzRPa/t5esLk0dLAJGLg6mjnr7Huj0g7ZBzepvhYwuCh7fQH4WpulFt8WFhYAg7AKBU0XaW16JYMT8qLDvBxQU+RDvhDigmzvvlAVAlt4gW68ji4uDEihP2pYovHhQeV6vnUYIxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBW49DbM; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBW49DbM"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c20010f10so9728256c88.0
        for <linux-doc@vger.kernel.org>; Sun, 12 Apr 2026 14:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776029691; x=1776634491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOgAYENScOZ7pTYhzspnmWOqUMT/Bqb4/z+V10phsHU=;
        b=UBW49DbMmp4eCpyirwFWwAWYbiY5q0w+Q1IW7l5pDp4Am3k1VUahWkEXBlB0LoP+Fm
         2qRdKVCwr9r22b2Njz5fNNrrA8onDT7Ofj/CL6u+ndBB3jv1MwdIX3jIxOeqypPImiXE
         6+2DrTs7dmd9qCL5pA/pezoiCQHuwVpiEfs06F8ccmTs/RZKRzlr38afPnvjxAE9DPYl
         2ywWstPmiqw897hxu0AZMrUq8mwK2jfP4r2qXh1++3gsp0aEPfOXjFLuyC1eV5RBv4/k
         Q5Xtxka09s4RrFavLettgzwrNpOvgaBW/jvh9Df3LE7ViG+7cJB6khA7678lNMuGdaTI
         kDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776029691; x=1776634491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TOgAYENScOZ7pTYhzspnmWOqUMT/Bqb4/z+V10phsHU=;
        b=oe2VVgCStDvDsg3rWGdZcmYIDdEXeIpoLSLTL78BmlTogHpWwsFYS4jtfaRjapjrX+
         ibnOBtA/Dxr1Rj5oqdZ5f6itS2a10YH4FI9QflZfCQ7scNwLAiHS0H79OecarOcq8AIu
         A+/Wd7TQ8fVJmbaPE8uDHfAorVejXdhcJUPkk7lr9xDYptKr1J+nFt9Hv5KGK1B2Q8fn
         lt4qKSbWpo7i7te1aRbDVeySgnOIQ5XQsIVPkOIRdOVz2VU+N+LOqeZZUxEazivlvLkJ
         WfwIwrKTORs8+1yy2Rv6ESBc19gNNDS4K8FZahMV5EyiCaGtJOTH5Ds6467WoxXCEkwU
         6xcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8oQ4aDPZMz3LCDbu61aDY9R7zMMCIZT58KzIRZDmqYAs4qGpktLeZsJX4s/caK53RnQIYnmALrFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkNj13/X57dZVVooEmg9/gVQ/SJoz0sQPUYpV0xwP+iyaZgYZ6
	p9/K1WnUkICcxaO1dOGQqkJCzvAL12H1a7G3vUchQJ337FjvMPt1Zjp7
X-Gm-Gg: AeBDievjquiNo9R3UdfvfvW/VvkubK+OLcd16S8WJvoa4nbLxA+BzFqd4pXwN+KWW+p
	9n5fYfzPWRg1tVLHGVlxnROw+8cKbuAKtfolUOKkS2I8hVh2v82nXZtCnrj3pda/K4IphKdz0xW
	Y91qIJBtPdI1bth5G1AI92wgF1ZD/Jb8HLDbGAU5IRB4Y3j6+U1dUsOxIQCa+f34j/mOdOMCbvf
	VfhWDkWm7bN9via2rAaxvmXSRp1a8Ll8YaEr1HpY/fYHfNCVoDZ96gBPH5fbe0arREjA6aDOH/v
	aNizQqXjEXmuMvBv6mKbf/TvheMBiC9kFpU3npgzNF+g3pm1qsG0OvxiEKceJhI6kRmc113I3G6
	vyLHGMEWrwuFmHTRYWSUGldWmivox/LWz/0F6cRWY94c1Gyh4XWQMwFAvza0urg4WxfovFJlCNV
	e31pMapuDbVcHWZiWtJwiMYv3it4LU2p81uJ/6+JpOkF1tZLL0qBq1CHLsf+2E9I6jdm0COVuMG
	Qc+
X-Received: by 2002:a05:7022:6085:b0:12b:ee7b:51e9 with SMTP id a92af1059eb24-12c34e3f299mr6814611c88.4.1776029691033;
        Sun, 12 Apr 2026 14:34:51 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c345b5b9dsm10631736c88.7.2026.04.12.14.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 14:34:50 -0700 (PDT)
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
Subject: [PATCH v3 5/5] HID: hid-oxp: Add Vibration Intensity Attribute
Date: Sun, 12 Apr 2026 21:34:44 +0000
Message-ID: <20260412213444.2231505-6-derekjohn.clark@gmail.com>
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

Adds attribute for setting the rumble intensity level. This setting must
be re-applied after the gamepad mode is set as doing so resets this to
the default value.

Reviewed-by: Zhouwang Huang <honjow311@gmail.com>
Tested-by: Zhouwang Huang <honjow311@gmail.com>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-oxp.c | 78 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/hid/hid-oxp.c b/drivers/hid/hid-oxp.c
index 959ec1a90d22..a4e9d41bd3a7 100644
--- a/drivers/hid/hid-oxp.c
+++ b/drivers/hid/hid-oxp.c
@@ -34,6 +34,7 @@ enum oxp_function_index {
 	OXP_FID_GEN1_RGB_SET =		0x07,
 	OXP_FID_GEN1_RGB_REPLY =	0x0f,
 	OXP_FID_GEN2_TOGGLE_MODE =	0xb2,
+	OXP_FID_GEN2_RUMBLE_SET =	0xb3,
 	OXP_FID_GEN2_KEY_STATE =	0xb4,
 	OXP_FID_GEN2_STATUS_EVENT =	0xb8,
 };
@@ -178,6 +179,7 @@ static struct oxp_hid_cfg {
 	struct mutex cfg_mutex; /*ensure single synchronous output report*/
 	u8 rgb_brightness;
 	u8 gamepad_mode;
+	u8 rumble_intensity;
 	u8 rgb_effect;
 	u8 rgb_speed;
 	u8 rgb_en;
@@ -263,6 +265,11 @@ static const char *const oxp_rgb_effect_text[] = {
 	[OXP_EFFECT_MONO_LIST] = "monocolor",
 };
 
+enum oxp_rumble_side_index {
+	OXP_RUMBLE_LEFT = 0x00,
+	OXP_RUMBLE_RIGHT,
+};
+
 struct oxp_gen_1_rgb_report {
 	u8 report_id;
 	u8 message_id;
@@ -338,6 +345,7 @@ static int oxp_hid_raw_event_gen_1(struct hid_device *hdev,
 
 static int oxp_gen_2_property_out(enum oxp_function_index fid, u8 *data, u8 data_size);
 static int oxp_set_buttons(void);
+static int oxp_rumble_intensity_set(u8 intensity);
 
 static void oxp_mcu_init_fn(struct work_struct *work)
 {
@@ -365,6 +373,12 @@ static void oxp_mcu_init_fn(struct work_struct *work)
 	if (ret)
 		dev_err(&drvdata.hdev->dev,
 			"Error: Failed to set gamepad mode: %i\n", ret);
+
+	/* Set vibration level */
+	ret = oxp_rumble_intensity_set(drvdata.rumble_intensity);
+	if (ret)
+		dev_err(&drvdata.hdev->dev,
+			"Error: Failed to set rumble intensity: %i\n", ret);
 }
 
 static DECLARE_DELAYED_WORK(oxp_mcu_init, oxp_mcu_init_fn);
@@ -513,6 +527,14 @@ static ssize_t gamepad_mode_store(struct device *dev,
 
 	drvdata.gamepad_mode = data[0];
 
+	if (drvdata.gamepad_mode == OXP_GP_MODE_DEBUG)
+		return count;
+
+	/* Re-apply rumble settings as switching gamepad mode will override */
+	ret = oxp_rumble_intensity_set(drvdata.rumble_intensity);
+	if (ret)
+		return ret;
+
 	return count;
 }
 
@@ -858,6 +880,59 @@ static ssize_t button_mapping_options_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(button_mapping_options);
 
+static int oxp_rumble_intensity_set(u8 intensity)
+{
+	u8 header[15] = { 0x02, 0x38, 0x02, 0xe3, 0x39, 0xe3, 0x39, 0xe3,
+			  0x39, 0x01, intensity, 0x05, 0xe3, 0x39, 0xe3 };
+	u8 footer[9] = { 0x39, 0xe3, 0x39, 0xe3, 0xe3, 0x02, 0x04, 0x39, 0x39 };
+	size_t footer_size = ARRAY_SIZE(footer);
+	size_t header_size = ARRAY_SIZE(header);
+	u8 data[59] = { 0x0 };
+	size_t data_size = ARRAY_SIZE(data);
+
+	memcpy(data, header, header_size);
+	memcpy(data + data_size - footer_size, footer, footer_size);
+
+	return oxp_gen_2_property_out(OXP_FID_GEN2_RUMBLE_SET, data, data_size);
+}
+
+static ssize_t rumble_intensity_store(struct device *dev,
+				      struct device_attribute *attr, const char *buf,
+				      size_t count)
+{
+	int ret;
+	u8 val;
+
+	ret = kstrtou8(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	if (val < 0 || val > 5)
+		return -EINVAL;
+
+	ret = oxp_rumble_intensity_set(val);
+	if (ret)
+		return ret;
+
+	drvdata.rumble_intensity = val;
+
+	return count;
+}
+
+static ssize_t rumble_intensity_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%i\n", drvdata.rumble_intensity);
+}
+static DEVICE_ATTR_RW(rumble_intensity);
+
+static ssize_t rumble_intensity_range_show(struct device *dev,
+					   struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "0-5\n");
+}
+static DEVICE_ATTR_RO(rumble_intensity_range);
+
 #define OXP_DEVICE_ATTR_RW(_name, _group)                                     \
 	static ssize_t _name##_store(struct device *dev,                      \
 				     struct device_attribute *attr,           \
@@ -949,6 +1024,8 @@ static struct attribute *oxp_cfg_attrs[] = {
 	&dev_attr_gamepad_mode.attr,
 	&dev_attr_gamepad_mode_index.attr,
 	&dev_attr_reset_buttons.attr,
+	&dev_attr_rumble_intensity.attr,
+	&dev_attr_rumble_intensity_range.attr,
 	NULL,
 };
 
@@ -1422,6 +1499,7 @@ static int oxp_cfg_probe(struct hid_device *hdev, u16 up)
 	drvdata.bmap_2 = bmap_2;
 	oxp_reset_buttons();
 	drvdata.gamepad_mode = OXP_GP_MODE_XINPUT;
+	drvdata.rumble_intensity = 5;
 	mod_delayed_work(system_wq, &oxp_mcu_init, msecs_to_jiffies(50));
 
 	ret = devm_device_add_group(&hdev->dev, &oxp_cfg_attrs_group);
-- 
2.53.0

