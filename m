Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7F0877D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Apr 2019 03:03:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbfDPC4a (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 15 Apr 2019 22:56:30 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:43964 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbfDPC42 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Apr 2019 22:56:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=rgEi1FbZ1KQVjPlthAMzWVJDwxWXBrjQesVcsGYz/Q8=; b=VJL6Xe4BOtBov1m8J7Z22GC8ax
        HjQv5APnMglBSQPrCxnXIfVih/ZdZZFnakIQtGA8O30J1+jDCNSn33IjMfWseio5iCTKX6Al4KGmx
        NuiL0kmBJu5nrN/WGgDm7ReID71q4OHbhZpnabn2Pl3wy001xJYq6gj+9sZXssucq8XLtdzmLlwaV
        cGU1DxX9jg6QqQW0YLKT5VK9FvxvFTtKqKGyT6WG1uyHySfkLa5mfoKUEUkLhkJKaQFfzAmisBHo+
        IRCx6+0niJXIifjzn7nPrs3zu/Fu3sLRmgVMNzFlQ7oeRpgkFlNjkgC16mYDVY/6oDJDvteeTbL9F
        oc30U/pA==;
Received: from 177.205.118.176.dynamic.adsl.gvt.net.br ([177.205.118.176] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hGEGp-0007aI-SB; Tue, 16 Apr 2019 02:56:27 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hGEGm-0001l3-Tg; Mon, 15 Apr 2019 23:56:24 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 03/57] docs: aoe: convert text files to ReST
Date:   Mon, 15 Apr 2019 23:55:28 -0300
Message-Id: <d7b673b233444a3563068d4f8ad2a33be730f2cb.1555382110.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1555382110.git.mchehab+samsung@kernel.org>
References: <cover.1555382110.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are only two files within Documentation/aoe dir that are
documentation. The remaining ones are examples and shell
scripts.

Convert the two AoE files to ReST format.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/aoe/aoe.txt  | 63 +++++++++++++++++++++-----------------
 Documentation/aoe/todo.txt |  3 ++
 Documentation/aoe/udev.txt |  2 +-
 3 files changed, 39 insertions(+), 29 deletions(-)

diff --git a/Documentation/aoe/aoe.txt b/Documentation/aoe/aoe.txt
index c71487d399d1..58747ecec71d 100644
--- a/Documentation/aoe/aoe.txt
+++ b/Documentation/aoe/aoe.txt
@@ -1,3 +1,6 @@
+Introduction
+============
+
 ATA over Ethernet is a network protocol that provides simple access to
 block storage on the LAN.
 
@@ -22,7 +25,8 @@ document the use of the driver and are not necessary if you install
 the aoetools.
 
 
-CREATING DEVICE NODES
+Creating Device Nodes
+=====================
 
   Users of udev should find the block device nodes created
   automatically, but to create all the necessary device nodes, use the
@@ -38,7 +42,8 @@ CREATING DEVICE NODES
   confusing when an AoE device is not present the first time the a
   command is run but appears a second later.
 
-USING DEVICE NODES
+Using Device Nodes
+==================
 
   "cat /dev/etherd/err" blocks, waiting for error diagnostic output,
   like any retransmitted packets.
@@ -55,7 +60,7 @@ USING DEVICE NODES
   by sysfs counterparts.  Using the commands in aoetools insulates
   users from these implementation details.
 
-  The block devices are named like this:
+  The block devices are named like this::
 
 	e{shelf}.{slot}
 	e{shelf}.{slot}p{part}
@@ -64,7 +69,8 @@ USING DEVICE NODES
   first shelf (shelf address zero).  That's the whole disk.  The first
   partition on that disk would be "e0.2p1".
 
-USING SYSFS
+Using sysfs
+===========
 
   Each aoe block device in /sys/block has the extra attributes of
   state, mac, and netif.  The state attribute is "up" when the device
@@ -78,29 +84,29 @@ USING SYSFS
 
   There is a script in this directory that formats this information in
   a convenient way.  Users with aoetools should use the aoe-stat
-  command.
+  command::
 
-  root@makki root# sh Documentation/aoe/status.sh 
-     e10.0            eth3              up
-     e10.1            eth3              up
-     e10.2            eth3              up
-     e10.3            eth3              up
-     e10.4            eth3              up
-     e10.5            eth3              up
-     e10.6            eth3              up
-     e10.7            eth3              up
-     e10.8            eth3              up
-     e10.9            eth3              up
-      e4.0            eth1              up
-      e4.1            eth1              up
-      e4.2            eth1              up
-      e4.3            eth1              up
-      e4.4            eth1              up
-      e4.5            eth1              up
-      e4.6            eth1              up
-      e4.7            eth1              up
-      e4.8            eth1              up
-      e4.9            eth1              up
+    root@makki root# sh Documentation/aoe/status.sh
+       e10.0            eth3              up
+       e10.1            eth3              up
+       e10.2            eth3              up
+       e10.3            eth3              up
+       e10.4            eth3              up
+       e10.5            eth3              up
+       e10.6            eth3              up
+       e10.7            eth3              up
+       e10.8            eth3              up
+       e10.9            eth3              up
+        e4.0            eth1              up
+        e4.1            eth1              up
+        e4.2            eth1              up
+        e4.3            eth1              up
+        e4.4            eth1              up
+        e4.5            eth1              up
+        e4.6            eth1              up
+        e4.7            eth1              up
+        e4.8            eth1              up
+        e4.9            eth1              up
 
   Use /sys/module/aoe/parameters/aoe_iflist (or better, the driver
   option discussed below) instead of /dev/etherd/interfaces to limit
@@ -113,12 +119,13 @@ USING SYSFS
   for this purpose.  You can also directly use the
   /dev/etherd/discover special file described above.
 
-DRIVER OPTIONS
+Driver Options
+==============
 
   There is a boot option for the built-in aoe driver and a
   corresponding module parameter, aoe_iflist.  Without this option,
   all network interfaces may be used for ATA over Ethernet.  Here is a
-  usage example for the module parameter.
+  usage example for the module parameter::
 
     modprobe aoe_iflist="eth1 eth3"
 
diff --git a/Documentation/aoe/todo.txt b/Documentation/aoe/todo.txt
index c09dfad4aed8..dea8db5a33e1 100644
--- a/Documentation/aoe/todo.txt
+++ b/Documentation/aoe/todo.txt
@@ -1,3 +1,6 @@
+TODO
+====
+
 There is a potential for deadlock when allocating a struct sk_buff for
 data that needs to be written out to aoe storage.  If the data is
 being written from a dirty page in order to free that page, and if
diff --git a/Documentation/aoe/udev.txt b/Documentation/aoe/udev.txt
index 1f06daf03f5b..54feda5a0772 100644
--- a/Documentation/aoe/udev.txt
+++ b/Documentation/aoe/udev.txt
@@ -11,7 +11,7 @@
 #   udev_rules="/etc/udev/rules.d/"
 #   bash# ls /etc/udev/rules.d/
 #   10-wacom.rules  50-udev.rules
-#   bash# cp /path/to/linux-2.6.xx/Documentation/aoe/udev.txt \
+#   bash# cp /path/to/linux/Documentation/aoe/udev.txt \
 #           /etc/udev/rules.d/60-aoe.rules
 #  
 
-- 
2.20.1

