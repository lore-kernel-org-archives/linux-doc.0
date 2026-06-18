Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71F13546C6
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 17:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781804206; cv=none; b=KDtPKZCLaaaxHKn1NQ5onVPMrOAjuQEqQAcYpW+GTxfUWRQHqfmrQfPpBFolY1MdJefXfPEeVfUYfBCkgWMmlnuY+J/GOyjqnqlMUZtomU3l7dtZLyRMYJF7kWScV2c5t4Z8lMtPyg2+7H1XoTi2fSZ2tC8m/8e9zAXGiBkGVvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781804206; c=relaxed/simple;
	bh=G+/S/zBUNlacXIpXt9A+VSLEyCZDWOzWrppcM7qUM7Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Tpknpd06QVqm+qOyHWPAfxqSsFO6lLnf/C6o1mgDxmduErM/btSQffzhNwXKW331206ffwfeK17/Qru08KQ1Jo92g2TCUJRntIwxmWltq6DzRzZzAsdBq9+EjRQRwZ+aSM6niOfjpxc5dfSihfY7TEF2FipwVsVt3gq593HkSyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NjO0kF4C; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NjO0kF4C"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-13992d6a729so3337039c88.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 10:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781804204; x=1782409004; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SJ5dFOiSjPf9OrULYCjNPZvX3O6ck7gOoqkGo0Qh7k8=;
        b=NjO0kF4CjZclqwOfLNTN5k+NQ5+T6GhesIm5DnG0riE7616mcC53UliqK/YtkbdePH
         4AgxXwGyxDMHBQr74VCiC/VMuQuaiBb8/t+OEsNro88k39oHBRH9UMIVGhhWKuO+CBMk
         HrgPuMudKy5a6TwZ0kxRlqeGHgamWoRX9lF4RGkYnOVF/tkLuYQE0d3aOTsEN/A954aG
         cAe31T7t+H0iAhSY6uDNI261wTOSRtM0pWmZNbA3xfmr/YVfingBPxuC2Fd6yhTA9jIl
         KPvjN8ZmTasCnk91Ktmk+lXIJnv8DRzKc5ya8bE4GH+mMj7YYPGfZXCycFPi4idGaEoF
         rPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781804204; x=1782409004;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SJ5dFOiSjPf9OrULYCjNPZvX3O6ck7gOoqkGo0Qh7k8=;
        b=qAqtcO/KvGnjw+zlFbE1dKGiM+3mop1JmOwvn6Bnti5PwVGTz8E/WV7bZzYYnFIYi6
         sJP026XmmI23VOL25QsNcNh+zE6sJ/5TP5CgjVEtHvofP07KFOPyOmB4cw9TbVZvNpC6
         DKVb4GJLHa8HyKsAiPRu/2lLzERgLrqK0XjA1AmWxlV9c0oo7KtUAup+v2rq3d5Khnqr
         PAvRhrLt0b51kmn2E8eGHcf+4XKlMrVYIgIPEBCEIqRS7SM1HVPh2gRyEKykpDAiP4VZ
         8F6YSeMnk0oPeEeNg1qA0j9X/yYBNf1zt7kCqxfX3v5YDSSrGLQ0NNhbhd6bvnWWPV3e
         0hcg==
X-Forwarded-Encrypted: i=1; AFNElJ9qyGXEKkeo6gcE4rI1iHkcaN7dCZqUNeEoIy0zYd0+OfFz9tkVTRbxm0PRSJh/vCWF1elAQLw+0cE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXfl3UUCGZXqiA69EAzAvPlnDHZPNuwKprCfeOgEoUARg807Jf
	/xN76V6hJAL1wlPSK62WVLYbq3zYEMdAMrhzsbnMUuep38VMCvKNvODFaEseQsPzSyaiOYEi90j
	0M69EJEogLzvOdyAsradndyKfEgv/XMxKQA==
X-Received: from dyer31.prod.google.com ([2002:a05:7300:231f:b0:304:2d1f:6ca6])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:911:b0:134:df7f:910d with SMTP id a92af1059eb24-139a2035fdemr476935c88.7.1781804203522;
 Thu, 18 Jun 2026 10:36:43 -0700 (PDT)
Date: Thu, 18 Jun 2026 17:36:34 +0000
In-Reply-To: <cover.1781803482.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1781803482.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.55.0.rc0.786.g65d90a0328-goog
Message-ID: <1d729195a8d11fadb1a1fb78c64633d46843ffe3.1781803482.git.abhishekbapat@google.com>
Subject: [PATCH v6 5/6] kselftest: alloc_tag: add kselftest for ioctl interface
From: Abhishek Bapat <abhishekbapat@google.com>
To: Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Hao Ge <hao.ge@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Sourav Panda <souravpanda@google.com>, Abhishek Bapat <abhishekbapat@google.com>
Content-Type: text/plain; charset="UTF-8"

Introduce a kselftest to verify the new IOCTL-based interface for
/proc/allocinfo. The test covers:

1. Validation of the filename filter.
2. Validation of the function filter.

The first test validates the functionality of the filename filter. Using
"mm/memory.c" as the candidate filename filter, it retrieves filtered
entries from both procfs and ioctl and matches the first VEC_MAX_ENTRIES
entries.

The second test validates the functionality of the function filter.
It uses "dup_mm" as the candidate function as we do not expect this
function name to change frequently and hence won't be needing to modify
this test often.

Note that both the tests match line no, function name and file name
fields. Bytes allocated and calls are not matched as those values may
change in the time when the data is being read from procfs and ioctl and
hence can lead to false negatives.

Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
---
 MAINTAINERS                                   |   1 +
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/alloc_tag/Makefile    |   9 +
 .../alloc_tag/allocinfo_ioctl_test.c          | 335 ++++++++++++++++++
 4 files changed, 346 insertions(+)
 create mode 100644 tools/testing/selftests/alloc_tag/Makefile
 create mode 100644 tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 019cc4c285a3..6610dd42e484 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16715,6 +16715,7 @@ F:	include/linux/alloc_tag.h
 F:	include/linux/pgalloc_tag.h
 F:	include/uapi/linux/alloc_tag.h
 F:	lib/alloc_tag.c
+F:	tools/testing/selftests/alloc_tag/
 
 MEMORY CONTROLLER DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 6e59b8f63e41..276a78c64736 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 TARGETS += acct
+TARGETS += alloc_tag
 TARGETS += alsa
 TARGETS += amd-pstate
 TARGETS += arm64
diff --git a/tools/testing/selftests/alloc_tag/Makefile b/tools/testing/selftests/alloc_tag/Makefile
new file mode 100644
index 000000000000..f2b8fc022c3b
--- /dev/null
+++ b/tools/testing/selftests/alloc_tag/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+
+TEST_GEN_PROGS := allocinfo_ioctl_test
+
+CFLAGS += -Wall
+CFLAGS += -I../../../../usr/include
+
+include ../lib.mk
+
diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
new file mode 100644
index 000000000000..1ae0291f2245
--- /dev/null
+++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* kselftest for allocinfo ioctl
+ * allocinfo ioctl retrives allocinfo data through ioctl
+ * Copyright (C) 2026 Google, Inc.
+ */
+
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <stdbool.h>
+#include <unistd.h>
+#include <sys/ioctl.h>
+#include <linux/types.h>
+#include <linux/alloc_tag.h>
+#include "../kselftest.h"
+
+#define MAX_LINE_LEN		512
+#define ALLOCINFO_PROC		"/proc/allocinfo"
+
+enum ioctl_ret {
+	IOCTL_SUCCESS = 0,
+	IOCTL_FAILURE = 1,
+	IOCTL_INVALID_DATA = 2,
+};
+
+#define VEC_MAX_ENTRIES 32
+
+struct allocinfo_tag_data_vec {
+	struct allocinfo_tag_data tag[VEC_MAX_ENTRIES];
+	__u64 count;
+};
+
+static inline int __allocinfo_get_content_id(int dev_fd, struct allocinfo_content_id *params)
+{
+	return ioctl(dev_fd, ALLOCINFO_IOC_CONTENT_ID, params);
+}
+
+static inline int __allocinfo_get_at(int dev_fd, struct allocinfo_get_at *params)
+{
+	return ioctl(dev_fd, ALLOCINFO_IOC_GET_AT, params);
+}
+
+static inline int __allocinfo_get_next(int dev_fd, struct allocinfo_tag_data *params)
+{
+	return ioctl(dev_fd, ALLOCINFO_IOC_GET_NEXT, params);
+}
+
+static bool match_entry(const struct allocinfo_tag_data *procfs_entry,
+			const struct allocinfo_tag_data *tag_data,
+			bool match_bytes, bool match_calls, bool match_lineno,
+			bool match_function, bool match_filename)
+{
+	if (match_bytes && tag_data->counter.bytes != procfs_entry->counter.bytes) {
+		ksft_print_msg("size retrieved through ioctl does not match procfs\n");
+		return false;
+	}
+
+	if (match_calls && tag_data->counter.calls != procfs_entry->counter.calls) {
+		ksft_print_msg("call count retrieved through ioctl does not match procfs\n");
+		return false;
+	}
+
+	if (match_lineno && tag_data->tag.lineno != procfs_entry->tag.lineno) {
+		ksft_print_msg("lineno retrieved through ioctl does not match procfs\n");
+		return false;
+	}
+
+	if (match_function &&
+	    strncmp(tag_data->tag.function, procfs_entry->tag.function, ALLOCINFO_STR_SIZE)) {
+		ksft_print_msg("function retrieved through ioctl does not match procfs\n");
+		return false;
+	}
+
+	if (match_filename &&
+	    strncmp(tag_data->tag.filename, procfs_entry->tag.filename, ALLOCINFO_STR_SIZE)) {
+		ksft_print_msg("filename retrieved through ioctl does not match procfs\n");
+		return false;
+	}
+	return true;
+}
+
+static bool match_entries(const struct allocinfo_tag_data_vec *procfs_entries,
+			  const struct allocinfo_tag_data_vec *tags,
+			  bool match_bytes, bool match_calls, bool match_lineno,
+			  bool match_function, bool match_filename)
+{
+	__u64 i;
+
+	if (procfs_entries->count != tags->count) {
+		ksft_print_msg("Entry count mismatch. ioctl entries: %llu, proc entries: %llu\n",
+			       tags->count, procfs_entries->count);
+		return false;
+	}
+	for (i = 0; i < procfs_entries->count; i++) {
+		if (!match_entry(&procfs_entries->tag[i], &tags->tag[i],
+				 match_bytes, match_calls, match_lineno,
+				 match_function, match_filename)) {
+			ksft_print_msg("%lluth entry does not match.\n", i);
+			return false;
+		}
+	}
+	return true;
+}
+
+static const char *allocinfo_str(const char *str)
+{
+	size_t len = strlen(str);
+
+	if (len >= ALLOCINFO_STR_SIZE)
+		str += (len - ALLOCINFO_STR_SIZE) + 1;
+	return str;
+}
+
+static void allocinfo_copy_str(char *dest, const char *src)
+{
+	strncpy(dest, allocinfo_str(src), ALLOCINFO_STR_SIZE - 1);
+	dest[ALLOCINFO_STR_SIZE - 1] = '\0';
+}
+
+static int get_filtered_procfs_entries(struct allocinfo_tag_data_vec *procfs_entries,
+				       const struct allocinfo_filter *filter)
+{
+	FILE *fp = fopen(ALLOCINFO_PROC, "r");
+	char line[MAX_LINE_LEN];
+	int matches;
+	struct allocinfo_tag_data procfs_entry;
+
+	if (!fp) {
+		ksft_print_msg("Failed to open " ALLOCINFO_PROC " for reading\n");
+		return 1;
+	}
+	memset(procfs_entries, 0, sizeof(*procfs_entries));
+	while (fgets(line, sizeof(line), fp) && procfs_entries->count < VEC_MAX_ENTRIES) {
+		char filename[MAX_LINE_LEN];
+		char function[MAX_LINE_LEN];
+
+		memset(&procfs_entry, 0, sizeof(procfs_entry));
+		matches = sscanf(line, "%llu %llu %[^:]:%llu func:%s",
+				 &procfs_entry.counter.bytes,
+				 &procfs_entry.counter.calls,
+				 filename,
+				 &procfs_entry.tag.lineno,
+				 function);
+
+		if (matches != 5)
+			continue;
+
+		allocinfo_copy_str(procfs_entry.tag.filename, filename);
+		allocinfo_copy_str(procfs_entry.tag.function, function);
+
+		if (filter->mask & ALLOCINFO_FILTER_MASK_FILENAME) {
+			if (strncmp(procfs_entry.tag.filename,
+				    filter->fields.filename, ALLOCINFO_STR_SIZE))
+				continue;
+		}
+		if (filter->mask & ALLOCINFO_FILTER_MASK_FUNCTION) {
+			if (strncmp(procfs_entry.tag.function,
+				    filter->fields.function, ALLOCINFO_STR_SIZE))
+				continue;
+		}
+		if (filter->mask & ALLOCINFO_FILTER_MASK_LINENO) {
+			if (procfs_entry.tag.lineno != filter->fields.lineno)
+				continue;
+		}
+		if (filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) {
+			if (procfs_entry.counter.bytes < filter->min_size)
+				continue;
+		}
+		if (filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) {
+			if (procfs_entry.counter.bytes > filter->max_size)
+				continue;
+		}
+
+		memcpy(&procfs_entries->tag[procfs_entries->count++], &procfs_entry,
+		       sizeof(procfs_entry));
+	}
+	fclose(fp);
+	return 0;
+}
+
+static enum ioctl_ret get_filtered_ioctl_entries(struct allocinfo_tag_data_vec *tags,
+						 const struct allocinfo_filter *filter,
+						 __u64 start_pos)
+{
+	int fd = open(ALLOCINFO_PROC, O_RDONLY);
+
+	if (fd < 0) {
+		ksft_print_msg("Failed to open " ALLOCINFO_PROC " for IOCTL\n");
+		return IOCTL_FAILURE;
+	}
+
+	struct allocinfo_content_id start_cont_id, end_cont_id;
+	struct allocinfo_get_at get_at_params;
+	const int max_retries = 10;
+	int retry_count = 0;
+	int status;
+
+	/*
+	 * __allocinfo_get_content_id may return different values if a kernel module was loaded
+	 * between the two calls. If that happens, the data gathered cannot be considered consistent
+	 * and hence needs to be fetched again to avoid flakiness.
+	 */
+	do {
+		if (__allocinfo_get_content_id(fd, &start_cont_id)) {
+			ksft_print_msg("allocinfo_get_content_id failed\n");
+			status = IOCTL_FAILURE;
+			goto exit;
+		}
+
+		memset(tags, 0, sizeof(*tags));
+		memset(&get_at_params, 0, sizeof(get_at_params));
+		memcpy(&get_at_params.filter, filter, sizeof(*filter));
+		get_at_params.pos = start_pos;
+		if (__allocinfo_get_at(fd, &get_at_params)) {
+			ksft_print_msg("allocinfo_get_at failed\n");
+			status = IOCTL_FAILURE;
+			goto exit;
+		}
+		memcpy(&tags->tag[tags->count++], &get_at_params.data, sizeof(get_at_params.data));
+
+		while (tags->count < VEC_MAX_ENTRIES &&
+		       __allocinfo_get_next(fd, &tags->tag[tags->count]) == 0)
+			tags->count++;
+
+		if (__allocinfo_get_content_id(fd, &end_cont_id)) {
+			ksft_print_msg("allocinfo_get_content_id failed\n");
+			status = IOCTL_FAILURE;
+			goto exit;
+		}
+
+		if (start_cont_id.id == end_cont_id.id) {
+			status = IOCTL_SUCCESS;
+		} else {
+			ksft_print_msg("allocinfo_get_content_id mismatch, retrying...\n");
+			status = IOCTL_INVALID_DATA;
+		}
+	} while (status == IOCTL_INVALID_DATA && retry_count++ < max_retries);
+
+exit:
+	close(fd);
+	return status;
+}
+
+static int run_filter_test(const struct allocinfo_filter *filter)
+{
+	struct allocinfo_tag_data_vec *tags = malloc(sizeof(*tags));
+	struct allocinfo_tag_data_vec *procfs_entries = malloc(sizeof(*procfs_entries));
+	int ioctl_status;
+	int ret = KSFT_PASS;
+
+	if (!tags || !procfs_entries) {
+		ksft_print_msg("Memory allocation failed.\n");
+		ret = KSFT_FAIL;
+		goto exit;
+	}
+
+	if (get_filtered_procfs_entries(procfs_entries, filter)) {
+		ksft_print_msg("Error retrieving entries from " ALLOCINFO_PROC "\n");
+		ret = KSFT_SKIP;
+		goto exit;
+	}
+
+	if (procfs_entries->count == 0) {
+		ksft_print_msg("No entries found in " ALLOCINFO_PROC ", skipping test\n");
+		ret = KSFT_SKIP;
+		goto exit;
+	}
+
+	ioctl_status = get_filtered_ioctl_entries(tags, filter, 0);
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
+	if (!match_entries(procfs_entries, tags, false, false, true, true, true))
+		ret = KSFT_FAIL;
+
+exit:
+	free(tags);
+	free(procfs_entries);
+	return ret;
+}
+
+static int test_filename_filter(void)
+{
+	struct allocinfo_filter filter;
+	const char *target_filename = "mm/memory.c";
+
+	memset(&filter, 0, sizeof(filter));
+	filter.mask |= ALLOCINFO_FILTER_MASK_FILENAME;
+	strncpy(filter.fields.filename, target_filename, ALLOCINFO_STR_SIZE);
+
+	return run_filter_test(&filter);
+}
+
+static int test_function_filter(void)
+{
+	struct allocinfo_filter filter;
+	const char *target_function = "dup_mm";
+
+	memset(&filter, 0, sizeof(filter));
+	filter.mask |= ALLOCINFO_FILTER_MASK_FUNCTION;
+	strncpy(filter.fields.function, target_function, ALLOCINFO_STR_SIZE);
+
+	return run_filter_test(&filter);
+}
+
+int main(int argc, char *argv[])
+{
+	int ret;
+
+	ksft_set_plan(2);
+
+	ret = test_filename_filter();
+	if (ret == KSFT_SKIP)
+		ksft_test_result_skip("Skipping test_filename_filter\n");
+	else
+		ksft_test_result(ret == KSFT_PASS, "test_filename_filter\n");
+
+	ret = test_function_filter();
+	if (ret == KSFT_SKIP)
+		ksft_test_result_skip("Skipping test_function_filter\n");
+	else
+		ksft_test_result(ret == KSFT_PASS, "test_function_filter\n");
+
+	ksft_finished();
+}
-- 
2.55.0.rc0.786.g65d90a0328-goog

