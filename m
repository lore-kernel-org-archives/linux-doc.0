Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E15C3BFE34
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 04:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780978503; cv=none; b=HOu6+lyBK/+q+x5xRRrYuByaUK3LDtc1dLadkZoEBfytsy5phXmNMl23BG8TnBj/gt681iG5gxoGngZlD/pWWYTnuPCrOnVJkyOQKzA/bHX8FF3kyG2qmE9GQfJ+y/F2bMVgntF5XTRKCXHT/GMG0VEWUUFMb8aJNl3643LNXec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780978503; c=relaxed/simple;
	bh=E/xl1JvCgeKLcTsv74DlRrmze/TsLnufeI1o4/GZ7bE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j6QoGQ+FynSVMrXe9Ge96QoiYf9WwObP6sFukY1/tFtcgBxVxxpy3df+N9l9Jgl0WqRlSFyDOw/faROO5co2atHyX4oWcsE8+zLP+jQSNCgvkLNMoYMakQ6Zhlu0AXlKhHQ163vXEv+dF9UvyNrWZuhT3oKlLwc8EU62A35sfBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLCmQN1U; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLCmQN1U"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c168baac83so23317295ad.2
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 21:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780978502; x=1781583302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BgYD1+plAw+i8a8I9KmFfAGKUdU1l1KJmLovt53nB04=;
        b=NLCmQN1UWSbD84lh9iU3KubPv5ZuXWWeVkWEtIxFU+I/nfLAF/qyl9xgppQeogrZDX
         XKO8TNk3jGalidGb84WQ0bQFGakw2HWyRy01jNRqLoDuXE7O4bJgVmEp+DBZqIV9lSn8
         Zn00OAq0QnQhu95e2XqaRujWG7gBjlsRH0zkb1jExXYBEzq75ME9FCKaE2YxBRRHJXCe
         Oo2nhtRqBCZQ6VbPeTr0ozLyxT3sxGtQefHRC16CtBKLjrL3PLqInvdemX89OK4AyNzC
         9LDMYcnuFfuzrIZrsgYkPtsbT+hPuPR2QdxF8cd38otUhzXwmFIh4os758WICd3D/u9p
         Ddlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780978502; x=1781583302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgYD1+plAw+i8a8I9KmFfAGKUdU1l1KJmLovt53nB04=;
        b=h9yXgas8FziW34iEagUDHpNX4uWeCkoDTyMhlsUXbe0Zg1H3Fb1vOG04mKrjfc9TkV
         Gy/6UJ7rMDle+Hea7uz5vOmvhbFwb3qjiS+NUZlYinC2jjD8bCSbYgXeF2XyQQ0OmWga
         +eq/OXTmUVRCLBWWhdqzl04MfN+D5bI0Y5MNVLgLjMqtSFCwZ4JhDSURcCX0GKvcczHE
         HnW9o0GnQqQ1iE7vXXBYQpdv0pCF4g7ozOPoDI92sXBQh70PI15476hBYg+/xPfW3RMs
         c3oTtxcvbhZ+AG9DTzUpBwh5nL1IIQt5gs1lS5j1BjY//5smDeeHVXArWM8GfBX42aE/
         /J8w==
X-Forwarded-Encrypted: i=1; AFNElJ9xAoYTQ6+CTS51ygE/y8EvilDbELWa1cwS3OJH19bRzvBnMTi48JqLdChmpJhtHJqwhYgnTXG5ZKg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5/588NuTXuTNUhJWcsyJje43Zeif0+ysE8xORfhAQZwWEnds4
	WH9nLK7blrTQpP54jpVKAx0EODS4jTo1Ser/olraWLurjd2Xow2ldbzw
X-Gm-Gg: Acq92OF8EOFJ5v0vsk1kHevK7A/E3gdrbYE0VctjybBYmMVUlB7cr4Mua2XeTnu4eMz
	ibmV+xpMHBoS5N6F1KhDAlszdRdsM31SNsMszh+SA31dhXDnp+UYcBKW50Kijc2HF0ZvjanI3eY
	aTqjR9MLIoNn8blriNr8w9OzMy3kL0DFKhZJpHw4oacFHLs455M8OxZSzb10d8KcwgYs+NxVsg8
	Im2/xjyYeTO25MbepSlH22y1dijdimbECAJ6Awi/ggzclBOmIbKFf+tnget/bK2ioxLlzzvR7Mt
	9wJJTyaD4Kdj5Ju3SsQn7+xfkZwbKytmFpoFZ+evFoXMebwZM7A1UDr1/iKrDbmacRPI6Q3PQc+
	MT8ULoEJnUymRj/Xns/WldWb8B3XMHmv+NMP+WRmZo1mWo/v7FrD2VJGgzR65hYKupoqHyLrwN2
	HvAXFv7bKXm3SRgh3Ti3ATgsflSQVo26lXoEYCFS5REEwenD9eB/K2vGEICtub
X-Received: by 2002:a17:903:18e:b0:2be:e3bc:e8e4 with SMTP id d9443c01a7336-2c1e7e50ccamr217301755ad.18.1780978501658;
        Mon, 08 Jun 2026 21:15:01 -0700 (PDT)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 ([2400:2410:5f2b:700:d93d:42a4:f320:1e3f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664ad138sm202962665ad.82.2026.06.08.21.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 21:15:00 -0700 (PDT)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: mpearson-lenovo@squebb.ca,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	corbet@lwn.net,
	derekjohn.clark@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	skhan@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-doc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v2] platform/x86: thinkpad_acpi: Add USB-C Security (USCS) support
Date: Tue,  9 Jun 2026 13:14:02 +0900
Message-ID: <20260609041402.328509-1-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Newer ThinkPad systems expose a USB-C Security (Restricted Mode) feature.
When active, USB-C data connections are disabled while power delivery is
preserved. This is useful for kiosk and physically-secured deployments.

Hardware interface:

The HKEY device exposes a read-only ACPI method USCS():

  Return value bit layout:
    Bit 16 : Capability flag (1 = feature present on this SKU)
    Bit  0 : Current state  (0 = security OFF, 1 = security ON)

The sysfs attribute is read-only.

The Fn+U followed by Fn+S hotkey chord is the only way to toggle the
hardware state.

Hotkey:

Fn+U followed by Fn+S generates HKEY event 0x131e.

sysfs interface:

  /sys/devices/platform/thinkpad_acpi/usb_c_security  (read-only)
  "enabled\n"  -- data connections are currently blocked
  "disabled\n" -- data connections are currently allowed

  The attribute is hidden on SKUs where the USCS capability bit (bit 16)
  is not set, so there is no ABI impact on unsupported hardware.

Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
---
Changes since v1:
- Use guard(mutex) from cleanup.h instead of manual mutex_lock/unlock
- Revert usbc_security_query() to return int (-EIO/-ENODEV/0) instead
  of bool to avoid uninitialized *enabled bug on unsupported platforms
- Remove !! when assigning to bool in usbc_security_query()
- Remove dead tp_features.usbc_security_supported check in show()
  since is_visible() already gates the attribute on unsupported SKUs
- Use str_enabled_disabled() from string_choices.h in show()
- Fix uninitialized *enabled bug in tpacpi_usbc_security_init() by
  only assigning usbc_security_enabled after a successful query
---
 .../admin-guide/laptops/thinkpad-acpi.rst     |  24 ++++
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 118 ++++++++++++++++++
 2 files changed, 142 insertions(+)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index f874db31801d..db4588af0278 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -1543,6 +1543,30 @@ Values:
 
 	This setting can also be toggled via the Fn+doubletap hotkey.
 
+USB-C Security
+--------------
+
+sysfs: usb_c_security
+
+Reports the current state of the USB-C Security (Restricted Mode) feature
+on supported ThinkPad systems. When enabled, USB-C data connections are
+disabled while power delivery is preserved.
+
+The available command is::
+
+        cat /sys/devices/platform/thinkpad_acpi/usb_c_security
+
+Values:
+
+	* ``enabled``  - USB-C data connections are currently blocked
+	* ``disabled`` - USB-C data connections are currently allowed
+
+The attribute is read-only. The USB-C Security state can only be toggled
+via the Fn+U followed by Fn+S hotkey chord.
+
+The sysfs attribute is not created on platforms that do not support this
+feature.
+
 Auxmac
 ------
 
diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index e1cee42a1683..379769b62c80 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -38,6 +38,7 @@
 #include <linux/backlight.h>
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
 #include <linux/freezer.h>
@@ -66,6 +67,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include <linux/string_helpers.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
@@ -185,6 +187,7 @@ enum tpacpi_hkey_event_t {
 	TP_HKEY_EV_AMT_TOGGLE		= 0x131a, /* Toggle AMT on/off */
 	TP_HKEY_EV_CAMERASHUTTER_TOGGLE = 0x131b, /* Toggle Camera Shutter */
 	TP_HKEY_EV_DOUBLETAP_TOGGLE	= 0x131c, /* Toggle trackpoint doubletap on/off */
+	TP_HKEY_EV_USB_C_SECURITY	= 0x131e, /* Toggle USB C Security ON/OFF */
 	TP_HKEY_EV_PROFILE_TOGGLE	= 0x131f, /* Toggle platform profile in 2024 systems */
 	TP_HKEY_EV_PROFILE_TOGGLE2	= 0x1401, /* Toggle platform profile in 2025 + systems */
 
@@ -373,6 +376,8 @@ static struct {
 	u32 has_adaptive_kbd:1;
 	u32 kbd_lang:1;
 	u32 trackpoint_doubletap_enable:1;
+	u32 usbc_security_supported:1;
+	u32 usbc_security_enabled:1;
 	struct quirk_entry *quirks;
 } tp_features;
 
@@ -11265,6 +11270,112 @@ static struct ibm_struct hwdd_driver_data = {
 	.name = "hwdd",
 };
 
+/*************************************************************************
+ * USB-C Security subdriver
+ *
+ * HKEY.USCS(0) is a read-only ACPI method; its argument is ignored.
+ * It always returns:
+ *   bit 16 - USB-C security capability present on this SKU or not
+ *   bit  0 - USB-C Security state (enable or disable)
+ *
+ * Hotkey
+ * ------
+ * 0x131e (Fn+U, Fn+S): firmware toggles USBS before firing the event.
+ * The driver reads back the new state and notifies the sysfs attribute.
+ *
+ */
+
+/* USCS() return word bit layout */
+#define USCS_CAP_BIT		BIT(16)	/* capability: feature present on SKU */
+#define USCS_STATUS_BIT		BIT(0)	/* current security state */
+
+static DEFINE_MUTEX(usbc_security_mutex);
+
+/*
+ * usbc_security_query - read current USB-C security state via USCS()
+ * @enabled: out - true when security is ON (data connections blocked)
+ *
+ * Returns true if the feature is supported and query succeeded,
+ * false otherwise (feature absent or ACPI call failed).
+ */
+static int usbc_security_query(bool *enabled)
+{
+	int status;
+
+	guard(mutex)(&usbc_security_mutex);
+	if (!acpi_evalf(hkey_handle, &status, "USCS", "dd", 0))
+		return -EIO;
+
+	if (!(status & USCS_CAP_BIT)) {
+		pr_debug("USCS cap bit absent (raw=0x%x)\n", status);
+		return -ENODEV;
+	}
+
+	*enabled = status & USCS_STATUS_BIT;
+	return 0;
+}
+
+/* sysfs: /sys/devices/platform/thinkpad_acpi/usb_c_security ---------- */
+static ssize_t usb_c_security_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	return sysfs_emit(buf, "%s\n",
+			  str_enabled_disabled(tp_features.usbc_security_enabled));
+}
+
+static DEVICE_ATTR_RO(usb_c_security);
+
+static struct attribute *usbc_security_attributes[] = {
+	&dev_attr_usb_c_security.attr,
+	NULL,
+};
+
+static umode_t usbc_security_attr_is_visible(struct kobject *kobj,
+					     struct attribute *attr, int n)
+{
+	return tp_features.usbc_security_supported ? attr->mode : 0;
+}
+
+static const struct attribute_group usbc_security_attr_group = {
+	.is_visible = usbc_security_attr_is_visible,
+	.attrs = usbc_security_attributes,
+};
+
+static int tpacpi_usbc_security_init(struct ibm_init_struct *iibm)
+{
+	bool enabled;
+	int err;
+
+	err = usbc_security_query(&enabled);
+	if (err)
+		return err == -ENODEV ? 0 : err;
+
+	tp_features.usbc_security_supported = true;
+	tp_features.usbc_security_enabled = enabled;
+	return 0;
+}
+
+/* tpacpi_usbc_security_hotkey - handle Fn+U Fn+S hotkey (0x131e) */
+static bool tpacpi_usbc_security_hotkey(void)
+{
+	bool enabled;
+
+	if (!tp_features.usbc_security_supported)
+		return false;
+
+	if (usbc_security_query(&enabled))
+		return false;
+
+	tp_features.usbc_security_enabled = enabled;
+	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "usb_c_security");
+	return true;
+}
+
+static struct ibm_struct usbc_security_driver_data = {
+	.name = "usbc_security",
+};
+
 /* --------------------------------------------------------------------- */
 
 static struct attribute *tpacpi_driver_attributes[] = {
@@ -11325,6 +11436,7 @@ static const struct attribute_group *tpacpi_groups[] = {
 	&dprc_attr_group,
 	&auxmac_attr_group,
 	&hwdd_attr_group,
+	&usbc_security_attr_group,
 	NULL,
 };
 
@@ -11479,6 +11591,8 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 	case TP_HKEY_EV_PROFILE_TOGGLE2:
 		platform_profile_cycle();
 		return true;
+	case TP_HKEY_EV_USB_C_SECURITY:
+		return tpacpi_usbc_security_hotkey();
 	}
 
 	return false;
@@ -11930,6 +12044,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
 		.init = tpacpi_hwdd_init,
 		.data = &hwdd_driver_data,
 	},
+	{
+		.init = tpacpi_usbc_security_init,
+		.data = &usbc_security_driver_data,
+	},
 };
 
 static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
-- 
2.51.0

