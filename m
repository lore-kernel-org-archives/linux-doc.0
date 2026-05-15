Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2433CC334
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 03:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778816196; cv=none; b=etprTac51uTjpD3DvpLBIhJdK5m1yUtI127mS4E1gQgZgL1Kk6MKe+wnKHVzFbCRIyXC9SCHQcW9crzguKG9rgE9dgC/41PTm68S7Tnzrc6ANhsiQgTvhrhoxPPMnHANyLjFt/TiJTduZQdHzaA8km0akOyGierGSwWVs8qNASw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778816196; c=relaxed/simple;
	bh=BV/YwiqpLKavQjibMyICw4VFw6EPGnwK70eyfo9+oKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lCN2jWVwzsGRlP4EsJuxJh5eTUjvT/eEE7dptqHjI/aRFINpEOjtS/Va+B2rTgbbUXieo+1AOVFk/CJ/iPYVNnXG4fPWO+RZKRJcr1jrFNSFB8clnZDXxSprAu690jXCCFmZpqjmDRinG103IMmCZbTL9qGwHOK6jsF/1Fss59g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgOxoeeD; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgOxoeeD"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so20654357eec.0
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 20:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778816188; x=1779420988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2A1UKrsams39Mvt+MiQQfASyG6w6rP8GDuPPtbEUsDI=;
        b=fgOxoeeD0zzEXrC3FTadIozKskHVgM+CTSpJ1Dc930SHIQUh+Pwc9F44TBMQIaJYeT
         Pqxa/fa8sVwITjE3wnXjnwarbnvD7Pa+xEzTJJeic5zQlCe0V73wZGN2GG7AgVGAAyd3
         IFxfywbdQfANcLhpTeDzsv5X1pbmWNA51yFcZuaKhNyHaud9cgMWylEkjgE/h/8WVcGB
         MaQRRvGqs0EWTucUwHBmzFsHyjPk6DyY48zMGw9X2NswZJ9pnITWQKbufL1KrqzxplSo
         ETEuiWNmyPM2+IKa+hOTNKhaELjpF3gqVp0CLut7k1frwoaBeRM+p8cRhgDkNy1zs3Vn
         JnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778816188; x=1779420988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2A1UKrsams39Mvt+MiQQfASyG6w6rP8GDuPPtbEUsDI=;
        b=K9SZTJdD8bplGAzX45XMwPff5WcepnCbgfoikmYm/t/zxzI/hLd/K7xsX4wH6f7aBy
         7KseEgkh+yYvpfTP09hKqG5+Ze4rNxt+U0ajETSSXgrLyMdaCSJkx2oidZ0RfLvZXurv
         mb7D/ibk6jNH/JS4UKrpR0lvIV0zAWxsAjIQRs2YOaFRl5t8vyRFCaf9vmAUDXtdaCuh
         uc8Ytdq1UEveZsq790rj3YEw+9Sb5n2Uj0X4fUyyeY0AfN51kSqLp5EMp1Uf1g2ewKX6
         sIOenjYxCAEYVbtJNqYyZmoRsu/5FgA/deS/6eL8iphcs7a428g/1B4WBHRuVscDxnf/
         z2ww==
X-Forwarded-Encrypted: i=1; AFNElJ/dbbdRn5US1pLokWPsyLPyK4q8iIsQlSTweCXHiQ6IfFIA1/bqt59JNwYIFLl3muC/shLTHNDLBnc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLUDaip6GHqGlFAvOM6aYKFUUzpSsy+VmZljAd5R86UBggUZ+a
	cVpVGqAa6ozvyls5aVmf37tbM74c9NcO2D58YWvEYdmKl20f/MSqlMei
X-Gm-Gg: Acq92OE9ujFsAwYsytTyfnfIw8JCcoUU5k+yWf+9vymDy4zFrXdBX3RoRiqR3unGNEK
	qgHT4aRe1HV9IKeg1wVMA3jALmRyX/jh3iv9l6H8CeSbrZr3KhdUEB4k8ycIDFtjUL9ACpqJavs
	MWTDGelJ66TLGPMdrhq1MeMsVnxthfM5uE9dI/cMcmtgQI4sSCpERqB0pznCMIcHirRBAhLSIGA
	vO8BU+Y/MHdhv1TX4MygvBgAtRXAI9JnJoGox05vp6O4IUa6ya9xPf6ja/XbvW8XU4y/lDHW3GP
	GZu0kKqnfmuiz+1mx5AWFoPkKhZO4XEhxwnHpUD3pzCAatQRy/nF0SASphjo3u+OiXQxJRn4W1L
	qmxZ8kmFy1u3MkBDsJg8Xh/Q1U4psDE9pu1pamm9qmjTPZGKe8IWzNlersRo4vVObtMswKBtrc6
	QeyHGYrOYAA+4/nEtNhGW+zN/AqPe4qkLfJ7RBcGonyqfY5aaw2VbXolR/2nMoEQNXxMQsNknuc
	uQB
X-Received: by 2002:a05:7300:510:b0:2c1:7b61:8731 with SMTP id 5a478bee46e88-303982be4d0mr1335250eec.10.1778816188483;
        Thu, 14 May 2026 20:36:28 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bcc5asm5430789eec.22.2026.05.14.20.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 20:36:28 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Denis Benato <denis.benato@linux.dev>,
	Zhouwang Huang <honjow311@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] HID: hid-msi: Add Rumble Intensity Attributes
Date: Fri, 15 May 2026 03:36:22 +0000
Message-ID: <20260515033622.2095277-5-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515033622.2095277-1-derekjohn.clark@gmail.com>
References: <20260515033622.2095277-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds intensity adjustment for the left and right rumble motors.

Claude was used during the reverse-engineering data gathering for this
feature done by Zhouwang Huang. As the code had already been affected,
I used Claude to create the initial framing for the feature, then did
manual cleanup of the _show and _store functions afterwards to fix bugs
and keep the coding style consistent. Claude was also used as an initial
reviewer of this patch.

Assisted-by: Claude:claude-sonnet-4-6
Co-developed-by: Zhouwang Huang <honjow311@gmail.com>
Signed-off-by: Zhouwang Huang <honjow311@gmail.com>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v2:
  - Use pending_profile and sync to rom mutexes.
---
 drivers/hid/hid-msi.c | 147 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/drivers/hid/hid-msi.c b/drivers/hid/hid-msi.c
index 06dc4290d2bb5..349a59f75e471 100644
--- a/drivers/hid/hid-msi.c
+++ b/drivers/hid/hid-msi.c
@@ -76,6 +76,8 @@ enum claw_profile_ack_pending {
 	CLAW_M1_PENDING,
 	CLAW_M2_PENDING,
 	CLAW_RGB_PENDING,
+	CLAW_RUMBLE_LEFT_PENDING,
+	CLAW_RUMBLE_RIGHT_PENDING,
 };
 
 enum claw_key_index {
@@ -262,6 +264,11 @@ static const u16 button_mapping_addr_new[] = {
 static const u16 rgb_addr_old = 0x01fa;
 static const u16 rgb_addr_new = 0x024a;
 
+static const u16 rumble_addr[] = {
+	0x0022,  /* left  */
+	0x0023,  /* right */
+};
+
 struct claw_command_report {
 	u8 report_id;
 	u8 padding[2];
@@ -311,7 +318,10 @@ struct claw_drvdata {
 	enum claw_gamepad_mode_index gamepad_mode;
 	u8 m1_codes[CLAW_KEYS_MAX];
 	u8 m2_codes[CLAW_KEYS_MAX];
+	u8 rumble_intensity_right;
+	u8 rumble_intensity_left;
 	const u16 *bmap_addr;
+	bool rumble_support;
 	bool bmap_support;
 
 	/* RGB Variables */
@@ -397,6 +407,12 @@ static int claw_profile_event(struct claw_drvdata *drvdata, struct claw_command_
 			drvdata->led_mc.subled_info[2].intensity = frame->zone_data.zone[0].blue;
 		}
 
+		break;
+	case CLAW_RUMBLE_LEFT_PENDING:
+		drvdata->rumble_intensity_left = cmd_rep->data[4];
+		break;
+	case CLAW_RUMBLE_RIGHT_PENDING:
+		drvdata->rumble_intensity_right = cmd_rep->data[4];
 		break;
 	default:
 		dev_warn(&drvdata->hdev->dev,
@@ -810,6 +826,126 @@ static ssize_t button_mapping_options_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(button_mapping_options);
 
+static ssize_t rumble_intensity_left_store(struct device *dev,
+					   struct device_attribute *attr,
+					   const char *buf, size_t count)
+{
+	u8 data[] = { 0x01, (rumble_addr[0] >> 8) & 0xff, rumble_addr[0] & 0xff, 0x01, 0x00 };
+	struct hid_device *hdev = to_hid_device(dev);
+	struct claw_drvdata *drvdata = hid_get_drvdata(hdev);
+	u8 val;
+	int ret;
+
+	ret = kstrtou8(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	if (val > 100)
+		return -EINVAL;
+
+	data[4] = val;
+
+	guard(mutex)(&drvdata->rom_mutex);
+	ret = claw_hw_output_report(hdev, CLAW_COMMAND_TYPE_WRITE_PROFILE_DATA,
+				    data, ARRAY_SIZE(data), 8);
+	if (ret)
+		return ret;
+
+	ret = claw_hw_output_report(hdev, CLAW_COMMAND_TYPE_SYNC_TO_ROM, NULL, 0, 8);
+	if (ret)
+		return ret;
+
+	drvdata->rumble_intensity_left = val;
+
+	return count;
+}
+
+static ssize_t rumble_intensity_left_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
+{
+	u8 data[4] = { 0x01, (rumble_addr[0] >> 8) & 0xff, rumble_addr[0] & 0xff, 0x01 };
+	struct hid_device *hdev = to_hid_device(dev);
+	struct claw_drvdata *drvdata = hid_get_drvdata(hdev);
+	int ret;
+
+	guard(mutex)(&drvdata->profile_mutex);
+	drvdata->profile_pending = CLAW_RUMBLE_LEFT_PENDING;
+	ret = claw_hw_output_report(hdev, CLAW_COMMAND_TYPE_READ_PROFILE, data,
+				    ARRAY_SIZE(data), 8);
+	if (ret) {
+		drvdata->profile_pending = CLAW_NO_PENDING;
+		return ret;
+	}
+
+	return sysfs_emit(buf, "%u\n", drvdata->rumble_intensity_left);
+}
+static DEVICE_ATTR_RW(rumble_intensity_left);
+
+static ssize_t rumble_intensity_right_store(struct device *dev,
+					    struct device_attribute *attr,
+					    const char *buf, size_t count)
+{
+	u8 data[] = { 0x01, (rumble_addr[1] >> 8) & 0xff, rumble_addr[1] & 0xff, 0x01, 0x00 };
+	struct hid_device *hdev = to_hid_device(dev);
+	struct claw_drvdata *drvdata = hid_get_drvdata(hdev);
+	u8 val;
+	int ret;
+
+	ret = kstrtou8(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	if (val > 100)
+		return -EINVAL;
+
+	data[4] = val;
+
+	guard(mutex)(&drvdata->rom_mutex);
+	ret = claw_hw_output_report(hdev, CLAW_COMMAND_TYPE_WRITE_PROFILE_DATA,
+				    data, ARRAY_SIZE(data), 8);
+	if (ret)
+		return ret;
+
+	ret = claw_hw_output_report(hdev, CLAW_COMMAND_TYPE_SYNC_TO_ROM, NULL, 0, 8);
+	if (ret)
+		return ret;
+
+	drvdata->rumble_intensity_right = val;
+
+	return count;
+}
+
+static ssize_t rumble_intensity_right_show(struct device *dev,
+					   struct device_attribute *attr,
+					   char *buf)
+{
+	u8 data[4] = { 0x01, (rumble_addr[1] >> 8) & 0xff, rumble_addr[1] & 0xff, 0x01 };
+	struct hid_device *hdev = to_hid_device(dev);
+	struct claw_drvdata *drvdata = hid_get_drvdata(hdev);
+	int ret;
+
+	guard(mutex)(&drvdata->profile_mutex);
+	drvdata->profile_pending = CLAW_RUMBLE_RIGHT_PENDING;
+	ret = claw_hw_output_report(hdev, CLAW_COMMAND_TYPE_READ_PROFILE, data,
+				    ARRAY_SIZE(data), 8);
+	if (ret) {
+		drvdata->profile_pending = CLAW_NO_PENDING;
+		return ret;
+	}
+
+	return sysfs_emit(buf, "%u\n", drvdata->rumble_intensity_right);
+}
+static DEVICE_ATTR_RW(rumble_intensity_right);
+
+static ssize_t rumble_intensity_range_show(struct device *dev,
+					   struct device_attribute *attr,
+					   char *buf)
+{
+	return sysfs_emit(buf, "0-100\n");
+}
+static DEVICE_ATTR_RO(rumble_intensity_range);
+
 static umode_t claw_gamepad_attr_is_visible(struct kobject *kobj, struct attribute *attr,
 					    int n)
 {
@@ -830,6 +966,12 @@ static umode_t claw_gamepad_attr_is_visible(struct kobject *kobj, struct attribu
 	    attr == &dev_attr_reset.attr)
 		return attr->mode;
 
+	/* Hide rumble attrs if not supported */
+	if (attr == &dev_attr_rumble_intensity_left.attr ||
+	    attr == &dev_attr_rumble_intensity_right.attr ||
+	    attr == &dev_attr_rumble_intensity_range.attr)
+		return drvdata->rumble_support ? attr->mode : 0;
+
 	/* Hide button mapping attrs if it isn't supported */
 	return drvdata->bmap_support ? attr->mode : 0;
 }
@@ -843,6 +985,9 @@ static struct attribute *claw_gamepad_attrs[] = {
 	&dev_attr_mkeys_function.attr,
 	&dev_attr_mkeys_function_index.attr,
 	&dev_attr_reset.attr,
+	&dev_attr_rumble_intensity_left.attr,
+	&dev_attr_rumble_intensity_right.attr,
+	&dev_attr_rumble_intensity_range.attr,
 	NULL,
 };
 
@@ -1314,6 +1459,7 @@ static void claw_features_supported(struct claw_drvdata *drvdata)
 		drvdata->bmap_support = true;
 		if (minor >= 0x66) {
 			drvdata->bmap_addr = button_mapping_addr_new;
+			drvdata->rumble_support = true;
 			drvdata->rgb_addr = rgb_addr_new;
 		} else {
 			drvdata->bmap_addr = button_mapping_addr_old;
@@ -1325,6 +1471,7 @@ static void claw_features_supported(struct claw_drvdata *drvdata)
 	if ((major == 0x02 && minor >= 0x17) || major >= 0x03) {
 		drvdata->bmap_support = true;
 		drvdata->bmap_addr = button_mapping_addr_new;
+		drvdata->rumble_support = true;
 		drvdata->rgb_addr = rgb_addr_new;
 		return;
 	}
-- 
2.53.0

