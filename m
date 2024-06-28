Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D22F7711B
	for <linux-doc@vger.kernel.org>; Fri, 28 Jun 2024 21:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719608406; cv=none; b=tyFUrC6cxzwqcEDmzmeoFdhBiJ0TPtLO0a9IvqXtaIjF75yZS/0YXeenN8ORtvTf8qk08vOA5ZVJgP/yUjLJsBKDXduG91zJIpVUtb9QwV3NglnIyKpVYZkXd7Mo9zeIMjhtDM2hg47MxsT1579iv5vXjxd9sbXOstp1boy9kRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719608406; c=relaxed/simple;
	bh=hg8CPYXS9fn0kR0erOvm5NtBSSu1bf2KL6kCyqh1b7A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uuiWFj6b5We7ZZpuevb+kCblsi/+nY75NV9qMg7C4X9zDhPGEvS/SgP1lZRJRwTlnJbnNAh+VdN7CSdbqvGQL0rSGZdlB+YSGhq0btApCg8OgGOIx8O6cHR7kMJGKQZ89ZbsgKRHNxlhhz4t0CZP25Uk4ML9M8Hqs43kBhTWDpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DYoroUHe; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DYoroUHe"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1fabc312e36so11686765ad.3
        for <linux-doc@vger.kernel.org>; Fri, 28 Jun 2024 14:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719608404; x=1720213204; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wloQRnRJOFsUL3bZC7DzXWvVx2ebdRLN4PLJ4fxz/Zs=;
        b=DYoroUHeyel6jJBlxsWP31FmoIvPm2ugBF7mHMF0Dd1WwjAQaRNpbAJdbgquk4eqQe
         JhMgXEg2Owr1h2V5JxhZVzOdCw2mv9Ee05OPFxTtQckyqLbif5J14aCVGteEzsOj/2kT
         pczFLIJDhy96aXG0GsSivp9AdYWmNJLGqyJUD663PG91sjzRCNTsVbFLqBhf3x4uxpBn
         KBS0Vf0+6jVncbbcwvnkz2D8Ph9TL6jh0D5sJ0ag1Mz+CX1oqgxtk4WRjbw4DLCcsS+1
         ZXr9Ly/Dl7QFPIM0T6PpVMisTxtc+UV/q6aL4v0WEgZXIDtHvnnvN/pwh9E1/33zb2q2
         XqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719608404; x=1720213204;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wloQRnRJOFsUL3bZC7DzXWvVx2ebdRLN4PLJ4fxz/Zs=;
        b=lpDHW+nerACQ9Z1gfkU6gVVDAkQDegM6I5y8lxvZKEcr964XXo6/P6DcFU0pR0a3LF
         0g/UF7HJJtZ9orfcnzpJm0qAP3nLMCB1VOjiaQHEdft11azuunA8zupiKI0v8WHJ/UAQ
         BvQnxQfvfjgd9JATwWhpDb2MS+mTHOodAsLXR20GeiQjUK+ZJbLu6LFXT2tHG/Bh+lZE
         ehMOr25+5kfTydsndTVgOooowWeww65zDRgImvXUjGs/6sijQ+ekgZa2/0rwZw8q8YzJ
         0PlwN7fqfF2kl0QV/7pTFz2Kkogp13hTHs1DjRAv+uUgsR0iK1ENvjrk52y+QyomlrVL
         nqqA==
X-Forwarded-Encrypted: i=1; AJvYcCXpLJUQ1MB1+xrW/VauRpTZmmLJ+4klbHh8xxsB6O1UVQJicxJgcplvFjuNOCRIwpPfs7LSU1/ceK8FfQ/5T8043/TVzHyiXX3O
X-Gm-Message-State: AOJu0YzhcCM3wKd8K39Hd9mQScY1fIGtrln0iu/k+wC3mEDCiwowPKrO
	fn3sWIy8kw5ZPQBYAhLF9SeuvbKoYA2DRVJeMetfYlfbj2ldMR+FEvEAGJ9QOyuwjqC/6tbXdxl
	YAf8rrgmJ5A==
X-Google-Smtp-Source: AGHT+IFngVlviz+bFsu7ULS0zV0gCgvaUcH7TCcU6sghaFwvanKOQPhlg4lFgTCSFwGFZC7AMJvWD60uCEYyCw==
X-Received: from yjq3.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:272f])
 (user=jiaqiyan job=sendgmr) by 2002:a17:902:e5c8:b0:1fa:9149:4979 with SMTP
 id d9443c01a7336-1fa91494ca4mr7717605ad.2.1719608404213; Fri, 28 Jun 2024
 14:00:04 -0700 (PDT)
Date: Fri, 28 Jun 2024 20:59:56 +0000
In-Reply-To: <20240628205958.2845610-1-jiaqiyan@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240628205958.2845610-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240628205958.2845610-3-jiaqiyan@google.com>
Subject: [PATCH v7 2/4] mm/memory-failure: userspace controls soft-offlining pages
From: Jiaqi Yan <jiaqiyan@google.com>
To: nao.horiguchi@gmail.com, linmiaohe@huawei.com
Cc: jane.chu@oracle.com, ioworker0@gmail.com, muchun.song@linux.dev, 
	akpm@linux-foundation.org, shuah@kernel.org, rdunlap@infradead.org, 
	corbet@lwn.net, osalvador@suse.de, rientjes@google.com, duenwen@google.com, 
	fvdl@google.com, ak@linux.intel.com, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"

Correctable memory errors are very common on servers with large
amount of memory, and are corrected by ECC. Soft offline is kernel's
additional recovery handling for memory pages having (excessive)
corrected memory errors. Impacted page is migrated to a healthy page
if inuse; the original page is discarded for any future use.

The actual policy on whether (and when) to soft offline should be
maintained by userspace, especially in case of an 1G HugeTLB page.
Soft-offline dissolves the HugeTLB page, either in-use or free, into
chunks of 4K pages, reducing HugeTLB pool capacity by 1 hugepage.
If userspace has not acknowledged such behavior, it may be surprised
when later failed to mmap hugepages due to lack of hugepages.
In case of a transparent hugepage, it will be split into 4K pages
as well; userspace will stop enjoying the transparent performance.

In addition, discarding the entire 1G HugeTLB page only because of
corrected memory errors sounds very costly and kernel better not
doing under the hood. But today there are at least 2 such cases
doing so:
1. when GHES driver sees both GHES_SEV_CORRECTED and
   CPER_SEC_ERROR_THRESHOLD_EXCEEDED after parsing CPER.
2. RAS Correctable Errors Collector counts correctable errors per
   PFN and when the counter for a PFN reaches threshold
In both cases, userspace has no control of the soft offline performed
by kernel's memory failure recovery.

This commit gives userspace the control of softofflining any page:
kernel only soft offlines raw page / transparent hugepage / HugeTLB
hugepage if userspace has agreed to. The interface to userspace is a
new sysctl at /proc/sys/vm/enable_soft_offline. By default its value
is set to 1 to preserve existing behavior in kernel. When set to 0,
soft-offline (e.g. MADV_SOFT_OFFLINE) will fail with EOPNOTSUPP.

Acked-by: Miaohe Lin <linmiaohe@huawei.com>
Acked-by: David Rientjes <rientjes@google.com>
Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 mm/memory-failure.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 685ab9a77966..d55fdeed0cfc 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -68,6 +68,8 @@ static int sysctl_memory_failure_early_kill __read_mostly;
 
 static int sysctl_memory_failure_recovery __read_mostly = 1;
 
+static int sysctl_enable_soft_offline __read_mostly = 1;
+
 atomic_long_t num_poisoned_pages __read_mostly = ATOMIC_LONG_INIT(0);
 
 static bool hw_memory_failure __read_mostly = false;
@@ -141,6 +143,15 @@ static struct ctl_table memory_failure_table[] = {
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE,
 	},
+	{
+		.procname	= "enable_soft_offline",
+		.data		= &sysctl_enable_soft_offline,
+		.maxlen		= sizeof(sysctl_enable_soft_offline),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE,
+	}
 };
 
 /*
@@ -2758,8 +2769,9 @@ static int soft_offline_in_use_page(struct page *page)
  * @pfn: pfn to soft-offline
  * @flags: flags. Same as memory_failure().
  *
- * Returns 0 on success
- *         -EOPNOTSUPP for hwpoison_filter() filtered the error event
+ * Returns 0 on success,
+ *         -EOPNOTSUPP for hwpoison_filter() filtered the error event, or
+ *         disabled by /proc/sys/vm/enable_soft_offline,
  *         < 0 otherwise negated errno.
  *
  * Soft offline a page, by migration or invalidation,
@@ -2795,6 +2807,12 @@ int soft_offline_page(unsigned long pfn, int flags)
 		return -EIO;
 	}
 
+	if (!sysctl_enable_soft_offline) {
+		pr_info_once("disabled by /proc/sys/vm/enable_soft_offline\n");
+		put_ref_page(pfn, flags);
+		return -EOPNOTSUPP;
+	}
+
 	mutex_lock(&mf_mutex);
 
 	if (PageHWPoison(page)) {
-- 
2.45.2.803.g4e1b14247a-goog

