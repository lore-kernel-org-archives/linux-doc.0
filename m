Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F83638E11C
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 22:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773873010; cv=none; b=Yyfpe8ZpFPQ9SFCQVLHxL/mJnyK9lZcpuTCHdmmRWy1mp5RtOTH44Bx2+c1Rhmr613e5fD4luFg7zw8qRIRtmO+5+v7M6+i/FjAf4L4oiFWbD0r3FJZGmVSkpZ/NhJ+AKbH3LWmn0dLprf7c2Ojwkb7glO41eAheQ8bja0LruQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773873010; c=relaxed/simple;
	bh=RtjI20tpXl2gzkkeQFik239RRAiwP1G/DuOJFlw72jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XJNxDDzyXEvTef7GFH0V+nbnhfmaw8vZ76vPH0/EGgqAukydg2bcvxqmANg4p6+AVpJ5RFh4VdzMLcmwfwzau0o7pDIQffOCFePv1BI6qTb8BCA1vnd2kKyvA0Z6fBmms3jo87KsiVws1puZlVat6GifZiieeLLw6wmnTPiR6Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9wqLewo; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9wqLewo"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-40438e0cba6so311565fac.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 15:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773873007; x=1774477807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uOXWFDfbhJT9tG5Yl+ef83GJnrWQ5V7qgRvvdgSeJQ=;
        b=K9wqLewoSybShJc0AVArPIwS51nucN5E08RGEHDXaZbsq5CE93fWblAZ2pZ7WI0l6p
         mCd82ayyEhxDqgeh99XjSxmbJsdMnLAgsi8/7UAN398nI53qZSiKP8MXqWZMUzwE3li2
         44GpfIm+Y/oIbjoTtTv7non18oj/6T6m3X9b+6gIHxTPQCVBGZyyrjfF7/xPbahBcFyX
         DsgZf+bn3grIXTJ/Po05RsbsOoEkSoFds9/LeLWGUYjbDite97+zfAesmi9OABEOBzfh
         cqOWM2K5SRFF+YHToYD9OALJn6jdC2BdUdw8rBSzQFVoyMIcTmop7MYF5Yt3/a1QIyzb
         BTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773873007; x=1774477807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0uOXWFDfbhJT9tG5Yl+ef83GJnrWQ5V7qgRvvdgSeJQ=;
        b=DcUWp93j6q55R3aq95sNJALqOVBI1ftbQnvoSr4ZLEBGnjOnFGEIcW2pbRyRd427Me
         eUALpMY0LaMXGv849PfH5sG9+UXJPzzpZw1AH1+c4cEGdswLsKOUApzOvsm4Twe6Dcgm
         e6WARLRzOX+ucNl3KXySfl0R44xOoc2/UIeWgItzku5HL/dptCNmzDaYvxoa3M7C7cbl
         wA5Gk4DYyK3YDHS/QY+/IfRm2Dr92jEYKwBpQcJhbQezOkgCIjhSEUZDUJejeeWfnUW7
         Oyp+FF2LEjrbNRBr2ixStgQRcpfgcYoyP0yfxl6edPhgtFDnnDIoMQ2ac/9IYdt261XI
         FGSw==
X-Forwarded-Encrypted: i=1; AJvYcCXHFnV4hl4WMKWxgH6Yv8I4sXiCKeTt++QDu+FUZQ9YLGh2goU7xdT2ueYyMJwmOtR7hlqudm5DJmM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy0fHxS32hhaBFrBftBtZM8elPwYCdK/ufUa+Rq4nGLQ4oMEl5
	XKTVRbGAB9PhWxmCWW3RHo80KE8OzTch39HnWROcwJpeB3tTCoHaRibo
X-Gm-Gg: ATEYQzylEfoCITBXslvzKEgmS+dTcDJLFPBVUKfaWgdY/7DQtY+K+4+LTIDCDk/yEhA
	eCc5FmUCbPeCPrDcas7HOU4ryvdy4bYYDN5SB4UFiVkUVGLs88tYtop8JOBXrXtmxI8CuDyF3Mx
	bke6tylQNkmgFx2POXCQMbvUWnNOk6hBtw9qhL8IRYXx+9o2Gq8GQkcqOL51zQHwHn5NccXKyVB
	CB3wp0gp4NhNyNmHg7DEFZyugb3T3bLjfkZy2sASgynf9P8ZnDxI+mAtAZCVrnjxHIz21ZgzFts
	uFNtCOA52MmSCGzQ7Ru44JMLvPEF1iqvMEKOmc9kFl2zJAB5aX7OI6JAiSgz20g//GvU9nKy0OT
	BQBC15ZkHwEcdrkgbyCPgEWo5XfIPW34oX30/TIcKR6YyK80NhMNo/krsuqYPkOJSEowg1qZogi
	s1IMELAXX+0neqbtK4AGi32b9r+mkvBMH4ViBXdh0PNgyuIw==
X-Received: by 2002:a05:6870:1405:b0:417:14d1:9671 with SMTP id 586e51a60fabf-41bd3f7d47cmr3526021fac.34.1773873006867;
        Wed, 18 Mar 2026 15:30:06 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:73::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41bd22dee78sm4108849fac.0.2026.03.18.15.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 15:30:06 -0700 (PDT)
From: Nhat Pham <nphamcs@gmail.com>
To: kasong@tencent.com
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	apopple@nvidia.com,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	bhe@redhat.com,
	byungchul@sk.com,
	cgroups@vger.kernel.org,
	chengming.zhou@linux.dev,
	chrisl@kernel.org,
	corbet@lwn.net,
	david@kernel.org,
	dev.jain@arm.com,
	gourry@gourry.net,
	hannes@cmpxchg.org,
	hughd@google.com,
	jannh@google.com,
	joshua.hahnjy@gmail.com,
	lance.yang@linux.dev,
	lenb@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-pm@vger.kernel.org,
	lorenzo.stoakes@oracle.com,
	matthew.brost@intel.com,
	mhocko@suse.com,
	muchun.song@linux.dev,
	npache@redhat.com,
	nphamcs@gmail.com,
	pavel@kernel.org,
	peterx@redhat.com,
	peterz@infradead.org,
	pfalcato@suse.de,
	rafael@kernel.org,
	rakie.kim@sk.com,
	roman.gushchin@linux.dev,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shakeel.butt@linux.dev,
	shikemeng@huaweicloud.com,
	surenb@google.com,
	tglx@kernel.org,
	vbabka@suse.cz,
	weixugc@google.com,
	ying.huang@linux.alibaba.com,
	yosry.ahmed@linux.dev,
	yuanchu@google.com,
	zhengqi.arch@bytedance.com,
	ziy@nvidia.com,
	kernel-team@meta.com,
	riel@surriel.com
Subject: [PATCH v4 07/21] mm: create scaffolds for the new virtual swap implementation
Date: Wed, 18 Mar 2026 15:29:38 -0700
Message-ID: <20260318222953.441758-8-nphamcs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260318222953.441758-1-nphamcs@gmail.com>
References: <20260318222953.441758-1-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In prepration for the implementation of swap virtualization, add new
scaffolds for the new code: a new mm/vswap.c source file, which
currently only holds the logic to set up the (for now, empty) vswap
debugfs directory. Hook this up in the swap setup step in
mm/swap_state.c, and set up vswap compilation in the Makefile.

Other than the debugfs directory, no behavioral change intended.

Finally, make Johannes a swap reviewer, given that he has contributed
majorly to the developments of virtual swap.

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 MAINTAINERS          |  2 ++
 include/linux/swap.h |  3 +++
 mm/Makefile          |  2 +-
 mm/swap_state.c      |  6 ++++++
 mm/vswap.c           | 35 +++++++++++++++++++++++++++++++++++
 5 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 mm/vswap.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e087673237636..b21038b160a07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16728,6 +16728,7 @@ R:	Kemeng Shi <shikemeng@huaweicloud.com>
 R:	Nhat Pham <nphamcs@gmail.com>
 R:	Baoquan He <bhe@redhat.com>
 R:	Barry Song <baohua@kernel.org>
+R:	Johannes Weiner <hannes@cmpxchg.org>
 L:	linux-mm@kvack.org
 S:	Maintained
 F:	Documentation/mm/swap-table.rst
@@ -16740,6 +16741,7 @@ F:	mm/swap.h
 F:	mm/swap_table.h
 F:	mm/swap_state.c
 F:	mm/swapfile.c
+F:	mm/vswap.c
 
 MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
 M:	Andrew Morton <akpm@linux-foundation.org>
diff --git a/include/linux/swap.h b/include/linux/swap.h
index 918b47da55f44..df0771903a952 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -423,6 +423,9 @@ extern void __meminit kswapd_stop(int nid);
 
 #ifdef CONFIG_SWAP
 
+/* Virtual swap space API (mm/vswap.c) */
+int vswap_init(void);
+
 /* Lifecycle swap API (mm/swapfile.c) */
 int folio_alloc_swap(struct folio *folio);
 bool folio_free_swap(struct folio *folio);
diff --git a/mm/Makefile b/mm/Makefile
index 2d0570a16e5be..67fa4586e7e18 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -75,7 +75,7 @@ ifdef CONFIG_MMU
 	obj-$(CONFIG_ADVISE_SYSCALLS)	+= madvise.o
 endif
 
-obj-$(CONFIG_SWAP)	+= page_io.o swap_state.o swapfile.o
+obj-$(CONFIG_SWAP)	+= page_io.o swap_state.o swapfile.o vswap.o
 obj-$(CONFIG_ZSWAP)	+= zswap.o
 obj-$(CONFIG_HAS_DMA)	+= dmapool.o
 obj-$(CONFIG_HUGETLBFS)	+= hugetlb.o hugetlb_sysfs.o hugetlb_sysctl.o
diff --git a/mm/swap_state.c b/mm/swap_state.c
index e2e9f55bea3bb..29ec666be4204 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -882,6 +882,12 @@ static int __init swap_init(void)
 	int err;
 	struct kobject *swap_kobj;
 
+	err = vswap_init();
+	if (err) {
+		pr_err("failed to initialize virtual swap space\n");
+		return err;
+	}
+
 	swap_kobj = kobject_create_and_add("swap", mm_kobj);
 	if (!swap_kobj) {
 		pr_err("failed to create swap kobject\n");
diff --git a/mm/vswap.c b/mm/vswap.c
new file mode 100644
index 0000000000000..e68234f053fc9
--- /dev/null
+++ b/mm/vswap.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Virtual swap space
+ *
+ * Copyright (C) 2024 Meta Platforms, Inc., Nhat Pham
+ */
+#include <linux/swap.h>
+
+#ifdef CONFIG_DEBUG_FS
+#include <linux/debugfs.h>
+
+static struct dentry *vswap_debugfs_root;
+
+static int vswap_debug_fs_init(void)
+{
+	if (!debugfs_initialized())
+		return -ENODEV;
+
+	vswap_debugfs_root = debugfs_create_dir("vswap", NULL);
+	return 0;
+}
+#else
+static int vswap_debug_fs_init(void)
+{
+	return 0;
+}
+#endif
+
+int vswap_init(void)
+{
+	if (vswap_debug_fs_init())
+		pr_warn("Failed to initialize vswap debugfs\n");
+
+	return 0;
+}
-- 
2.52.0

