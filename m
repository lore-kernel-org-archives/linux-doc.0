Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD4B37F757
	for <linux-doc@vger.kernel.org>; Sun, 12 Apr 2026 21:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776029692; cv=none; b=BTxhfKrMHA8YDalln/XfoTdomqMiqzH7ugqarXDmSBDZ/EY2slQfps8a5HFvCnmACu2xXNA25zzPgJSRG+HvlbQvSCx0HzJ1sXTzmCTkQbhJ2enN8LAKoteVP/0i9TSm12gyOFfWQdhOxOrAZ9MRBFnUu339JTThfH2lyza5wqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776029692; c=relaxed/simple;
	bh=SEBykZeCnW/xeD5gQNY2WuG4haDjvKG8/rGhDkNAbk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WQj3MQPHMFhr2ZJ9d8FVL/tG/JOnaK8ZMGsD+vDU+FZ2WdWyIp+TDZkOKoHPfP2+LUWATi0FOLXfOnS7Ih2b6hE00i03kqip6pSGRi5yJvBvgGSh7vWtn0Ezsctq/qNhmUEFb7oO0YlrMew5UD/xsqTm9lU3ZIMuNwuNC4TOH9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPSzhlrR; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPSzhlrR"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12c42a23c8eso1133921c88.1
        for <linux-doc@vger.kernel.org>; Sun, 12 Apr 2026 14:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776029690; x=1776634490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnMzHjJR0Uaq6W91lkgEhs+gh3BDwXUqFPleDSqk1uM=;
        b=MPSzhlrRoweCx4LJx9igQtsvEac9dOOi3r5Sk8JrQRR+o1BhqlVKxx9TdKZltnSq7L
         GyQpPVApta8Xl0VB4OmXaVAQ5wteFN9rlf8kfSvA8obeNmVVUDtZ0hUABmXV8npt3qq8
         kieGZZM10mkLP3ZUKeX5DS/E2IJ4652R20b00usKgqOdw+YBsZkBIxRAmcNwYMikZ6GM
         ge1o+dN3bAEVE+VTnGieJlGrJku2rVu8VsRaX4W3D0KzaRAQ0I7RBB52dd3deZFJlZS+
         UsTvlUq6IWoN4pmfGx7YU0b8Pts24pyVwMfu72RMY/ZZuLnYiVZOHdLauDk9RbNAVsI7
         21vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776029690; x=1776634490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bnMzHjJR0Uaq6W91lkgEhs+gh3BDwXUqFPleDSqk1uM=;
        b=OECY1ybvmU5NQu4NaCxXjkxZd/sPPXV+9KCbBmmyF5GvCFxWn8sdFySVZ6f3BdbzVT
         8UApef3OpnJp4E3YUkl7bOpI/TAkGHewEqMFaTz3KjgQArvpxH/9unEGF+yjBPZ03+V8
         JHISO988CNIIO+jo5FvSf1iO4x+KV0O+8OxIPY4NLqpNM/fzOTOI1kZWWiQfOfDtp6AK
         YnCoZykJ/pcwglsKrEkpyy0TrBc6ehnWnbJpMHpTBMppJkuhCAtnWGhJHhnC6b712x2w
         QtU7cPC8OskQNc/taymetx4AUipYKciPeEJ9N/ucQks0uAlU5tMZJMBKHXFTdAV4mF/E
         Ot6w==
X-Forwarded-Encrypted: i=1; AJvYcCU4g1HcmC1C63+sAPCSl8NZCoL3D/QeHlta/dMOyBzqhwkv5k2Ou2x6jgxsnWnGrcu1lSwitXR/iEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmJx2ncHAjNP+VDa+yMmmzt/9AlED3GxNgbMUW9ZPNQUys9Jwq
	8dDzHKlV5Ouvsge9vULvRvMNKWgh8Pti0cvkabaYwKXiMWJ5KOnYLE4M
X-Gm-Gg: AeBDieuZVc+Z+uJQLJgc13kPLOfq1ZtxrXTKfAv8aUtxjDzMNvJWCh87LUl1zeO12j4
	H83j0zZ/85+ZfvFx8s0r8Aiv8svkqSmdJ4uAYVeeQJ8RbrF+QOXMHTLggvU/cFhHj4/tBIdH8mW
	73f1AjsbHS3SvJnN3AQY9r89cxgAC7rgl9rJqs8dYzoLyQm1w98dzbcPO4R7iNZBaW+mwg2vf3b
	csp8htweiixC+6YPvz6+24Ka2V/IpgL1I4WWE/35FjF4W4QDIEA3p+nI7KRJiR+TQrPPLQjIEjz
	tvBniV1xCQzk387QOIZ3lHgz8aQu5zhIQPCyk/2Yt6qRkCPv7T3mzRcLUGnkqJhdu0Zc3ApRVzs
	o/feioTtXmsacfSVt7L7nV1gxkuwZBJbB+aEOqY/7EsnSoZLsuIQFnL+3S/3G4PKECFxtTNLguE
	NXsOrQZMV0TBcbM8F6dyWi08UrJY8oyOxfa5lb+vSr2UK2QU4+cZtaBnY32El2w5Fs8Vy+pPeJr
	6A7
X-Received: by 2002:a05:7022:219:b0:128:d3de:c9e0 with SMTP id a92af1059eb24-12c34f0663cmr6097417c88.26.1776029689727;
        Sun, 12 Apr 2026 14:34:49 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c345b5b9dsm10631736c88.7.2026.04.12.14.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 14:34:49 -0700 (PDT)
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
Subject: [PATCH v3 3/5] HID: hid-oxp: Add Second Generation Gamepad Mode Switch
Date: Sun, 12 Apr 2026 21:34:42 +0000
Message-ID: <20260412213444.2231505-4-derekjohn.clark@gmail.com>
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

Adds "gamepad_mode" attribute to second generation OneXPlayer
configuration HID devices. This attribute initiates a mode shift in the
device MCU that puts it into a state where all events are routed to an
hidraw interface instead of the xpad evdev interface. This allows for
debugging the hardware input mapping added in the next patch.

Reviewed-by: Zhouwang Huang <honjow311@gmail.com>
Tested-by: Zhouwang Huang <honjow311@gmail.com>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v2:
  - Rename to gamepad_mode & show relevant gamepad modes instead of
    using a debug enable/disable paradigm, to match other drivers.
---
 drivers/hid/hid-oxp.c | 130 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/drivers/hid/hid-oxp.c b/drivers/hid/hid-oxp.c
index 25214356163e..c62952537d98 100644
--- a/drivers/hid/hid-oxp.c
+++ b/drivers/hid/hid-oxp.c
@@ -33,6 +33,7 @@
 enum oxp_function_index {
 	OXP_FID_GEN1_RGB_SET =		0x07,
 	OXP_FID_GEN1_RGB_REPLY =	0x0f,
+	OXP_FID_GEN2_TOGGLE_MODE =	0xb2,
 	OXP_FID_GEN2_STATUS_EVENT =	0xb8,
 };
 
@@ -41,11 +42,22 @@ static struct oxp_hid_cfg {
 	struct hid_device *hdev;
 	struct mutex cfg_mutex; /*ensure single synchronous output report*/
 	u8 rgb_brightness;
+	u8 gamepad_mode;
 	u8 rgb_effect;
 	u8 rgb_speed;
 	u8 rgb_en;
 } drvdata;
 
+enum oxp_gamepad_mode_index {
+	OXP_GP_MODE_XINPUT = 0x00,
+	OXP_GP_MODE_DEBUG = 0x03,
+};
+
+static const char *const oxp_gamepad_mode_text[] = {
+	[OXP_GP_MODE_XINPUT] = "xinput",
+	[OXP_GP_MODE_DEBUG] = "debug",
+};
+
 enum oxp_feature_en_index {
 	OXP_FEAT_DISABLED,
 	OXP_FEAT_ENABLED,
@@ -181,6 +193,32 @@ static int oxp_hid_raw_event_gen_1(struct hid_device *hdev,
 	return 0;
 }
 
+static int oxp_gen_2_property_out(enum oxp_function_index fid, u8 *data, u8 data_size);
+
+static void oxp_mcu_init_fn(struct work_struct *work)
+{
+	u8 gp_mode_data[3] = { OXP_GP_MODE_DEBUG, 0x01, 0x02 };
+	int ret;
+
+	/* Cycle the gamepad mode */
+	ret = oxp_gen_2_property_out(OXP_FID_GEN2_TOGGLE_MODE, gp_mode_data, 3);
+	if (ret)
+		dev_err(&drvdata.hdev->dev,
+			"Error: Failed to set gamepad mode: %i\n", ret);
+
+	/* Remainder only applies for xinput mode */
+	if (drvdata.gamepad_mode == OXP_GP_MODE_DEBUG)
+		return;
+
+	gp_mode_data[0] = OXP_GP_MODE_XINPUT;
+	ret = oxp_gen_2_property_out(OXP_FID_GEN2_TOGGLE_MODE, gp_mode_data, 3);
+	if (ret)
+		dev_err(&drvdata.hdev->dev,
+			"Error: Failed to set gamepad mode: %i\n", ret);
+}
+
+static DECLARE_DELAYED_WORK(oxp_mcu_init, oxp_mcu_init_fn);
+
 static int oxp_hid_raw_event_gen_2(struct hid_device *hdev,
 				   struct hid_report *report, u8 *data,
 				   int size)
@@ -191,6 +229,14 @@ static int oxp_hid_raw_event_gen_2(struct hid_device *hdev,
 	if (data[0] != OXP_FID_GEN2_STATUS_EVENT)
 		return 0;
 
+	/* Sent ~6s after resume event, indicating the MCU has fully reset.
+	 * Re-apply our settings after this has been received.
+	 */
+	if (data[3] == OXP_EFFECT_MONO_TRUE) {
+		mod_delayed_work(system_wq, &oxp_mcu_init, msecs_to_jiffies(50));
+		return 0;
+	}
+
 	if (data[3] != OXP_GET_PROPERTY)
 		return 0;
 
@@ -288,6 +334,77 @@ static int oxp_gen_2_property_out(enum oxp_function_index fid, u8 *data,
 				footer_size);
 }
 
+static ssize_t gamepad_mode_store(struct device *dev,
+				  struct device_attribute *attr, const char *buf,
+				  size_t count)
+{
+	u16 up = get_usage_page(drvdata.hdev);
+	u8 data[3] = { 0x00, 0x01, 0x02 };
+	int ret = -EINVAL;
+	int i;
+
+	if (up != GEN2_USAGE_PAGE)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(oxp_gamepad_mode_text); i++) {
+		if (oxp_gamepad_mode_text[i] && sysfs_streq(buf, oxp_gamepad_mode_text[i])) {
+			ret = i;
+			break;
+		}
+	}
+	if (ret < 0)
+		return ret;
+
+	data[0] = ret;
+
+	ret = oxp_gen_2_property_out(OXP_FID_GEN2_TOGGLE_MODE, data, 3);
+	if (ret)
+		return ret;
+
+	drvdata.gamepad_mode = data[0];
+
+	return count;
+}
+
+static ssize_t gamepad_mode_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%s\n", oxp_gamepad_mode_text[drvdata.gamepad_mode]);
+}
+static DEVICE_ATTR_RW(gamepad_mode);
+
+static ssize_t gamepad_mode_index_show(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buf)
+{
+	ssize_t count = 0;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(oxp_gamepad_mode_text); i++) {
+		if (!oxp_gamepad_mode_text[i] ||
+		    oxp_gamepad_mode_text[i][0] == '\0')
+			continue;
+
+		count += sysfs_emit_at(buf, count, "%s ", oxp_gamepad_mode_text[i]);
+	}
+
+	if (count)
+		buf[count - 1] = '\n';
+
+	return count;
+}
+static DEVICE_ATTR_RO(gamepad_mode_index);
+
+static struct attribute *oxp_cfg_attrs[] = {
+	&dev_attr_gamepad_mode.attr,
+	&dev_attr_gamepad_mode_index.attr,
+	NULL,
+};
+
+static const struct attribute_group oxp_cfg_attrs_group = {
+	.attrs = oxp_cfg_attrs,
+};
+
 static int oxp_rgb_status_store(u8 enabled, u8 speed, u8 brightness)
 {
 	u16 up = get_usage_page(drvdata.hdev);
@@ -733,7 +850,20 @@ static int oxp_cfg_probe(struct hid_device *hdev, u16 up)
 		dev_warn(drvdata.led_mc->led_cdev.dev,
 			 "Failed to query RGB initial state: %i\n", ret);
 
+	/* Below features are only implemented in gen 2 */
+	if (up != GEN2_USAGE_PAGE)
+		return 0;
+
 skip_rgb:
+	mod_delayed_work(system_wq, &oxp_mcu_init, msecs_to_jiffies(50));
+
+	drvdata.gamepad_mode = OXP_GP_MODE_XINPUT;
+
+	ret = devm_device_add_group(&hdev->dev, &oxp_cfg_attrs_group);
+	if (ret)
+		return dev_err_probe(&hdev->dev, ret,
+				     "Failed to attach configuration attributes\n");
+
 	return 0;
 }
 
-- 
2.53.0

