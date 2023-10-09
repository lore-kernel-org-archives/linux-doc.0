Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D39E95A8E
	for <linux-doc@archiver.kernel.org>; Mon,  9 Oct 2023 09:05:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345660AbjJIJF0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 Oct 2023 05:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345706AbjJIJFC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Oct 2023 05:05:02 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E13D7116
        for <linux-doc@vger.kernel.org>; Mon,  9 Oct 2023 02:04:29 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-690bd59322dso3072352b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Oct 2023 02:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1696842269; x=1697447069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnskIBrvSZEYEyApxx0F6Uk1TEGei79sZvSWDi4Yrxw=;
        b=EOOXF6+WmJ4nbCNN47RG75CZ/Zoa26nQoJa9aAjFw74VVXF5CyxclEVCoOjul1szQo
         np+gYpoXQZsOpcQQIUZgdGXDP2uR+dF2E6VLO98ZgPZd9q86Yx/5fYb3xeGMUOowtl3y
         KPPQRjYTNU1K09PTho+jl+E8mmKrmh7rLqbPofLsU9tpzXSGC//ZOGjou/H8OI8oVA+8
         brRqTiMZjkMsNha0l0O8QQtL0mw44g8PRiCYmybAqwNN3bdY0JkiekSbZfHRGFbb1/n9
         xNHXvAbgft/YEiBjfokkLbNrGtB3nEeydy8utUv6hp7G4n0TfhNEx48tuf+UMN9nRiVZ
         98wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696842269; x=1697447069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jnskIBrvSZEYEyApxx0F6Uk1TEGei79sZvSWDi4Yrxw=;
        b=TB2BSau7GWwkbDaTp/pJ0lmu42pWMGeJ1mI6+WQN7PY2BQWQIHmdELYw9P1SPiHf+e
         /fc4cdbVJmVIuQO1JXlprSNcGgvsm28BStgccI1tDnIpqeEtIob0tHtzmUPjYmQnqoy/
         C6iHEYqdIiSgAxvlwh++SvZkrCtcsrgdGJpeTDgUcDKcw7v0dxD9T+DbeASsQIfCht2s
         IMjDf/2RFGcPG01Yj47HozXgpZCDeJ9oHSwlDIFltuLDCcVTP6qOEcy8uYZBmQhi+NY0
         V4SyDqp+l7Bh8KphH8hXaMXyzLwgoFA8mVdvu1J4iyhc/JnwE3OGb+eVs6W52vZU0rlR
         fxuw==
X-Gm-Message-State: AOJu0YwWsg8cRZDO6RDXXCDvA6O8Pp7RjnOW+xuGX54kLV6t4+zq3dvW
        dz03UAbjEKZKAu+l1wuFYr+aJA==
X-Google-Smtp-Source: AGHT+IET1qb2peUsO8cEnYgLpRkD93NRxlManliBfrRzGPRkgabOCFSqkeE2y8LdqsuC0g9EI5V17w==
X-Received: by 2002:a05:6a21:1a6:b0:16b:afc2:3b69 with SMTP id le38-20020a056a2101a600b0016bafc23b69mr8157702pzb.36.1696842269350;
        Mon, 09 Oct 2023 02:04:29 -0700 (PDT)
Received: from GL4FX4PXWL.bytedance.net ([139.177.225.243])
        by smtp.gmail.com with ESMTPSA id fk3-20020a056a003a8300b00690ca4356f1sm5884847pfb.198.2023.10.09.02.04.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Oct 2023 02:04:29 -0700 (PDT)
From:   Peng Zhang <zhangpeng.00@bytedance.com>
To:     Liam.Howlett@oracle.com, corbet@lwn.net, akpm@linux-foundation.org,
        willy@infradead.org, brauner@kernel.org, surenb@google.com,
        michael.christie@oracle.com, mjguzik@gmail.com,
        mathieu.desnoyers@efficios.com, npiggin@gmail.com,
        peterz@infradead.org, oliver.sang@intel.com, mst@redhat.com
Cc:     zhangpeng.00@bytedance.com, maple-tree@lists.infradead.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: [PATCH v4 07/10] maple_tree: Skip other tests when BENCH is enabled
Date:   Mon,  9 Oct 2023 17:03:17 +0800
Message-Id: <20231009090320.64565-8-zhangpeng.00@bytedance.com>
X-Mailer: git-send-email 2.37.0 (Apple Git-136)
In-Reply-To: <20231009090320.64565-1-zhangpeng.00@bytedance.com>
References: <20231009090320.64565-1-zhangpeng.00@bytedance.com>
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
index 06959165e2f9..27d424fad797 100644
--- a/lib/test_maple_tree.c
+++ b/lib/test_maple_tree.c
@@ -3572,10 +3572,6 @@ static int __init maple_tree_seed(void)
 
 	pr_info("\nTEST STARTING\n\n");
 
-	mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
-	check_root_expand(&tree);
-	mtree_destroy(&tree);
-
 #if defined(BENCH_SLOT_STORE)
 #define BENCH
 	mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
@@ -3633,6 +3629,10 @@ static int __init maple_tree_seed(void)
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

