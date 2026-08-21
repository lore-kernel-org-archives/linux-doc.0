Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A06A3E00A6
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 18:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338703; cv=none; b=SR3ce3aiS4Xqj701i1BugRbH+oUGZs3fTbOv+xQrEQK9HnC98HUTB1SDUDFIMh6dHUKtiWqTXS5RkMXq4eEyJWFPU8CetlDAhYUoLjMoi8gNz2nfSAqo49hzlJtvptfQzpEkHRLTJJ1EqjXV9L/DzNCbBqN5objxfa1q27bt2Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338703; c=relaxed/simple;
	bh=orQNNaUZmojI+/cs8egxOMQvuXgFqATETxJY+MjSr8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ep9y89pA21n3cdqckVy7YMJBwMU6l/2wBFPtpUuEM7l+Dj73ZPjazF9q8GB8iKgBHwxNIBpS8WLS0g7uxEcoHoKk0LUgcQ8M1p5GgAX9Y5gwDvOREIIoCyD4Jvo6lTHksPochToL3/QcDgPdE4V027j5PyBdUgvjwaU2qKhDjUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=elqGmklF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LUTohYnG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="elqGmklF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LUTohYnG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787338697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s7YiByawknR2bKXyMMS9faTlbP3TdC6Smi6Eshk/hFk=;
	b=elqGmklF1WztNFjRxpZyVozKNkAWiI7zgQlyeZuoUUY8C6ZpZOMVaqX7lsrqDPyGhi8HdN
	j5MJCzIeGebPFjXcVSvGa90bcnkU4b9nd0Pk/X8P2zFLYpv4blRQhTh7m1Ez4Kw7F4rpuu
	w5SqEQgdDlrB2YwF7LsYjCsConP914c=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-JOi-goHRNTGytC5xrvM48w-1; Fri, 21 Aug 2026 14:58:16 -0400
X-MC-Unique: JOi-goHRNTGytC5xrvM48w-1
X-Mimecast-MFC-AGG-ID: JOi-goHRNTGytC5xrvM48w_1787338696
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ea75996387so25541146d6.1
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 11:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787338696; x=1787943496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7YiByawknR2bKXyMMS9faTlbP3TdC6Smi6Eshk/hFk=;
        b=LUTohYnGVgS0R5QUoInTii2VjCg/+5rXJisqABF9/1YrnGD85Q/ypeEsU814uU4dvf
         0xrMkVBd02ZOz6f5jqxTqLVaJKSFY5dV5A0jzDqWAg7LwOeQEshximHrWaWQnYwujTOT
         wPK6UC9/tOtftYm5RgUGOG9jsfr+Gxdrihfet9i1DYE2LMr8IHU6BFYDCstzUIL+P3DM
         AtlL87lbWmGEIDHlfV+/dDaKp6GRo361CVlGFFYvsP7F4l8zzzCBcZ0iqgQHdiQDFbNt
         oyCpepwwcpdG8UyOO7QR2ZcLzgxfXH523NmJyVbhLcc7OXBs98jlmdbw4MqsCD4XkAPb
         v+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787338696; x=1787943496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s7YiByawknR2bKXyMMS9faTlbP3TdC6Smi6Eshk/hFk=;
        b=T4K66vjCdG/hobvgi3JyQKAtGDnEnM9FosG+MH83NBKTmMhkEvnmc9m6Y7osAxRpYK
         bz8sxy42Jgmnq7MBuDi58C5H5jzOddKThZzcz3msLN0Eqw7zuTy/Ds9dj3CgIPcBgPFK
         isjZqDb9LjnrE2+CpPN9yJbUXCdVAx9KfCe6eFxLW2Tb6ceR/V39J2RM/9ILHKUKrFn/
         PUfZmeuVpLALZK/xFsaf2xwCx6A+8D2As/HRU7smmN3epMdmaCUNp4UtnPL58LxBnEAm
         IRgmaiDP7D9UbCCEzfqBiuSj47RzZJrexHzRClznfLiAzb/O5pziQFw40SbKIgxJfHcj
         mZOQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAb8tZ8GF/rfHMAfbLJ9Yz926tcWlxSE++wfHX8jG4nlcsXDTX5U9NhMoVii0wDdTQg9OaN2ASBFs=@vger.kernel.org
X-Gm-Message-State: AFuF++mWz4tWZ4aTR4YfHmx2DYeOg0mTbaUh24WMioLmIkLwLFWvyrDm
	cvNwIA6gTG+tTLoRcMiWIIeSUXysFch6mSB19ed8ei9il4Lzr5XtmQagaFl7TYbzltzDray0eUp
	UWXknV9qf9QIe5R8C5Kzl3/wxjW7/6Tr/v1I2xPl1mWxfuuOgNDe50kD+6DP+8w==
X-Gm-Gg: AR+sD10Dt7wq8jaSWU66mY2oW8RzCI5LEjY4TRL+LwQScZ52rqyYnjw51ZUoyC9IFG5
	NFGcNuil246+o/Gnoreh2F5aQDToe8p7Exl4lwoILNukKYOvzOkWs+1pKyk40fdCdtjY60cdcXE
	laDKSKKdKN4y5xRJMwTzB6pXbd+MZ2/CpxIgjOB/k/9knXUjLFm7n2/kTX9hWuO40xI7oKyfybm
	yGQUVzGv6ML6CHJ14k4S4CVZwr8yrSFxy8vSFz58Zpzgw0AUUUXGCbEIipkwGGph7JB8rom46lt
	0ja6vN6SSCgRPMwWCr9bqAmpUszrppX6GA9vEVzg+oHxWRc2g8X7VY8JsCqycfzAAbBzUzG+4rW
	vkpmEx8nVnxeVZYTF3u51BdVtdFWOQ+B/G/Oee8caezPy
X-Received: by 2002:a05:6214:3114:b0:8de:25f7:98bc with SMTP id 6a1803df08f44-90c8fa2ace7mr7854526d6.22.1787338695743;
        Fri, 21 Aug 2026 11:58:15 -0700 (PDT)
X-Received: by 2002:a05:6214:3114:b0:8de:25f7:98bc with SMTP id 6a1803df08f44-90c8fa2ace7mr7854186d6.22.1787338695297;
        Fri, 21 Aug 2026 11:58:15 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c6b42455dsm51197756d6.37.2026.08.21.11.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:58:11 -0700 (PDT)
From: Eric Chanudet <echanude@redhat.com>
Date: Fri, 21 Aug 2026 14:57:02 -0400
Subject: [PATCH 10/11] selftests: cgroup: add memcg hugetlb_cma tests
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-cma-memcg-regions-v1-10-d21b165b8440@redhat.com>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
In-Reply-To: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Tejun Heo <tj@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Maxime Ripard <mripard@redhat.com>, 
 Albert Esteve <aesteve@redhat.com>, Eric Chanudet <echanude@redhat.com>
X-Mailer: b4 0.14.3

test_hugetlb_cma_charge gets a hugepage by incrementing nr_hugepages,
confirms memory.cma.hugetlb0.current increased as expected, then
releases it and checks the counter returns to its initial value.

test_hugetlb_cma_limit sets memory.cma.hugetlb0.max to 0, tries to
allocate a hugepage and verifies it fails.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 tools/testing/selftests/cgroup/test_cma_memcg.c | 209 ++++++++++++++++++++++++
 1 file changed, 209 insertions(+)

diff --git a/tools/testing/selftests/cgroup/test_cma_memcg.c b/tools/testing/selftests/cgroup/test_cma_memcg.c
index b5b5ea140518..9bd41d9a6177 100644
--- a/tools/testing/selftests/cgroup/test_cma_memcg.c
+++ b/tools/testing/selftests/cgroup/test_cma_memcg.c
@@ -4,7 +4,9 @@
 #include <linux/limits.h>
 #include <sys/mman.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
+#include <dirent.h>
 #include <fcntl.h>
 #include <linux/dma-heap.h>
 #include <sys/ioctl.h>
@@ -15,6 +17,10 @@
 #define CMA_RESERVED_CURRENT	"memory.cma.reserved.current"
 #define CMA_RESERVED_MAX	"memory.cma.reserved.max"
 
+#define HUGETLB_CMA_CURRENT	"memory.cma.hugetlb0.current"
+#define HUGETLB_CMA_MAX	"memory.cma.hugetlb0.max"
+#define HUGEPAGES_DIR		"/sys/kernel/mm/hugepages"
+
 static int cma_heap_alloc(int heap_fd, size_t size)
 {
 	struct dma_heap_allocation_data data = {
@@ -145,6 +151,207 @@ static int test_cma_limit(const char *root)
 	return rc;
 }
 
+static long find_largest_hugepage_size_kb(void)
+{
+	DIR *dir;
+	struct dirent *entry;
+	long max_size = 0;
+
+	dir = opendir(HUGEPAGES_DIR);
+	if (!dir)
+		return -1;
+
+	while ((entry = readdir(dir)) != NULL) {
+		long size;
+
+		if (sscanf(entry->d_name, "hugepages-%ldkB", &size) == 1) {
+			if (size > max_size)
+				max_size = size;
+		}
+	}
+	closedir(dir);
+
+	return max_size > 0 ? max_size : -1;
+}
+
+static long read_sysfs_long(const char *path)
+{
+	FILE *f;
+	long val = -1;
+
+	f = fopen(path, "r");
+	if (!f)
+		return -1;
+	if (fscanf(f, "%ld", &val) != 1)
+		val = -1;
+	fclose(f);
+	return val;
+}
+
+static int write_sysfs_long(const char *path, long val)
+{
+	FILE *f;
+	int rc;
+
+	f = fopen(path, "w");
+	if (!f)
+		return -1;
+	rc = fprintf(f, "%ld", val);
+	fclose(f);
+	return rc < 0 ? -1 : 0;
+}
+
+static int test_hugetlb_cma_charge(const char *root)
+{
+	int rc = KSFT_SKIP, in_cg = 0;
+	long hpage_size_kb, hpage_size_bytes;
+	long orig_nr = -1, new_nr, before, after;
+	char nr_path[PATH_MAX];
+	char *cg;
+
+	hpage_size_kb = find_largest_hugepage_size_kb();
+	if (hpage_size_kb < 0) {
+		ksft_print_msg("no hugepage size found\n");
+		return KSFT_SKIP;
+	}
+	hpage_size_bytes = hpage_size_kb * 1024;
+
+	snprintf(nr_path, sizeof(nr_path),
+		 HUGEPAGES_DIR "/hugepages-%ldkB/nr_hugepages", hpage_size_kb);
+
+	cg = cg_name(root, "memcg_hugetlb_cma_charge");
+	if (!cg)
+		goto cleanup;
+
+	if (cg_create(cg))
+		goto cleanup;
+
+	if (cg_enter_current(cg))
+		goto cleanup;
+	in_cg = 1;
+
+	if (cg_read_long(cg, HUGETLB_CMA_CURRENT) < 0) {
+		ksft_print_msg("hugetlb CMA counters not available\n");
+		goto cleanup;
+	}
+
+	orig_nr = read_sysfs_long(nr_path);
+	if (orig_nr < 0) {
+		ksft_print_msg("cannot read %s\n", nr_path);
+		goto cleanup;
+	}
+
+	before = cg_read_long(cg, HUGETLB_CMA_CURRENT);
+
+	if (write_sysfs_long(nr_path, orig_nr + 1)) {
+		ksft_print_msg("cannot write %s\n", nr_path);
+		goto cleanup;
+	}
+
+	new_nr = read_sysfs_long(nr_path);
+	if (new_nr <= orig_nr) {
+		ksft_print_msg("failed to allocate a hugepage\n");
+		goto cleanup;
+	}
+
+	rc = KSFT_FAIL;
+	after = cg_read_long(cg, HUGETLB_CMA_CURRENT);
+
+	if (after - before < hpage_size_bytes) {
+		ksft_print_msg(
+			"hugetlb CMA counter not charged: before=%ld after=%ld expected +%ld\n",
+			before, after, hpage_size_bytes);
+		goto cleanup;
+	}
+
+	write_sysfs_long(nr_path, orig_nr);
+
+	after = cg_read_long(cg, HUGETLB_CMA_CURRENT);
+	if (!values_close(before, after, 3)) {
+		ksft_print_msg(
+			"hugetlb CMA counter not uncharged: before=%ld after=%ld\n",
+			before, after);
+		goto cleanup;
+	}
+
+	rc = KSFT_PASS;
+
+cleanup:
+	if (orig_nr >= 0)
+		write_sysfs_long(nr_path, orig_nr);
+
+	if (in_cg)
+		cg_enter_current(root);
+	cg_destroy(cg);
+	free(cg);
+
+	return rc;
+}
+
+static int test_hugetlb_cma_limit(const char *root)
+{
+	int rc = KSFT_SKIP, in_cg = 0;
+	long hpage_size_kb;
+	long orig_nr, new_nr;
+	char nr_path[PATH_MAX];
+	char *cg;
+
+	hpage_size_kb = find_largest_hugepage_size_kb();
+	if (hpage_size_kb < 0) {
+		ksft_print_msg("no hugepage size found\n");
+		return KSFT_SKIP;
+	}
+
+	snprintf(nr_path, sizeof(nr_path),
+		 HUGEPAGES_DIR "/hugepages-%ldkB/nr_hugepages", hpage_size_kb);
+
+	cg = cg_name(root, "memcg_hugetlb_cma_limit");
+	if (!cg)
+		goto cleanup;
+
+	if (cg_create(cg))
+		goto cleanup;
+
+	if (cg_enter_current(cg))
+		goto cleanup;
+	in_cg = 1;
+
+	if (cg_read_long(cg, HUGETLB_CMA_MAX) < 0) {
+		ksft_print_msg("hugetlb CMA counters not available\n");
+		goto cleanup;
+	}
+
+	if (cg_write(cg, HUGETLB_CMA_MAX, "0")) {
+		ksft_print_msg("cannot set hugetlb CMA limit\n");
+		goto cleanup;
+	}
+
+	orig_nr = read_sysfs_long(nr_path);
+	if (orig_nr < 0) {
+		ksft_print_msg("cannot read %s\n", nr_path);
+		goto cleanup;
+	}
+
+	write_sysfs_long(nr_path, orig_nr + 1);
+	new_nr = read_sysfs_long(nr_path);
+
+	rc = KSFT_FAIL;
+	if (new_nr > orig_nr) {
+		ksft_print_msg("hugetlb CMA limit not enforced\n");
+		write_sysfs_long(nr_path, orig_nr);
+	} else {
+		rc = KSFT_PASS;
+	}
+
+cleanup:
+	if (in_cg)
+		cg_enter_current(root);
+	cg_destroy(cg);
+	free(cg);
+
+	return rc;
+}
+
 #define T(x) { x, #x }
 struct cma_memcg_tests {
 	int (*fn)(const char *root);
@@ -152,6 +359,8 @@ struct cma_memcg_tests {
 } tests[] = {
 	T(test_cma_charge),
 	T(test_cma_limit),
+	T(test_hugetlb_cma_charge),
+	T(test_hugetlb_cma_limit),
 };
 #undef T
 

-- 
2.53.0

