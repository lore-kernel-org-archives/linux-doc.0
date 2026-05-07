Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21EE2DD5E2
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 03:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778124747; cv=none; b=GZvNH2tVlbUps0WPeK3gRe++z4XSC6lQnVkGRopAOk5q9euD1ih+OIXe0vGm9pBf6rSepdJrOBoLDVgzDv/RfKcniSMIiUphxyz3WrQ6c9HOrW5V11GEiZtcQPSAhxi8A4O/ZJ70//P/HHao2zrXDRLo+ExkZ0eJRVz9oE4TFqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778124747; c=relaxed/simple;
	bh=yyDfmEPivb0/5E/2IFHBQISFwnPHdmmiGmpkGrnEdrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sruiOPZrijz+qWPQYpbJSFIuwZOz4LBdM4C47wd1TKm5MXYtJHdZ3Ok7M9RyTPo6KzVZzldBFG5+QYZCyDLzrglqHq/qntoZWyjRHH6c0eQX3pa1FuDy3oVXaJ4eLNXLvpQg1IzeuXW7spACVlveodi6fIb53gHmVAmDU9NKAuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWGEfUWP; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWGEfUWP"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-837cd669be0so229593b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2026 20:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778124745; x=1778729545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3hz0A98B9puJCvkh6JtrxfTFZ4RXGUWv+B5oj53yvm4=;
        b=bWGEfUWPB/jRoRnLY91v+qR2cLSCazlrEPzIvGqh5nwOi2iXQ0BwszfXjnm5NuIMpX
         PL0jQTpnG/F6ti1VdhCmLBr8ad/hKvq7P+iUrT3AMPRnMFxOZhoH0/75l2Fqy/6tcCBN
         AvkyzkN4kYTdXSKkV5DyIFc40zTxtF1XBebJE+zw/4yqEZhZLK9vm52PYBJlF2xKPPGO
         zxco1wfLYzsoumKbvyhzMJxkYMZx6OVhKnTuoixIwp5FpDVI1Q1MEUs7fmzqGJw+04Gs
         pc5gc0Zcw4A+FFx4rFfFoBy5H0tkk3kpabYZuiAHxqf8iljzvPx11EkYJTF9EHSKlgPf
         3DCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778124745; x=1778729545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3hz0A98B9puJCvkh6JtrxfTFZ4RXGUWv+B5oj53yvm4=;
        b=kDpon+yjriwc0Dd4qEEkYJ7Cxi3hrQn43Svd+9a3AIW5Eu985bod3jS5200qkAsKNM
         pl/vFEWjEhur9rb+nYKtV3dOP78NArS4oHrpHwThAwktcpDGcCWIS2PwxGK5Ez1RKZGy
         DRY+UTYgcCeqJEiACjhpYVEk1IwgInmgw3Q8nmrqk3xZMOQ4/gV7xyRXeDbNsqb3iQN5
         7zQw2eD2t0PvrwtrE/g7wvoeIGlmPKMDasjZnbiH3sbnmKgLYFnIgDIhRt7PTZcdCAVH
         GVu88pxUrNob2P//tdO24vKjlEzbX+KjkIhhtia1r7UkX0MA8846q95HK3LdBk9F6mmX
         qNRw==
X-Forwarded-Encrypted: i=1; AFNElJ+x+FcNrDfC4q/WgVoP4wLGRxXxrP7L4NX5oWybjuHg/Lcy0MWkZ43DpnHIzk5aGvtR4gE8tXr0nM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxdSaLtEiKYXp81XOcnmxz6Ndrj5ABWZ5JtaZiPdaJB/RLcjN5
	WOmFDTUIfZGuVSN9DBKidFplxBRNaFNaWnul9E5sO8DrViTGTHYgxJmz
X-Gm-Gg: AeBDietPoh+Ah89IF8DaP58w0oav+j9v9XeGnmhinDmxJzuAAGsXGo6t8o1SY2Kt30X
	7H8mCkQsEMG/UWiYEMYDiFSpTHZu46A20iKHo6M5xXuRfkhkelTD1vwFJb1g+JAgBUAOQ65C1gD
	I4XD1Hc1UVwXbWXhk2XXuc7sn3juQ0aIYCgQLAt+ecSHDm3sKHOrhx9xAALCPwFt1oFCiY7BTIM
	YKj3LVVlvycACQIVM8mUW2GcW89l3NoWiQTOuOeFN27zuxuS0NXovhWwfe+DuoLKeZ0sREFmrbI
	cKoeYUHMMkTRB0e4Pj5FdgPkNPZOIK0F19zqOw6QL8heRNxbHXbTzicisJYNZ2IjAwP+X3EiFzq
	tkdS8TgSo4y5nDiQC1eLF5WZgAnYC5eGtzhIGkVgDZuZOadjKnXr5XCOcy999BpNazMsl/D3dIo
	yn3JwI1yJa6t5mdYMsvKIDEjdDLD0EJ/s=
X-Received: by 2002:a05:6a00:b48:b0:82f:280a:d888 with SMTP id d2e1a72fcca58-83a5bbd5fd8mr6171391b3a.12.1778124745097;
        Wed, 06 May 2026 20:32:25 -0700 (PDT)
Received: from mincom1 ([14.67.155.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a103esm9171580b3a.51.2026.05.06.20.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 20:32:24 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	linux-usb@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [PATCH v3 1/2] usb: xhci-pci: add generic auxiliary device interface
Date: Thu,  7 May 2026 12:31:58 +0900
Message-ID: <effa7bd7bef8a8ea28b9e28fe47af6a58e39edf2.1778123510.git.hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778123510.git.hurryman2212@gmail.com>
References: <cover.1778123510.git.hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some xHCI PCI controllers expose controller-specific functionality that is
not part of generic xHCI operation and is better handled by optional child
drivers in other subsystems. Add a small auxiliary device registration path
for selected xHCI PCI controllers.

The initial PCI ID match table lists AMD Promontory 21 (PROM21) 1022:43fd
controllers. For matching controllers, xhci-pci creates an auxiliary
device and stores it in devres so the remove path destroys it before HCD
teardown.

Subsystem-specific child drivers can then bind to those devices through
the auxiliary bus and keep their hardware-specific logic outside xhci-pci.

Assisted-by: Codex:gpt-5.5
Signed-off-by: Jihong Min <hurryman2212@gmail.com>
---
 drivers/usb/host/Kconfig    | 10 +++++
 drivers/usb/host/xhci-pci.c | 83 +++++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 0a277a07cf70..e0c2c7ac5c97 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -42,6 +42,16 @@ config USB_XHCI_PCI
 	depends on USB_PCI
 	default y
 
+config USB_XHCI_PCI_AUXDEV
+	bool "xHCI PCI auxiliary device support"
+	depends on USB_XHCI_PCI
+	select AUXILIARY_BUS
+	help
+	  This enables xHCI PCI support for registering auxiliary devices
+	  for selected controllers. It is used by optional child drivers
+	  that bind to xHCI PCI controller-specific functionality through
+	  the auxiliary bus.
+
 config USB_XHCI_PCI_RENESAS
 	tristate "Support for additional Renesas xHCI controller with firmware"
 	depends on USB_XHCI_PCI
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 585b2f3117b0..618d6840e108 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -8,6 +8,8 @@
  * Some code borrowed from the Linux EHCI driver.
  */
 
+#include <linux/auxiliary_bus.h>
+#include <linux/device/devres.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/module.h>
@@ -80,6 +82,7 @@
 #define PCI_DEVICE_ID_AMD_RAVEN_15E1_XHCI		0x15e1
 #define PCI_DEVICE_ID_AMD_RAVEN2_XHCI			0x15e5
 #define PCI_DEVICE_ID_AMD_RENOIR_XHCI			0x1639
+#define PCI_DEVICE_ID_AMD_PROM21_XHCI			0x43fd
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_4			0x43b9
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_3			0x43ba
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_2			0x43bb
@@ -103,6 +106,80 @@ static int xhci_pci_run(struct usb_hcd *hcd);
 static int xhci_pci_update_hub_device(struct usb_hcd *hcd, struct usb_device *hdev,
 				      struct usb_tt *tt, gfp_t mem_flags);
 
+static const struct pci_device_id pci_ids_have_aux[] = {
+	{ PCI_DEVICE_DATA(AMD, PROM21_XHCI, "prom21_hwmon") },
+	{ /* end: all zeroes */ }
+};
+
+struct xhci_pci_aux_devres {
+	struct auxiliary_device *auxdev;
+};
+
+static const char *xhci_pci_aux_dev_name(struct pci_dev *pdev)
+{
+	const struct pci_device_id *id;
+
+	id = pci_match_id(pci_ids_have_aux, pdev);
+	if (!id)
+		return NULL;
+
+	return (const char *)id->driver_data;
+}
+
+static void xhci_pci_aux_devres_release(struct device *dev, void *res)
+{
+	struct xhci_pci_aux_devres *devres = res;
+
+	if (devres->auxdev)
+		auxiliary_device_destroy(devres->auxdev);
+}
+
+static void xhci_pci_try_add_aux_device(struct pci_dev *pdev)
+{
+	struct xhci_pci_aux_devres *devres;
+	struct auxiliary_device *auxdev;
+	const char *aux_dev_name;
+
+	aux_dev_name = xhci_pci_aux_dev_name(pdev);
+	if (!aux_dev_name)
+		return;
+
+	devres = devres_alloc(xhci_pci_aux_devres_release, sizeof(*devres),
+			      GFP_KERNEL);
+	if (!devres) {
+		dev_warn(&pdev->dev,
+			 "failed to allocate auxiliary device state\n");
+		return;
+	}
+
+	auxdev = auxiliary_device_create(&pdev->dev, KBUILD_MODNAME,
+					 aux_dev_name, NULL,
+					 (pci_domain_nr(pdev->bus) << 16) |
+						 pci_dev_id(pdev));
+	if (!auxdev) {
+		devres_free(devres);
+		dev_warn(&pdev->dev, "failed to add %s auxiliary device\n",
+			 aux_dev_name);
+		return;
+	}
+
+	devres->auxdev = auxdev;
+	devres_add(&pdev->dev, devres);
+}
+
+static void xhci_pci_try_remove_aux_device(struct pci_dev *pdev)
+{
+	struct xhci_pci_aux_devres *devres;
+
+	devres = devres_find(&pdev->dev, xhci_pci_aux_devres_release, NULL,
+			     NULL);
+	if (!devres || !devres->auxdev)
+		return;
+
+	auxiliary_device_destroy(devres->auxdev);
+	devres->auxdev = NULL;
+}
+
 static const struct xhci_driver_overrides xhci_pci_overrides __initconst = {
 	.reset = xhci_pci_setup,
 	.start = xhci_pci_run,
@@ -677,6 +754,9 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (device_property_read_bool(&dev->dev, "ti,pwron-active-high"))
 		pci_clear_and_set_config_dword(dev, 0xE0, 0, 1 << 22);
 
+	if (IS_ENABLED(CONFIG_USB_XHCI_PCI_AUXDEV))
+		xhci_pci_try_add_aux_device(dev);
+
 	return 0;
 
 put_usb3_hcd:
@@ -713,6 +793,9 @@ void xhci_pci_remove(struct pci_dev *dev)
 	xhci = hcd_to_xhci(pci_get_drvdata(dev));
 	set_power_d3 = xhci->quirks & XHCI_SPURIOUS_WAKEUP;
 
+	if (IS_ENABLED(CONFIG_USB_XHCI_PCI_AUXDEV))
+		xhci_pci_try_remove_aux_device(dev);
+
 	xhci->xhc_state |= XHCI_STATE_REMOVING;
 
 	if (pci_choose_state(dev, PMSG_SUSPEND) == PCI_D0)
-- 
2.53.0

