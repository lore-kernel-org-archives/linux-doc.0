Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030A0E7D0BB
	for <linux-doc@archiver.kernel.org>; Fri, 22 Sep 2023 02:18:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbjIVCSs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Sep 2023 22:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbjIVCSr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Sep 2023 22:18:47 -0400
X-Greylist: delayed 1082 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 21 Sep 2023 19:18:41 PDT
Received: from wxsgout04.xfusion.com (wxsgout04.xfusion.com [36.139.87.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05109192
        for <linux-doc@vger.kernel.org>; Thu, 21 Sep 2023 19:18:40 -0700 (PDT)
Received: from wuxshcsitd00600.xfusion.com (unknown [10.32.133.213])
        by wxsgout04.xfusion.com (SkyGuard) with ESMTPS id 4RsFmG5H0QzB0R6m;
        Fri, 22 Sep 2023 09:58:22 +0800 (CST)
Received: from localhost (10.82.147.3) by wuxshcsitd00600.xfusion.com
 (10.32.133.213) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 22 Sep
 2023 10:00:21 +0800
Date:   Fri, 22 Sep 2023 10:00:21 +0800
From:   Wang Jinchao <wangjinchao@xfusion.com>
To:     David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, <linux-mm@kvack.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     xulei <stone.xulei@xfusion.com>
Subject: [PATCH] memory-hotplug.rst: fix wrong /sys/device/ path
Message-ID: <ZQz1NUATBMOb3RT+@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-Originating-IP: [10.82.147.3]
X-ClientProxiedBy: wuxshcsitd00600.xfusion.com (10.32.133.213) To
 wuxshcsitd00600.xfusion.com (10.32.133.213)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Actually, it should be /sys/devices/

Signed-off-by: Wang Jinchao <wangjinchao@xfusion.com>
---
 Documentation/admin-guide/mm/memory-hotplug.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
index cfe034cf1e87..01595965734a 100644
--- a/Documentation/admin-guide/mm/memory-hotplug.rst
+++ b/Documentation/admin-guide/mm/memory-hotplug.rst
@@ -250,15 +250,15 @@ Observing the State of Memory Blocks
 The state (online/offline/going-offline) of a memory block can be observed
 either via::
 
-	% cat /sys/device/system/memory/memoryXXX/state
+	% cat /sys/devices/system/memory/memoryXXX/state
 
 Or alternatively (1/0) via::
 
-	% cat /sys/device/system/memory/memoryXXX/online
+	% cat /sys/devices/system/memory/memoryXXX/online
 
 For an online memory block, the managing zone can be observed via::
 
-	% cat /sys/device/system/memory/memoryXXX/valid_zones
+	% cat /sys/devices/system/memory/memoryXXX/valid_zones
 
 Configuring Memory Hot(Un)Plug
 ==============================
@@ -326,7 +326,7 @@ however, a memory block might span memory holes. A memory block spanning memory
 holes cannot be offlined.
 
 For example, assume 1 GiB memory block size. A device for a memory starting at
-0x100000000 is ``/sys/device/system/memory/memory4``::
+0x100000000 is ``/sys/devices/system/memory/memory4``::
 
 	(0x100000000 / 1Gib = 4)
 
-- 
2.40.0

