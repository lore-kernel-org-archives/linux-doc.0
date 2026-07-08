Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6E647F2E1
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 18:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783533698; cv=none; b=R6xxrSOH5aPS/JnzY/yfZlB7ifFDnTjvMqyRBPQbTAtTqFpLA98fFFrHaLliXi1LtVT2egtKEZNZ7sk2F47eRd1IqVeXV5xh6gxU+feL1NLxmp/Yup3rx025uJeOYV3KuoUfRKDp3NeOxdzR8SYyaqH0q1EfhqmhAqZ9+KYY9kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783533698; c=relaxed/simple;
	bh=sqWIgudGTpUeV4ZuCiP029XN1a8xuVLkuWwCH9LVg4k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z/ZKyOzyCIjNw/BY7/CZRJmeobyCFBkxVdMrq0u1ExI2HYcpsnavVlQImd2hVswCX2mmai6gOQKk/hDMLYgp7bLI/KyRPCpqIrPU7rzA3jAgh56uX2wPVnwBPaBNUuenvK84JXkNtJtZEu1UZjdxhCS5nkxa2TBMJHB77XFn6zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pZ+0X43H; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pZ+0X43H"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2cacd6d37edso18420475ad.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 11:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783533695; x=1784138495; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T7UKXB2WhHPZfBUr+7nlWpVJ1Kl8ZwGizFgFGzwoYUY=;
        b=pZ+0X43HhdopVL4ac55B9/Ja5ol8XL9uAxGCU1UCOGfnziDC7YycbEimPHFzroWbOj
         x0PbB30X6WzIZmbqd2WB186+lzoVCMOixcgycZH0K+SGzfrgn6JbakPgPPeIyh59h+9x
         lk0WjaUgs5IzIA8NVkLzx2dwsMF6mO9XVXk/VaD1IiLX/XvfXTn3M3333uFug1mF9/Oj
         Fk7qfxqdQeWMlHr0u5icmh5Um/4AhrOhA5o5U5KeCicsK7/3NerJ3X2GgrQP6NN0xGkX
         jfHUOGba7Vlx0o4gwznsPKhro7PUPw7DQ3qMc6ORthloriBg7fdk8LIgXtZ7J4zebhc+
         ak3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783533695; x=1784138495;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T7UKXB2WhHPZfBUr+7nlWpVJ1Kl8ZwGizFgFGzwoYUY=;
        b=DOYYDhjqKj4/j68N3DsNoEK9Dg0mhKNmTygZqk65OvuL2dSgAdC/jx46QahGfe990A
         g8p7YYioFEt/3LtALVpOBnq6cLq9/uaugugz3RdZMvwHw9DCYfs6fxhnILg5EH0wodNs
         UOkUErDvab6UJI8QdnXWvaIsDCPoyf6nZs2+Smns9EhhBtIXVPexJNcyT+BlXcg0o2MD
         g0bujvj+PGao4sysiTlyS0xtgcWciw42P9lfHRdpibikb7FyHodRpZ/bTUK4drTH8qWY
         ClVlQ6qDENpIVFRowdS/MRg2jb1wSKg6MgcPGd6xYl0VKLl4Qf4zcHnx+qbQFW3/V/K+
         TSmg==
X-Forwarded-Encrypted: i=1; AHgh+Rq0UB9LuxX8Zr7cZurTtwISPdApltAvrY0ZT5pCFLuqZWnX4I0pXU/WcxKX7EVgA4TOjhd4p61IjRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxY5DitvuE1jgxxgpm4vXpmI4x81u7mTkRmMJobgRKagNzk+j6
	DQIS4quETWSvHAYg4MElS+j1/Uu5hEYTNkkQC6ss6gEArpLAu/c2aBQSkB+SiHXABIv++5HVsdj
	hbhkyjwEa7FSeWgxWNIQybdlckLVLCxkYbA==
X-Received: from dycme2.prod.google.com ([2002:a05:693c:2402:b0:30c:2df8:2138])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:28c3:b0:37f:db06:2299 with SMTP id 98e67ed59e1d1-38942f70dfbmr3593771a91.21.1783533694942;
 Wed, 08 Jul 2026 11:01:34 -0700 (PDT)
Date: Wed,  8 Jul 2026 18:01:28 +0000
In-Reply-To: <cover.1783532853.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1783532853.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <e5171926b48802531284c1cb5f04734017141341.1783532853.git.abhishekbapat@google.com>
Subject: [PATCH v8 6/6] kselftest: alloc_tag: extend the allocinfo ioctl kselftest
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
 .../alloc_tag/allocinfo_ioctl_test.c          | 216 +++++++++++++++++-
 1 file changed, 215 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
index 9ce7b53078b1..7d94abb785a1 100644
--- a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
+++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2026 Google, Inc.
  */
 
+#include <errno.h>
 #include <fcntl.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -312,11 +313,212 @@ static int test_function_filter(void)
 	return run_filter_test(&filter);
 }
 
+static int test_size_filter(void)
+{
+	int fd;
+	struct allocinfo_tag_data_vec *tags = malloc(sizeof(*tags));
+	struct allocinfo_tag_data_vec *procfs_entries = malloc(sizeof(*procfs_entries));
+	struct allocinfo_filter filter;
+	int ret = KSFT_PASS;
+	__u64 target_size, i, pos;
+	struct allocinfo_tag_data *found_tag = NULL;
+	const char *target_function = "do_init_module";
+	struct allocinfo_content_id start_cont_id, end_cont_id;
+	int retry = 0;
+	const int max_retries = 10;
+
+	if (!tags || !procfs_entries) {
+		ksft_print_msg("Memory allocation failed.\n");
+		ret = KSFT_FAIL;
+		goto freemem;
+	}
+
+	fd = open(ALLOCINFO_PROC, O_RDONLY);
+	if (fd < 0) {
+		ksft_print_msg("Failed to open " ALLOCINFO_PROC ": %s\n", strerror(errno));
+		ret = KSFT_SKIP;
+		goto freemem;
+	}
+
+	do {
+		found_tag = NULL;
+		pos = 0;
+
+		if (__allocinfo_get_content_id(fd, &start_cont_id)) {
+			ksft_print_msg("allocinfo_get_content_id failed\n");
+			ret = KSFT_FAIL;
+			goto exit;
+		}
+
+		memset(&filter, 0, sizeof(filter));
+		filter.mask |= ALLOCINFO_FILTER_MASK_FUNCTION;
+		strncpy(filter.fields.function, target_function, ALLOCINFO_STR_SIZE);
+
+		if (get_filtered_procfs_entries(procfs_entries, &filter)) {
+			ksft_print_msg("Error retrieving entries from " ALLOCINFO_PROC "\n");
+			ret = KSFT_SKIP;
+			goto exit;
+		}
+
+		if (procfs_entries->count == 0) {
+			ksft_print_msg("Function %s not found in procfs\n", target_function);
+			ret = KSFT_SKIP;
+			goto exit;
+		}
+
+		target_size = procfs_entries->tag[0].counter.bytes;
+
+		memset(&filter, 0, sizeof(filter));
+		filter.mask |= ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_MASK_MAX_SIZE;
+		filter.min_size = target_size;
+		filter.max_size = target_size;
+
+		while (1) {
+			struct allocinfo_get_at get_at_params;
+
+			memset(&get_at_params, 0, sizeof(get_at_params));
+			memcpy(&get_at_params.filter, &filter, sizeof(filter));
+			get_at_params.pos = pos;
+
+			if (__allocinfo_get_at(fd, &get_at_params))
+				break;
+
+			tags->count = 0;
+			memcpy(&tags->tag[tags->count++], &get_at_params.data,
+			       sizeof(get_at_params.data));
+
+			while (tags->count < VEC_MAX_ENTRIES &&
+			       __allocinfo_get_next(fd, &tags->tag[tags->count]) == 0)
+				tags->count++;
+
+			for (i = 0; i < tags->count; i++) {
+				if (strcmp(tags->tag[i].tag.function, target_function) == 0) {
+					found_tag = &tags->tag[i];
+					break;
+				}
+			}
+
+			if (found_tag || tags->count < VEC_MAX_ENTRIES)
+				break;
+
+			pos += tags->count;
+		}
+
+		if (__allocinfo_get_content_id(fd, &end_cont_id)) {
+			ksft_print_msg("allocinfo_get_content_id failed\n");
+			ret = KSFT_FAIL;
+			goto exit;
+		}
+
+		if (start_cont_id.id == end_cont_id.id)
+			break;
+
+		ksft_print_msg("Module load detected during size verification, retrying...\n");
+	} while (retry++ < max_retries);
+
+	if (start_cont_id.id == end_cont_id.id && !found_tag) {
+		ksft_print_msg("Entry with function %s not found in IOCTL results\n",
+			       target_function);
+		ret = KSFT_FAIL;
+	} else if (start_cont_id.id != end_cont_id.id) {
+		ksft_print_msg("Failed to match content_ids for procfs and IOCTL, skipping...\n");
+		ret = KSFT_SKIP;
+	} else if (found_tag && found_tag->counter.bytes != target_size) {
+		ksft_print_msg("IOCTL entry size %llu does not match target size %llu\n",
+			       found_tag->counter.bytes, target_size);
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
+	struct allocinfo_tag_data_vec *tags = malloc(sizeof(*tags));
+	struct allocinfo_tag_data_vec *procfs_entries = malloc(sizeof(*procfs_entries));
+	struct allocinfo_filter filter;
+	enum ioctl_ret ioctl_status;
+	int ret = KSFT_PASS;
+	__u64 target_lineno, i;
+	struct allocinfo_tag_data *target_tag;
+	bool found = false;
+
+	if (!tags || !procfs_entries) {
+		ksft_print_msg("Memory allocation failed.\n");
+		ret = KSFT_FAIL;
+		goto exit;
+	}
+
+	memset(&filter, 0, sizeof(filter));
+
+	if (get_filtered_procfs_entries(procfs_entries, &filter)) {
+		ksft_print_msg("Error retrieving entries from " ALLOCINFO_PROC "\n");
+		ret = KSFT_SKIP;
+		goto exit;
+	}
+	if (procfs_entries->count == 0) {
+		ksft_print_msg("Could not retrieve procfs entries\n");
+		ret = KSFT_SKIP;
+		goto exit;
+	}
+	/*
+	 * We depend on the procfs results to determine the line number for the filter before
+	 * making the ioctl query. Hence, we cannot reuse run_filter_test here.
+	 */
+	target_tag = &procfs_entries->tag[0];
+	target_lineno = target_tag->tag.lineno;
+
+	filter.mask |= ALLOCINFO_FILTER_MASK_LINENO;
+	filter.fields.lineno = target_lineno;
+
+	ioctl_status = get_filtered_ioctl_entries(tags, &filter, 0);
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
+	for (i = 0; i < tags->count; i++) {
+		if (tags->tag[i].tag.lineno != target_lineno) {
+			ksft_print_msg("IOCTL entry %llu has incorrect lineno %llu.\n",
+				       i, tags->tag[i].tag.lineno);
+			ret = KSFT_FAIL;
+			goto exit;
+		}
+
+		if (strncmp(tags->tag[i].tag.function, target_tag->tag.function,
+			    ALLOCINFO_STR_SIZE) == 0 &&
+		    strncmp(tags->tag[i].tag.filename, target_tag->tag.filename,
+			    ALLOCINFO_STR_SIZE) == 0)
+			found = true;
+	}
+
+	if (!found) {
+		ksft_print_msg("Original procfs entry not found in IOCTL lineno filter results.\n");
+		ret = KSFT_FAIL;
+	}
+
+exit:
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
@@ -330,5 +532,17 @@ int main(int argc, char *argv[])
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
2.55.0.795.g602f6c329a-goog

