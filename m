Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 21D877DD32
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 01:11:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755737AbeD0BLE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 26 Apr 2018 21:11:04 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55502 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754728AbeD0BLD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Apr 2018 21:11:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=QUy1AZ6sjkf0c4WyW5RljTPJwaSD/44UBsrF5yZun38=; b=asiRaWBtIdN3yz/BY+rEAClcu
        wDwEASCHZDo5JYoM6dBW1i4O8AksIGccmhoL30oqWKWtAeWNykNEPnbVjYEwTo7tsjoUStGuvwDVj
        VrpB6tHp4W5kb8x5gpgFr0TsrSbVrKgFz0d96EDW9f44fDJJmuyVGl/Z2/o2H8udTqgQ+lFuw5wt3
        N9pR18bPvLT7uiZTQLJZrqyYQkCUyZa5m1SP5AwAH+oaYQduaHSFEg7ucj6eAT608IhBJEAhV1GXG
        KIkVTGiZo/YpQWixtTGzKa1wNbywCuUIvJJWJYBCgf6EUWEBvNsu5ajTLjTcxguV+G6NHbWVBn/oV
        STMgZIgGw==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fBruh-0004Xm-8W; Fri, 27 Apr 2018 01:11:03 +0000
To:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     LKML <linux-kernel@vger.kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] documentation: core-api: rearrange a few kernel-api chapters
 and sections
Message-ID: <f05c8785-e9e1-0a5e-b362-50669b75d80b@infradead.org>
Date:   Thu, 26 Apr 2018 18:11:02 -0700
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

Rearrange some kernel-api chapters and sections to group them
together better.

- move Bit Operations from Basic C Library Functions to Basic
  Kernel Library Functions (now adjacent to Bitmap Operations since
  they are not typical C library functions)

- move Sorting from Math Functions to Basic Kernel Library Functions
  since sort functions are more Basic than Math Functions

- move Text Searching from Math Functions to Basic Kernel Library
  Functions (keep Sorting and Searching close to each other)

- combine CRC and Math functions together into the (newly named)
  CRC and Math Functions chapter

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/core-api/kernel-api.rst |   60 ++++++++++++------------
 1 file changed, 30 insertions(+), 30 deletions(-)

--- linux-next-20180426.orig/Documentation/core-api/kernel-api.rst
+++ linux-next-20180426/Documentation/core-api/kernel-api.rst
@@ -39,17 +39,17 @@ String Manipulation
 .. kernel-doc:: lib/string.c
    :export:
 
+Basic Kernel Library Functions
+==============================
+
+The Linux kernel provides more basic utility functions.
+
 Bit Operations
 --------------
 
 .. kernel-doc:: arch/x86/include/asm/bitops.h
    :internal:
 
-Basic Kernel Library Functions
-==============================
-
-The Linux kernel provides more basic utility functions.
-
 Bitmap Operations
 -----------------
 
@@ -80,6 +80,31 @@ Command-line Parsing
 .. kernel-doc:: lib/cmdline.c
    :export:
 
+Sorting
+-------
+
+.. kernel-doc:: lib/sort.c
+   :export:
+
+.. kernel-doc:: lib/list_sort.c
+   :export:
+
+Text Searching
+--------------
+
+.. kernel-doc:: lib/textsearch.c
+   :doc: ts_intro
+
+.. kernel-doc:: lib/textsearch.c
+   :export:
+
+.. kernel-doc:: include/linux/textsearch.h
+   :functions: textsearch_find textsearch_next \
+               textsearch_get_pattern textsearch_get_pattern_len
+
+CRC and Math Functions in Linux
+===============================
+
 CRC Functions
 -------------
 
@@ -103,9 +128,6 @@ CRC Functions
 .. kernel-doc:: lib/crc-itu-t.c
    :export:
 
-Math Functions in Linux
-=======================
-
 Base 2 log and power Functions
 ------------------------------
 
@@ -127,28 +149,6 @@ Division Functions
 .. kernel-doc:: lib/gcd.c
    :export:
 
-Sorting
--------
-
-.. kernel-doc:: lib/sort.c
-   :export:
-
-.. kernel-doc:: lib/list_sort.c
-   :export:
-
-Text Searching
---------------
-
-.. kernel-doc:: lib/textsearch.c
-   :doc: ts_intro
-
-.. kernel-doc:: lib/textsearch.c
-   :export:
-
-.. kernel-doc:: include/linux/textsearch.h
-   :functions: textsearch_find textsearch_next \
-               textsearch_get_pattern textsearch_get_pattern_len
-
 UUID/GUID
 ---------
 


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
