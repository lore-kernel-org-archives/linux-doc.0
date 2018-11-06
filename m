Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C1FC97D9ED
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Nov 2018 06:48:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387731AbeKFQLs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Nov 2018 11:11:48 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:47592 "EHLO mxct.zte.com.cn"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387813AbeKFQLm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Nov 2018 11:11:42 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
        by Forcepoint Email with ESMTPS id B91446C2DC1251479BC5;
        Tue,  6 Nov 2018 14:47:17 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
        by mse01.zte.com.cn with ESMTP id wA66lAEJ044659;
        Tue, 6 Nov 2018 14:47:10 +0800 (GMT-8)
        (envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
          by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
          with ESMTP id 2018110614472345-8886603 ;
          Tue, 6 Nov 2018 14:47:23 +0800 
From:   Peng Hao <peng.hao2@zte.com.cn>
To:     robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, andy@infradead.org,
        dvhart@infradead.org
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        hutao@cn.fujitsu.com, linux-doc@vger.kernel.org,
        Peng Hao <peng.hao2@zte.com.cn>
Subject: [PATCH V8 06/11]  misc/pvpanic : grouping ACPI related stuff
Date:   Tue, 6 Nov 2018 22:57:17 +0800
Message-Id: <1541516242-98568-6-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1541516242-98568-1-git-send-email-peng.hao2@zte.com.cn>
References: <1541516242-98568-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release 8.5.3FP6|November
 21, 2013) at 2018-11-06 14:47:23,
        Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2018-11-06 14:47:05,
        Serialize complete at 2018-11-06 14:47:05
X-MAIL: mse01.zte.com.cn wA66lAEJ044659
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Grouping ACPI related stuff and make preparation to break
the ACPI dependency w/o any functional change.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 drivers/misc/pvpanic.c | 43 +++++++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
index c7f62bd..a9676b7 100644
--- a/drivers/misc/pvpanic.c
+++ b/drivers/misc/pvpanic.c
@@ -32,32 +32,12 @@
 
 static void __iomem *base;
 
+#define PVPANIC_PANICKED        (1 << 0)
+
 MODULE_AUTHOR("Hu Tao <hutao@cn.fujitsu.com>");
 MODULE_DESCRIPTION("pvpanic device driver");
 MODULE_LICENSE("GPL");
 
-static int pvpanic_add(struct acpi_device *device);
-static int pvpanic_remove(struct acpi_device *device);
-
-static const struct acpi_device_id pvpanic_device_ids[] = {
-	{ "QEMU0001", 0 },
-	{ "", 0 },
-};
-MODULE_DEVICE_TABLE(acpi, pvpanic_device_ids);
-
-#define PVPANIC_PANICKED	(1 << 0)
-
-static struct acpi_driver pvpanic_driver = {
-	.name =		"pvpanic",
-	.class =	"QEMU",
-	.ids =		pvpanic_device_ids,
-	.ops =		{
-				.add =		pvpanic_add,
-				.remove =	pvpanic_remove,
-			},
-	.owner =	THIS_MODULE,
-};
-
 static void
 pvpanic_send_event(unsigned int event)
 {
@@ -77,6 +57,25 @@
 	.priority = 1, /* let this called before broken drm_fb_helper */
 };
 
+static int pvpanic_add(struct acpi_device *device);
+static int pvpanic_remove(struct acpi_device *device);
+
+static const struct acpi_device_id pvpanic_device_ids[] = {
+	{ "QEMU0001", 0 },
+	{ "", 0 },
+};
+MODULE_DEVICE_TABLE(acpi, pvpanic_device_ids);
+
+static struct acpi_driver pvpanic_driver = {
+	.name =		"pvpanic",
+	.class =	"QEMU",
+	.ids =		pvpanic_device_ids,
+	.ops =		{
+				.add =		pvpanic_add,
+				.remove =	pvpanic_remove,
+			},
+	.owner =	THIS_MODULE,
+};
 
 static acpi_status
 pvpanic_walk_resources(struct acpi_resource *res, void *context)
-- 
1.8.3.1

