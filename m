Return-Path: <SRS0=3gwW=AS=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EADC433E0
	for <linux-doc@archiver.kernel.org>; Tue,  7 Jul 2020 18:49:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF956206E2
	for <linux-doc@archiver.kernel.org>; Tue,  7 Jul 2020 18:49:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="g9AQaVgV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728699AbgGGStl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Jul 2020 14:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728149AbgGGStl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Jul 2020 14:49:41 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42768C061755
        for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2020 11:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=D4x4jPiKX+Iyobv6Y8ZU8/VPYUmykRCMO46lJLvlQr4=; b=g9AQaVgVShJ5M0RHWtRm1z59YW
        p38aLOulbDJq4qcWdc1rxkjqJHW59ciqF/LN2s9l/0Zr1Hhl4f7L3XDP+ooBvig473FEYspcdTK7+
        Gap2GZPtQ/iof2aXCUdOrm8a2Irqga8zNcgSRWObEi2Cg5QFY3qF1XWbLaToprFRY3OGYAIFwx0FP
        5kF2dJ8nglJ7Owg5Gz/eUQoCUvJKN3VtQ3WQ5s0nU93g1CprxFN9rRGXpqWYrO+6I/WM75ElhPRfy
        3TbhhZxAPuzU6yjxowczBPZQg9+00FP6eyfBbhUjOyerlFGdowMlbDV2ai/9r/I/hXMv5qZygirBW
        0Ia3OOcw==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jsses-0006kg-F3; Tue, 07 Jul 2020 18:49:35 +0000
To:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu,
        codalist@coda.cs.cmu.edu
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] Documentation: coda: annotate duplicated words
Message-ID: <d7c2d274-de28-193f-5a98-9e3e16c6c9d5@infradead.org>
Date:   Tue, 7 Jul 2020 11:49:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

At first glance it appears that the coda.rst file contains doubled
words "name name" in two places. Turns out it is just confusing
(at least to me), so try to make it clear that the second 'name'
is just the name of a struct field/member.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Jan Harkes <jaharkes@cs.cmu.edu>
Cc: coda@cs.cmu.edu
Cc: codalist@coda.cs.cmu.edu
---
 Documentation/filesystems/coda.rst |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-5.8-rc3.orig/Documentation/filesystems/coda.rst
+++ linux-5.8-rc3/Documentation/filesystems/coda.rst
@@ -524,7 +524,7 @@ kernel support.
 
   Description
     This call is made to determine the ViceFid and filetype of
-    a directory entry.  The directory entry requested carries name name
+    a directory entry.  The directory entry requested carries name 'name'
     and Venus will search the directory identified by cfs_lookup_in.VFid.
     The result may indicate that the name does not exist, or that
     difficulty was encountered in finding it (e.g. due to disconnection).
@@ -886,7 +886,7 @@ kernel support.
 	none
 
   Description
-    Remove the directory with name name from the directory
+    Remove the directory with name 'name' from the directory
     identified by VFid.
 
   .. Note:: The attributes of the parent directory should be returned since

