Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A0B867D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Apr 2019 13:32:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727367AbfDVN2V (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Apr 2019 09:28:21 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:37768 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727556AbfDVN2V (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Apr 2019 09:28:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Xgp9K2E3/AiwjL0mYh03usUsFh3eZrw9uB7Ke6y66R4=; b=ty50b5WhFYK5lxoDK8yw2FuQph
        bRbJzKFNTV1vGKjVtSWwz72XAwBsUVBGZy9ysMzm37Afw7XBfQPCaDH2WJKYnQ5Ere8WqYb2YeBZl
        WqFB2yhx6V3sNof8+vFAXJNpsm9AIGhZDUP/iVfp48j7eNysS7tVbeNvDHhwea9RF8nuy6CTh0uQ/
        XoC3eDJHG29swduw2W6D5B2O3mhzJ6YOL6DU1DImAegxPQTEaqqiO+2D0OoIY+n6aTxyjJPGXrRjW
        IhovJDUNXi8VqSroBuJiEMRgqt6T1xvnLzHBl7O6YZL3Fh/8vvpytKGGsygsqEqgTHThwUToluuei
        WMpfHoSQ==;
Received: from 179.176.125.229.dynamic.adsl.gvt.net.br ([179.176.125.229] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hIYzb-0005Ht-WB; Mon, 22 Apr 2019 13:28:20 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hIYzT-0005mq-Gk; Mon, 22 Apr 2019 10:28:11 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Milo Kim <milo.kim@ti.com>
Subject: [PATCH v2 42/79] docs: lp855x-driver.txt: convert to ReST and move to kernel-api
Date:   Mon, 22 Apr 2019 10:27:31 -0300
Message-Id: <a774a888eeec42df4446b7a8e30787e91e5d9392.1555938376.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1555938375.git.mchehab+samsung@kernel.org>
References: <cover.1555938375.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This small file seems to be an attempt to start documenting
backlight drivers.

It contains descriptions of the controls for the driver
with could sound as an somewhat user-faced description, but
it's main focus is to describe, instead, the data that should
be passed via platform data and some driver-specific stuff.

While this is not part of the driver-api book, mark it as
:orphan:, in order to avoid build warnings.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/backlight/lp855x-driver.rst | 83 +++++++++++++++++++++++
 Documentation/backlight/lp855x-driver.txt | 66 ------------------
 MAINTAINERS                               |  2 +-
 3 files changed, 84 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/backlight/lp855x-driver.rst
 delete mode 100644 Documentation/backlight/lp855x-driver.txt

diff --git a/Documentation/backlight/lp855x-driver.rst b/Documentation/backlight/lp855x-driver.rst
new file mode 100644
index 000000000000..62b7ed847a77
--- /dev/null
+++ b/Documentation/backlight/lp855x-driver.rst
@@ -0,0 +1,83 @@
+:orphan:
+
+====================
+Kernel driver lp855x
+====================
+
+Backlight driver for LP855x ICs
+
+Supported chips:
+
+	Texas Instruments LP8550, LP8551, LP8552, LP8553, LP8555, LP8556 and
+	LP8557
+
+Author: Milo(Woogyom) Kim <milo.kim@ti.com>
+
+Description
+-----------
+
+* Brightness control
+
+  Brightness can be controlled by the pwm input or the i2c command.
+  The lp855x driver supports both cases.
+
+* Device attributes
+
+  1) bl_ctl_mode
+
+  Backlight control mode.
+
+  Value: pwm based or register based
+
+  2) chip_id
+
+  The lp855x chip id.
+
+  Value: lp8550/lp8551/lp8552/lp8553/lp8555/lp8556/lp8557
+
+Platform data for lp855x
+------------------------
+
+For supporting platform specific data, the lp855x platform data can be used.
+
+* name:
+	Backlight driver name. If it is not defined, default name is set.
+* device_control:
+	Value of DEVICE CONTROL register.
+* initial_brightness:
+	Initial value of backlight brightness.
+* period_ns:
+	Platform specific PWM period value. unit is nano.
+	Only valid when brightness is pwm input mode.
+* size_program:
+	Total size of lp855x_rom_data.
+* rom_data:
+	List of new eeprom/eprom registers.
+
+Examples
+========
+
+1) lp8552 platform data: i2c register mode with new eeprom data::
+
+    #define EEPROM_A5_ADDR	0xA5
+    #define EEPROM_A5_VAL	0x4f	/* EN_VSYNC=0 */
+
+    static struct lp855x_rom_data lp8552_eeprom_arr[] = {
+	{EEPROM_A5_ADDR, EEPROM_A5_VAL},
+    };
+
+    static struct lp855x_platform_data lp8552_pdata = {
+	.name = "lcd-bl",
+	.device_control = I2C_CONFIG(LP8552),
+	.initial_brightness = INITIAL_BRT,
+	.size_program = ARRAY_SIZE(lp8552_eeprom_arr),
+	.rom_data = lp8552_eeprom_arr,
+    };
+
+2) lp8556 platform data: pwm input mode with default rom data::
+
+    static struct lp855x_platform_data lp8556_pdata = {
+	.device_control = PWM_CONFIG(LP8556),
+	.initial_brightness = INITIAL_BRT,
+	.period_ns = 1000000,
+    };
diff --git a/Documentation/backlight/lp855x-driver.txt b/Documentation/backlight/lp855x-driver.txt
deleted file mode 100644
index 01bce243d3d7..000000000000
--- a/Documentation/backlight/lp855x-driver.txt
+++ /dev/null
@@ -1,66 +0,0 @@
-Kernel driver lp855x
-====================
-
-Backlight driver for LP855x ICs
-
-Supported chips:
-	Texas Instruments LP8550, LP8551, LP8552, LP8553, LP8555, LP8556 and
-	LP8557
-
-Author: Milo(Woogyom) Kim <milo.kim@ti.com>
-
-Description
------------
-
-* Brightness control
-
-Brightness can be controlled by the pwm input or the i2c command.
-The lp855x driver supports both cases.
-
-* Device attributes
-
-1) bl_ctl_mode
-Backlight control mode.
-Value : pwm based or register based
-
-2) chip_id
-The lp855x chip id.
-Value : lp8550/lp8551/lp8552/lp8553/lp8555/lp8556/lp8557
-
-Platform data for lp855x
-------------------------
-
-For supporting platform specific data, the lp855x platform data can be used.
-
-* name : Backlight driver name. If it is not defined, default name is set.
-* device_control : Value of DEVICE CONTROL register.
-* initial_brightness : Initial value of backlight brightness.
-* period_ns : Platform specific PWM period value. unit is nano.
-	     Only valid when brightness is pwm input mode.
-* size_program : Total size of lp855x_rom_data.
-* rom_data : List of new eeprom/eprom registers.
-
-example 1) lp8552 platform data : i2c register mode with new eeprom data
-
-#define EEPROM_A5_ADDR	0xA5
-#define EEPROM_A5_VAL	0x4f	/* EN_VSYNC=0 */
-
-static struct lp855x_rom_data lp8552_eeprom_arr[] = {
-	{EEPROM_A5_ADDR, EEPROM_A5_VAL},
-};
-
-static struct lp855x_platform_data lp8552_pdata = {
-	.name = "lcd-bl",
-	.device_control = I2C_CONFIG(LP8552),
-	.initial_brightness = INITIAL_BRT,
-	.size_program = ARRAY_SIZE(lp8552_eeprom_arr),
-	.rom_data = lp8552_eeprom_arr,
-};
-
-example 2) lp8556 platform data : pwm input mode with default rom data
-
-static struct lp855x_platform_data lp8556_pdata = {
-	.device_control = PWM_CONFIG(LP8556),
-	.initial_brightness = INITIAL_BRT,
-	.period_ns = 1000000,
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index c40b6a876f2d..f67d86aad5f0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15616,7 +15616,7 @@ F:	sound/soc/codecs/isabelle*
 TI LP855x BACKLIGHT DRIVER
 M:	Milo Kim <milo.kim@ti.com>
 S:	Maintained
-F:	Documentation/backlight/lp855x-driver.txt
+F:	Documentation/backlight/lp855x-driver.rst
 F:	drivers/video/backlight/lp855x_bl.c
 F:	include/linux/platform_data/lp855x.h
 
-- 
2.20.1

