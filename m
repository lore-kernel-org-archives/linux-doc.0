Return-Path: <SRS0=Succ=4U=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C18BC3F2DB
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 13:59:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 13D4D20863
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 13:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583243971;
	bh=H6v8m9+eTb8TJjP7/IX9nuNDh4mqr7FOvBYBGbPbrrI=;
	h=From:Cc:Subject:Date:In-Reply-To:References:To:List-ID:From;
	b=psx6LTsnBg4vrbWyIF8QrqdlSNWop5gpxKgHHFcpyS3ymv1b0LuzOInfhhwW5Fdz6
	 nh1Yvn84WBD2yjBSAmL7jYth2SstSa1eSGXxIxtZT6ORuTrdRLqLc6qhSRLKR5Y5j+
	 JNkgh5jC3W/AIJ5DTiSEV5W6dfTXj4HhTMSZcqEA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727753AbgCCN7a (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Mar 2020 08:59:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:45324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725796AbgCCN73 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 3 Mar 2020 08:59:29 -0500
Received: from mail.kernel.org (x2f7fa80.dyn.telefonica.de [2.247.250.128])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 650E820863;
        Tue,  3 Mar 2020 13:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583243968;
        bh=H6v8m9+eTb8TJjP7/IX9nuNDh4mqr7FOvBYBGbPbrrI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T9BOHnvFhi4fZDAdhFwv7rk4B9Ag3O/eNXQiB6y+AGzYmNlbcKC2YeOXNLO7k4Pnf
         LEibqQMZDDM+uHyvJZU17Ni+Ntzs+wWP8OykN74YpxVvQ8MaMMIP/43m2FZRNTLKbu
         Ty2vgjy1+MjM5fBLowcGWLH/7hfk7ApssxiY7tV8=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1j9850-001YdU-Cf; Tue, 03 Mar 2020 14:59:26 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v3 09/18] docs: misc-devices/c2port.txt: convert to ReST format
Date:   Tue,  3 Mar 2020 14:59:16 +0100
Message-Id: <e16e19ff9332ac58311abe743688f83508d5cd0e.1583243826.git.mchehab+huawei@kernel.org>
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

