Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC44BC433DB
	for <linux-doc@archiver.kernel.org>; Mon, 22 Mar 2021 19:52:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5B9F6196C
	for <linux-doc@archiver.kernel.org>; Mon, 22 Mar 2021 19:52:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231723AbhCVTvf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Mar 2021 15:51:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231815AbhCVTvV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Mar 2021 15:51:21 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6808CC061574
        for <linux-doc@vger.kernel.org>; Mon, 22 Mar 2021 12:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=SLdwPC5W3o3Gr0ZVa4JQql9yn28VAnXye3gRNuw619g=; b=Vx8d4CcY/4oayG0fn7gXhPPH2v
        L+4k+RNSys1IkokVhJlKguahw1F8hVsP/9RGbYseY9pzQkuTUbYRNVYSvFgXPXfq4+UrtP7OItYE0
        heJXSP2/VodK2SXpzDqklh4PQtzI/9EviJa/5MANT1joF8Tj7ryN3C/ipWp3/gEh2z/dKVkTGOUlG
        /K4MedKwrPPhJbrP5LJwOeSSMvHqz0Dfc/MomCkVCfHCLPvpxQRzpibxj3CD4C3tcCUv06Y4s3vrt
        GSuKo96DpxIwJIJiLiP59k3iEnCzQblEcxKnN6jw1fATrV+joMbsR9PJ+cGJMq0U/U1Y7ONqJqiQw
        t1wJwxtA==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lOQZM-008zfX-16; Mon, 22 Mar 2021 19:50:39 +0000
From:   "Matthew Wilcox (Oracle)" <willy@infradead.org>
To:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-doc@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 1/4] mm/doc: Fix fault_flag_allow_retry_first kerneldoc
Date:   Mon, 22 Mar 2021 19:50:19 +0000
Message-Id: <20210322195022.2143603-1-willy@infradead.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

make htmldocs reports:

./include/linux/mm.h:496: warning: Function parameter or member 'flags' not described in 'fault_flag_allow_retry_first'

Add a description.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/mm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index cb1e191da319..9c149e945bf9 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -482,6 +482,7 @@ extern pgprot_t protection_map[16];
 
 /**
  * fault_flag_allow_retry_first - check ALLOW_RETRY the first time
+ * @flags: Fault flags.
  *
  * This is mostly used for places where we want to try to avoid taking
  * the mmap_lock for too long a time when waiting for another condition
-- 
2.30.2

