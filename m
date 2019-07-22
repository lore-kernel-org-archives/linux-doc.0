Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 164237DE70
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Jul 2019 11:08:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729868AbfGVLIJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Jul 2019 07:08:09 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:35644 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729842AbfGVLIB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Jul 2019 07:08:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=aR7AC9Cq6LkXN2cwUE0qDw5EbAH8P80ZhWXW4rf7/6E=; b=RfLraHyCWzEv4pBYzLgN9hvBmT
        Ilf1u6/sz9rpDsOygYXZcV/kRW6aje8c86+KFo3R8OMxKnBT3ReS5V2zusgRm2KdJhDsDRryD2Pel
        vRQWxjA79uBf3KXh9VdtqXUcvmbwOLtc03EmLBzplfcjYtfSfYr8fCD2p2VG5tpP5NZN906Fk3N0B
        ed9qBV3VVZvVY+gFZs2LWO3m2T4f3sQ7sS86+plHrhBtK0SvfbeRGUZUEcIRGx7Zj9ePtJM6T8sEc
        snz6+yOiQzYM1fpxD5msdwJWbff0QLwp340TQMzY9ALrSWNYeN0Xk04KBWtBxV5uak3jOjPl+eonC
        Z4ud8A6A==;
Received: from 177.157.124.3.dynamic.adsl.gvt.net.br ([177.157.124.3] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hpWAi-00025E-3i; Mon, 22 Jul 2019 11:08:00 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hpWAa-00040v-63; Mon, 22 Jul 2019 08:07:52 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>,
        linux-doc@vger.kernel.org
Subject: [PATCH 07/22] docs: admin-guide: add auxdisplay files to it after conversion to ReST
Date:   Mon, 22 Jul 2019 08:07:34 -0300
Message-Id: <ed8bb8935bb67d294b5e3bee7647dbdd72c5b608.1563792334.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563792333.git.mchehab+samsung@kernel.org>
References: <cover.1563792333.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Those two files describe userspace-faced information. While part of
it might fit on uAPI, it sounds to me that the admin guide is the
best place for them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 .../admin-guide/auxdisplay/cfag12864b.rst     |  98 ++++++++++++++++
 .../admin-guide/auxdisplay/index.rst          |  16 +++
 .../admin-guide/auxdisplay/ks0108.rst         |  50 +++++++++
 Documentation/admin-guide/index.rst           |   1 +
 Documentation/auxdisplay/cfag12864b           | 105 ------------------
 Documentation/auxdisplay/ks0108               |  55 ---------
 MAINTAINERS                                   |   2 +-
 drivers/auxdisplay/Kconfig                    |   2 +-
 8 files changed, 167 insertions(+), 162 deletions(-)
 create mode 100644 Documentation/admin-guide/auxdisplay/cfag12864b.rst
 create mode 100644 Documentation/admin-guide/auxdisplay/index.rst
 create mode 100644 Documentation/admin-guide/auxdisplay/ks0108.rst
 delete mode 100644 Documentation/auxdisplay/cfag12864b
 delete mode 100644 Documentation/auxdisplay/ks0108

diff --git a/Documentation/admin-guide/auxdisplay/cfag12864b.rst b/Documentation/admin-guide/auxdisplay/cfag12864b.rst
new file mode 100644
index 000000000000..18c2865bd322
--- /dev/null
+++ b/Documentation/admin-guide/auxdisplay/cfag12864b.rst
@@ -0,0 +1,98 @@
+===================================
+cfag12864b LCD Driver Documentation
+===================================
+
+:License:		GPLv2
+:Author & Maintainer:	Miguel Ojeda Sandonis
+:Date:			2006-10-27
+
+
+
+.. INDEX
+
+	1. DRIVER INFORMATION
+	2. DEVICE INFORMATION
+	3. WIRING
+	4. USERSPACE PROGRAMMING
+
+1. Driver Information
+---------------------
+
+This driver supports a cfag12864b LCD.
+
+
+2. Device Information
+---------------------
+
+:Manufacturer:	Crystalfontz
+:Device Name:	Crystalfontz 12864b LCD Series
+:Device Code:	cfag12864b
+:Webpage:	http://www.crystalfontz.com
+:Device Webpage: http://www.crystalfontz.com/products/12864b/
+:Type:		LCD (Liquid Crystal Display)
+:Width:		128
+:Height:	64
+:Colors:	2 (B/N)
+:Controller:	ks0108
+:Controllers:	2
+:Pages:		8 each controller
+:Addresses:	64 each page
+:Data size:	1 byte each address
+:Memory size:	2 * 8 * 64 * 1 = 1024 bytes = 1 Kbyte
+
+
+3. Wiring
+---------
+
+The cfag12864b LCD Series don't have official wiring.
+
+The common wiring is done to the parallel port as shown::
+
+  Parallel Port                          cfag12864b
+
+    Name Pin#                            Pin# Name
+
+  Strobe ( 1)------------------------------(17) Enable
+  Data 0 ( 2)------------------------------( 4) Data 0
+  Data 1 ( 3)------------------------------( 5) Data 1
+  Data 2 ( 4)------------------------------( 6) Data 2
+  Data 3 ( 5)------------------------------( 7) Data 3
+  Data 4 ( 6)------------------------------( 8) Data 4
+  Data 5 ( 7)------------------------------( 9) Data 5
+  Data 6 ( 8)------------------------------(10) Data 6
+  Data 7 ( 9)------------------------------(11) Data 7
+         (10)                      [+5v]---( 1) Vdd
+         (11)                      [GND]---( 2) Ground
+         (12)                      [+5v]---(14) Reset
+         (13)                      [GND]---(15) Read / Write
+    Line (14)------------------------------(13) Controller Select 1
+         (15)
+    Init (16)------------------------------(12) Controller Select 2
+  Select (17)------------------------------(16) Data / Instruction
+  Ground (18)---[GND]              [+5v]---(19) LED +
+  Ground (19)---[GND]
+  Ground (20)---[GND]              E    A             Values:
+  Ground (21)---[GND]       [GND]---[P1]---(18) Vee    - R = Resistor = 22 ohm
+  Ground (22)---[GND]                |                 - P1 = Preset = 10 Kohm
+  Ground (23)---[GND]       ----   S ------( 3) V0     - P2 = Preset = 1 Kohm
+  Ground (24)---[GND]       |  |
+  Ground (25)---[GND] [GND]---[P2]---[R]---(20) LED -
+
+
+4. Userspace Programming
+------------------------
+
+The cfag12864bfb describes a framebuffer device (/dev/fbX).
+
+It has a size of 1024 bytes = 1 Kbyte.
+Each bit represents one pixel. If the bit is high, the pixel will
+turn on. If the pixel is low, the pixel will turn off.
+
+You can use the framebuffer as a file: fopen, fwrite, fclose...
+Although the LCD won't get updated until the next refresh time arrives.
+
+Also, you can mmap the framebuffer: open & mmap, munmap & close...
+which is the best option for most uses.
+
+Check samples/auxdisplay/cfag12864b-example.c
+for a real working userspace complete program with usage examples.
diff --git a/Documentation/admin-guide/auxdisplay/index.rst b/Documentation/admin-guide/auxdisplay/index.rst
new file mode 100644
index 000000000000..e466f0595248
--- /dev/null
+++ b/Documentation/admin-guide/auxdisplay/index.rst
@@ -0,0 +1,16 @@
+=========================
+Auxiliary Display Support
+=========================
+
+.. toctree::
+    :maxdepth: 1
+
+    ks0108.rst
+    cfag12864b.rst
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/admin-guide/auxdisplay/ks0108.rst b/Documentation/admin-guide/auxdisplay/ks0108.rst
new file mode 100644
index 000000000000..c0b7faf73136
--- /dev/null
+++ b/Documentation/admin-guide/auxdisplay/ks0108.rst
@@ -0,0 +1,50 @@
+==========================================
+ks0108 LCD Controller Driver Documentation
+==========================================
+
+:License:		GPLv2
+:Author & Maintainer:	Miguel Ojeda Sandonis
+:Date:			2006-10-27
+
+
+
+.. INDEX
+
+	1. DRIVER INFORMATION
+	2. DEVICE INFORMATION
+	3. WIRING
+
+
+1. Driver Information
+---------------------
+
+This driver supports the ks0108 LCD controller.
+
+
+2. Device Information
+---------------------
+
+:Manufacturer:	Samsung
+:Device Name:	KS0108 LCD Controller
+:Device Code:	ks0108
+:Webpage:	-
+:Device Webpage: -
+:Type:		LCD Controller (Liquid Crystal Display Controller)
+:Width:		64
+:Height:	64
+:Colors:	2 (B/N)
+:Pages:		8
+:Addresses:	64 each page
+:Data size:	1 byte each address
+:Memory size:	8 * 64 * 1 = 512 bytes
+
+
+3. Wiring
+---------
+
+The driver supports data parallel port wiring.
+
+If you aren't building LCD related hardware, you should check
+your LCD specific wiring information in the same folder.
+
+For example, check Documentation/admin-guide/auxdisplay/cfag12864b.rst
diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index 457fd1112b65..3f8f7d564552 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -101,6 +101,7 @@ configure specific aspects of kernel behavior to your liking.
    iostats
    kernel-per-CPU-kthreads
    laptops/index
+   auxdisplay/index
    lcd-panel-cgram
    ldm
    lockup-watchdogs
diff --git a/Documentation/auxdisplay/cfag12864b b/Documentation/auxdisplay/cfag12864b
deleted file mode 100644
index 12fd51b8de75..000000000000
--- a/Documentation/auxdisplay/cfag12864b
+++ /dev/null
@@ -1,105 +0,0 @@
-	===================================
-	cfag12864b LCD Driver Documentation
-	===================================
-
-License:		GPLv2
-Author & Maintainer:	Miguel Ojeda Sandonis
-Date:			2006-10-27
-
-
-
---------
-0. INDEX
---------
-
-	1. DRIVER INFORMATION
-	2. DEVICE INFORMATION
-	3. WIRING
-	4. USERSPACE PROGRAMMING
-
-
----------------------
-1. DRIVER INFORMATION
----------------------
-
-This driver supports a cfag12864b LCD.
-
-
----------------------
-2. DEVICE INFORMATION
----------------------
-
-Manufacturer:	Crystalfontz
-Device Name:	Crystalfontz 12864b LCD Series
-Device Code:	cfag12864b
-Webpage:	http://www.crystalfontz.com
-Device Webpage:	http://www.crystalfontz.com/products/12864b/
-Type:		LCD (Liquid Crystal Display)
-Width:		128
-Height:		64
-Colors:		2 (B/N)
-Controller:	ks0108
-Controllers:	2
-Pages:		8 each controller
-Addresses:	64 each page
-Data size:	1 byte each address
-Memory size:	2 * 8 * 64 * 1 = 1024 bytes = 1 Kbyte
-
-
----------
-3. WIRING
----------
-
-The cfag12864b LCD Series don't have official wiring.
-
-The common wiring is done to the parallel port as shown:
-
-Parallel Port                          cfag12864b
-
-  Name Pin#                            Pin# Name
-
-Strobe ( 1)------------------------------(17) Enable
-Data 0 ( 2)------------------------------( 4) Data 0
-Data 1 ( 3)------------------------------( 5) Data 1
-Data 2 ( 4)------------------------------( 6) Data 2
-Data 3 ( 5)------------------------------( 7) Data 3
-Data 4 ( 6)------------------------------( 8) Data 4
-Data 5 ( 7)------------------------------( 9) Data 5
-Data 6 ( 8)------------------------------(10) Data 6
-Data 7 ( 9)------------------------------(11) Data 7
-       (10)                      [+5v]---( 1) Vdd
-       (11)                      [GND]---( 2) Ground
-       (12)                      [+5v]---(14) Reset
-       (13)                      [GND]---(15) Read / Write
-  Line (14)------------------------------(13) Controller Select 1
-       (15)
-  Init (16)------------------------------(12) Controller Select 2
-Select (17)------------------------------(16) Data / Instruction
-Ground (18)---[GND]              [+5v]---(19) LED +
-Ground (19)---[GND]
-Ground (20)---[GND]              E    A             Values:
-Ground (21)---[GND]       [GND]---[P1]---(18) Vee    - R = Resistor = 22 ohm
-Ground (22)---[GND]                |                 - P1 = Preset = 10 Kohm
-Ground (23)---[GND]       ----   S ------( 3) V0     - P2 = Preset = 1 Kohm
-Ground (24)---[GND]       |  |
-Ground (25)---[GND] [GND]---[P2]---[R]---(20) LED -
-
-
-------------------------
-4. USERSPACE PROGRAMMING
-------------------------
-
-The cfag12864bfb describes a framebuffer device (/dev/fbX).
-
-It has a size of 1024 bytes = 1 Kbyte.
-Each bit represents one pixel. If the bit is high, the pixel will
-turn on. If the pixel is low, the pixel will turn off.
-
-You can use the framebuffer as a file: fopen, fwrite, fclose...
-Although the LCD won't get updated until the next refresh time arrives.
-
-Also, you can mmap the framebuffer: open & mmap, munmap & close...
-which is the best option for most uses.
-
-Check samples/auxdisplay/cfag12864b-example.c
-for a real working userspace complete program with usage examples.
diff --git a/Documentation/auxdisplay/ks0108 b/Documentation/auxdisplay/ks0108
deleted file mode 100644
index 8ddda0c8ceef..000000000000
--- a/Documentation/auxdisplay/ks0108
+++ /dev/null
@@ -1,55 +0,0 @@
-	==========================================
-	ks0108 LCD Controller Driver Documentation
-	==========================================
-
-License:		GPLv2
-Author & Maintainer:	Miguel Ojeda Sandonis
-Date:			2006-10-27
-
-
-
---------
-0. INDEX
---------
-
-	1. DRIVER INFORMATION
-	2. DEVICE INFORMATION
-	3. WIRING
-
-
----------------------
-1. DRIVER INFORMATION
----------------------
-
-This driver supports the ks0108 LCD controller.
-
-
----------------------
-2. DEVICE INFORMATION
----------------------
-
-Manufacturer:	Samsung
-Device Name:	KS0108 LCD Controller
-Device Code:	ks0108
-Webpage:	-
-Device Webpage:	-
-Type:		LCD Controller (Liquid Crystal Display Controller)
-Width:		64
-Height:		64
-Colors:		2 (B/N)
-Pages:		8
-Addresses:	64 each page
-Data size:	1 byte each address
-Memory size:	8 * 64 * 1 = 512 bytes
-
-
----------
-3. WIRING
----------
-
-The driver supports data parallel port wiring.
-
-If you aren't building LCD related hardware, you should check
-your LCD specific wiring information in the same folder.
-
-For example, check Documentation/auxdisplay/cfag12864b.
diff --git a/MAINTAINERS b/MAINTAINERS
index fd2af50e66b5..4cd39259fcdc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8991,7 +8991,7 @@ F:	kernel/kprobes.c
 KS0108 LCD CONTROLLER DRIVER
 M:	Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
 S:	Maintained
-F:	Documentation/auxdisplay/ks0108
+F:	Documentation/admin-guide/auxdisplay/ks0108.rst
 F:	drivers/auxdisplay/ks0108.c
 F:	include/linux/ks0108.h
 
diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
index dd61fdd400f0..6b476e663e80 100644
--- a/drivers/auxdisplay/Kconfig
+++ b/drivers/auxdisplay/Kconfig
@@ -97,7 +97,7 @@ config CFAG12864B
 	  say Y. You also need the ks0108 LCD Controller driver.
 
 	  For help about how to wire your LCD to the parallel port,
-	  check Documentation/auxdisplay/cfag12864b
+	  check Documentation/admin-guide/auxdisplay/cfag12864b.rst
 
 	  Depends on the x86 arch and the framebuffer support.
 
-- 
2.21.0

