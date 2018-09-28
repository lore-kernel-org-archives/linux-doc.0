Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AA7447D08D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 28 Sep 2018 03:24:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbeI1JqU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 28 Sep 2018 05:46:20 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:13139 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726060AbeI1JqU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 28 Sep 2018 05:46:20 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 52E5471CDDA82;
        Fri, 28 Sep 2018 11:24:42 +0800 (CST)
Received: from dessert.huawei.com (10.69.192.158) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.399.0; Fri, 28 Sep 2018 11:24:36 +0800
From:   Zeng Tao <prime.zeng@hisilicon.com>
To:     <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
        <mathias.nyman@linux.intel.com>, <drinkcat@chromium.org>,
        <felipe.balbi@linux.intel.com>, <drake@endlessm.com>,
        <ravisadineni@chromium.org>, <joe@perches.com>
CC:     <prime.zeng@hisilicon.com>, Jonathan Corbet <corbet@lwn.net>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        "Thymo van Beers" <thymovanbeers@gmail.com>,
        Jiri Kosina <jkosina@suse.cz>,
        "Konrad Rzeszutek Wilk" <konrad.wilk@oracle.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        David Rientjes <rientjes@google.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
Subject: [PATCH] usb: hub: try old enumeration scheme first for high speed devices
Date:   Fri, 28 Sep 2018 19:27:52 +0800
Message-ID: <1538134077-14542-1-git-send-email-prime.zeng@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.158]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The new scheme is required just to support legacy low and full-speed
devices. For high speed devices, it will slower the enumeration speed.
So in this patch we try the "old" enumeration scheme first for high speed
devices, and this is what Windows does since Windows 8.

Signed-off-by: Zeng Tao <prime.zeng@hisilicon.com>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
Reviewed-by: Roger Quadros <rogerq@ti.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 ++-
 drivers/usb/core/hub.c                          | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 92eb1f4..151c527 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4610,7 +4610,8 @@
 
 	usbcore.old_scheme_first=
 			[USB] Start with the old device initialization
-			scheme (default 0 = off).
+			scheme,  applies only to low and full-speed devices
+			 (default 0 = off).
 
 	usbcore.usbfs_memory_mb=
 			[USB] Memory limit (in MB) for buffers allocated by
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 462ce49..fb4e6bb 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2660,11 +2660,13 @@ static bool use_new_scheme(struct usb_device *udev, int retry,
 {
 	int old_scheme_first_port =
 		port_dev->quirks & USB_PORT_QUIRK_OLD_SCHEME;
+	int quick_enumeration = (udev->speed == USB_SPEED_HIGH);
 
 	if (udev->speed >= USB_SPEED_SUPER)
 		return false;
 
-	return USE_NEW_SCHEME(retry, old_scheme_first_port || old_scheme_first);
+	return USE_NEW_SCHEME(retry, old_scheme_first_port || old_scheme_first
+			      || quick_enumeration);
 }
 
 /* Is a USB 3.0 port in the Inactive or Compliance Mode state?
-- 
2.7.4

