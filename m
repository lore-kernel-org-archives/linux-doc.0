Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3E53C5DB6
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 10:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444484; cv=none; b=EXoDAzPrmtymMI/U3k2thyUf0lpgrMBmAA6+6n77BwSWbmh7RNcAWimi3KKkliaO9Px6wpwWazP32nmg/QYNgtim89ebfM/9tPwSr20M0oKDZXQ2Cu0X73R7+SEnSlGW5DRbgu6UG25e9dUDvZJciabvKDp+kEBY+JMXEvbnn8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444484; c=relaxed/simple;
	bh=yrGRLJJNKjxQXYGvDm/9oHf3Fry/Fq7TaFKaqXZkIWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wxcztf9KPL7jAb3ytrAvfBsAJNcMe7sXH0/t13QdLd0GQC1iK1U/RHC2N2aXJJLBZkDeeEcUAC7nQ7g/SbrJBxPXN2GP7eKI5eI31gg0QWBha78EcjwXCNW+Y/JBaffASlI186J1SkM5BLuNkRoMU4Wcky4rWfH5zD5GAvZbZAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pARdmw/6; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pARdmw/6"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ba4a1a0325so45619505ad.0
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 03:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444482; x=1780049282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yGKeV9SlBS4xw5Peq+K+JK8yryD65EG/aByyDDes+nM=;
        b=pARdmw/6ERs+iDGgjwOLkLJa2B8rcVLZZVvQErDfitwKQv83s2Dc1hAaqpNzdqcOfl
         BFwXuGj42s9eBfoy2AYGAXrpJAczQZVQYUiouuPc2XjvS/Efbr4cF1DMySkahtlZZMD/
         /wjD452nZYrX4tRwn71WsiIr4fiVdcRrd5g9JTo4/H2V68XLplNKXj8M3lKtG0UwqIQ+
         t6exGHQQ7THftWhJPY7rVpn5aZVCEY1JvNxJs2mydNHdqACw4PXtY9QWbzfyOZ9gcHkf
         mP+DzO3eH+Vp3HbYb44gPIFWJ33EIaIqMfnHchICu0MdrTHA5GWfvIwvqboRqtYSaKfE
         ZT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444482; x=1780049282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGKeV9SlBS4xw5Peq+K+JK8yryD65EG/aByyDDes+nM=;
        b=V7VAiGfbDXdJMmcu2Cv1vEKSiXl5u0hSEOPNs+h/veOsedaTDWZJc9iKYOf8UEMm5H
         nC/MDkvjCgEDSejCWhcXuFQf6VkmRImeVao5vcWOFZkNgAgf8B8NZ8JhLSoe1si9RnBv
         J6CW7Zt/+gVk1A+M4gdhqQ3gvdzJi90BkqCqhQUYB1P7G9+L8oW+1JpORg7bIwLpZTZI
         wUzHUiA9pMbUURIvy9id4toVElMNINLqpyvpqKoSIj2z3gkanGIzfECFOjU1knCwq4j/
         IvKLdj25ON9aYoFF4G+fZgB+T2x5Eeb/XjcA0onMhcMnha9KfbSmaNlnLXS02GfzTuxz
         vlRg==
X-Forwarded-Encrypted: i=1; AFNElJ+EwQKR8qEVOEpBOtQOn3ijbMt1e8oCS0oV2uyGp+Y+GVQ3BWjQv+EzqPObAymOCv62qwBo085Yxkg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTpdPi+kV5ssb6swe4DD+26XO20BysAcHDJ6MliBZx4XzzjGoM
	MKKyz3FNHbCVc7Tva44hEIa/SMgbcqPZhBT+dvqlTf+itKjWeCQRFxGh
X-Gm-Gg: Acq92OFFscQoqRn+mTv5iUMdcjVkmgNx2Fma6rnpjr5CpF+KIvs+kL5wrfTDVUwgQiG
	GD7pL5o/30Djp7bybGYlA/4LdpX4IyC4YBhaBDisNTe+eAQMeR3DgFxEtNGI/tmZtUHQ/9ptISY
	6h7NDWzk01LdjflhmdlALkRUNlE8LxJLUaWAGSiCfgLIe733so/zWyiG/m0lW8ho/MeReigTzIC
	e5HfvPjSgEjnjZpaXf3LRHQLcMKnT9p+cjVqmU6ss1/sX3ULxbg+ULbGeiREjuaZEmHT/QXOVxF
	D1X0u6/ZkNXq3a7IseuwzRKjKMnpdc1/rkXgK2h2TjNleK56zUjDyqWp7lytys+dRUoXcaT67P7
	AgRNlzjZUvvSv7OEeXvK2ddkiI9tQ0Lu40R1Wgevmdhl6kEEkDNvElW/D0ygV+2EIEgGZ0HF62R
	6p8z2AMrWdpQQJflFlOi06RkttqY9NiOmwvvwkMxNpmDtO28Touw==
X-Received: by 2002:a17:902:c94a:b0:2bd:9728:5e42 with SMTP id d9443c01a7336-2beb074b967mr32871895ad.31.1779444481668;
        Fri, 22 May 2026 03:08:01 -0700 (PDT)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 ([2400:2410:5f2b:700:25c3:6270:fc29:ed71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b3058sm12718925ad.39.2026.05.22.03.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:08:01 -0700 (PDT)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: mpearson-lenovo@squebb.ca,
	skhan@linuxfoundation.org,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	corbet@lwn.net,
	derekjohn.clark@gmail.com,
	ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-doc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Add USB-C Security (USCS) support
Date: Fri, 22 May 2026 19:07:15 +0900
Message-ID: <20260522100715.20036-1-vishnuocv@gmail.com>
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
 .../admin-guide/laptops/thinkpad-acpi.rst     |  24 ++++
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 115 ++++++++++++++++++
 2 files changed, 139 insertions(+)

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
index e1cee42a1683..889db802185a 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -185,6 +185,7 @@ enum tpacpi_hkey_event_t {
 	TP_HKEY_EV_AMT_TOGGLE		= 0x131a, /* Toggle AMT on/off */
 	TP_HKEY_EV_CAMERASHUTTER_TOGGLE = 0x131b, /* Toggle Camera Shutter */
 	TP_HKEY_EV_DOUBLETAP_TOGGLE	= 0x131c, /* Toggle trackpoint doubletap on/off */
+	TP_HKEY_EV_USB_C_SECURITY	= 0x131e, /* Toggle USB C Security ON/OFF */
 	TP_HKEY_EV_PROFILE_TOGGLE	= 0x131f, /* Toggle platform profile in 2024 systems */
 	TP_HKEY_EV_PROFILE_TOGGLE2	= 0x1401, /* Toggle platform profile in 2025 + systems */
 
@@ -373,6 +374,8 @@ static struct {
 	u32 has_adaptive_kbd:1;
 	u32 kbd_lang:1;
 	u32 trackpoint_doubletap_enable:1;
+	u32 usbc_security_supported:1;
+	u32 usbc_security_enabled:1;
 	struct quirk_entry *quirks;
 } tp_features;
 
@@ -11265,6 +11268,111 @@ static struct ibm_struct hwdd_driver_data = {
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
+static bool usbc_security_query(bool *enabled)
+{
+	int status;
+
+	mutex_lock(&usbc_security_mutex);
+	if (!acpi_evalf(hkey_handle, &status, "USCS", "dd", 0)) {
+		mutex_unlock(&usbc_security_mutex);
+		return false;
+	}
+	mutex_unlock(&usbc_security_mutex);
+
+	if (!(status & USCS_CAP_BIT)) {
+		pr_debug("USCS cap bit absent (raw=0x%x)\n", status);
+		return false;
+	}
+
+	*enabled = !!(status & USCS_STATUS_BIT);
+	return true;
+}
+
+/* sysfs: /sys/devices/platform/thinkpad_acpi/usb_c_security ---------- */
+static ssize_t usb_c_security_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	return sysfs_emit(buf, "%s\n",
+			  tp_features.usbc_security_enabled ? "enabled" : "disabled");
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
+
+	tp_features.usbc_security_supported =
+		usbc_security_query(&enabled);
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
+	if (!usbc_security_query(&enabled))
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
@@ -11325,6 +11433,7 @@ static const struct attribute_group *tpacpi_groups[] = {
 	&dprc_attr_group,
 	&auxmac_attr_group,
 	&hwdd_attr_group,
+	&usbc_security_attr_group,
 	NULL,
 };
 
@@ -11479,6 +11588,8 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 	case TP_HKEY_EV_PROFILE_TOGGLE2:
 		platform_profile_cycle();
 		return true;
+	case TP_HKEY_EV_USB_C_SECURITY:
+		return tpacpi_usbc_security_hotkey();
 	}
 
 	return false;
@@ -11930,6 +12041,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
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

