Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B983EB0F5
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 11:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732093; cv=none; b=qkH6Xk82sB6tJMNZ4aHqTU0piFPIsj67Hi4d562JAh5NiM0PvvFG6ZwgMgUMibC9Oi0WoLATCwURZx0DbvYbO0IrbiLW8gQJ1QFktrjCJbaSqc42Rc9y0mah4jJ33mWMANnM/ubRWS4Vo+bwe2B7L2O1NnnsH5SSX1b7OkPj4yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732093; c=relaxed/simple;
	bh=Xx/j6MOsB/ODQQFw5od0xKUEWZ/imNY2GfHdpvnX2/s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ax+4Lo4e14kjL+xnJR5TaCXBihgnKw4g4LDDRFu13TKiP4GzfqaIlxHgQpSHo/pw/AWzJgXZIprRFjy3J048hxqHcgOSSqMlZbXcnvZumtAVRTL/A19Th7xq5OI1qljdfuWdD/aZr2jYNINhmCTP7m1B2nJrwXPVq0PgLcc0u9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NcR2+8va; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcR2+8va"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ca06ad2d11so5757185ad.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 04:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782732092; x=1783336892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFDvCEsQoPukFv687y8Q7d8QC6mycXohjdzF/lNSz/E=;
        b=NcR2+8vaUdTr3VyiqyjxaTAY3DPM3SBqeTcH3EtP6PisVYmIQrJJ4ShG1LvX0/cgBg
         7XtMG/CMtwDeqK5BCTke3rhvzj0rTziGQNPR3XIk6xd8cQjOx8LPgmN5ct8/ye0ngM7M
         eql43nbQrV8b5mQd0hu8cywc45RKIsmzvAJNdJuB9GSlLBIlSFARuPeSzD1OxkjrUk6P
         qo8y0mmXk98CetQ9SRzMAnvhJWJl38neIqrDAnUWD4wuv0/sh9e360nREEHdz63KrAA4
         u+ZyoeV8BtuQB73PSwYcwkR3a0XtnSfDVCRTrcLYCNCdgVv4zdg/FNG0HQyW0JhZ/jhT
         20aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732092; x=1783336892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MFDvCEsQoPukFv687y8Q7d8QC6mycXohjdzF/lNSz/E=;
        b=Z9RVP1tQ7bav+zG5tMMsl18lu7xn7riQk2HMNCN/NGWxuBEEEypjdp5hG+c9kTF31A
         pGVU38KAPqK0fXrT6ylTB9WGES2u3IoWhOtXa/8M8BpwQ6Vsr4QJTVISq5nI1QXWRQOP
         TMkEfcFn9WNPKTxKYIsnvVOGd0UFG5YtvxXri7wjVkSWrq7V9KrSw+HinSEr3asa+AB3
         4kJda6mmZuw0xsIaoXcKtAOxzKdhuBYrkOpioelGevEPJjrwpmoXDRGuHgIA/AR6UrsZ
         Ch49xvybCP5jhKqqFmwoE7yR3u3JaqIT1qcuZfm83XUQh/+CpGjZ6QlsOqo/FPkImC0U
         KLew==
X-Forwarded-Encrypted: i=1; AHgh+RqyZBPEI1hIatXeOktcoPz74/yhiaSyEtfINt9uozrjxk3+ufUXHD6OKfVGEeSB8C4B2+ytML592ww=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfAxGRku+hpQu3vx+GCghP+f+ExbwW6WdIq4LaLemNZWJOhQ+q
	32YHBOyxrZ1R6ixqgJirBG7u79v0QnaqdDiC77PgkoTqrmE9n4+mGN6Q
X-Gm-Gg: AfdE7cnAZQQK60tdByM6GN3gG8+M07NgL5lh4x6R0PTP08Yn7tJVcHSikAiMQffOSII
	bn15K7756BI8GKi+F/S+SOhdv/6hLnno/nEkchVJlHRJF7+dGjI7ENsmCAXo3h2B5Oi/8vO9/qo
	rE2UXy1j2fiHbEbFzO3EXdOvV1xriK1KBCuHEWTkDPOZrLov0GKJ6irNUCR6CgJRoucrQ/wYGn4
	7rd1aODzCxboPWMbsPyLH5E6bHjD776VBfCt7Y+CumnHdJqRb0YB+m6q09WMQoldWIHsNumoVEM
	tMJxh9k1mpMLjyLJt3TZIzYlzbh6w75rY4hoR0fKG9UODnk7Lgzi5qmjPPRGL8umbWqIrwe8bj8
	XJyNRSMzhQzI9u//fMMm0OxkqF3gHdVuR/V3y8o03+LXq4kFWvIIZKSBSn7fWHsE5y858jf4ttk
	3XgeqYJBWC2tYhNpRu94XqCnykb7ObUhQzwkK+nQcP
X-Received: by 2002:a17:903:b86:b0:2ca:e3f:6a4a with SMTP id d9443c01a7336-2ca0e3f6c4emr17005765ad.21.1782732091673;
        Mon, 29 Jun 2026 04:21:31 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d09f0sm92759085ad.56.2026.06.29.04.21.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Jun 2026 04:21:31 -0700 (PDT)
From: Hao Jia <jiahao.kernel@gmail.com>
To: akpm@linux-foundation.org,
	tj@kernel.org,
	hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	mhocko@kernel.org,
	yosry@kernel.org,
	mkoutny@suse.com,
	nphamcs@gmail.com,
	chengming.zhou@linux.dev,
	muchun.song@linux.dev,
	roman.gushchin@linux.dev
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Hao Jia <jiahao1@lixiang.com>
Subject: [PATCH v5 6/6] selftests/cgroup: Add tests for zswap proactive writeback
Date: Mon, 29 Jun 2026 19:20:32 +0800
Message-Id: <20260629112032.20423-7-jiahao.kernel@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260629112032.20423-1-jiahao.kernel@gmail.com>
References: <20260629112032.20423-1-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hao Jia <jiahao1@lixiang.com>

Add test_zswap_proactive_writeback() to cover the new memory.reclaim
"source=zswap" key. The test populates a memory cgroup zswap
pool, triggers proactive writeback, and verifies the behavior by
observing the change in zswpwb_proactive_b. Invalid input combinations
are also covered.

Extend test_zswap_writeback_one() to assert that the existing
non-proactive writeback path leaves zswpwb_proactive_b at zero.

Signed-off-by: Hao Jia <jiahao1@lixiang.com>
---
 tools/testing/selftests/cgroup/test_zswap.c | 161 +++++++++++++++++++-
 1 file changed, 160 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index 49b36ee79160..dfd5f24b9d99 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -60,7 +60,12 @@ static int get_zswap_stored_pages(size_t *value)
 
 static long get_cg_wb_count(const char *cg)
 {
-	return cg_read_key_long(cg, "memory.stat", "zswpwb");
+	return cg_read_key_long(cg, "memory.stat", "zswpwb ");
+}
+
+static long get_cg_pwb_bytes(const char *cg)
+{
+	return cg_read_key_long(cg, "memory.stat", "zswpwb_proactive_b ");
 }
 
 static long get_zswpout(const char *cgroup)
@@ -355,6 +360,7 @@ static int attempt_writeback(const char *cgroup, void *arg)
 static int test_zswap_writeback_one(const char *cgroup, bool wb)
 {
 	long zswpwb_before, zswpwb_after;
+	long pwb_bytes;
 
 	zswpwb_before = get_cg_wb_count(cgroup);
 	if (zswpwb_before != 0) {
@@ -362,6 +368,12 @@ static int test_zswap_writeback_one(const char *cgroup, bool wb)
 		return -1;
 	}
 
+	pwb_bytes = get_cg_pwb_bytes(cgroup);
+	if (pwb_bytes > 0) {
+		ksft_print_msg("zswpwb_proactive_b_before = %ld instead of 0\n", pwb_bytes);
+		return -1;
+	}
+
 	if (cg_run(cgroup, attempt_writeback, (void *) &wb))
 		return -1;
 
@@ -379,6 +391,17 @@ static int test_zswap_writeback_one(const char *cgroup, bool wb)
 		return -1;
 	}
 
+	/*
+	 * attempt_writeback() does not use the proactive writeback path, so
+	 * zswpwb_proactive_b must stay at zero regardless of whether
+	 * writeback was enabled.
+	 */
+	pwb_bytes = get_cg_pwb_bytes(cgroup);
+	if (pwb_bytes > 0) {
+		ksft_print_msg("zswpwb_proactive_b_after is %ld, expected 0\n", pwb_bytes);
+		return -1;
+	}
+
 	return 0;
 }
 
@@ -770,6 +793,141 @@ static int test_zswap_incompressible(const char *root)
 	return ret;
 }
 
+/*
+ * Trigger proactive zswap writeback with the following steps:
+ * 1. Allocate memory.
+ * 2. Push allocated memory into zswap.
+ * 3. Proactively write back zswap pages to swap
+ *    using "source=zswap".
+ */
+static int proactive_writeback_workload(const char *cgroup, void *arg)
+{
+	long pagesize = sysconf(_SC_PAGESIZE);
+	size_t memsize = pagesize * 1024;
+	char reclaim_cmd[64];
+	char buf[pagesize];
+	long zswap_usage;
+	int ret = -1;
+	int rc;
+	char *mem;
+
+	mem = (char *)malloc(memsize);
+	if (!mem)
+		return ret;
+
+	for (int i = 0; i < pagesize; i++)
+		buf[i] = i < pagesize / 2 ? (char)i : 0;
+	for (int i = 0; i < memsize; i += pagesize)
+		memcpy(&mem[i], buf, pagesize);
+
+	/* Evict allocated memory into zswap. */
+	if (cg_write_numeric(cgroup, "memory.reclaim", memsize)) {
+		ksft_print_msg("Failed to push pages into zswap\n");
+		goto out;
+	}
+
+	zswap_usage = cg_read_long(cgroup, "memory.zswap.current");
+	if (zswap_usage <= 0) {
+		ksft_print_msg("no zswap pool to write back\n");
+		goto out;
+	}
+
+	/* Trigger proactive zswap writeback. */
+	snprintf(reclaim_cmd, sizeof(reclaim_cmd), "%ld source=zswap", zswap_usage);
+	rc = cg_write(cgroup, "memory.reclaim", reclaim_cmd);
+	if (rc && rc != -EAGAIN) {
+		ksft_print_msg("proactive zswap writeback failed: %d\n", rc);
+		goto out;
+	}
+
+	ret = 0;
+out:
+	free(mem);
+	return ret;
+}
+
+static int check_writeback_invalid_inputs(const char *cgroup)
+{
+	static char * const bad_inputs[] = {
+		"source=zswap",
+		"1M source=zswap swappiness=60",
+		"1M swappiness=60 source=zswap",
+		"1M source=zswap swappiness=max",
+		"1M swappiness=max source=zswap",
+	};
+	int i, rc;
+
+	for (i = 0; i < ARRAY_SIZE(bad_inputs); i++) {
+		rc = cg_write(cgroup, "memory.reclaim", bad_inputs[i]);
+		if (rc != -EINVAL) {
+			ksft_print_msg("memory.reclaim '%s': returned %d, expected %d\n",
+				       bad_inputs[i], rc, -EINVAL);
+			return -1;
+		}
+	}
+	return 0;
+}
+
+static int test_zswap_proactive_writeback(const char *root)
+{
+	long wb_before, wb_after;
+	long pwb_b_before, pwb_b_after;
+	long wb_delta, pwb_b_delta;
+	int ret = KSFT_FAIL;
+	char *test_group;
+
+	if (cg_read_strcmp(root, "memory.zswap.writeback", "1"))
+		return KSFT_SKIP;
+
+	test_group = cg_name(root, "zswap_proactive_test");
+	if (!test_group)
+		return KSFT_FAIL;
+	if (cg_create(test_group))
+		goto out;
+	/*
+	 * A missing zswpwb_proactive_b stat means the kernel lacks proactive
+	 * writeback support, so skip rather than fail.
+	 */
+	if (get_cg_pwb_bytes(test_group) < 0) {
+		ret = KSFT_SKIP;
+		goto out;
+	}
+	if (check_writeback_invalid_inputs(test_group))
+		goto out;
+
+	pwb_b_before = get_cg_pwb_bytes(test_group);
+	wb_before = get_cg_wb_count(test_group);
+	if (pwb_b_before < 0 || wb_before < 0)
+		goto out;
+
+	if (cg_run(test_group, proactive_writeback_workload, NULL))
+		goto out;
+
+	pwb_b_after = get_cg_pwb_bytes(test_group);
+	wb_after = get_cg_wb_count(test_group);
+	if (pwb_b_after < 0 || wb_after < 0)
+		goto out;
+
+	pwb_b_delta = pwb_b_after - pwb_b_before;
+	wb_delta = wb_after - wb_before;
+
+	if (pwb_b_delta <= 0) {
+		ksft_print_msg("zswpwb_proactive_b did not increase: delta=%ld\n",
+			       pwb_b_delta);
+		goto out;
+	}
+	if (wb_delta <= 0) {
+		ksft_print_msg("zswpwb did not increase: delta=%ld\n", wb_delta);
+		goto out;
+	}
+
+	ret = KSFT_PASS;
+out:
+	cg_destroy(test_group);
+	free(test_group);
+	return ret;
+}
+
 #define T(x) { x, #x }
 struct zswap_test {
 	int (*fn)(const char *root);
@@ -783,6 +941,7 @@ struct zswap_test {
 	T(test_no_kmem_bypass),
 	T(test_no_invasive_cgroup_shrink),
 	T(test_zswap_incompressible),
+	T(test_zswap_proactive_writeback),
 };
 #undef T
 
-- 
2.34.1

