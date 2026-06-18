Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ACA28469F
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 04:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781758206; cv=none; b=a+A7FSJsvtrMiW+HjcnKEhqhN5Wmgv/mQTrGj9i49VWTkVGBwNBFFV3d8bDiyeC8VzjBsXNjsigy4ifiTJ6SvGZ34zC25dr1y+dSYRs+8J85zCq2/PPBSvgDFPYEffEFwkGqHTm0WeQFsdC6k2EKkPIqHNqtrqyDUdbiWPK1Vg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781758206; c=relaxed/simple;
	bh=aIcPhA6gmhErGVoUAefc+7js1FHagPXIMuNDUIB2Pxc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XHzIdOyh8np8f60YTKRvhfQ3knOh+NJJF56qOlecmT063gFWYpuvndu7mEZY4gTMzjvC3Ciyu6GiOIuW1DNSTonn2w7p97ZcNVaSpnthyqJLZIKd12yet/KspCzOWq9ufcGpkj111BsiRgCYnQzk+Fc+2rETtgxdKnfaLvrVzRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHFlYWbb; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHFlYWbb"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8422f148dfcso242408b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 21:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781758204; x=1782363004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AC9B5YDsIulRerYhn7rz1eBAPxCjqQ7ZRwn/nMekv0E=;
        b=JHFlYWbbb9+TP27E1auB+z0zoZsU/awklKZN2ILxK5vWgwtSrww8iqMqsl7XdNs78J
         Wlbdl+DKZHyBf3ABp/6Nepe6hDbP6Ew6Rpc2k43J2FtISbkFRueDwvJqYgV50CSx7z+c
         kG6PLZlTpui//PaKd1luIeaGZ9DlNk5DrWvBEXGUqjluAWR7bcz4BkVmzjMu/6HONozH
         /wzf1BOGC6BeKJ86A85H84v7w98ewr08y6B2IwuHw4BXc7RaTm8SZFLytrtyEI66A81+
         fpqC0yYMruFahTC+aal68CLmRnyk9tK1ErSqzib2soGUs1882PMN778w3bkRH7OEHvf+
         tKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781758204; x=1782363004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AC9B5YDsIulRerYhn7rz1eBAPxCjqQ7ZRwn/nMekv0E=;
        b=E42UTG4GKncM+np6DmBUPWWscKz8ArZF3HqOHD2qU+6/45w5l4tsFYFk5FfHBPw1QK
         056YD8bVSvFCtVAcfRsJ9ZbouvyV5xXiDFKCFC+ngI5BZ+zzSW9rx12yAuWIfgPmvP8q
         ZUvXz+kZnaZmhaXttSR7VYkvHaNo4FVvQ0oaqd1PTXRLz3B6sDuyg4PxOGK7fuxPy7qf
         OY9AQIbjIndf6YZ783XdS+W/tzWpYNrS7EU3fH3xOUNN4pE905BWZGPqASrCovxMmiGi
         Wgp/R73aTH/l/UUjh6NnGpIRx0+4G4XJcYRmJMW0iJntwvB7LP47kUN3dXUvTypbBYQI
         noKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Xc8kjghclwx0P190PFrkZ/bdZHj6vmOer2E/F1/ndWW8r5gBlmGqGaeSk3M5nMBKFBo2y+2zV6io=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdVgh6DDc6xXlp9DbiwdxsE93ZT9AdWYiS51U+qb5NYISlB+I8
	zDGQDY9Y8L820+GAv5D3tmKFhDVAlnqE9PE91zBNcNVre5DvcJ4XunJx
X-Gm-Gg: AfdE7cmWbtavWL/UeFXuew6XnHtk3zxlV2kO/EXFp4l4YNhCIfl8YkmWoTINWixfQet
	MAT+Sl935WQrvYPzWMCO8/fbtS1FWlPWVKQb/9YthglfYAPp6As+NdR0l0mhhdlfxHg122tXx6a
	ZSDEGaFkQSixzF9DCo+XlRS5llni+V2LaEwCsfGwtIsGtmNjwWLUAoQ1PN8iNJHFQGJJ1Cpxt8w
	M9rKSsWwFRlVafseJ3y596IUgV3WK3ycBshKmY3vDfnd+y9dfo3O9YZBIcwlvobNqWvom2RaBCx
	HrUwrikgz0oS8aRBi/A5n/HIQwhr7IOAAT9+M69kDGkEFqQ5uVIc44V5TIolExeAjeV8cakjjL4
	Hr2OYyIdyEaeDUS21+FK2tMKd7VZymGOv7f9DiKaeY/RWi/MwIR85x8l6OGLOr0E6KUa41Xj8NO
	G8QL0Itdbu38aInIX3jGeeRzG8nkBQKI6eN+iept+KnW6p36gm4v0=
X-Received: by 2002:a05:6a00:66c5:b0:845:31a6:d84d with SMTP id d2e1a72fcca58-84531a6df5bmr4041592b3a.7.1781758204555;
        Wed, 17 Jun 2026 21:50:04 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b020b53sm17214781b3a.47.2026.06.17.21.49.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Jun 2026 21:50:04 -0700 (PDT)
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
Subject: [PATCH v4 5/5] selftests/cgroup: Add tests for zswap proactive writeback
Date: Thu, 18 Jun 2026 12:48:57 +0800
Message-Id: <20260618044857.69439-6-jiahao.kernel@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260618044857.69439-1-jiahao.kernel@gmail.com>
References: <20260618044857.69439-1-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hao Jia <jiahao1@lixiang.com>

Add test_zswap_proactive_writeback() to cover the new memory.reclaim
"zswap_writeback_only" key. The test populates a memory cgroup zswap
pool, triggers proactive writeback, and verifies the behavior by
observing the change in zswpwb_proactive_b. Invalid input combinations
are also covered.

Extend test_zswap_writeback_one() to assert that the existing
non-proactive writeback path leaves zswpwb_proactive_b at zero.

Signed-off-by: Hao Jia <jiahao1@lixiang.com>
---
 tools/testing/selftests/cgroup/test_zswap.c | 153 +++++++++++++++++++-
 1 file changed, 152 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index 49b36ee79160..9c153fdd3a08 100644
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
+	if (pwb_bytes != 0) {
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
+	if (pwb_bytes != 0) {
+		ksft_print_msg("zswpwb_proactive_b_after is %ld, expected 0\n", pwb_bytes);
+		return -1;
+	}
+
 	return 0;
 }
 
@@ -770,6 +793,133 @@ static int test_zswap_incompressible(const char *root)
 	return ret;
 }
 
+/*
+ * Trigger proactive zswap writeback with the following steps:
+ * 1. Allocate memory.
+ * 2. Push allocated memory into zswap.
+ * 3. Proactively write back zswap pages to swap
+ *    using "zswap_writeback_only".
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
+	snprintf(reclaim_cmd, sizeof(reclaim_cmd), "%zu zswap_writeback_only", zswap_usage);
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
+		"zswap_writeback_only",
+		"1M zswap_writeback_only swappiness=60",
+		"1M swappiness=60 zswap_writeback_only",
+		"1M zswap_writeback_only swappiness=max",
+		"1M swappiness=max zswap_writeback_only",
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
@@ -783,6 +933,7 @@ struct zswap_test {
 	T(test_no_kmem_bypass),
 	T(test_no_invasive_cgroup_shrink),
 	T(test_zswap_incompressible),
+	T(test_zswap_proactive_writeback),
 };
 #undef T
 
-- 
2.34.1

