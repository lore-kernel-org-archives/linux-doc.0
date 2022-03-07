Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7186CC433FE
	for <linux-doc@archiver.kernel.org>; Mon,  7 Mar 2022 11:25:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241466AbiCGL0p (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Mar 2022 06:26:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241748AbiCGL0b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Mar 2022 06:26:31 -0500
X-Greylist: delayed 1759 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Mar 2022 03:00:22 PST
Received: from mx3.b2b2c.ca (mx3.b2b2c.ca [66.158.128.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A56E02606
        for <linux-doc@vger.kernel.org>; Mon,  7 Mar 2022 03:00:22 -0800 (PST)
Received: from dermoth.dyndns.org (dsl-205-236-230-251.b2b2c.ca [205.236.230.251])
        by mx3.b2b2c.ca (8.15.2/8.15.2) with ESMTPS id 227AUxKM944324
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Mon, 7 Mar 2022 05:31:00 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 mx3.b2b2c.ca 227AUxKM944324
Received: from dermoth by dermoth.dyndns.org with local (Exim 4.94.2)
        (envelope-from <tguyot@gmail.com>)
        id 1nRAdm-000BVu-E1; Mon, 07 Mar 2022 05:30:58 -0500
From:   Thomas Guyot-Sionnest <tguyot@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     Thomas Guyot-Sionnest <tguyot@gmail.com>
Subject: [PATCH] hiddev: Clarify minor device numbering
Date:   Mon,  7 Mar 2022 05:30:48 -0500
Message-Id: <20220307103048.44159-1-tguyot@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

USB hiddev minor device numbering can be dynamic, in which case the
minor be any number from 0 to 255. This is defined in drivers/hid/usbhid/hiddev.c.

Signed-off-by: Thomas Guyot-Sionnest <tguyot@gmail.com>
---
 Documentation/hid/hiddev.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/hid/hiddev.rst b/Documentation/hid/hiddev.rst
index caebc6266603..9647210cdd34 100644
--- a/Documentation/hid/hiddev.rst
+++ b/Documentation/hid/hiddev.rst
@@ -54,6 +54,13 @@ you need the following commands::
 	mknod /dev/usb/hiddev14 c 180 110
 	mknod /dev/usb/hiddev15 c 180 111
 
+When using CONFIG_USB_DYNAMIC_MINORS you should let udev create these
+devices automatically. They will have a minor ranging from 0 to 255.
+You can find the actual major:minor in the /sys tree under the usbmisc
+class. You can list them with::
+
+  grep -H . /sys/class/usbmisc/hiddev*/dev
+
 So you point your hiddev compliant user-space program at the correct
 interface for your device, and it all just works.
 
-- 
2.30.2

