Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E78C2B9F4
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 20:44:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28F6A61400
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 20:44:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231742AbhFQUqp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Jun 2021 16:46:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbhFQUqp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Jun 2021 16:46:45 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 505FAC061574
        for <linux-doc@vger.kernel.org>; Thu, 17 Jun 2021 13:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=8xywp7LiKcGCaFvvwvOAeZj1J6iQDYcpbrJsJxe4LF4=; b=pBisYjD+W/gukGr/TNGVdFUgdL
        cV651SZgZWQgVFh4IK80PCPCfKnc42/v7cgNVmA6++p0V/dY3De0C8w2m+61WiGMv+f3B7PxhvfRL
        ptHR+L5pe2oyS6R/VYoOuIFTtEl7580h+NKJ/ByYtE7Fd81asY8Kbp0WQdqlLMf/E23QokxXTSBWM
        DCo7E94Crd4F1foBsrhNeGos/xbMp87Vzb1Z3T/lv18NnXYNfuKlq4J3sGRo8kIekzj1QnSyQKTJH
        eNOJUTj+2nwQwuJ26NvCP1oohTilAkeF4CGcqeDo6vKoDSowFkRNNW9FLP2nyQjhJebl9XD/475k4
        Y2EB2XDg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1ltyro-009YpW-NU; Thu, 17 Jun 2021 20:44:08 +0000
From:   "Matthew Wilcox (Oracle)" <willy@infradead.org>
To:     linux-mm@kvack.org, linux-doc@vger.kernel.org
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [PATCH 2/3] mm/doc: Add some more missing kernel-doc
Date:   Thu, 17 Jun 2021 21:43:24 +0100
Message-Id: <20210617204325.2278730-2-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617204325.2278730-1-willy@infradead.org>
References: <20210617204325.2278730-1-willy@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

All these functions have kernel-doc that's not being included.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 Documentation/core-api/mm-api.rst | 4 ++++
 Documentation/vm/transhuge.rst    | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
index a42f9baddfbf..e46f01c4b200 100644
--- a/Documentation/core-api/mm-api.rst
+++ b/Documentation/core-api/mm-api.rst
@@ -66,6 +66,8 @@ File Mapping and Page Cache
 
 .. kernel-doc:: mm/page-writeback.c
    :export:
+.. kernel-doc:: mm/backing-dev.c
+   :export:
 
 .. kernel-doc:: mm/truncate.c
    :export:
@@ -93,6 +95,8 @@ More Memory Management Functions
 
 .. kernel-doc:: mm/page_alloc.c
 .. kernel-doc:: mm/mempolicy.c
+.. kernel-doc:: mm/vmscan.c
+   :export:
 .. kernel-doc:: include/linux/mm_types.h
    :internal:
 .. kernel-doc:: include/linux/mm.h
diff --git a/Documentation/vm/transhuge.rst b/Documentation/vm/transhuge.rst
index 216db1d67d04..550dea445528 100644
--- a/Documentation/vm/transhuge.rst
+++ b/Documentation/vm/transhuge.rst
@@ -185,3 +185,9 @@ a THP crosses a VMA boundary.
 The function deferred_split_huge_page() is used to queue a page for splitting.
 The splitting itself will happen when we get memory pressure via shrinker
 interface.
+
+Functions and structures
+========================
+
+.. kernel-doc:: mm/huge_memory.c
+.. kernel-doc:: mm/khugepaged.c
-- 
2.30.2

