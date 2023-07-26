Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A05EC001E0
	for <linux-doc@archiver.kernel.org>; Wed, 26 Jul 2023 08:24:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233185AbjGZIYQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Jul 2023 04:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233223AbjGZIXF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Jul 2023 04:23:05 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11EC57297
        for <linux-doc@vger.kernel.org>; Wed, 26 Jul 2023 01:10:35 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-267fc19280bso471285a91.1
        for <linux-doc@vger.kernel.org>; Wed, 26 Jul 2023 01:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690359035; x=1690963835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYZiuBqx6ckWFl98anzbTzEwZ+z/345ZUTz3W5AilLA=;
        b=UY37TDKu0twvwszgVhYceWMnSiyklSFwgsOVGywjtmrkLJSXFOYwHm0cFLDDibc+Sl
         +1VrunZVuLNYwXFEBJceFr/7cl/UxJ701yJbZmlFmHYaho6pTuZIdVh8kohzGqcox2X/
         G/9/XrffPAYdh6AMJtIBZLDgcWQHQgF+7I+/jXOXF4gZsOmJ2EzpCo899MIPIqRyjIiP
         tBX/VyS7r4sbEogmJzWTzn/+sREeVGT8Bo+KzycwKdiq633va22OBvw2p+4WStXY6yXA
         Dq0qJbqciYrp/oNwDyzcp9LvnNAVegjxOI8T0ucLR/8q2ebzgfcWV3JK4fIhAIhQI8u4
         kIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690359035; x=1690963835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYZiuBqx6ckWFl98anzbTzEwZ+z/345ZUTz3W5AilLA=;
        b=MJH/1I/Rgy8nHiCpS8E2094pk7YNgxBqKYo/q2ziC/uLf2Io8eSLV0hbNVdeVIORjC
         owEDMU++nljm/Hj8S3ddkrvVFzJ7ifeoncPyQIS3/w8zYdI/NK2j5rborQv7BGXRWMsZ
         +da6f4zA1qwq+yoGc2yga9vTlRLdfKas+pY/idlCOHRiwMdq1avl70zkn0NVhTkLl4if
         6BcrEKzRuu0ULvk4892FnDRso39nPYBi2SRt/bIwBG8FSfTB7e0Vdur3KQ7a53y6/rOl
         meRHrd37mVDjm2WcRBam8pwZU0AAJSvvSNIPpqd0Py5RogbToKmsy8+JxpI8c/LaWz+j
         FW+g==
X-Gm-Message-State: ABy/qLa/JR6neB2lPZbVRjmxr5v4SHPB3GA47sUllf5EE4kPG3AoCCfi
        pbvwKlMLZFIuIMn8JFP0p3Kjfw==
X-Google-Smtp-Source: APBJJlF8Oq29jicXQ7LZzSR8Tvg8Z3f0r8jXoW+wL7thrKSoHpxajUTRtxGMChVZFla02C1R6Weu5w==
X-Received: by 2002:a17:90a:1b6c:b0:268:535f:7c15 with SMTP id q99-20020a17090a1b6c00b00268535f7c15mr1294451pjq.0.1690359035369;
        Wed, 26 Jul 2023 01:10:35 -0700 (PDT)
Received: from GL4FX4PXWL.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id gc17-20020a17090b311100b002680b2d2ab6sm756540pjb.19.2023.07.26.01.10.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Jul 2023 01:10:35 -0700 (PDT)
From:   Peng Zhang <zhangpeng.00@bytedance.com>
To:     Liam.Howlett@oracle.com, corbet@lwn.net, akpm@linux-foundation.org,
        willy@infradead.org, brauner@kernel.org, surenb@google.com,
        michael.christie@oracle.com, peterz@infradead.org,
        mathieu.desnoyers@efficios.com, npiggin@gmail.com, avagin@gmail.com
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Peng Zhang <zhangpeng.00@bytedance.com>
Subject: [PATCH 08/11] maple_tree: Skip other tests when BENCH is enabled
Date:   Wed, 26 Jul 2023 16:09:13 +0800
Message-Id: <20230726080916.17454-9-zhangpeng.00@bytedance.com>
X-Mailer: git-send-email 2.37.0 (Apple Git-136)
In-Reply-To: <20230726080916.17454-1-zhangpeng.00@bytedance.com>
References: <20230726080916.17454-1-zhangpeng.00@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Skip other tests when BENCH is enabled so that performance can be
measured in user space.

Signed-off-by: Peng Zhang <zhangpeng.00@bytedance.com>
---
 lib/test_maple_tree.c            | 8 ++++----
 tools/testing/radix-tree/maple.c | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/lib/test_maple_tree.c b/lib/test_maple_tree.c
index 0674aebd4423..0ec0c6a7c0b5 100644
--- a/lib/test_maple_tree.c
+++ b/lib/test_maple_tree.c
@@ -3514,10 +3514,6 @@ static int __init maple_tree_seed(void)
 
 	pr_info("\nTEST STARTING\n\n");
 
-	mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
-	check_root_expand(&tree);
-	mtree_destroy(&tree);
-
 #if defined(BENCH_SLOT_STORE)
 #define BENCH
 	mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
@@ -3575,6 +3571,10 @@ static int __init maple_tree_seed(void)
 	goto skip;
 #endif
 
+	mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
+	check_root_expand(&tree);
+	mtree_destroy(&tree);
+
 	mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
 	check_iteration(&tree);
 	mtree_destroy(&tree);
diff --git a/tools/testing/radix-tree/maple.c b/tools/testing/radix-tree/maple.c
index 3052e899e5df..57e6b0bc5984 100644
--- a/tools/testing/radix-tree/maple.c
+++ b/tools/testing/radix-tree/maple.c
@@ -36140,7 +36140,9 @@ void farmer_tests(void)
 
 void maple_tree_tests(void)
 {
+#if !defined(BENCH_FORK)
 	farmer_tests();
+#endif
 	maple_tree_seed();
 	maple_tree_harvest();
 }
-- 
2.20.1

