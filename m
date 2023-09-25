Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A18E5CE7A81
	for <linux-doc@archiver.kernel.org>; Mon, 25 Sep 2023 03:59:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231986AbjIYD7Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 24 Sep 2023 23:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231993AbjIYD7D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Sep 2023 23:59:03 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12C621A5
        for <linux-doc@vger.kernel.org>; Sun, 24 Sep 2023 20:58:27 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7743448d88eso51916985a.2
        for <linux-doc@vger.kernel.org>; Sun, 24 Sep 2023 20:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1695614307; x=1696219107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4LS/TFttl0uhdXEX5m8lwn2u6CezP5DBiTdl/qFdZ8=;
        b=RbkY5du3e8f5L6fTOBHDl/rIqGkpPP2l8STPrbSNtDdnszFsq7XS55GmpE6aCoMb4m
         /PAe0Jbt3rNynoYGefUf2h19aaaZTUJwD/YIna/14Z9XrI7Nnl7sBv8jFqwEUYcHpxZJ
         7Ffg+9ZR/0bvoJ0/5Pqq1tmQVH2kpkSoO6pAMcTq7v/ih+UDoCbCXwaaTgapd2YWd7o/
         poPLVdgDxazK6cCWC5Lvwu2hgFJBw7t8K887WboLqR7GHztnXMvodHaOTTy4RgrLKfyc
         p23QohmyTgDEMuGOrl/OV5CZIEcwLBH26RguVZ378W7KUuMpiPb1XNJMhW3AGFu0DVKf
         vcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695614307; x=1696219107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4LS/TFttl0uhdXEX5m8lwn2u6CezP5DBiTdl/qFdZ8=;
        b=mNkQMxZLHieNCNkC9S3HnPWUIv1NrSksW2Yy5UKH5PokjrQobL8AMtdiK1NdXNNcfo
         HIzE4pJKMlNpFdiCMdFiwIYrZr9QYz/tGx7H3rp6VouSLyzZLrvgkhahxoxYWj5Gj4u2
         Sy9vUx/U3/2Gi8i7N3zzO0K8duumU4N+0wC0eqLnuKvk4bZ/7dgqyeK46+Hh0eTOcpSA
         YEjViniqzZsUuGjNMxjomnPpVbtBtSRNN04zh4GiFzhEMGRSvnXATi//WoBjx5/l12lU
         SYRw5/1sWKbKSKQZx/uEs5LdYFOqTLawbba8RSzHU8/Ikjjms88R8Q1GcU9bogb9Kcf2
         n9cg==
X-Gm-Message-State: AOJu0Yw7jDat4VHC8jqpWF9cmbV7z9JRlyl0wRog19JakgcUajg5F/ms
        /rEU3Zk0ROZhaMQXJt90zHPQdg==
X-Google-Smtp-Source: AGHT+IFyPjYxuSfNgvsS9Z7GkNZ6srfa0PNzA2kN76VBzGnCz9+3nPN5C/SDQMLJt6pMfLPc2iPj9w==
X-Received: by 2002:a0c:ab82:0:b0:64f:8994:792d with SMTP id j2-20020a0cab82000000b0064f8994792dmr4730466qvb.38.1695614307072;
        Sun, 24 Sep 2023 20:58:27 -0700 (PDT)
Received: from GL4FX4PXWL.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id fm1-20020a056a002f8100b00679a4b56e41sm7025387pfb.43.2023.09.24.20.58.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 24 Sep 2023 20:58:26 -0700 (PDT)
From:   Peng Zhang <zhangpeng.00@bytedance.com>
To:     Liam.Howlett@oracle.com, corbet@lwn.net, akpm@linux-foundation.org,
        willy@infradead.org, brauner@kernel.org, surenb@google.com,
        michael.christie@oracle.com, mjguzik@gmail.com,
        mathieu.desnoyers@efficios.com, npiggin@gmail.com,
        peterz@infradead.org, oliver.sang@intel.com
Cc:     zhangpeng.00@bytedance.com, maple-tree@lists.infradead.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: [PATCH v3 6/9] maple_tree: Skip other tests when BENCH is enabled
Date:   Mon, 25 Sep 2023 11:56:14 +0800
Message-Id: <20230925035617.84767-7-zhangpeng.00@bytedance.com>
X-Mailer: git-send-email 2.37.0 (Apple Git-136)
In-Reply-To: <20230925035617.84767-1-zhangpeng.00@bytedance.com>
References: <20230925035617.84767-1-zhangpeng.00@bytedance.com>
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
index 12b3390e9591..cb5358674521 100644
--- a/tools/testing/radix-tree/maple.c
+++ b/tools/testing/radix-tree/maple.c
@@ -36299,7 +36299,9 @@ void farmer_tests(void)
 
 void maple_tree_tests(void)
 {
+#if !defined(BENCH)
 	farmer_tests();
+#endif
 	maple_tree_seed();
 	maple_tree_harvest();
 }
-- 
2.20.1

