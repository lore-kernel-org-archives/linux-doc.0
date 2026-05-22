Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024A5357D0A
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 17:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779471955; cv=none; b=dfVWta2v0lyg+T9yM2Yh99UhJBY8U7b+SQWn9h7oNuTBuaFKuKdAeCk/3Jdscpgb/FpRqAt7U+N4q0RHaqoEFaTiBhPE2zOubg1mA0FxiMLyNLOEF3nGHtbLKCFKJTLbUJzcNeS0nJonICRdc0cvJMohdTjULyAFgMXQnf87GQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779471955; c=relaxed/simple;
	bh=JB4Hu76wjr0YkVBEWWP5py228goBaZacP8xfyeQFG8A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nUvc1CZmJn/g7HCEHP3ZxlhXsbo3O1hpzezka789/ysm/VD2jSOTtzCQPY9bzW+FSJqWbGufq+3uYKpvLIQAod5Y113EZ+9d8cnRAAFAFf621bMrkbW7GywA+OAny4HZWSym0K03SiNAyIonwOnUqaeNoIlXRI29pwQwxRgFi0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jChpHl4y; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jChpHl4y"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-304448ab58cso4443224eec.1
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 10:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779471952; x=1780076752; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTL5FG6+Kr2BWUUPWPXeiSAcbi1S62N6S7m7CP+BgJA=;
        b=jChpHl4ynVLKIWuj9fgSLP3IChzhqhedQowr2UzjFahRJs2Ft3NCZD71SePu+toqxF
         eNY03//AKFplb8F6MApKzrKUnHapTpD+xq7xY258kNfRVhGdjLTEYjvRLXQ8ZfyPgYyy
         qLOvOWdh8YGRWZ/NY29SSGCc93euGWe75zBid43cb9Yt5KBaywrmVDA65KUPaFyvzHiP
         mruVgkVYJLWlfYcfh10odwxSnBAZbx+Wwdo+iFKs4Uz50DxLceSm5nC5CZy8etGSqajb
         3Rxdg9WO4A+YNSuKFvWJFS3228MrvfPUfPfJ44knXD46bbiXZ5PU+dF6jfqTStnU2Tmx
         D+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779471952; x=1780076752;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTL5FG6+Kr2BWUUPWPXeiSAcbi1S62N6S7m7CP+BgJA=;
        b=D18e82J4oxM5I6FxAtNITvA4L/hCGOXbwTpE+zDelCv0qmvVAdBVntla3iwus6bm2B
         mbPPPG1FCzfaCU+tJ26yo8UW5uLwp97YT9d45JvTZhWORJ+ujjfEIqmdjLE6Fb1rF4FZ
         gXAYngCyb9/UJaQLQ4yCW/czM+NUGohwEVJffbHXS1j4tnTuYo/yo5BFGV70xLvba+3l
         rBoj+MzIKFWBxNqYI+XEJ3C9J6z+KMQgXcmeWETAt0y2toapSoCggNtKqV86Ftcv3kQ8
         K3Iaq1lWFBTQYIf6aaRL8YSvup1ivFIxQLlvZFls6/a1fLdl90+SjcmEFvvwwWOBdy65
         f81w==
X-Forwarded-Encrypted: i=1; AFNElJ+22YN6MEaT4T6Hd9LNJtljZTFd146af61sX8u+GMlf7BY1llgCY9FaDWVjTZzMKGyYbNt+/pw2ftE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaV8YyJGGOBXrolfwlac5IFVw3lJHBMRpZekypbcryJQH6FwDx
	jIUQmU+dLvIImmdSsOkrjfCBqgeOu2BkWRYL8JrTpBg0L/x5qGJlX/jMNIgC7lPAzlWIaYQYUQx
	JRNF1C2zUxx2af0zmvsvQtL/R5BArmP2Czw==
X-Received: from dybgh3.prod.google.com ([2002:a05:7301:3:b0:303:521c:29a5])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:1922:b0:2ef:8b91:212 with SMTP id 5a478bee46e88-30449063389mr2564519eec.14.1779471951995;
 Fri, 22 May 2026 10:45:51 -0700 (PDT)
Date: Fri, 22 May 2026 17:45:38 +0000
In-Reply-To: <cover.1779471082.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1779471082.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <fb8b2eff38746510eb415624b5f5846be57a0a26.1779471082.git.abhishekbapat@google.com>
Subject: [PATCH v2 6/6] kselftest: alloc_tag: extend the allocinfo ioctl kselftest
From: Abhishek Bapat <abhishekbapat@google.com>
To: Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Hao Ge <hao.ge@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Sourav Panda <souravpanda@google.com>, Abhishek Bapat <abhishekbapat@google.com>
Content-Type: text/plain; charset="UTF-8"

Add the following 2 scenarios to the allocinfo ioctl kselftest:
1. Validate size based filtering
2. Validate lineno based filtering

The first test uses "do_init_module" as the candidate function for the
test. This is because the associated site will only allocate memory when
a kernel module is loaded. The return value of get_content_id() changes
every time modules are loaded or unloaded. Hence, as long as
get_content_id() values at the start and the end of the test are the
same, the memory allocated by the do_init_module call site should also
remain the same. Consequently, the test can assume consistency between
the value returned by the ioctl and the procfs resulting in less
flakiness.

Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
---
 .../alloc_tag/allocinfo_ioctl_test.c          | 194 +++++++++++++++++-
 1 file changed, 193 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
index 5c3c16e86c23..ce3576e3cd9b 100644
--- a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
+++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
@@ -291,11 +291,191 @@ static int test_function_filter(void)
 	return run_filter_test(&filter);
 }
 
+static int test_size_filter(void)
+{
+	int fd;
+	struct allocinfo_tag_data_vec *tags = malloc(sizeof(*tags));
+	struct allocinfo_tag_data_vec *procfs_entries = malloc(sizeof(*procfs_entries));
+	struct allocinfo_filter filter;
+	int ret = KSFT_PASS;
+	__u64 target_size, i;
+	bool found = false;
+	const char *target_function = "do_init_module";
+
+	if (!tags || !procfs_entries) {
+		ksft_print_msg("Memory allocation failed.\n");
+		ret = KSFT_FAIL;
+		goto freemem;
+	}
+
+	fd = open(ALLOCINFO_PROC, O_RDONLY);
+	if (fd < 0) {
+		ksft_exit_skip("Failed to open " ALLOCINFO_PROC ": %s\n", strerror(errno));
+		ret = KSFT_FAIL;
+		goto freemem;
+	}
+
+	memset(&filter, 0, sizeof(filter));
+	filter.mask |= ALLOCINFO_FILTER_MASK_FUNCTION;
+	strncpy(filter.fields.function, target_function, ALLOCINFO_STR_SIZE);
+
+	if (get_filtered_procfs_entries(procfs_entries, &filter, fd)) {
+		ksft_print_msg("Error retrieving entries from " ALLOCINFO_PROC "\n");
+		ret = KSFT_FAIL;
+		goto exit;
+	}
+
+	if (procfs_entries->count == 0) {
+		ksft_print_msg("Function %s not found in procfs\n", target_function);
+		ret = KSFT_SKIP;
+		goto exit;
+	}
+
+	/*
+	 * We depend on the result of procfs entries to create the ioctl_filter. Hence we
+	 * cannot recycle the run_filter_test function here.
+	 */
+	target_size = procfs_entries->tag[0].counter.bytes;
+
+	memset(&filter, 0, sizeof(filter));
+	filter.mask |= ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_MASK_MAX_SIZE;
+	filter.min_size = target_size;
+	filter.max_size = target_size;
+
+	__u64 pos = 0;
+	enum ioctl_ret ioctl_status;
+
+	/*
+	 * This loop is required because the first 32 entries fetched by the IOCTL based on
+	 * the size parameter might not contain the exact entry that was used from procfs.
+	 * If that happens, we must update pos and fetch again until we find the exact entry.
+	 */
+	while (1) {
+		ioctl_status = get_filtered_ioctl_entries(tags, &filter, fd, pos);
+		if (ioctl_status == IOCTL_INVALID_DATA) {
+			ksft_print_msg("Trouble retrieving valid IOCTL entries, skipping.\n");
+			ret = KSFT_SKIP;
+			goto exit;
+		}
+		if (ioctl_status == IOCTL_FAILURE) {
+			ksft_print_msg("Error retrieving IOCTL entries.\n");
+			ret = KSFT_FAIL;
+			goto exit;
+		}
+
+		for (i = 0; i < tags->count; i++) {
+			if (strcmp(tags->tag[i].tag.function, target_function) == 0) {
+				found = true;
+				break;
+			}
+		}
+
+		if (found)
+			break;
+
+		if (tags->count < VEC_MAX_ENTRIES)
+			break;
+
+		pos += tags->count;
+	}
+
+	if (!found) {
+		ksft_print_msg("Entry with function %s not found in IOCTL results\n",
+			       target_function);
+		ret = KSFT_FAIL;
+	}
+
+exit:
+	close(fd);
+freemem:
+	free(tags);
+	free(procfs_entries);
+	return ret;
+}
+
+static int test_lineno_filter(void)
+{
+	int fd;
+	struct allocinfo_tag_data_vec *tags = malloc(sizeof(*tags));
+	struct allocinfo_tag_data_vec *procfs_entries = malloc(sizeof(*procfs_entries));
+	struct allocinfo_filter filter;
+	enum ioctl_ret ioctl_status;
+	int ret = KSFT_PASS;
+	__u64 target_lineno, i;
+
+	if (!tags || !procfs_entries) {
+		ksft_print_msg("Memory allocation failed.\n");
+		ret = KSFT_FAIL;
+		goto freemem;
+	}
+
+	fd = open(ALLOCINFO_PROC, O_RDONLY);
+	if (fd < 0) {
+		ksft_exit_skip("Failed to open " ALLOCINFO_PROC ": %s\n", strerror(errno));
+		ret = KSFT_FAIL;
+		goto freemem;
+	}
+
+	memset(&filter, 0, sizeof(filter));
+
+	if (get_filtered_procfs_entries(procfs_entries, &filter, fd)) {
+		ksft_print_msg("Error retrieving entries from " ALLOCINFO_PROC "\n");
+		ret = KSFT_FAIL;
+		goto exit;
+	}
+	if (procfs_entries->count == 0) {
+		ksft_print_msg("Could not retrieve procfs entries\n");
+		ret = KSFT_SKIP;
+		goto exit;
+	}
+	/*
+	 * We depend on the result of procfs entries to create the ioctl_filter. Hence we
+	 * cannot recycle the run_filter_test function here.
+	 */
+	target_lineno = procfs_entries->tag[0].tag.lineno;
+
+	filter.mask |= ALLOCINFO_FILTER_MASK_LINENO;
+	filter.fields.lineno = target_lineno;
+
+	ioctl_status = get_filtered_ioctl_entries(tags, &filter, fd, 0);
+	if (ioctl_status == IOCTL_INVALID_DATA) {
+		ksft_print_msg("Trouble retrieving valid IOCTL entries, skipping.\n");
+		ret = KSFT_SKIP;
+		goto exit;
+	}
+	if (ioctl_status == IOCTL_FAILURE) {
+		ksft_print_msg("Error retrieving IOCTL entries.\n");
+		ret = KSFT_FAIL;
+		goto exit;
+	}
+
+	if (tags->count == 0) {
+		ksft_print_msg("IOCTL returned 0 matches for target lineno %llu.\n", target_lineno);
+		ret = KSFT_FAIL;
+		goto exit;
+	}
+	for (i = 0; i < tags->count; i++) {
+		if (tags->tag[i].tag.lineno != target_lineno) {
+			ksft_print_msg("IOCTL entry %llu has incorrect lineno %llu.\n",
+				       i, tags->tag[i].tag.lineno);
+			ret = KSFT_FAIL;
+			goto exit;
+		}
+	}
+
+exit:
+	close(fd);
+freemem:
+	free(tags);
+	free(procfs_entries);
+	return ret;
+}
+
 int main(int argc, char *argv[])
 {
 	int ret;
 
-	ksft_set_plan(2);
+	ksft_set_plan(4);
 
 	ret = test_filename_filter();
 	if (ret == KSFT_SKIP)
@@ -309,5 +489,17 @@ int main(int argc, char *argv[])
 	else
 		ksft_test_result(ret == KSFT_PASS, "test_function_filter\n");
 
+	ret = test_size_filter();
+	if (ret == KSFT_SKIP)
+		ksft_test_result_skip("Skipping test_size_filter\n");
+	else
+		ksft_test_result(ret == KSFT_PASS, "test_size_filter\n");
+
+	ret = test_lineno_filter();
+	if (ret == KSFT_SKIP)
+		ksft_test_result_skip("Skipping test_lineno_filter\n");
+	else
+		ksft_test_result(ret == KSFT_PASS, "test_lineno_filter\n");
+
 	ksft_finished();
 }
-- 
2.54.0.746.g67dd491aae-goog

