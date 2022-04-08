Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D399DC4332F
	for <linux-doc@archiver.kernel.org>; Fri,  8 Apr 2022 04:58:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234401AbiDHE77 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Apr 2022 00:59:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234408AbiDHE74 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Apr 2022 00:59:56 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 743D431DC4
        for <linux-doc@vger.kernel.org>; Thu,  7 Apr 2022 21:57:52 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id z8-20020a170903018800b001566875e0f5so3877243plg.21
        for <linux-doc@vger.kernel.org>; Thu, 07 Apr 2022 21:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=3pTs/VmZPxq5q5wYSF5wNcPHcga+GtsVQl1Ey1cMTYA=;
        b=rvhnsrqMv4sgVKJh1vywJDwJ5U1YIrm4qeZ+xvYMN5iNrp3UBtoPAwLYGST3GoaiMm
         WHOaYmhgN89ZSkqq/rrlyrpsoAk9snev93OB3iD6xwnbay5f9TY/LZvY0DCAezc6XBkq
         xL4SfAAQ1Asd+mUQruSX/RHQfET7mMtUa5hZPgL9lbYKPNV6DK0EbhmuK9i82PR/5pAt
         /NhixDWU/pG6CKN2oFTyr8dDewwdERP0qYAzylJbweyHFeoMsu6trfoKBuDfsepu7Rek
         a8aShEUZ343hISjyHiMcMdIBoVEqcQ1IoADLU9STJVAAr7sxoIvQ8281ix2aOcgAz9HZ
         /kVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=3pTs/VmZPxq5q5wYSF5wNcPHcga+GtsVQl1Ey1cMTYA=;
        b=WVdPQoEJOn/NU7CLlEhp6KR4oDttb7j2yFeCNdjDGDCxQMjo7mf1LhrrzVBxD/GbDg
         EIv7HJZ8/DBkQDMf+5AwFqQ1I0VA2TP3bd//msq6eb/b99B0e5gUwqtvlPyV8rBhclX6
         +8Ogu6Kl4o0GwRDT24RwPz1a0yqkOdrn3RQjsr2FDvZIXAglcPIe3ySQKuwzAPG/eM7Y
         CLBzlqL/Iz+go1E3KxIfHoX40yIcydH14+L1Qo/fCFAGQWvUbh6XTmAa5B0Y9Zgb/orv
         80qaXxIwfYWwuryDXSreBBGZL9yJN1Im46gEEyh+5SITHR254/w2E/LwVeoZxpd7ZlMH
         HLww==
X-Gm-Message-State: AOAM5336BW0spB4xMidwzVMLmAPNPwZbkFAvgTaZuZbQO1yzNoxrrMhy
        kORtIHZdueG3rm3pnHz8ccKBrsUw+t+HHRSq
X-Google-Smtp-Source: ABdhPJwrP7dagj8dnlFgC14HxELMunGPx+PFv2E1bWL6b6NRaIqpjG704ThFr7Q8pI5XpMISvNAO5NCYkQKyivj5
X-Received: from yosry.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:2327])
 (user=yosryahmed job=sendgmr) by 2002:a17:903:22c4:b0:154:8399:5285 with SMTP
 id y4-20020a17090322c400b0015483995285mr17325689plg.56.1649393871741; Thu, 07
 Apr 2022 21:57:51 -0700 (PDT)
Date:   Fri,  8 Apr 2022 04:57:43 +0000
In-Reply-To: <20220408045743.1432968-1-yosryahmed@google.com>
Message-Id: <20220408045743.1432968-5-yosryahmed@google.com>
Mime-Version: 1.0
References: <20220408045743.1432968-1-yosryahmed@google.com>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
Subject: [PATCH v3 4/4] selftests: cgroup: add a selftest for memory.reclaim
From:   Yosry Ahmed <yosryahmed@google.com>
To:     Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Shakeel Butt <shakeelb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <roman.gushchin@linux.dev>
Cc:     David Rientjes <rientjes@google.com>, Tejun Heo <tj@kernel.org>,
        Zefan Li <lizefan.x@bytedance.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Yu Zhao <yuzhao@google.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Wei Xu <weixugc@google.com>, Greg Thelen <gthelen@google.com>,
        Chen Wandun <chenwandun@huawei.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        "=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>,
        Tim Chen <tim.c.chen@linux.intel.com>, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
        Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a new test for memory.reclaim that verifies that the interface
correctly reclaims memory as intended, from both anon and file pages.

Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
---
 .../selftests/cgroup/test_memcontrol.c        | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
index f2ffb3a30194..75ae441c01c3 100644
--- a/tools/testing/selftests/cgroup/test_memcontrol.c
+++ b/tools/testing/selftests/cgroup/test_memcontrol.c
@@ -760,6 +760,90 @@ static int test_memcg_max(const char *root)
 	return ret;
 }
 
+/*
+ * This test checks that memory.reclaim reclaims the given
+ * amount of memory (from both anon and file).
+ */
+static int test_memcg_reclaim(const char *root)
+{
+	int ret = KSFT_FAIL, fd;
+	char *memcg;
+	long current, to_reclaim;
+	char buf[64];
+
+	memcg = cg_name(root, "memcg_test");
+	if (!memcg)
+		goto cleanup;
+
+	if (cg_create(memcg))
+		goto cleanup;
+
+	current = cg_read_long(memcg, "memory.current");
+	if (current != 0)
+		goto cleanup;
+
+	cg_run_nowait(memcg, alloc_anon_noexit, (void *) MB(50));
+	sleep(1);
+
+	fd = get_temp_fd();
+	if (fd < 0)
+		goto cleanup;
+
+	cg_run_nowait(memcg, alloc_pagecache_50M_noexit, (void *)(long)fd);
+	sleep(1);
+
+	current = cg_read_long(memcg, "memory.current");
+	if (!values_close(current, MB(100), 10))
+		goto cleanup;
+
+	/*
+	 * Reclaim until current reaches 30M, make sure to reclaim over 50M to
+	 * hit both anon and file.
+	 */
+	while (true) {
+		int err;
+
+		current = cg_read_long(memcg, "memory.current");
+		to_reclaim = current - MB(30);
+
+		/*
+		 * We only keep looping if we get EAGAIN, which means we could
+		 * not reclaim the full amount.
+		 */
+		if (to_reclaim <= 0)
+			goto cleanup;
+
+
+		snprintf(buf, sizeof(buf), "%ld", to_reclaim);
+		err = cg_write(memcg, "memory.reclaim", buf);
+		if (!err) {
+			/*
+			 * If writing succeeds, then the written amount should have been
+			 * fully reclaimed (and maybe more).
+			 */
+			current = cg_read_long(memcg, "memory.current");
+			if (!values_close(current, MB(30), 3) && current > MB(30))
+				goto cleanup;
+			break;
+		}
+
+		/* The kernel could not reclaim the full amount, try again. */
+		if (err == EAGAIN)
+			continue;
+
+		/* We got an unexpected error. */
+		goto cleanup;
+	}
+
+	ret = KSFT_PASS;
+cleanup:
+	cg_destroy(memcg);
+	free(memcg);
+	close(fd);
+
+	return ret;
+}
+
 static int alloc_anon_50M_check_swap(const char *cgroup, void *arg)
 {
 	long mem_max = (long)arg;
@@ -1263,6 +1347,7 @@ struct memcg_test {
 	T(test_memcg_high),
 	T(test_memcg_high_sync),
 	T(test_memcg_max),
+	T(test_memcg_reclaim),
 	T(test_memcg_oom_events),
 	T(test_memcg_swap_max),
 	T(test_memcg_sock),
-- 
2.35.1.1178.g4f1659d476-goog

