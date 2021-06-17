Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B68C49361
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 20:44:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1EF4610A7
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 20:44:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbhFQUqZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Jun 2021 16:46:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbhFQUqZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Jun 2021 16:46:25 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B707C061574
        for <linux-doc@vger.kernel.org>; Thu, 17 Jun 2021 13:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=TGQuTGgAWX1MM2s4JV1XEEtRQArGGvuBOcpKDMQ5/Nc=; b=BYHggXlPKzcsmbzFerS/z59nzR
        Z744Xj99f9e4UCQq4DebaUN3nuLpq90UoaRa6XyvIhI9OTqbKsLln7Xm68ajNapaAyc7TgWE9ar99
        Cv1s7xYsF6wmkkENy8sB2y4v6JZ8RnWrE8Ps36IEOwqbjktViDf1J3E7sVvdQnqa9++yN7czhMFgP
        h1h9Caq9YBM+PYBtJhtr+xR49S13YlXfHGNa1VQ6wLH9IU2fJ506ESkJ7E0hnCbrDQCgJrlorQDXm
        s8crUJ/V8OjSs+AzK8c+vJ28IIuEVEtzGxd11aIeyh3mePYaO0HWnHicuJbsdXwuqXaPl3NVqGhef
        QwBbimgQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1ltyrK-009Yoa-52; Thu, 17 Jun 2021 20:43:47 +0000
From:   "Matthew Wilcox (Oracle)" <willy@infradead.org>
To:     linux-mm@kvack.org, linux-doc@vger.kernel.org
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [PATCH 1/3] mm/doc: Include compressed memory kernel-doc
Date:   Thu, 17 Jun 2021 21:43:23 +0100
Message-Id: <20210617204325.2278730-1-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

People have gone to a lot of trouble to write all this documentation;
include it as part of the htmldocs.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 Documentation/vm/z3fold.rst   | 5 +++++
 Documentation/vm/zsmalloc.rst | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/Documentation/vm/z3fold.rst b/Documentation/vm/z3fold.rst
index 224e3c61d686..1e1fd3c46290 100644
--- a/Documentation/vm/z3fold.rst
+++ b/Documentation/vm/z3fold.rst
@@ -28,3 +28,8 @@ handle which encodes actual location of the allocated object.
 Keeping effective compression ratio close to zsmalloc's, z3fold doesn't
 depend on MMU enabled and provides more predictable reclaim behavior
 which makes it a better fit for small and response-critical systems.
+
+Functions and structures
+========================
+
+.. kernel-doc:: mm/z3fold.c
diff --git a/Documentation/vm/zsmalloc.rst b/Documentation/vm/zsmalloc.rst
index 6e79893d6132..32bda5f31e6b 100644
--- a/Documentation/vm/zsmalloc.rst
+++ b/Documentation/vm/zsmalloc.rst
@@ -80,3 +80,10 @@ Similarly, we assign zspage to:
 * ZS_ALMOST_FULL  when n > N / f
 * ZS_EMPTY        when n == 0
 * ZS_FULL         when n == N
+
+Functions and structures
+========================
+
+.. kernel-doc:: mm/zsmalloc.c
+.. kernel-doc:: mm/zbud.c
+.. kernel-doc:: mm/zpool.c
-- 
2.30.2

