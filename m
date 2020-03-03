Return-Path: <SRS0=Succ=4U=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FA0C3F2CD
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 13:59:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D45BE2086A
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 13:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583243975;
	bh=iReCS8VV7m2KO4it67sP5mC0Qvg3ldjIIFpp+0zettc=;
	h=From:Cc:Subject:Date:In-Reply-To:References:To:List-ID:From;
	b=g/mKd0d72/G8mR9Pjo/PdC1iLeRRQ1hGlYv/IorVNRMbVKRWUqoFHW1KWquuF8Ljz
	 bzBiB8kZW9Mv7/LPr3r4y+PeKq2c9lnpKmT4gWec0oFyh9rmqQgk3NnszZkF4XZklY
	 V2QY6hQXK6PoDUd1w6kyLc6TCB5Z5JK96erf45wA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729361AbgCCN7f (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Mar 2020 08:59:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:45726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729359AbgCCN7e (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 3 Mar 2020 08:59:34 -0500
Received: from mail.kernel.org (ip-109-40-2-133.web.vodafone.de [109.40.2.133])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A7A30215A4;
        Tue,  3 Mar 2020 13:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583243973;
        bh=iReCS8VV7m2KO4it67sP5mC0Qvg3ldjIIFpp+0zettc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=1iG2U87qbceZjjxR8JVs7TDUNDW+62TWPxE/CvlKePinA8yrtKQESxw7CSKATcANs
         MYEZBwPv3ezfTkoO2zuALsv96iEQpK6Vonw+kwZ1bbtmN0l/tOVpl+P3f49C0rMN8p
         I63V1a4M/koi4uBQUsRUHPNIpC4swkpvQpfSNdMc=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1j9850-001YdM-AY; Tue, 03 Mar 2020 14:59:26 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        linux-doc@vger.kernel.org
Subject: [PATCH v3 07/18] docs: misc-devices/pci-endpoint-test.txt: convert to ReST
Date:   Tue,  3 Mar 2020 14:59:14 +0100
Message-Id: <833d2ac346ee5efe11d2ba609f189e021489ad77.1583243826.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583243826.git.mchehab+huawei@kernel.org>
References: <cover.1583243826.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

- use title markups;
- mark literal blocks.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../{ad525x_dpot.txt => ad525x_dpot.rst}      | 24 +++++++++----------
 Documentation/misc-devices/index.rst          |  1 +
 drivers/misc/Kconfig                          |  2 +-
 drivers/misc/ad525x_dpot.c                    |  2 +-
 4 files changed, 15 insertions(+), 14 deletions(-)
 rename Documentation/misc-devices/{ad525x_dpot.txt => ad525x_dpot.rst} (85%)

diff --git a/Documentation/misc-devices/ad525x_dpot.txt b/Documentation/misc-devices/ad525x_dpot.rst
similarity index 85%
rename from Documentation/misc-devices/ad525x_dpot.txt
rename to Documentation/misc-devices/ad525x_dpot.rst
index 0c9413b1cbf3..6483ec254520 100644
--- a/Documentation/misc-devices/ad525x_dpot.txt
+++ b/Documentation/misc-devices/ad525x_dpot.rst
@@ -1,6 +1,8 @@
----------------------------------
-  AD525x Digital Potentiometers
----------------------------------
+.. SPDX-License-Identifier: GPL-2.0
+
+=============================
+AD525x Digital Potentiometers
+=============================
 
 The ad525x_dpot driver exports a simple sysfs interface.  This allows you to
 work with the immediate resistance settings as well as update the saved startup
@@ -8,9 +10,8 @@ settings.  Access to the factory programmed tolerance is also provided, but
 interpretation of this settings is required by the end application according to
 the specific part in use.
 
----------
-  Files
----------
+Files
+=====
 
 Each dpot device will have a set of eeprom, rdac, and tolerance files.  How
 many depends on the actual part you have, as will the range of allowed values.
@@ -24,23 +25,22 @@ and may vary greatly on a part-by-part basis.  For exact interpretation of
 this field, please consult the datasheet for your part.  This is presented
 as a hex file for easier parsing.
 
------------
-  Example
------------
+Example
+=======
 
 Locate the device in your sysfs tree.  This is probably easiest by going into
-the common i2c directory and locating the device by the i2c slave address.
+the common i2c directory and locating the device by the i2c slave address::
 
 	# ls /sys/bus/i2c/devices/
 	0-0022  0-0027  0-002f
 
 So assuming the device in question is on the first i2c bus and has the slave
-address of 0x2f, we descend (unrelated sysfs entries have been trimmed).
+address of 0x2f, we descend (unrelated sysfs entries have been trimmed)::
 
 	# ls /sys/bus/i2c/devices/0-002f/
 	eeprom0 rdac0 tolerance0
 
-You can use simple reads/writes to access these files:
+You can use simple reads/writes to access these files::
 
 	# cd /sys/bus/i2c/devices/0-002f/
 
diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index 2d454b413aef..005547c1ad5d 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -14,6 +14,7 @@ fit into other categories.
 .. toctree::
    :maxdepth: 2
 
+   ad525x_dpot
    eeprom
    ibmvmc
    ics932s401
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 99e151475d8f..9388743d78e3 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -24,7 +24,7 @@ config AD525X_DPOT
 	  AD5271, AD5272, AD5274
 	  digital potentiometer chips.
 
-	  See Documentation/misc-devices/ad525x_dpot.txt for the
+	  See Documentation/misc-devices/ad525x_dpot.rst for the
 	  userspace interface.
 
 	  This driver can also be built as a module.  If so, the module
diff --git a/drivers/misc/ad525x_dpot.c b/drivers/misc/ad525x_dpot.c
index ccce3226a571..6f164522b028 100644
--- a/drivers/misc/ad525x_dpot.c
+++ b/drivers/misc/ad525x_dpot.c
@@ -58,7 +58,7 @@
  * AD5272		1		1024		20, 50, 100 (50-TP)
  * AD5274		1		256		20, 50, 100 (50-TP)
  *
- * See Documentation/misc-devices/ad525x_dpot.txt for more info.
+ * See Documentation/misc-devices/ad525x_dpot.rst for more info.
  *
  * derived from ad5258.c
  * Copyright (c) 2009 Cyber Switching, Inc.
-- 
2.24.1

