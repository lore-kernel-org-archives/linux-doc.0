Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BF76E7D089
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Nov 2018 06:47:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387552AbeKFQLD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Nov 2018 11:11:03 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:17402 "EHLO mxhk.zte.com.cn"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387551AbeKFQLD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Nov 2018 11:11:03 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
        by Forcepoint Email with ESMTPS id A22F32AC5F19ED3F0D67;
        Tue,  6 Nov 2018 14:47:18 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
        by mse01.zte.com.cn with ESMTP id wA66lBav044660;
        Tue, 6 Nov 2018 14:47:11 +0800 (GMT-8)
        (envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
          by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
          with ESMTP id 2018110614472470-8886605 ;
          Tue, 6 Nov 2018 14:47:24 +0800 
From:   Peng Hao <peng.hao2@zte.com.cn>
To:     robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, andy@infradead.org,
        dvhart@infradead.org
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        hutao@cn.fujitsu.com, linux-doc@vger.kernel.org,
        Peng Hao <peng.hao2@zte.com.cn>
Subject: [PATCH V8 07/11]  misc/pvpanic : break dependency on ACPI
Date:   Tue, 6 Nov 2018 22:57:18 +0800
Message-Id: <1541516242-98568-7-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1541516242-98568-1-git-send-email-peng.hao2@zte.com.cn>
References: <1541516242-98568-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release 8.5.3FP6|November
 21, 2013) at 2018-11-06 14:47:24,
        Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2018-11-06 14:47:07,
        Serialize complete at 2018-11-06 14:47:07
X-MAIL: mse01.zte.com.cn wA66lBav044660
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pvpanic driver is available for architectures that do not
support ACPI.So break the dependency.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 drivers/misc/Kconfig   |  2 +-
 drivers/misc/pvpanic.c | 23 +++++++++++++++++++++--
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 64c898a..642626a 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -515,7 +515,7 @@ config MISC_RTSX
 
 config PVPANIC
 	tristate "pvpanic device support"
-	depends on ACPI
+	depends on ACPI || OF
 	help
 	  This driver provides support for the pvpanic device.  pvpanic is
 	  a paravirtualized device provided by QEMU; it lets a virtual machine
diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
index a9676b7..83f3187 100644
--- a/drivers/misc/pvpanic.c
+++ b/drivers/misc/pvpanic.c
@@ -57,6 +57,7 @@
 	.priority = 1, /* let this called before broken drm_fb_helper */
 };
 
+#ifdef CONFIG_ACPI
 static int pvpanic_add(struct acpi_device *device);
 static int pvpanic_remove(struct acpi_device *device);
 
@@ -126,6 +127,24 @@ static int pvpanic_remove(struct acpi_device *device)
 	return 0;
 }
 
+static int pvpanic_register_acpi_driver(void)
+{
+	return acpi_bus_register_driver(&pvpanic_driver);
+}
+
+static void pvpanic_unregister_acpi_driver(void)
+{
+	acpi_bus_unregister_driver(&pvpanic_driver);
+}
+#else
+static int pvpanic_register_acpi_driver(void)
+{
+	return -ENODEV;
+}
+
+static void pvpanic_unregister_acpi_driver(void) {}
+#endif
+
 static int pvpanic_mmio_probe(struct platform_device *pdev)
 {
 	struct resource *mem;
@@ -172,7 +191,7 @@ static int __init pvpanic_mmio_init(void)
 	if (acpi_disabled)
 		return platform_driver_register(&pvpanic_mmio_driver);
 	else
-		return acpi_bus_register_driver(&pvpanic_driver);
+		return pvpanic_register_acpi_driver();
 }
 
 static void __exit pvpanic_mmio_exit(void)
@@ -180,7 +199,7 @@ static void __exit pvpanic_mmio_exit(void)
 	if (acpi_disabled)
 		platform_driver_unregister(&pvpanic_mmio_driver);
 	else
-		acpi_bus_unregister_driver(&pvpanic_driver);
+		pvpanic_unregister_acpi_driver();
 }
 
 module_init(pvpanic_mmio_init);
-- 
1.8.3.1

