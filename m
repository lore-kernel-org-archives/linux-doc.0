Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 603217DE78
	for <lwn-linux-doc@archive.lwn.net>; Sun,  6 May 2018 18:50:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751789AbeEFSuh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 6 May 2018 14:50:37 -0400
Received: from merlin.infradead.org ([205.233.59.134]:43232 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751771AbeEFSug (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 6 May 2018 14:50:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=owF4dZH0KGCKt3x+8k+Y4CqdMqn89fSwy63TcGrt464=; b=HjiyLkFjKSKaXCogVXuNXXoRtS
        xq6up81iQvtVTJq1kuVCsiNl5rmKPNHP2nFXHwOYgn7K55mm3vO8FN06Ey0vQZfQ7lGsZZB7oJdif
        JKWcTSU08Zf144ddi/pfTtjIsGe5ZG4BZJd9NeppvYLHbRdJWZeh8/EVHzjwgkA4JF3Ip3uN8Xcup
        W6yuAfzkvc95Op/PzPbaQaHFuwxxbVQAJKHl8ubRjvXtmbHQ6FnLK9t6DojWm46c8AYU2cev+6nNe
        H8LlooyMlDrLuEhoR3jKPWXc/nGjQZuaGRJetpAZNlUjT8p2ZoGCe5QaIgy2t8ZuTWgAfmINq9GAX
        SzFZ5OsQ==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fFOjv-0006gr-Of; Sun, 06 May 2018 18:50:32 +0000
To:     "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        axboe <axboe@kernel.dk>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Cai Zhiyong <caizhiyong@huawei.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] Documentation: block: cmdline-partition.txt fixes and
 additions
Message-ID: <dba389fc-2745-34b1-e33e-fc83f53eaf42@infradead.org>
Date:   Sun, 6 May 2018 11:50:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Make the description of the kernel command line option "blkdevparts"
a bit more flowing and readable.

Fix a few typos.
Add the optional <size> and <offset> suffixes.
Note that size can be "-" to indicate all of the remaining space.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Cai Zhiyong <caizhiyong@huawei.com>
---
Should the "ro" and "lk" flags options be described?

 Documentation/block/cmdline-partition.txt |   21 +++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

--- linux-next-20180504.orig/Documentation/block/cmdline-partition.txt
+++ linux-next-20180504/Documentation/block/cmdline-partition.txt
@@ -1,7 +1,9 @@
 Embedded device command line partition parsing
 =====================================================================
 
-Support for reading the block device partition table from the command line.
+The "blkdevparts" command line option adds support for reading the
+block device partition table from the kernel command line.
+
 It is typically used for fixed block (eMMC) embedded devices.
 It has no MBR, so saves storage space. Bootloader can be easily accessed
 by absolute address of data on the block device.
@@ -14,22 +16,27 @@ blkdevparts=<blkdev-def>[;<blkdev-def>]
     <partdef> := <size>[@<offset>](part-name)
 
 <blkdev-id>
-    block device disk name, embedded device used fixed block device,
-    it's disk name also fixed. such as: mmcblk0, mmcblk1, mmcblk0boot0.
+    block device disk name. Embedded device uses fixed block device.
+    Its disk name is also fixed, such as: mmcblk0, mmcblk1, mmcblk0boot0.
 
 <size>
     partition size, in bytes, such as: 512, 1m, 1G.
+    size may contain an optional suffix of (upper or lower case):
+      K, M, G, T, P, E.
+    "-" is used to denote all remaining space.
 
 <offset>
     partition start address, in bytes.
+    offset may contain an optional suffix of (upper or lower case):
+      K, M, G, T, P, E.
 
 (part-name)
-    partition name, kernel send uevent with "PARTNAME". application can create
-    a link to block device partition with the name "PARTNAME".
-    user space application can access partition by partition name.
+    partition name. Kernel sends uevent with "PARTNAME". Application can
+    create a link to block device partition with the name "PARTNAME".
+    User space application can access partition by partition name.
 
 Example:
-    eMMC disk name is "mmcblk0" and "mmcblk0boot0"
+    eMMC disk names are "mmcblk0" and "mmcblk0boot0".
 
   bootargs:
     'blkdevparts=mmcblk0:1G(data0),1G(data1),-;mmcblk0boot0:1m(boot),-(kernel)'

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
