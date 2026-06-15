Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7687E3BED7F
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 23:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781564687; cv=none; b=QyaQl9MCyjW80bLqVSN08s8KVB5UHgqhsAXn+5tjh4aGthKPo6IJSOIXelqXWEP16NqbSaZZdbKWBIIU2M9/V+qiBPkSdnvZnE51Z3t3IhRFS8xAvSahrAXbXrW1ynvL2iplsIsH+/lfidkOEI86guSyCja6Mg5zPgYxQiCZwe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781564687; c=relaxed/simple;
	bh=WG2iknUXIXfXnabDYeOKj3jFUn8Ns8a9PablUCHoUls=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SmrGUcKDr29Fhj/S+AYAM94hUb7bH7mdaYz3Fm1nbwCZt9ENa9NX4VTAHtP1enkKVLEPbF0HCKYkxEEqBEDkVaDhOdq7TKX2yYOK3omz+CCU7QN2qVkxx3N2YC4BPHialvEJa+qz+M7n0VAaMLfe/ive0MQkir1ltcID63z2qHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t6OsMbuN; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t6OsMbuN"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-1394c3ee7f2so8980270c88.1
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 16:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781564682; x=1782169482; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FeItXqTRSsd8a3mh0BbwLUsEpRnHJQ/3Kv211NGnNd0=;
        b=t6OsMbuNDUKrp22KNh6sc9DQ3CTziNOmtXhrjcqzTHLJgKMr3ZpwMRkKCA3xTzODmo
         /S8u571e316WQFsQQ//RMPCHEKhi2iyc01DFQZDs+rMcNrie/m4PL/uChOhfrotAgchL
         WAzVLfyzVYQeYqWc+gCx26+uNjPtXCav9LVHoSVxAqMMXSxjvAokYSymKmVQSEzDpDvb
         XO22V5IBxtPWKsH0YxeF/n7OISeSjOzPxcRyOgHGDs2bk5nBN1ZyC2gNkytP966HJXYB
         /PsK59GePas1aDUq9YkfzygX6qgkzqsWO9qXFoU949ZLTWEfioYMyIQSEmEG+Ug/kmpU
         NUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781564682; x=1782169482;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FeItXqTRSsd8a3mh0BbwLUsEpRnHJQ/3Kv211NGnNd0=;
        b=hW9yoYw7i/Q+kpOvJ2Fd5jLRgs3rHyXJopbWFB0Pb5EMUjAJou40GnrqVTP9TPYQ/Q
         WJw/7IgEk3RN/Xa8jqjG5V1Z7HbhBigKy1vFs1RSfNp4/6Y4EVNjZRoChjdUWPfhc7BT
         U+o66u7PrbYkPq9tHerqRCPxX9dXWvn1uWgbkl2WXOPhWCWoZ7DtfjyYMBO3IVbUkW0i
         gsvhYV42pjBuir9n4yAieNRYLnW2BbqjeRO1nh89PfSaIJdaymqT2/Je+0+D1hTBYQre
         lmz5ypkLIE7JrebIq6dqrMc+hTUVUES+TDV3OQ5pV4HrM8pYGH5cmLp6ARa0KjY3mCVC
         QYGA==
X-Forwarded-Encrypted: i=1; AFNElJ/8UbzmcRjqqZEgxz0Gi1bN7VjZRbo47ewDEJ6IfQcUPIujIeewlZHMDIY1VLXjQB4+WO1br9us3/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVfIXidQWxDYGn/eb72XLjkMckjx72qtmMOxtd+DxQ/TRy1Zm5
	/ycMKt7Avy4Cbyk1DMR+Co3mqjlxFmOPc+cWu87/4xtfVfgSPoxAn/mbsifSDhOoZSqkjG0341K
	3YACuXnCh55cnZJlVVoj0wPQr4ODdGTcu6Q==
X-Received: from dlbrn1.prod.google.com ([2002:a05:7022:1501:b0:138:3d1:7932])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:1b05:b0:12d:b66f:35d7 with SMTP id a92af1059eb24-1386f245655mr5972156c88.10.1781564681156;
 Mon, 15 Jun 2026 16:04:41 -0700 (PDT)
Date: Mon, 15 Jun 2026 23:04:31 +0000
In-Reply-To: <cover.1781564384.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1781564384.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <1a68864b1493528abed0e9e3489688fc6287c37e.1781564384.git.abhishekbapat@google.com>
Subject: [PATCH v5 6/6] kselftest: alloc_tag: extend the allocinfo ioctl kselftest
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
 .../alloc_tag/allocinfo_ioctl_test.c          | 197 +++++++++++++++++-
 1 file changed, 196 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
index 62d5a488a04d..041fee1a3d74 100644
--- a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
+++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
@@ -309,11 +309,194 @@ static int test_function_filter(void)
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
+	bool found;
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
+		found = false;
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
+					found = true;
+					break;
+				}
+			}
+
+			if (found || tags->count < VEC_MAX_ENTRIES)
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
+	if (start_cont_id.id == end_cont_id.id && !found) {
+		ksft_print_msg("Entry with function %s not found in IOCTL results\n",
+			       target_function);
+		ret = KSFT_FAIL;
+	} else if (start_cont_id.id != end_cont_id.id) {
+		ksft_print_msg("Failed to match content_ids for procfs and IOCTL, skipping...\n");
+		ret = KSFT_SKIP;
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
+	 * We depend on the result of procfs entries to create the ioctl_filter. Hence we
+	 * cannot recycle the run_filter_test function here.
+	 */
+	target_lineno = procfs_entries->tag[0].tag.lineno;
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
@@ -327,5 +510,17 @@ int main(int argc, char *argv[])
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
2.54.0.1136.gdb2ca164c4-goog

