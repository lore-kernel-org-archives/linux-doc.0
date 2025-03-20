Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABCB1EF396
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 06:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742452793; cv=none; b=dsWSznehJKy/6qtf/ND+vOBGx9NYs7v9ar4ddZ5O9DBXtcJzkmo7zB8o07UvIoPwMOe8Ebl4MLpvw7xJ/eoZo1f4WBKL9hTNLOOH5/jchZiSXN7L3e87mXk2mJ21Y6h8BaJxTGKc3wCfQkMMNd37IY/uisOMRU7zYS7zrEYI8uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742452793; c=relaxed/simple;
	bh=0nPyEUxMVYuWQBfOoZDrSnqSSdM+17gpqIPK/gAVNHM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LxScOkXVp9VEhP9ejSDvMxDVoZ4+gg9BCm/odctqO/47qYAfm9rnz5iAEDvJosVMfxpVu5OeCLaMmHBs0Pm/p/xXSH1or8OJYbUSprg+4DaawHtc7akDUv/qeim74uf0zPl9ruBGWplkyn1c4VsBzQkmAMTV1INKbtmgI/2ahlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QZJE6ZuI; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QZJE6ZuI"
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-85b3a62e3e5so92137039f.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Mar 2025 23:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742452791; x=1743057591; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AdzZEb8zIh2bnUEQF7HSdB5UkIAPD4MWW1lq1fR+Ug0=;
        b=QZJE6ZuIim85ftM+Ou5jkI9eOONUT/ijJQKEyGjBnO9KmUKmNVO+WshRmfitp+3bCY
         P+lbtgHJE2uoNokucBO7fd8U0ev4sfntXnUVCFWSZdx68nytBVr0prR/6IH2JFPAjL+t
         HlSQaQLTl8FuDfLex9yEkJ649BsUT18vXBhrKNDmWD40tMbJtVTilkvZkNQtv/zeSTR0
         VKUVVYko1ov6QG9VwqSKhsp3+aLlbJCkmM8m0VfeOG5+1Wm36vyyDsRtLmt23X1sM51W
         s4F0ppdr2XodtTI51PsO9gAlK8Wx2QSsz1jWQBpRkQkQh2BCy5GlwWXh2vb4tSzmEwSk
         6w9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742452791; x=1743057591;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AdzZEb8zIh2bnUEQF7HSdB5UkIAPD4MWW1lq1fR+Ug0=;
        b=oi/Q8spsyijxr6iIYpaDoQNXDKtnSGq9LQTEtulUVaxnam2zryGL6HQoC5DsUv89Yo
         2XQ+IbwtkrQwgR2THJ7EgandeMxdqb8wmA6i9/Ot35c3kZ4vvhg18pCvDCZWggNYzSRp
         trqGSoGDqWLP8DH+9i+WskMdElfaWIoC3nRcSVFffHnKt6NNDfSD2bItVdZ/SJ/mD/zE
         cI936nRD3tP0RwhOt9zbtZSlYKKNIXUDOVKc38AjMxSRmIEIIkcdiSoVBtF2Re+z34uW
         Y0N+HEzuexf8pMxwzp4IWZa18HNRI2xX540+czeE7iX1Xp1+U23qucFn1Q0qzkYTxF6m
         5bBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOX0VCnd71mnWNpzd9wP9a7Wcm1QoMb6hVKyLAf6cS13kYvLgr1YPYfuaNFtc4Z577OWCSsNUnQxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDifaARgixWXS0dk7oez9xN8EwOV4G3eeMPnNwvSj+sE58a8R+
	t5HAokbJkxA3aqpH1dVp0lFcPexTe2inSQJTLdfn4DbeL79nfcBWkf9aNWXAYiNF7az/HAPcarc
	dHw==
X-Google-Smtp-Source: AGHT+IH9m1sXlXKSr5bFdga9g4GN9qYyPPkoNzV3YUg0gItepaGaNcNSkWbPl4Pwf3Aa3OGUQddoqzehlLk=
X-Received: from iobbk13.prod.google.com ([2002:a05:6602:400d:b0:85d:ac99:6c85])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:4744:b0:85d:9a7a:8169
 with SMTP id ca18e2360f4ac-85e13647c3dmr667556939f.0.1742452790845; Wed, 19
 Mar 2025 23:39:50 -0700 (PDT)
Date: Thu, 20 Mar 2025 06:39:03 +0000
In-Reply-To: <20250320063903.2685882-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250320063903.2685882-1-avagin@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250320063903.2685882-3-avagin@google.com>
Subject: [PATCH 2/2] selftests/mm: add PAGEMAP_SCAN guard region test
From: Andrei Vagin <avagin@google.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrei Vagin <avagin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

From: Andrei Vagin <avagin@gmail.com>

Add a selftest to verify the PAGEMAP_SCAN ioctl correctly reports guard
regions using the newly introduced PAGE_IS_GUARD flag.

Signed-off-by: Andrei Vagin <avagin@gmail.com>
---
 tools/testing/selftests/mm/guard-regions.c | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/selftests/mm/guard-regions.c
index 0c7183e8b661..24e09092fda5 100644
--- a/tools/testing/selftests/mm/guard-regions.c
+++ b/tools/testing/selftests/mm/guard-regions.c
@@ -8,6 +8,7 @@
 #include <fcntl.h>
 #include <linux/limits.h>
 #include <linux/userfaultfd.h>
+#include <linux/fs.h>
 #include <setjmp.h>
 #include <signal.h>
 #include <stdbool.h>
@@ -2079,4 +2080,56 @@ TEST_F(guard_regions, pagemap)
 	ASSERT_EQ(munmap(ptr, 10 * page_size), 0);
 }
 
+/*
+ * Assert that PAGEMAP_SCAN correctly reports guard region ranges.
+ */
+TEST_F(guard_regions, pagemap_scan)
+{
+	const unsigned long page_size = self->page_size;
+	struct page_region pm_regs[10];
+	struct pm_scan_arg pm_scan_args = {
+		.size = sizeof(struct pm_scan_arg),
+		.category_anyof_mask = PAGE_IS_GUARD,
+		.return_mask = PAGE_IS_GUARD,
+		.vec = (long)&pm_regs,
+		.vec_len = ARRAY_SIZE(pm_regs),
+	};
+	int proc_fd, i;
+	char *ptr;
+
+	proc_fd = open("/proc/self/pagemap", O_RDONLY);
+	ASSERT_NE(proc_fd, -1);
+
+	ptr = mmap_(self, variant, NULL, 10 * page_size,
+		    PROT_READ | PROT_WRITE, 0, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	pm_scan_args.start = (long)ptr;
+	pm_scan_args.end = (long)ptr + 10 * page_size;
+	ASSERT_EQ(ioctl(proc_fd, PAGEMAP_SCAN, &pm_scan_args), 0);
+	ASSERT_EQ(pm_scan_args.walk_end, (long)ptr + 10 * page_size);
+
+	/* Install a guard region in every other page. */
+	for (i = 0; i < 10; i += 2) {
+		char *ptr_p = &ptr[i * page_size];
+
+		ASSERT_EQ(syscall(__NR_madvise, ptr_p, page_size, MADV_GUARD_INSTALL), 0);
+	}
+
+	ASSERT_EQ(ioctl(proc_fd, PAGEMAP_SCAN, &pm_scan_args), 5);
+	ASSERT_EQ(pm_scan_args.walk_end, (long)ptr + 10 * page_size);
+
+	/* Re-read from pagemap, and assert guard regions are detected. */
+	for (i = 0; i < 5; i++) {
+		long ptr_p = (long)&ptr[2 * i * page_size];
+
+		ASSERT_EQ(pm_regs[i].start, ptr_p);
+		ASSERT_EQ(pm_regs[i].end, ptr_p + page_size);
+		ASSERT_EQ(pm_regs[i].categories, PAGE_IS_GUARD);
+	}
+
+	ASSERT_EQ(close(proc_fd), 0);
+	ASSERT_EQ(munmap(ptr, 10 * page_size), 0);
+}
+
 TEST_HARNESS_MAIN
-- 
2.49.0.rc1.451.g8f38331e32-goog

