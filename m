Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420F0438476
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 18:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783362362; cv=none; b=t8ALBbwjs9f1KhPnrq/UwlunnYhMjYFakR8xPvK847zlDaMLCNYY9+Hd7MZSgVi+nVPAYtaXbVlYJNBRizhJfwLiY3A14JbSURYFS7Jd+HR7jNw/wbO3uMwsjtSElqbHmYvnd8Nbo2sfiBo/K33bEO92ClgeYZ9c5bed1uRhnAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783362362; c=relaxed/simple;
	bh=szRgRYhp4Fyr1P7OuIBH8t1P7X6YiNOzG8yuKluGkPo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oiJC6Usyov9swQPVOWDh2eOg3pxdTttzehb+QegQz/bpwnOD9Pj+Sba9zFRuCBBNa5Vt8LvS1e7lW/ikRBd8D+dK1dj3+KGcNRMMYlrGWzvmb03nufTBSgtSvamToi7C5o2i7NzSVNmN0aytMqMUumjb5iD2yq/tNsBuiNUFi7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rY4ZKX11; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rY4ZKX11"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c89704da8c7so5200291a12.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 11:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783362359; x=1783967159; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ebmkLDICYIqxaCrg+8iTMuP4BfhYuBwhF0kMyFUSvM=;
        b=rY4ZKX11DcyMF/JodZLm+a3KrItnA9Ieo/NZDcUBk8jBt9VOvG8AWYfB1HxpqsI3XA
         rpuDwVLLKw4RmvoWjb4Jl14dGBX2L0Hq4Y6mypEkU+7n1ogt4k9/ZY9ktZEl0Gczh228
         N/yCZkl2xAcI7OTWWtYSjEilIVM7UoAvW4zJc1pMrKVUAaPHxEWUwdl+unFAhOP281eP
         da2GBx9pbHbnCWqJuvVO+nxGBiKd5RRw9f9QfIsuPRuG1jY/VXGkkNAkaVYri4T7DqXF
         91LYamE4GZ0v3oMMPyHZxdmEr1nrja0LrO9UoB79iLkgkGgPwBNNo1Q7+/zI8e5uLpT0
         b+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783362359; x=1783967159;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ebmkLDICYIqxaCrg+8iTMuP4BfhYuBwhF0kMyFUSvM=;
        b=A/Ms9xUPGLeCN8lsQb6RKNNNv9OLMK8E8wlg4RF3gb3JST7dj4jVkUN+n/cXPtxW5o
         jzvgeq28qQaL032YpM0PUtK1v313ue5QdR6JgalaJUQgnqPE1Q20m5wPXLCgq8m97RB1
         CRLmwTrc81LGNb9emeubpJ7RvtWrMmy7Bw5ZtsrCLoShFkHY+b8yymNTkxD0q2c2Z589
         +63bySDESv30iyei4FO9+TJ3keW9o1WkHeGNS5cPIDczI27u1ZwBVrE7/Q92qq7Ol6dQ
         Qt2E6+ryz/d9gBz6ddyTx9q/Z2qZXZtyq17tqc5/g1vPQqoTMwQlVmmwuQCwmSsP9IWU
         3O4A==
X-Forwarded-Encrypted: i=1; AHgh+RoS1wYQqHIak7pcw1uoFxDdnjns97auQ3zuG3uLgFIUeqX2YzJ5CBBo+wB50f96vpxKrq5qcOVHn7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzI/XhoYwr0Mk0AgwOHttwMNgPcgKaMeXNVcANqDOYVL5RfNwO
	MvQx49hXf3JBu+K6E9aoLXOK+UncpuCo47EjW5hAnQqO3+Qci9Onjoa6Z5pb6gxXLt/BydxopMP
	TApHTlu2XgwAt8KwvEcTA0kajLFk2/F2Bwg==
X-Received: from dleb18-n2.prod.google.com ([2002:a05:701b:4252:20b0:13b:4702:ac79])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:2d43:b0:3bf:6c08:fba7 with SMTP id adf61e73a8af0-3c08f032c79mr2143625637.59.1783362359350;
 Mon, 06 Jul 2026 11:25:59 -0700 (PDT)
Date: Mon,  6 Jul 2026 18:25:49 +0000
In-Reply-To: <cover.1783361692.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1783361692.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <f6bd1ff0257987dbb7512f93595eaa6962c6153b.1783361692.git.abhishekbapat@google.com>
Subject: [PATCH v7 6/6] kselftest: alloc_tag: extend the allocinfo ioctl kselftest
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
index 9ce7b53078b1..092348097204 100644
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
+		ret = KSFT_FAIL;
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
+			ret = KSFT_FAIL;
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
+		ret = KSFT_FAIL;
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
2.55.0.rc2.803.g1fd1e6609c-goog

