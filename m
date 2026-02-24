Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D98242925
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 01:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771896758; cv=none; b=LylN77nES7PMO5z42SM6Sh102W9k13PoN3FgpbSK7sGbIl4oN7izpLrrY7tA4wZbko7RhVUVfRU4thDmbNDDpeSlE7JzSmZ2wdm7cI6nPVZUlKqTu7stYDOzb4/6BVxueErTXerPtsa4bNHJlQgCehdVcEHIQthQGzPhE70K9Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771896758; c=relaxed/simple;
	bh=M7SxhQWvDW+XfpiJKnDu+4pbvBA8S336MkKT+hSooSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b7ZWN8GrTViiQ4/2WL9xiBBoKWWQ9ECYbFjz9Ab+HhCO6cYDuFPp1fsvKxwZjRPj5IvQbKXaSszQc5aWSKHejl23XoHB09uUUjHJ1cl5wTZnWmowgR+bdCru8qEmOu9TZPGKUVdRbmNu7qNOkhm7j2JdPivItJzBfkVyQJJVIlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdC9a1fT; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdC9a1fT"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ba94dbf739so5433162eec.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 17:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771896754; x=1772501554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1ZcKGEZ166b0V4KU+eFGE3AGlt5zw6ztoFOIxvKeo8=;
        b=IdC9a1fT9pFurXwIAiZPPnjmLH8hm9TDF9pt5+HLLBIZtZEoD074bAdacHJtUIFved
         XSKlI+67Ostct23E2hmg9vcpGiobj64tjj/dGLkvwQwiHczFGVolF0lRfQDG4jquba0C
         QxlKk9U69dXa0BhtN1d8t2ixyS8Hhsvg+8cH4YaqJFz/qrrkzrcMAiRWtPy2m3QrHaFX
         9JnE+p+Q8FKI7zLeji+I/60v+RU7VPlqrOocPFm75XQRStIbr6EXwEHci00PGhOsBxMG
         iymVo7eCC0JFvcq42mKqpMFBl9Osji7D6u5uh1PvmRSPZQPN2kBuhibIeVZRSeQoRs2/
         gPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771896754; x=1772501554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e1ZcKGEZ166b0V4KU+eFGE3AGlt5zw6ztoFOIxvKeo8=;
        b=cu59vd/FeXuc56kSB/0286PJa0YIibeugvSzmAxGd5Zrb1ddI0q+yQ/TQwk2U7dOeU
         UtpXNmQkRDV70CAZolMMn4l7SZosrwFWqSzc/kdMJKYwMdHmNE/S/YwOdKhTQ93bUyoU
         m5yP5bG+20X7DvnDKdllKrCts0JZ0gzLIksZpAXHE9sswpxFSyHBLnTDqyrSbiH3Eoo/
         Rn+vGwfMvjux/iGyphwbuR51oKmPfv9nodRpOxksvsmpgjcUmgFZ//0H+02bUBs6SGGn
         L6xrT4jafhCfX91vMaqyrFfA2IAup0lGwiqkjbdwQDwtCLJGIYfv35XsYE6ibGPzB7oL
         us+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMSxTJ7/A7F1zJwZhNj/xgX4G8mlZYes4Hs2Aco1IRdb86ijvPvfWR+nbcYOzpnpY+1kBryTpcd9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/gNtNVu1f1SlU+gsRz+VBmx21naN7uP6HUg7K1CfmqFLnjZ1W
	z3aaIjuD22vPAbNLbAg5NWwPGKN1NPLCMVNJs7IG3RwaIMbQroK8++MSVfuQQw==
X-Gm-Gg: ATEYQzzuev9IVhvQlCC8lYr1NU2C7CDp08P69+GgDrasgdp4DcpF413OuyisKwSF02+
	3XY6JKXCgWlPDbrDt6wFxAjKzcc10p+OOuydkx0Y6J/hIUmozcG7g4Y/bHP3Sqsd8zJdUAoXwW/
	e3vT0iur+9SEPh+ruGzeR8eoQ4VZs/xNpLELCmJaQFLj1X3CLkiZbUyR81vdk6Fzg2mXLqKmuHD
	9yQKj8eIE5B1BYPolfZE+BoEbpaMR8PPVjWMQI7/IQsDqPn+CbfDcNWY4nCjwhZTqY6kYmIlDll
	dJQ77y8qDYaQTE199LMrvscUcoSf/twectVysiTw5OYT6eZvNOU6Jyytmxql5OnwPaQvneE92NI
	mLmxQiM8eY3ISHq4/It4uyVYzWK8ZnDYNgeSaP6pJjSRklbJdPKynBBsKzVa+e7RDi/26J1u1MW
	LsaNKP5i/e9XJBBdbnunbIr7fJMLdZEFulYqKnET5DgpxSjOxfjARCo7TAK8imSePRhQ+HBRa74
	1I=
X-Received: by 2002:a05:7301:678e:b0:2b7:a27f:3a6a with SMTP id 5a478bee46e88-2bd7b9d9844mr4151456eec.4.1771896754144;
        Mon, 23 Feb 2026 17:32:34 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7daa027fsm6485015eec.9.2026.02.23.17.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 17:32:32 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Richard Hughes <hughsient@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 14/16] HID: hid-lenovo-go-s: Add RGB LED control interface
Date: Tue, 24 Feb 2026 01:32:15 +0000
Message-ID: <20260224013217.1363996-15-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224013217.1363996-1-derekjohn.clark@gmail.com>
References: <20260224013217.1363996-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds an LED multicolor class device and attribute group for controlling
the RGB of the Left and right joystick rings. In addition to the standard
led_cdev attributes, additional attributes that allow for the control of
the effect (monocolor, breathe, rainbow, and chroma), speed of the
effect change, an enable toggle, and profile.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v4:
  - Cleaner formatting on multiple debug messages.
---
 drivers/hid/hid-lenovo-go-s.c | 424 ++++++++++++++++++++++++++++++++++
 1 file changed, 424 insertions(+)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index 02d4e6548285e..1a7de95e2a065 100644
--- a/drivers/hid/hid-lenovo-go-s.c
+++ b/drivers/hid/hid-lenovo-go-s.c
@@ -16,6 +16,7 @@
 #include <linux/hid.h>
 #include <linux/jiffies.h>
 #include <linux/kstrtox.h>
+#include <linux/led-class-multicolor.h>
 #include <linux/mutex.h>
 #include <linux/printk.h>
 #include <linux/string.h>
@@ -34,6 +35,7 @@
 struct hid_gos_cfg {
 	struct delayed_work gos_cfg_setup;
 	struct completion send_cmd_complete;
+	struct led_classdev *led_cdev;
 	struct hid_device *hdev;
 	struct mutex cfg_mutex; /*ensure single synchronous output report*/
 	u8 gp_auto_sleep_time;
@@ -45,7 +47,11 @@ struct hid_gos_cfg {
 	u8 mcu_id[12];
 	u8 mouse_step;
 	u8 os_mode;
+	u8 rgb_effect;
 	u8 rgb_en;
+	u8 rgb_mode;
+	u8 rgb_profile;
+	u8 rgb_speed;
 	u8 tp_en;
 	u8 tp_linux_mode;
 	u8 tp_windows_mode;
@@ -163,6 +169,38 @@ enum touchpad_config_index {
 
 };
 
+enum rgb_mode_index {
+	RGB_MODE_DYNAMIC,
+	RGB_MODE_CUSTOM,
+};
+
+static const char *const rgb_mode_text[] = {
+	[RGB_MODE_DYNAMIC] = "dynamic",
+	[RGB_MODE_CUSTOM] = "custom",
+};
+
+enum rgb_effect_index {
+	RGB_EFFECT_MONO,
+	RGB_EFFECT_BREATHE,
+	RGB_EFFECT_CHROMA,
+	RGB_EFFECT_RAINBOW,
+};
+
+static const char *const rgb_effect_text[] = {
+	[RGB_EFFECT_MONO] = "monocolor",
+	[RGB_EFFECT_BREATHE] = "breathe",
+	[RGB_EFFECT_CHROMA] = "chroma",
+	[RGB_EFFECT_RAINBOW] = "rainbow",
+};
+
+enum rgb_config_index {
+	LIGHT_MODE_SEL = 0x01,
+	LIGHT_PROFILE_SEL,
+	USR_LIGHT_PROFILE_1,
+	USR_LIGHT_PROFILE_2,
+	USR_LIGHT_PROFILE_3,
+};
+
 static int hid_gos_version_event(u8 *data)
 {
 	struct version_report *ver_rep = (struct version_report *)data;
@@ -241,6 +279,39 @@ static int hid_gos_touchpad_event(struct command_report *cmd_rep)
 	return ret;
 }
 
+static int hid_gos_light_event(struct command_report *cmd_rep)
+{
+	struct led_classdev_mc *mc_cdev;
+	int ret = 0;
+
+	switch (cmd_rep->sub_cmd) {
+	case LIGHT_MODE_SEL:
+		drvdata.rgb_mode = cmd_rep->data[0];
+		ret = 0;
+		break;
+	case LIGHT_PROFILE_SEL:
+		drvdata.rgb_profile = cmd_rep->data[0];
+		ret = 0;
+		break;
+	case USR_LIGHT_PROFILE_1:
+	case USR_LIGHT_PROFILE_2:
+	case USR_LIGHT_PROFILE_3:
+		mc_cdev = lcdev_to_mccdev(drvdata.led_cdev);
+		drvdata.rgb_effect = cmd_rep->data[0];
+		mc_cdev->subled_info[0].intensity = cmd_rep->data[1];
+		mc_cdev->subled_info[1].intensity = cmd_rep->data[2];
+		mc_cdev->subled_info[2].intensity = cmd_rep->data[3];
+		drvdata.led_cdev->brightness = cmd_rep->data[4];
+		drvdata.rgb_speed = cmd_rep->data[5];
+		ret = 0;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	return ret;
+}
+
 static int hid_gos_set_event_return(struct command_report *cmd_rep)
 {
 	if (cmd_rep->data[0] != 0)
@@ -291,7 +362,11 @@ static int hid_gos_raw_event(struct hid_device *hdev, struct hid_report *report,
 	case GET_TP_PARAM:
 		ret = hid_gos_touchpad_event(cmd_rep);
 		break;
+	case GET_RGB_CFG:
+		ret = hid_gos_light_event(cmd_rep);
+		break;
 	case SET_GAMEPAD_CFG:
+	case SET_RGB_CFG:
 	case SET_TP_PARAM:
 		ret = hid_gos_set_event_return(cmd_rep);
 		break;
@@ -669,6 +744,276 @@ static ssize_t mcu_id_show(struct device *dev, struct device_attribute *attr,
 	return sysfs_emit(buf, "%*phN\n", 12, &drvdata.mcu_id);
 }
 
+static int rgb_cfg_call(struct hid_device *hdev, enum mcu_command_index cmd,
+			enum rgb_config_index index, u8 *val, size_t size)
+{
+	if (cmd != SET_RGB_CFG && cmd != GET_RGB_CFG)
+		return -EINVAL;
+
+	if (index < LIGHT_MODE_SEL || index > USR_LIGHT_PROFILE_3)
+		return -EINVAL;
+
+	return mcu_property_out(hdev, cmd, index, val, size);
+}
+
+static int rgb_attr_show(void)
+{
+	enum rgb_config_index index;
+
+	index = drvdata.rgb_profile + 2;
+
+	return rgb_cfg_call(drvdata.hdev, GET_RGB_CFG, index, 0, 0);
+};
+
+static ssize_t rgb_effect_store(struct device *dev,
+				struct device_attribute *attr, const char *buf,
+				size_t count)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(drvdata.led_cdev);
+	enum rgb_config_index index;
+	u8 effect;
+	int ret;
+
+	ret = sysfs_match_string(rgb_effect_text, buf);
+	if (ret < 0)
+		return ret;
+
+	effect = ret;
+	index = drvdata.rgb_profile + 2;
+	u8 rgb_profile[6] = { effect,
+			      mc_cdev->subled_info[0].intensity,
+			      mc_cdev->subled_info[1].intensity,
+			      mc_cdev->subled_info[2].intensity,
+			      drvdata.led_cdev->brightness,
+			      drvdata.rgb_speed };
+
+	ret = rgb_cfg_call(drvdata.hdev, SET_RGB_CFG, index, rgb_profile, 6);
+	if (ret)
+		return ret;
+
+	drvdata.rgb_effect = effect;
+	return count;
+};
+
+static ssize_t rgb_effect_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int ret;
+
+	ret = rgb_attr_show();
+	if (ret)
+		return ret;
+
+	if (drvdata.rgb_effect >= ARRAY_SIZE(rgb_effect_text))
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%s\n", rgb_effect_text[drvdata.rgb_effect]);
+}
+
+static ssize_t rgb_effect_index_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	ssize_t count = 0;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rgb_effect_text); i++)
+		count += sysfs_emit_at(buf, count, "%s ", rgb_effect_text[i]);
+
+	if (count)
+		buf[count - 1] = '\n';
+
+	return count;
+}
+
+static ssize_t rgb_speed_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t count)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(drvdata.led_cdev);
+	enum rgb_config_index index;
+	int val = 0;
+	int ret;
+
+	ret = kstrtoint(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	if (val < 0 || val > 100)
+		return -EINVAL;
+
+	index = drvdata.rgb_profile + 2;
+	u8 rgb_profile[6] = { drvdata.rgb_effect,
+			      mc_cdev->subled_info[0].intensity,
+			      mc_cdev->subled_info[1].intensity,
+			      mc_cdev->subled_info[2].intensity,
+			      drvdata.led_cdev->brightness,
+			      val };
+
+	ret = rgb_cfg_call(drvdata.hdev, SET_RGB_CFG, index, rgb_profile, 6);
+	if (ret)
+		return ret;
+
+	drvdata.rgb_speed = val;
+
+	return count;
+};
+
+static ssize_t rgb_speed_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	int ret;
+
+	ret = rgb_attr_show();
+	if (ret)
+		return ret;
+
+	if (drvdata.rgb_speed > 100)
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%hhu\n", drvdata.rgb_speed);
+}
+
+static ssize_t rgb_speed_range_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "0-100\n");
+}
+
+static ssize_t rgb_mode_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	int ret;
+	u8 val;
+
+	ret = sysfs_match_string(rgb_mode_text, buf);
+	if (ret <= 0)
+		return ret;
+
+	val = ret;
+
+	ret = rgb_cfg_call(drvdata.hdev, SET_RGB_CFG, LIGHT_MODE_SEL, &val,
+			   1);
+	if (ret)
+		return ret;
+
+	drvdata.rgb_mode = val;
+
+	return count;
+};
+
+static ssize_t rgb_mode_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	int ret;
+
+	ret = rgb_cfg_call(drvdata.hdev, GET_RGB_CFG, LIGHT_MODE_SEL, 0, 0);
+	if (ret)
+		return ret;
+
+	if (drvdata.rgb_mode >= ARRAY_SIZE(rgb_mode_text))
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%s\n", rgb_mode_text[drvdata.rgb_mode]);
+};
+
+static ssize_t rgb_mode_index_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	ssize_t count = 0;
+	unsigned int i;
+
+	for (i = 1; i < ARRAY_SIZE(rgb_mode_text); i++)
+		count += sysfs_emit_at(buf, count, "%s ", rgb_mode_text[i]);
+
+	if (count)
+		buf[count - 1] = '\n';
+
+	return count;
+}
+
+static ssize_t rgb_profile_store(struct device *dev,
+				 struct device_attribute *attr, const char *buf,
+				 size_t count)
+{
+	size_t size = 1;
+	int ret;
+	u8 val;
+
+	ret = kstrtou8(buf, 10, &val);
+	if (ret < 0)
+		return ret;
+
+	if (val < 1 || val > 3)
+		return -EINVAL;
+
+	ret = rgb_cfg_call(drvdata.hdev, SET_RGB_CFG, LIGHT_PROFILE_SEL, &val,
+			   size);
+	if (ret)
+		return ret;
+
+	drvdata.rgb_profile = val;
+
+	return count;
+};
+
+static ssize_t rgb_profile_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	int ret;
+
+	ret = rgb_cfg_call(drvdata.hdev, GET_RGB_CFG, LIGHT_PROFILE_SEL, 0,
+			   0);
+	if (ret)
+		return ret;
+
+	if (drvdata.rgb_profile < 1 || drvdata.rgb_profile > 3)
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%hhu\n", drvdata.rgb_profile);
+};
+
+static ssize_t rgb_profile_range_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "1-3\n");
+}
+
+static void hid_gos_brightness_set(struct led_classdev *led_cdev,
+				   enum led_brightness brightness)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(drvdata.led_cdev);
+	enum rgb_config_index index;
+	int ret;
+
+	if (brightness > led_cdev->max_brightness) {
+		dev_err(led_cdev->dev, "Invalid argument\n");
+		return;
+	}
+
+	index = drvdata.rgb_profile + 2;
+	u8 rgb_profile[6] = { drvdata.rgb_effect,
+			      mc_cdev->subled_info[0].intensity,
+			      mc_cdev->subled_info[1].intensity,
+			      mc_cdev->subled_info[2].intensity,
+			      brightness,
+			      drvdata.rgb_speed };
+
+	ret = rgb_cfg_call(drvdata.hdev, SET_RGB_CFG, index, rgb_profile, 6);
+	switch (ret) {
+	case 0:
+		led_cdev->brightness = brightness;
+		break;
+	case -ENODEV: /* during switch to IAP -ENODEV is expected */
+	case -ENOSYS: /* during rmmod -ENOSYS is expected */
+		dev_dbg(led_cdev->dev, "Failed to write RGB profile: %i\n",
+			ret);
+		break;
+	default:
+		dev_err(led_cdev->dev, "Failed to write RGB profile: %i\n",
+			ret);
+	};
+}
+
 #define LEGOS_DEVICE_ATTR_RW(_name, _attrname, _rtype, _group)                 \
 	static ssize_t _name##_store(struct device *dev,                       \
 				     struct device_attribute *attr,            \
@@ -824,6 +1169,70 @@ static const struct attribute_group *top_level_attr_groups[] = {
 	NULL,
 };
 
+/* RGB */
+struct gos_cfg_attr rgb_enabled = { FEATURE_RGB_ENABLE };
+LEGOS_DEVICE_ATTR_RW(rgb_enabled, "enabled", index, gamepad);
+static DEVICE_ATTR_RO_NAMED(rgb_enabled_index, "enabled_index");
+
+static DEVICE_ATTR_RW_NAMED(rgb_effect, "effect");
+static DEVICE_ATTR_RO_NAMED(rgb_effect_index, "effect_index");
+static DEVICE_ATTR_RW_NAMED(rgb_mode, "mode");
+static DEVICE_ATTR_RO_NAMED(rgb_mode_index, "mode_index");
+static DEVICE_ATTR_RW_NAMED(rgb_profile, "profile");
+static DEVICE_ATTR_RO_NAMED(rgb_profile_range, "profile_range");
+static DEVICE_ATTR_RW_NAMED(rgb_speed, "speed");
+static DEVICE_ATTR_RO_NAMED(rgb_speed_range, "speed_range");
+
+static struct attribute *gos_rgb_attrs[] = {
+	&dev_attr_rgb_enabled.attr,
+	&dev_attr_rgb_enabled_index.attr,
+	&dev_attr_rgb_effect.attr,
+	&dev_attr_rgb_effect_index.attr,
+	&dev_attr_rgb_mode.attr,
+	&dev_attr_rgb_mode_index.attr,
+	&dev_attr_rgb_profile.attr,
+	&dev_attr_rgb_profile_range.attr,
+	&dev_attr_rgb_speed.attr,
+	&dev_attr_rgb_speed_range.attr,
+	NULL,
+};
+
+static struct attribute_group rgb_attr_group = {
+	.attrs = gos_rgb_attrs,
+};
+
+struct mc_subled gos_rgb_subled_info[] = {
+	{
+		.color_index = LED_COLOR_ID_RED,
+		.brightness = 0x50,
+		.intensity = 0x24,
+		.channel = 0x1,
+	},
+	{
+		.color_index = LED_COLOR_ID_GREEN,
+		.brightness = 0x50,
+		.intensity = 0x22,
+		.channel = 0x2,
+	},
+	{
+		.color_index = LED_COLOR_ID_BLUE,
+		.brightness = 0x50,
+		.intensity = 0x99,
+		.channel = 0x3,
+	},
+};
+
+struct led_classdev_mc gos_cdev_rgb = {
+	.led_cdev = {
+		.name = "go_s:rgb:joystick_rings",
+		.brightness = 0x50,
+		.max_brightness = 0x64,
+		.brightness_set = hid_gos_brightness_set,
+	},
+	.num_colors = ARRAY_SIZE(gos_rgb_subled_info),
+	.subled_info = gos_rgb_subled_info,
+};
+
 static void cfg_setup(struct work_struct *work)
 {
 	int ret;
@@ -859,6 +1268,21 @@ static int hid_gos_cfg_probe(struct hid_device *hdev,
 		return ret;
 	}
 
+	ret = devm_led_classdev_multicolor_register(&hdev->dev, &gos_cdev_rgb);
+	if (ret) {
+		dev_err_probe(&hdev->dev, ret, "Failed to create RGB device\n");
+		return ret;
+	}
+
+	ret = devm_device_add_group(gos_cdev_rgb.led_cdev.dev, &rgb_attr_group);
+	if (ret) {
+		dev_err_probe(&hdev->dev, ret,
+			      "Failed to create RGB configuratiion attributes\n");
+		return ret;
+	}
+
+	drvdata.led_cdev = &gos_cdev_rgb.led_cdev;
+
 	init_completion(&drvdata.send_cmd_complete);
 
 	/* Executing calls prior to returning from probe will lock the MCU. Schedule
-- 
2.52.0

