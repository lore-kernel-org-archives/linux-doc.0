Return-Path: <SRS0=SFNS=4G=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BFE3C34026
	for <linux-doc@archiver.kernel.org>; Tue, 18 Feb 2020 09:10:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A5F224649
	for <linux-doc@archiver.kernel.org>; Tue, 18 Feb 2020 09:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582017035;
	bh=H6v8m9+eTb8TJjP7/IX9nuNDh4mqr7FOvBYBGbPbrrI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=uwp5TMYFRjct67z/1pg5vVrewzhiZpECNW2XCbRTkOo1gZD3P+ceIroeBOi7uUvd7
	 gT7fFtihcABDan7EgaWzM3zQA1BrXZy+RfjZsbOcS3J3HfsXVkO+dOXvpErq75SjPI
	 509Cj0rL652gu3J15u8EPKkirpO+rZmy50tAAZ+U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgBRJKe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Feb 2020 04:10:34 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:35174 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbgBRJKe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Feb 2020 04:10:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=CdqmLOZ5sQ/Aflxvzy0izWi/tvqp/in3SnUYEGpwbcw=; b=GQTK0tfVKYqBydcyzx4tuedINU
        sLt6G5M349wSwoKo359zKoG0jTDuodwOtf0uEdagPSD3aB5YxsNFefDQTToqZilMk9oFxfWHCXI8S
        o3D1xrrtrnRUeqBQGGzqivds0H4CpU+8O0f0UdoxMmtN007ccjLEeA1UgKf1pFq4I12n0ho/gywa2
        +KKJC7VuZPIYpniO53GELz4cpeejga/JwmR85E87lK29F+fNRbBUm8dXksF55kIUSO6YKBDgZBbpy
        omEMXGkBVwWLU6F5Z1yAyMxkIH9n5fDGdtVe+9KxR8F/9yJNfyJ375F3Vu//0u2IeezgkC5qEUerh
        n6x3eAEA==;
Received: from tmo-109-126.customers.d1-online.com ([80.187.109.126] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j3ytm-00046s-59; Tue, 18 Feb 2020 09:10:34 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1j3j8W-000fpH-24; Mon, 17 Feb 2020 17:20:44 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 09/24] docs: misc-devices/c2port.txt: convert to ReST format
Date:   Mon, 17 Feb 2020 17:20:27 +0100
Message-Id: <d9837c807f6d3f2a861ceaeef3803c3f62a6aac3.1581956285.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581956285.git.mchehab+huawei@kernel.org>
References: <cover.1581956285.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

- Use copyright symbol;
- use title markups;
- adjust indentation;
- mark literal blocks as such.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../misc-devices/{c2port.txt => c2port.rst}   | 58 ++++++++++---------
 Documentation/misc-devices/index.rst          |  1 +
 2 files changed, 32 insertions(+), 27 deletions(-)
 rename Documentation/misc-devices/{c2port.txt => c2port.rst} (59%)

diff --git a/Documentation/misc-devices/c2port.txt b/Documentation/misc-devices/c2port.rst
similarity index 59%
rename from Documentation/misc-devices/c2port.txt
rename to Documentation/misc-devices/c2port.rst
index ea7344465610..258e1c1d43c7 100644
--- a/Documentation/misc-devices/c2port.txt
+++ b/Documentation/misc-devices/c2port.rst
@@ -1,7 +1,11 @@
-			C2 port support
-			---------------
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: <isonum.txt>
 
-(C) Copyright 2007 Rodolfo Giometti <giometti@enneenne.com>
+===============
+C2 port support
+===============
+
+|copy| Copyright 2007 Rodolfo Giometti <giometti@enneenne.com>
 
 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
@@ -32,10 +36,10 @@ The C2 Interface main references are at (http://www.silabs.com)
 Silicon Laboratories site], see:
 
 - AN127: FLASH Programming via the C2 Interface at
-http://www.silabs.com/Support Documents/TechnicalDocs/an127.pdf 
+  http://www.silabs.com/Support Documents/TechnicalDocs/an127.pdf
 
 - C2 Specification at
-http://www.silabs.com/pages/DownloadDoc.aspx?FILEURL=Support%20Documents/TechnicalDocs/an127.pdf&src=SearchResults
+  http://www.silabs.com/pages/DownloadDoc.aspx?FILEURL=Support%20Documents/TechnicalDocs/an127.pdf&src=SearchResults
 
 however it implements a two wire serial communication protocol (bit
 banging) designed to enable in-system programming, debugging, and
@@ -47,44 +51,44 @@ Using the driver
 ----------------
 
 Once the driver is loaded you can use sysfs support to get C2port's
-info or read/write in-system flash.
+info or read/write in-system flash::
 
-# ls /sys/class/c2port/c2port0/
-access            flash_block_size  flash_erase       rev_id
-dev_id            flash_blocks_num  flash_size        subsystem/
-flash_access      flash_data        reset             uevent
+  # ls /sys/class/c2port/c2port0/
+  access            flash_block_size  flash_erase       rev_id
+  dev_id            flash_blocks_num  flash_size        subsystem/
+  flash_access      flash_data        reset             uevent
 
 Initially the C2port access is disabled since you hardware may have
 such lines multiplexed with other devices so, to get access to the
-C2port, you need the command:
+C2port, you need the command::
 
-# echo 1 > /sys/class/c2port/c2port0/access
+  # echo 1 > /sys/class/c2port/c2port0/access
 
 after that you should read the device ID and revision ID of the
-connected micro controller:
+connected micro controller::
 
-# cat /sys/class/c2port/c2port0/dev_id
-8
-# cat /sys/class/c2port/c2port0/rev_id
-1
+  # cat /sys/class/c2port/c2port0/dev_id
+  8
+  # cat /sys/class/c2port/c2port0/rev_id
+  1
 
 However, for security reasons, the in-system flash access in not
-enabled yet, to do so you need the command:
+enabled yet, to do so you need the command::
 
-# echo 1 > /sys/class/c2port/c2port0/flash_access
+  # echo 1 > /sys/class/c2port/c2port0/flash_access
 
-After that you can read the whole flash:
+After that you can read the whole flash::
 
-# cat /sys/class/c2port/c2port0/flash_data > image
+  # cat /sys/class/c2port/c2port0/flash_data > image
 
-erase it:
+erase it::
 
-# echo 1 > /sys/class/c2port/c2port0/flash_erase
+  # echo 1 > /sys/class/c2port/c2port0/flash_erase
 
-and write it:
+and write it::
 
-# cat image > /sys/class/c2port/c2port0/flash_data
+  # cat image > /sys/class/c2port/c2port0/flash_data
 
-after writing you have to reset the device to execute the new code:
+after writing you have to reset the device to execute the new code::
 
-# echo 1 > /sys/class/c2port/c2port0/reset
+  # echo 1 > /sys/class/c2port/c2port0/reset
diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index 04f5dab2384c..c2e880d78734 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -16,6 +16,7 @@ fit into other categories.
 
    ad525x_dpot
    eeprom
+   c2port
    ibmvmc
    ics932s401
    isl29003
-- 
2.24.1

