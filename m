Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C0D18C332
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 21:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787348867; cv=none; b=b3EeNuV+f1d0ftgP7gIk4HOsfIrUJfr61q3Q79GhnNLsUx88PZWFpRcgZaFQKKsE/qwsX7/Jne+vuF5lImDKvscDZq723rQQOPAbqTptUznDmGZbyhCD9pbXR8M8HzIx1PImCvc2dk8mwoCjBn6aXYslCR00x+aRcX1/4uOl3Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787348867; c=relaxed/simple;
	bh=BON6K8iN4nul7ABm2ly+Mmj813l0uRbmJRamoL7U9ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dnYTK/IwaPGqzIzjwTMsnh3Wh4oysTpy2ofE0UelBRTMoR1ZY4frC9cMRFkItpL1NBH8eiQB4kQQv8rjtblRVBq7hkamO2gf2Za6S/+Iq/rE1Xz+ItUH9nJA9apV8/C0TP6eIhtkBx/i+1d3UkH5TXjQwKa+KHYYsLqwlvA3hfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ll62cRv4; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ll62cRv4"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc891373e0so17723045ad.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 14:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787348865; x=1787953665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HwBWuHIqZxxUmc+OyU9PwGZ3GQWQsMUaZR3o5VyRTcE=;
        b=Ll62cRv4bgHpuFqsNArAtzDqmY1xBhwYZp+Q6Nn//BM+lnOzp8vunsKFhgCUXk+mns
         ECn9TkdFrbsp1SUz/0MfHMPQbId6/MdpFjbYBea0+GEl1Qn5fn2DkDaZv/GardQAJ/X5
         CE+6KwLGHU2W7iTGHMWIl1FzHQsDeAkkR3E+K0TGeuniDcWcTcaSQN6ZcQhkf0LXPpqp
         O3wJT5jI20l1jGMRt9JuyfJAnvjpKiuwPqLncuYXdemATdom58EhHQrtUHkbWCUxM6N9
         6508JbfOIBPEDId/Ewv9t6hptf1WUGNtWXgegkcxZeL2m8Im0OCYuMvGby2TulMdz1qB
         UG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787348865; x=1787953665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HwBWuHIqZxxUmc+OyU9PwGZ3GQWQsMUaZR3o5VyRTcE=;
        b=T2zKPk+LlpI5/rcxDw2mSEoAYSOSgqJm9qmpPJNA3QLMEnUbab46/4g6lw1/iSvnyg
         neLVXT0+dnnAxczXDoP5WwQLwclKs/kqaHImuy6Pa/+C9iZpt+odEeek/HIeX6ljcH8q
         +MRX/ps52jFV3S9kYOX3fd1IavUlMrM/Yd+1f9apKRnIZJ7auGR87aaCo+ITdk2SVHu5
         +qAjgMUdPaBESlkSXSULOwFSi4LAzEeTEhL7OAEw2zv66XM4XC+IZISoXUSjSqeYMg7y
         hV1iw/+4O7UOOJAMjt6FVBZD932hZCRlQfBwWEHsn8ddpHS1K/zcXtRQSkJ8b5DyId+m
         Gdmw==
X-Forwarded-Encrypted: i=1; AHgh+Rqz4oXPencQWiQNlCbwiy9HezFxlqCw4CD7awON4vVwoa8RsG+99niRsMECZVPqAZ4w3P2efTMOTj0=@vger.kernel.org
X-Gm-Message-State: AFuF++kA8tRzLxwAr0JW4vkCLE7opyzKPGyYb/3ooYAJz81I4j7IDAVM
	Axm2MUwcSHp0BVhnXxQPf5KVjAh2GzwKHifQSQHId6U2lrKB13BB7T1K
X-Gm-Gg: AR+sD13AW2d2rAV+g0mlZ58njrP7/MgqRDWqDXFBaCLOEaVy+82Jds9UMMAE5SJci1d
	U4U7RDErn71oebDDHy7ttquoeZUgXboA+NufIh4nYOSsEFnIECVZuW+ljiq/TMmOAYeGDcT/k1X
	we1N8yF6CT0ZkVJvskV3QgAsehxbRQBuXj0RxikDjvY4TdY/lIgYEQln0O/GN9WUo0NlCFnSDmg
	QS/5JP/Zz1iOQk/5prwlihFzCMmpaNX/SSmV9pDVkMqZji3lPffEHucVejBmvHzcdsyp1Hul0+w
	XnLo17hJLb1ec2N2Gmea7aOP7FtPyRCouJOUHqvluKhNjDDkf3xh3KdCqnIGgQd+q6CKpRX/Aa0
	xcCAWELt+kOZYCrQT8RScBg988BlChR+QkIRCybx8oCOTvV5CAwA8rfT+hE28UGfIW7kTUYCMfZ
	GyjsuHyF2A4prj/7gya3n7963aJnGJcnoVEgOJBWSiXdXJq2az7WqINBJwiQTUbTGfD5lvQu5Fo
	zGR55focAILM7Ji7CM=
X-Received: by 2002:a05:6a21:3117:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3cd4b9e7d2bmr3040455637.3.1787348865532;
        Fri, 21 Aug 2026 14:47:45 -0700 (PDT)
Received: from localhost.localdomain ([103.16.69.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10d497sm45664198eec.14.2026.08.21.14.47.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 21 Aug 2026 14:47:44 -0700 (PDT)
From: Aditya Dash <mradityadash@gmail.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [RFC PATCH 2/3] platform/x86: lenovo-wmi-other: Add Legion Go fan RPM fallback
Date: Sat, 22 Aug 2026 03:17:26 +0530
Message-ID: <20260821214728.87773-3-mradityadash@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821214728.87773-1-mradityadash@gmail.com>
References: <20260821214728.87773-1-mradityadash@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Legion Go firmware does not mark fan 1 RPM as readable in Capability
Data, although Other Mode feature 0x04030001 returns the current RPM. As a
result, lenovo-wmi-other hides fan1_input.

When the normal VALID and GET flags are missing on a supported product,
try one read from the Other Mode feature. Expose fan1_input as read-only
if the read succeeds and does not return 0xffffffff. Treat a later
0xffffffff reply as an unavailable reading.

Assisted-by: Pi:gpt-5.6-sol
Signed-off-by: Aditya Dash <mradityadash@gmail.com>
---
 Documentation/wmi/devices/lenovo-wmi-other.rst |  4 ++++
 drivers/platform/x86/lenovo/wmi-other.c        | 14 +++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index 75f2deaaef16..c93e9e6f3fd0 100644
--- a/Documentation/wmi/devices/lenovo-wmi-other.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -56,6 +56,10 @@ On supported Legion Go models, Other Mode feature ``0x04020000`` controls
 Full Speed mode in firmware. The driver exposes it as ``pwm1_enable``. Value 0
 enables Full Speed, and value 2 returns fan control to firmware.
 
+Some Legion Go firmware does not advertise fan 1 RPM through Capability
+Data. In that case, the driver reads Other Mode feature ``0x04030001`` for
+``fan1_input``. Value ``0xffffffff`` means that RPM is unavailable.
+
 LENOVO_CAPABILITY_DATA_01
 -------------------------
 
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index c180933e1d18..b4be7739b243 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -98,6 +98,7 @@ enum lwmi_feature_id_psu {
 #define LWMI_FAN_ID(x) ((x) + LWMI_FAN_ID_BASE)
 
 #define LWMI_FAN_DIV 100
+#define LWMI_FAN_RPM_NORMAL_SUPPORT (LWMI_SUPP_VALID | LWMI_SUPP_GET)
 
 #define LWMI_CHARGE_BEHAVIOR_DISCHARGE	0x00
 #define LWMI_CHARGE_BEHAVIOR_AUTO	0x01
@@ -195,6 +196,7 @@ struct lwmi_om_priv {
 
 	struct lwmi_fan_info fan_info[LWMI_FAN_NR];
 	bool fullspeed_supported;
+	bool fan0_input_fallback;
 
 	struct {
 		bool capdata00_collected : 1;
@@ -343,6 +345,8 @@ static umode_t lwmi_om_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_t
 		return 0644;
 
 	if (type == hwmon_fan) {
+		if (channel == 0 && priv->fan0_input_fallback && attr == hwmon_fan_input)
+			return 0444;
 		if (!(priv->fan_info[channel].supported & LWMI_SUPP_VALID))
 			return 0;
 
@@ -419,6 +423,8 @@ static int lwmi_om_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			err = lwmi_om_fan_get_set(priv, channel, &retval, false);
 			if (err)
 				return err;
+			if (channel == 0 && priv->fan0_input_fallback && retval == U32_MAX)
+				return -EIO;
 
 			*val = retval;
 			return 0;
@@ -542,6 +548,7 @@ static const struct hwmon_chip_info lwmi_om_hwmon_chip_info = {
  */
 static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
 {
+	u32 rpm;
 	long enable;
 	int i, valid;
 
@@ -563,6 +570,11 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
 
 	priv->fullspeed_supported =
 		lwmi_fan_supported() && !lwmi_om_fullspeed_get(priv, &enable);
+	priv->fan0_input_fallback =
+		lwmi_fan_supported() &&
+		(priv->fan_info[0].supported & LWMI_FAN_RPM_NORMAL_SUPPORT) !=
+		LWMI_FAN_RPM_NORMAL_SUPPORT &&
+		!lwmi_om_fan_get_set(priv, 0, &rpm, false) && rpm != U32_MAX;
 
 	valid = 0;
 	for (i = 0; i < LWMI_FAN_NR; i++) {
@@ -580,7 +592,7 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
 		}
 	}
 
-	if (valid == 0 && !priv->fullspeed_supported) {
+	if (valid == 0 && !priv->fullspeed_supported && !priv->fan0_input_fallback) {
 		dev_warn(&priv->wdev->dev,
 			 "fan reporting/tuning is unsupported on this device\n");
 		return;
-- 
2.55.0

