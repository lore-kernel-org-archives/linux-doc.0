Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEE93B42C5
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 06:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789538728; cv=none; b=B0VIpm8uDqPdg0/9Zlf6yCAUYjYFYq6hXz0MSiJdtkagAJEyhpCnm9MeiE3CoEmZY5lzBTKMnqu1hzkXmIZ5rWrQjaO3GrDSVZ3h+aXJpv1BH1vBQCNG1MgqrXy4mKpUMElh62fLKKOjKyqeTWT9+VFChPhx827HwlXazsB3R9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789538728; c=relaxed/simple;
	bh=jROTR0ITRns0tiedyiy8ATd83fnU+oIF0ulm8QoJPN8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=rs1dxwzfBIIAIW+T90Lw6fjcCWxesilJYUCwKrWD/P2SzsiMiOkf/qCuon3960LEeBFIG4QHAEESBQH2rrVWuqCZ9ALpJTIVO6q1ZvtJCsgivmPfzF1764LCFpK0KaHkl1n/7NSdzIS0+AIWIXEGiBnybgHmklqQjw+nLJjOXsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6KRLndP; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6KRLndP"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3920so3722635e9.1
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 23:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789538725; x=1790143525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rbq2d0oIKc7y+4xN1GVI1HKIPTsHL3IMPxXwacqWNvY=;
        b=V6KRLndP1hW6Cg3+v0CE+HzTd8Wvx8AQeihMJIn3Cp5Uom93qUc3XMezKL+BDMX1++
         LW8g2o8JPnvbGGuUDCtgEVpeTGgxilIa9COonGAC1+RtGbAXiPG8yA+YJDQFdSJB/Re5
         CkzPg6SpbhrEOb2KAFNOPC4cOB5/koVHp6Cmikbj7hWkctGcT4ktwTUfgwf8ho1xG1Kd
         WI48YiA7kLTScWDjrghh0ajsmknGCMo62rgfrNjbSCcai3T6PUMNayv62Mwqgxmr4XKs
         kn34c6EGDokz/zttw+IsN9iPQYveRY/N5ln5mkJw5V7v2f8pxqce26Wk4/wOIo7eBCcE
         NPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538725; x=1790143525;
        h=content-transfer-encoding:content-type:cc:to:subject:from
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rbq2d0oIKc7y+4xN1GVI1HKIPTsHL3IMPxXwacqWNvY=;
        b=23lXQc5rY/tHJHyIONR/r2JQlfcGzidlCI7gm29bNdRVRbkdY5fcDktsfgVQj4G2+r
         wvhoa1B6Zu+aKYFj0zAb7rP/ccYBo064iIwGPaWhXr7D1KS+ptvhM04MjARW7YKQvGgL
         9hvS5XHqxQ1q0fbj2ch8ItpaSjjyT8VsG+OS7cVGa98pCVo1rM957FHWme3viqxC0WTc
         VEnAPCoDvyD4Iv8sHzu2AJbfyE/ldWpkYc7+Jb4kgQFmzT6BoQWdaTaWELMC7GBXkmcW
         x/2bEHGYwX36byO/FbeoPYl+kMVxOhFYNM1M80auc/kTo/gO4gX+I/0dPFz29gAkRQ+u
         8zzA==
X-Forwarded-Encrypted: i=1; AKwUvBwBeR3+LsUfeAyysbWbKsOg9Y7gDWEbkhj9cFROfiZzXa/+SjH3vnM9aVp4oKD1iVDCKmKH8U1n2f8=@vger.kernel.org
X-Gm-Message-State: AFuF++n4oUGN34/eBwZeSghuHB/m1xCmqwd+fuiQno+zE5qPjj4CQdxQ
	uEUY+j0GimMFQzmoufQfO6CP9sIYaYECUlwzkIvwykBGsTNv/4ZjbYk2
X-Gm-Gg: AYBFou2LQcvCh4s/6btDz3+oe4to8RboXNDJUvzsUn+e8IrrRaWhn5Jho21tvaDMsa0
	E9YsNMTlQuSdeXEjddiCu9gitj4diYcNVPrsdIv7/QTTWf+Alt1t7fN2VhKUgfGw1OUDR3h9LEm
	NZrfVdVX6uajBXcAcAu4iMpFnglhWjPxWWQ7Tbt+wbDb5jr/guEzx1z2ABJqSBuuy4euZnUceUa
	20BHgAcUoNMlatM7riRvOUYacQ4VhQ3sjJuHd8yo2SgIHqtfexMv9nx6CeVdZmyfGgQ5Gh5LBLv
	iOFueKK29JG6N7j4AXLnLQGaawTEYSliAwpJlqdm0OgLBu0oyGcQkEJLnSSfG5oq6cGPB8xnEZJ
	oqLKKUTUdOrnxotBh+k6OzDRrbRPx59hlSTadlScWnwahpj+dA4QHnNO6wCXnqU7jwB8FTZyXAr
	Un0lHSHCT95IdNDktEoznl60d2tGafEJ9Xh+AVwrn/0VXS1orDepr4FexxEp/8zB+C65IMQGwVH
	Xv5MDJSporiyqBfx3qMU+f0PBWqS3ObReqkRnrYMPRv9ZRyVkzj/qT27lrwiGcYRmJYFlxO7rdw
	My0vJQJhQtKJX0pUKPi0zJwck+5ejKbGXg==
X-Received: by 2002:a05:600c:3494:b0:49c:edd8:ba35 with SMTP id 5b1f17b1804b1-49eac46394amr10945995e9.6.1789538724510;
        Tue, 15 Sep 2026 23:05:24 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f24:d900:2d12:4011:929:f698? (p200300ea8f24d9002d1240110929f698.dip0.t-ipconnect.de. [2003:ea:8f24:d900:2d12:4011:929:f698])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83a89258sm52716815e9.2.2026.09.15.23.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 23:05:24 -0700 (PDT)
Message-ID: <2d722b84-a263-400b-ac91-bf37125eb85b@gmail.com>
Date: Wed, 16 Sep 2026 08:05:22 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 net-next] net: phy: factor out legacy PHY fixup support and
 make it always built-in
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

PHY fixup registration is used from platform code in init phase only.
Let's move the PHY fixup code from the modular part of phylib to the
always built-in part of phylib. This allows to annotate the fixup
registration as __init. No caller uses the return code of PHY fixup
registration, therefore change related functions to return void.

phy_needs_fixup() and phy_scan_fixups() wouldn't have to be moved to
the built-in part of phylib. But doing so allows to fully factor out
legacy fixup support into its own source code file, and make struct
phy_fixup and phy_fixup_list strictly private to phy_fixup.c.

phy_scan_fixups() is used after init phase only, then phy_fixup_list
is read-only. So we don't need the mutex when accessing the list.
Also when registering PHY fixups the mutex isn't needed, because
fixup registration is done sequentially from platform init code.
Actually there is only one platform with more than one fixup.

In addition this change lays the foundation for enabling modular
phylib on platforms where the fixup just sets a flag.

Last but not least reflect the change in the documentation,
and add a hint that fixup's are legacy functionality.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- adjust kdoc and reflect the change in the documentation
---
 Documentation/networking/phy.rst  | 17 +++---
 drivers/net/phy/Makefile          |  2 +-
 drivers/net/phy/phy_device.c      | 90 ----------------------------
 drivers/net/phy/phy_fixup.c       | 98 +++++++++++++++++++++++++++++++
 drivers/net/phy/phylib-internal.h |  1 +
 include/linux/phy.h               |  8 +--
 6 files changed, 114 insertions(+), 102 deletions(-)
 create mode 100644 drivers/net/phy/phy_fixup.c

diff --git a/Documentation/networking/phy.rst b/Documentation/networking/phy.rst
index 0170c9d4dc5..d53067ab1a6 100644
--- a/Documentation/networking/phy.rst
+++ b/Documentation/networking/phy.rst
@@ -511,24 +511,27 @@ Board Fixups
 Sometimes the specific interaction between the platform and the PHY requires
 special handling.  For instance, to change where the PHY's clock input is,
 or to add a delay to account for latency issues in the data path.  In order
-to support such contingencies, the PHY Layer allows platform code to register
-fixups to be run when the PHY is brought up (or subsequently reset).
+to support such contingencies, the PHY Layer allows platform init code to
+register fixups to be run when the PHY is brought up (or subsequently reset).
+
+Note: This is legacy functionality and not supposed to be used in new code.
+      Fixup's should be handled in the PHY driver.
 
 When the PHY Layer brings up a PHY it checks to see if there are any fixups
 registered for it, matching based on UID (contained in the PHY device's phy_id
 field) and the bus identifier (contained in phydev->dev.bus_id).  Both must
-match, however two constants, PHY_ANY_ID and PHY_ANY_UID, are provided as
-wildcards for the bus ID and UID, respectively.
+match, however NULL for the bus identifier and 0 for phy_uid_mask can be
+used to disable the respective type of matching.
 
 When a match is found, the PHY layer will invoke the run function associated
 with the fixup.  This function is passed a pointer to the phy_device of
-interest.  It should therefore only operate on that PHY.
+interest. It should therefore only operate on that PHY.
 
 The platform code can register the fixup using one of::
 
- int phy_register_fixup_for_uid(u32 phy_uid, u32 phy_uid_mask,
+ void __init phy_register_fixup_for_uid(u32 phy_uid, u32 phy_uid_mask,
 		int (*run)(struct phy_device *));
- int phy_register_fixup_for_id(const char *phy_id,
+ void __init phy_register_fixup_for_id(const char *phy_id,
 		int (*run)(struct phy_device *));
 
 Standards
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 25c4a3c2429..6c2ee118a12 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -8,7 +8,7 @@ libphy-y			:= phy.o phy-c45.o phy-core.o phy_device.o \
 
 ifdef CONFIG_PHYLIB
 # built-in whenever PHYLIB is built-in or module
-obj-y				+= stubs.o
+obj-y				+= stubs.o phy_fixup.o
 endif
 
 libphy-$(CONFIG_SWPHY)		+= swphy.o
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 41d1b20cde2..5b13a74e2fa 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -49,14 +49,6 @@ MODULE_DESCRIPTION("PHY library");
 MODULE_AUTHOR("Andy Fleming");
 MODULE_LICENSE("GPL");
 
-struct phy_fixup {
-	struct list_head list;
-	char bus_id[MII_BUS_ID_SIZE + 3];
-	u32 phy_uid;
-	u32 phy_uid_mask;
-	int (*run)(struct phy_device *phydev);
-};
-
 static struct phy_driver genphy_c45_driver = {
 	.phy_id         = 0xffffffff,
 	.phy_id_mask    = 0xffffffff,
@@ -237,9 +229,6 @@ static void phy_mdio_device_remove(struct mdio_device *mdiodev)
 
 static struct phy_driver genphy_driver;
 
-static LIST_HEAD(phy_fixup_list);
-static DEFINE_MUTEX(phy_fixup_lock);
-
 static bool phy_drv_wol_enabled(struct phy_device *phydev)
 {
 	struct ethtool_wolinfo wol = { .cmd = ETHTOOL_GWOL };
@@ -427,85 +416,6 @@ static __maybe_unused int mdio_bus_phy_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(mdio_bus_phy_pm_ops, mdio_bus_phy_suspend,
 			 mdio_bus_phy_resume);
 
-/**
- * phy_register_fixup - creates a new phy_fixup and adds it to the list
- * @bus_id: A string which matches phydev->mdio.dev.bus_id (or NULL)
- * @phy_uid: Used to match against phydev->phy_id (the UID of the PHY)
- * @phy_uid_mask: Applied to phydev->phy_id and fixup->phy_uid before
- *	comparison (or 0 to disable id-based matching)
- * @run: The actual code to be run when a matching PHY is found
- */
-static int phy_register_fixup(const char *bus_id, u32 phy_uid, u32 phy_uid_mask,
-			      int (*run)(struct phy_device *))
-{
-	struct phy_fixup *fixup = kzalloc_obj(*fixup);
-
-	if (!fixup)
-		return -ENOMEM;
-
-	if (bus_id)
-		strscpy(fixup->bus_id, bus_id, sizeof(fixup->bus_id));
-	fixup->phy_uid = phy_uid;
-	fixup->phy_uid_mask = phy_uid_mask;
-	fixup->run = run;
-
-	mutex_lock(&phy_fixup_lock);
-	list_add_tail(&fixup->list, &phy_fixup_list);
-	mutex_unlock(&phy_fixup_lock);
-
-	return 0;
-}
-
-/* Registers a fixup to be run on any PHY with the UID in phy_uid */
-int phy_register_fixup_for_uid(u32 phy_uid, u32 phy_uid_mask,
-			       int (*run)(struct phy_device *))
-{
-	return phy_register_fixup(NULL, phy_uid, phy_uid_mask, run);
-}
-EXPORT_SYMBOL(phy_register_fixup_for_uid);
-
-/* Registers a fixup to be run on the PHY with id string bus_id */
-int phy_register_fixup_for_id(const char *bus_id,
-			      int (*run)(struct phy_device *))
-{
-	return phy_register_fixup(bus_id, 0, 0, run);
-}
-EXPORT_SYMBOL(phy_register_fixup_for_id);
-
-static bool phy_needs_fixup(struct phy_device *phydev, struct phy_fixup *fixup)
-{
-	if (!strcmp(fixup->bus_id, phydev_name(phydev)))
-		return true;
-
-	if (fixup->phy_uid_mask &&
-	    phy_id_compare(phydev->phy_id, fixup->phy_uid, fixup->phy_uid_mask))
-		return true;
-
-	return false;
-}
-
-/* Runs any matching fixups for this phydev */
-static int phy_scan_fixups(struct phy_device *phydev)
-{
-	struct phy_fixup *fixup;
-
-	mutex_lock(&phy_fixup_lock);
-	list_for_each_entry(fixup, &phy_fixup_list, list) {
-		if (phy_needs_fixup(phydev, fixup)) {
-			int err = fixup->run(phydev);
-
-			if (err < 0) {
-				mutex_unlock(&phy_fixup_lock);
-				return err;
-			}
-			phydev->has_fixups = true;
-		}
-	}
-	mutex_unlock(&phy_fixup_lock);
-
-	return 0;
-}
-
 /**
  * genphy_match_phy_device - match a PHY device with a PHY driver
  * @phydev: target phy_device struct
diff --git a/drivers/net/phy/phy_fixup.c b/drivers/net/phy/phy_fixup.c
new file mode 100644
index 00000000000..75ed9b142cc
--- /dev/null
+++ b/drivers/net/phy/phy_fixup.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * PHY fixup support
+ */
+
+#include <linux/list.h>
+#include <linux/phy.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include "phylib-internal.h"
+
+static struct list_head phy_fixup_list __ro_after_init =
+	LIST_HEAD_INIT(phy_fixup_list);
+
+struct phy_fixup {
+	struct list_head list;
+	char bus_id[MII_BUS_ID_SIZE + 3];
+	u32 phy_uid;
+	u32 phy_uid_mask;
+	int (*run)(struct phy_device *phydev);
+};
+
+/**
+ * phy_register_fixup - creates a new phy_fixup and adds it to the list
+ * @bus_id: A string which matches phydev->mdio.dev.bus_id (or NULL)
+ * @phy_uid: Used to match against phydev->phy_id (the UID of the PHY)
+ * @phy_uid_mask: Applied to phydev->phy_id and fixup->phy_uid before
+ *	comparison (or 0 to disable id-based matching)
+ * @run: The actual code to be run when a matching PHY is found
+ */
+static void __init phy_register_fixup(const char *bus_id, u32 phy_uid,
+				      u32 phy_uid_mask,
+				      int (*run)(struct phy_device *))
+{
+	struct phy_fixup *fixup = kzalloc_obj(*fixup);
+
+	if (!fixup)
+		return;
+
+	if (bus_id)
+		strscpy(fixup->bus_id, bus_id);
+	fixup->phy_uid = phy_uid;
+	fixup->phy_uid_mask = phy_uid_mask;
+	fixup->run = run;
+
+	list_add_tail(&fixup->list, &phy_fixup_list);
+}
+
+/* Registers a fixup to be run on any PHY with the UID in phy_uid */
+void __init phy_register_fixup_for_uid(u32 phy_uid, u32 phy_uid_mask,
+				       int (*run)(struct phy_device *))
+{
+	phy_register_fixup(NULL, phy_uid, phy_uid_mask, run);
+}
+
+/* Registers a fixup to be run on the PHY with id string bus_id */
+void __init phy_register_fixup_for_id(const char *bus_id,
+				      int (*run)(struct phy_device *))
+{
+	phy_register_fixup(bus_id, 0, 0, run);
+}
+
+static bool phy_needs_fixup(struct phy_device *phydev, struct phy_fixup *fixup)
+{
+	if (!strcmp(fixup->bus_id, phydev_name(phydev)))
+		return true;
+
+	if (fixup->phy_uid_mask &&
+	    phy_id_compare(phydev->phy_id, fixup->phy_uid, fixup->phy_uid_mask))
+		return true;
+
+	return false;
+}
+
+/**
+ * phy_scan_fixups - runs any matching fixups for this phydev
+ * @phydev: the phydev to search and run fixups for
+ * Returns: 0 or an errno
+ */
+int phy_scan_fixups(struct phy_device *phydev)
+{
+	struct phy_fixup *fixup;
+
+	list_for_each_entry(fixup, &phy_fixup_list, list) {
+		if (phy_needs_fixup(phydev, fixup)) {
+			int err = fixup->run(phydev);
+
+			if (err < 0)
+				return err;
+
+			phydev->has_fixups = true;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(phy_scan_fixups);
diff --git a/drivers/net/phy/phylib-internal.h b/drivers/net/phy/phylib-internal.h
index 664ed7faa51..38ee294f3c9 100644
--- a/drivers/net/phy/phylib-internal.h
+++ b/drivers/net/phy/phylib-internal.h
@@ -23,6 +23,7 @@ void of_set_phy_eee_broken(struct phy_device *phydev);
 void of_set_phy_timing_role(struct phy_device *phydev);
 int phy_speed_down_core(struct phy_device *phydev);
 void phy_check_downshift(struct phy_device *phydev);
+int phy_scan_fixups(struct phy_device *phydev);
 
 int mdiobus_register_device(struct mdio_device *mdiodev);
 int mdiobus_unregister_device(struct mdio_device *mdiodev);
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 3d8afe6b7f1..257634a543a 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2440,10 +2440,10 @@ int phy_get_mac_termination(struct phy_device *phydev, struct device *dev,
 void phy_resolve_pause(unsigned long *local_adv, unsigned long *partner_adv,
 		       bool *tx_pause, bool *rx_pause);
 
-int phy_register_fixup_for_id(const char *bus_id,
-			      int (*run)(struct phy_device *));
-int phy_register_fixup_for_uid(u32 phy_uid, u32 phy_uid_mask,
-			       int (*run)(struct phy_device *));
+void __init phy_register_fixup_for_id(const char *bus_id,
+				      int (*run)(struct phy_device *));
+void __init phy_register_fixup_for_uid(u32 phy_uid, u32 phy_uid_mask,
+				       int (*run)(struct phy_device *));
 
 int phy_eee_tx_clock_stop_capable(struct phy_device *phydev);
 int phy_eee_rx_clock_stop(struct phy_device *phydev, bool clk_stop_enable);
-- 
2.55.0

