Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B9AC001DC
	for <linux-doc@archiver.kernel.org>; Wed, 26 Jul 2023 08:23:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232775AbjGZIXd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Jul 2023 04:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232215AbjGZIWm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Jul 2023 04:22:42 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 770DE55A9
        for <linux-doc@vger.kernel.org>; Wed, 26 Jul 2023 01:10:41 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-26824c32cfbso482568a91.1
        for <linux-doc@vger.kernel.org>; Wed, 26 Jul 2023 01:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690359041; x=1690963841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=La30n3p8fENYrfJWqtvIRjpZvPcttyQzv7ZUcu4OWh0=;
        b=hDJE8eg6JhSqyFPBgmdPFLb2NvreqZRkoQ0fdGojtOrd++HIHNVUOcYmZwlfCxm5K+
         7S9/adYQ+mg7sePuGXIBKc3RGbqqWjQTdPhVgF9gclNb+ndj+3HGIaBgnMq+mTnEsAfS
         nN2TDe1AymKzfNIyX0pmL+9gSFtSZWjLFgJDdDBiEQVKijpSxGzTzdDVwHZxORnAaQUU
         +Ccnk2vlrYUp96CC7W9TS8BkgThX3dUut8NY2hntTU6eCEHXncFT/nxcYtcUKsiEhorE
         tPaMsoIeutpOBq+cJKv6F4JMmekbuoNmYseftMJvCzZYYszTS4YyUs6sAV+hYDzi/ty6
         YQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690359041; x=1690963841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=La30n3p8fENYrfJWqtvIRjpZvPcttyQzv7ZUcu4OWh0=;
        b=PbT7QwQcBvdzq7r1AEXxNMy8FYhBYBTGW2zI/rbnLQOfjh2gTsfuCVF1DbxEJbZ+2F
         71a6Im3eoLhNpUcNb6c8tvpirXhah2fS2LqBDcavbM6Xz2sbyXZMG0T+z5WVrPepUqgV
         ZCS98nwNW9fJq+fdiYRk9+Cz3eCqNksHsxLWqNaYAFRsGBkJyoXznAYmoJFqvLjPgFlf
         FdKSu35u/6j+ER6k41JLBGPl2pN899ZaK4hxoYJO7tEWC67+NHfyhk0ar0/3fnFNueI1
         rql748H+z6jhOGkIBiCQXH35xHT8M1/4jDueRUhyAcdCRsZU67tiRnllU88Jsx8brI9k
         j65w==
X-Gm-Message-State: ABy/qLa/7tsdf/MTFS6lGiyz1Bl27MZsPTA9aqslsd1PlrcY2b9KC0LF
        c827ESFke4yy5M9Y+BjS2APKxA==
X-Google-Smtp-Source: APBJJlE8cIpYZ+sTitqIk/v4pR8PRlkevNUmvEDeqPpuFom8xFn2KAvQVis6NXMadCyNx4ljN105gA==
X-Received: by 2002:a17:90b:8cf:b0:25c:18ad:6b82 with SMTP id ds15-20020a17090b08cf00b0025c18ad6b82mr1683093pjb.21.1690359040966;
        Wed, 26 Jul 2023 01:10:40 -0700 (PDT)
Received: from GL4FX4PXWL.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id gc17-20020a17090b311100b002680b2d2ab6sm756540pjb.19.2023.07.26.01.10.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Jul 2023 01:10:40 -0700 (PDT)
From:   Peng Zhang <zhangpeng.00@bytedance.com>
To:     Liam.Howlett@oracle.com, corbet@lwn.net, akpm@linux-foundation.org,
        willy@infradead.org, brauner@kernel.org, surenb@google.com,
        michael.christie@oracle.com, peterz@infradead.org,
        mathieu.desnoyers@efficios.com, npiggin@gmail.com, avagin@gmail.com
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Peng Zhang <zhangpeng.00@bytedance.com>
Subject: [PATCH 09/11] maple_tree: Update check_forking() and bench_forking()
Date:   Wed, 26 Jul 2023 16:09:14 +0800
Message-Id: <20230726080916.17454-10-zhangpeng.00@bytedance.com>
X-Mailer: git-send-email 2.37.0 (Apple Git-136)
In-Reply-To: <20230726080916.17454-1-zhangpeng.00@bytedance.com>
References: <20230726080916.17454-1-zhangpeng.00@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Updated check_forking() and bench_forking() to use __mt_dup() to
duplicate maple tree.

Signed-off-by: Peng Zhang <zhangpeng.00@bytedance.com>
---
 lib/test_maple_tree.c | 59 ++++++++++++++++++-------------------------
 1 file changed, 25 insertions(+), 34 deletions(-)

diff --git a/lib/test_maple_tree.c b/lib/test_maple_tree.c
index 0ec0c6a7c0b5..bbdac08927c6 100644
--- a/lib/test_maple_tree.c
+++ b/lib/test_maple_tree.c
@@ -1837,7 +1837,7 @@ static noinline void __init check_forking(struct maple_tree *mt)
 {
 
 	struct maple_tree newmt;
-	int i, nr_entries = 134;
+	int i, nr_entries = 134, ret;
 	void *val;
 	MA_STATE(mas, mt, 0, 0);
 	MA_STATE(newmas, mt, 0, 0);
@@ -1847,26 +1847,22 @@ static noinline void __init check_forking(struct maple_tree *mt)
 				  xa_mk_value(i), GFP_KERNEL);
 
 	mt_set_non_kernel(99999);
-	mt_init_flags(&newmt, MT_FLAGS_ALLOC_RANGE);
-	newmas.tree = &newmt;
-	mas_reset(&newmas);
-	mas_reset(&mas);
-	mas_lock(&newmas);
-	mas.index = 0;
-	mas.last = 0;
-	if (mas_expected_entries(&newmas, nr_entries)) {
+	mas_lock(&mas);
+
+	ret = __mt_dup(mt, &newmt, GFP_NOWAIT | __GFP_NOWARN);
+	if (ret) {
 		pr_err("OOM!");
 		BUG_ON(1);
 	}
-	rcu_read_lock();
-	mas_for_each(&mas, val, ULONG_MAX) {
-		newmas.index = mas.index;
-		newmas.last = mas.last;
-		mas_store(&newmas, val);
+
+	mas_set(&newmas, 0);
+	mas_for_each(&newmas, val, ULONG_MAX) {
+		mas_replace_entry(&newmas, val);
 	}
-	rcu_read_unlock();
+
+	mas_unlock(&mas);
+
 	mas_destroy(&newmas);
-	mas_unlock(&newmas);
 	mt_validate(&newmt);
 	mt_set_non_kernel(0);
 	mtree_destroy(&newmt);
@@ -1974,9 +1970,8 @@ static noinline void __init check_mas_store_gfp(struct maple_tree *mt)
 #if defined(BENCH_FORK)
 static noinline void __init bench_forking(struct maple_tree *mt)
 {
-
 	struct maple_tree newmt;
-	int i, nr_entries = 134, nr_fork = 80000;
+	int i, nr_entries = 134, nr_fork = 80000, ret;
 	void *val;
 	MA_STATE(mas, mt, 0, 0);
 	MA_STATE(newmas, mt, 0, 0);
@@ -1987,26 +1982,22 @@ static noinline void __init bench_forking(struct maple_tree *mt)
 
 	for (i = 0; i < nr_fork; i++) {
 		mt_set_non_kernel(99999);
-		mt_init_flags(&newmt, MT_FLAGS_ALLOC_RANGE);
-		newmas.tree = &newmt;
-		mas_reset(&newmas);
-		mas_reset(&mas);
-		mas.index = 0;
-		mas.last = 0;
-		rcu_read_lock();
-		mas_lock(&newmas);
-		if (mas_expected_entries(&newmas, nr_entries)) {
-			printk("OOM!");
+
+		mas_lock(&mas);
+		ret = __mt_dup(mt, &newmt, GFP_NOWAIT | __GFP_NOWARN);
+		if (ret) {
+			pr_err("OOM!");
 			BUG_ON(1);
 		}
-		mas_for_each(&mas, val, ULONG_MAX) {
-			newmas.index = mas.index;
-			newmas.last = mas.last;
-			mas_store(&newmas, val);
+
+		mas_set(&newmas, 0);
+		mas_for_each(&newmas, val, ULONG_MAX) {
+			mas_replace_entry(&newmas, val);
 		}
+
+		mas_unlock(&mas);
+
 		mas_destroy(&newmas);
-		mas_unlock(&newmas);
-		rcu_read_unlock();
 		mt_validate(&newmt);
 		mt_set_non_kernel(0);
 		mtree_destroy(&newmt);
-- 
2.20.1

