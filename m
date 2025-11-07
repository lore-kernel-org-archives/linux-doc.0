Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A636344032
	for <linux-doc@vger.kernel.org>; Fri,  7 Nov 2025 21:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762549564; cv=none; b=mhsFlUBjsT0w8DkKXTHq1I+tjVuvk9pB9nXOpWoZ7N68UDlLpM59iOb4LVgV/GFufQN2h3d7zoX0j4F2OfqFDik9ffXFMEAEFC0p99OhZkUnAPWFFGFp3lQdhwwGLkDAr4lmYroAavOMCgxAQGV6aunkQc+BigJg3wZWe3EDge4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762549564; c=relaxed/simple;
	bh=2YoVzov6bB1zBXUx8MCa0vSfim57g+g/ybqzdLdnqC4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jJat8zKJ/eo2ccTwXmaryvbiL/wxsHSptuQF6q8IaIIRXW5U/FDA+xMhJlERlzPQltULGaJLFoptl0Iko8d36hhynqc2TEiKYJTH84POpjzvYD21W7DIGBo2yBlW8qlsi4awnuZ5/0BSthaTjRB+aNAE+1o5qyPnuZup3Vs+pUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=WIaPj78v; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="WIaPj78v"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-71d6014810fso10303837b3.0
        for <linux-doc@vger.kernel.org>; Fri, 07 Nov 2025 13:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1762549561; x=1763154361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7B04/0h/Qcfyqc4t6CaWgs850ouGgVZlycEHNrf/bt4=;
        b=WIaPj78vg695vgQwUK4DlX/6p67WRgOK7neDgslYM3rNERJhdHG6V3iAppvpCoXTmQ
         YvTETkOLzzTUpVKRqGJ0FQq8xkpNXICMaSHHmjFEC1R4Wo+uNOswQPK0HCBiWP/Ta6xz
         t6/waWvn92bKsy17K6arLVwjq2Z+Fj1rmRooOSYAxZp/6PUB8EKz7VeRTYR3qBfV8G3w
         KrHhQF3YDpIwYotZMcm4Mz85vIAaDcWT2IVmVeCiKb/X4XfDnJakQgvvXVF0MK+2iBkX
         Tofe6V17g4myb/cILaOQaOuNLKb7YXBNT0OngxZLx/Dv22Vr/WK6cE0UOjrZyMV9i0y/
         1/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762549561; x=1763154361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7B04/0h/Qcfyqc4t6CaWgs850ouGgVZlycEHNrf/bt4=;
        b=bvgbU/m6AE2QjJZDxTtjR47LfFNpmmDfgURlQ91dP01S1BmbQCeqlatIWqVDFnsw3b
         1NcnPTOLKKBO8HaVLyumt3N+qpmwPPkfcKqHmLgWeOrEDcxhcsW8Esc05x0n5fK7XbQB
         DlkvyN0/kMWVlPlN+x0QwNtfiJoGTFdX6Ii19IenjpUW0J4jNSbu50EzqG4zRyXneroa
         8rA4F35CGNOA7WqOZBYciqA+5rptE89f+7iQEl4cYYJYDB6VRlbGJOnIlsilJmgvPwUI
         uszr5FfwEz7NSHiAZAh1/IWAebb1sCBHKLfHqw74pvnzDOHq9QqG30gCWc6+aVHlc0AB
         ve6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUj9/v29A0lVqcssmQcgcSc9T24S6wzXc8ZXQ1Xs1z1TNUUY3aUITGRvY602ZnHGnTg+EJ2O9OvtRE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5wQ8EOhn96zfBidm2q49835he+Hwtl+fb68V9o8OAOniBnN0j
	UTJpnd1f14MZLJeNCZVir2EJ706RvwtoHWfoTORm3fWf/kDuqgm8gWC2WJ8vVF1Beus=
X-Gm-Gg: ASbGnct0kXmv0ctaMtK77JEuMeJr9ROzJESZLgiSEfuA6Ib9xsrb1nTyDfa5vwBHDWZ
	D38Qb6Kdy5DH0L9mOXxEB9ncxUeRls1sYXq3KDPpz3Hx4EGIABHt+m3ONgy29qAug74rt0qt/b8
	QFyW8swxO2Hlub1TUgq+8ynUBdDHV+QjrVSEZ95iUq7LW0GA9QorvhgsML5nrUyFNxNh7zQ0IDt
	gC6KJ1GSXnX+D9m3GolKqAwKSZdDuRHxrtgx7ez4ThxUvMktwdcjOZChchB+1JIZFMas+6BUduZ
	FJ4IhtCvQXi8+F8S4lbVkNjV3giYWPpjuYqWBJpXbOdVbMTaQ0M0BYNmVZCgDuHzQVWDNXa6Mpz
	y6+JmeK6HqCDaINlV+0tp4t533Fu5nZ3WuZl1Wk+TZVpcqGhslkBU6e80St8CHCPWggililKW8+
	YCo8WQkaL/Ne9xXZG81YucgKKVvWjvQglmJFEEnCd3fH5ifYsMvglLJhSqEzKknn+P8Q5Cp5zou
	GVWPCFXhc8C
X-Google-Smtp-Source: AGHT+IGF4+/4J86N/nzQZyRsPJ7pMtknxLR4bnE8JC68ZkTL3I3E4I5rinqYLEhJi2wbGwCzdCJ5TQ==
X-Received: by 2002:a05:690c:55c5:b0:784:8153:c604 with SMTP id 00721157ae682-787d53ba2bemr6446727b3.31.1762549561166;
        Fri, 07 Nov 2025 13:06:01 -0800 (PST)
Received: from soleen.c.googlers.com.com (53.47.86.34.bc.googleusercontent.com. [34.86.47.53])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-787d68754d3sm990817b3.26.2025.11.07.13.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 13:06:00 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	saeedm@nvidia.com,
	ajayachandra@nvidia.com,
	jgg@nvidia.com,
	parav@nvidia.com,
	leonro@nvidia.com,
	witu@nvidia.com,
	hughd@google.com,
	skhawaja@google.com,
	chrisl@kernel.org
Subject: [PATCH v5 15/22] mm: shmem: export some functions to internal.h
Date: Fri,  7 Nov 2025 16:03:13 -0500
Message-ID: <20251107210526.257742-16-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
In-Reply-To: <20251107210526.257742-1-pasha.tatashin@soleen.com>
References: <20251107210526.257742-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pratyush Yadav <ptyadav@amazon.de>

shmem_inode_acct_blocks(), shmem_recalc_inode(), and
shmem_add_to_page_cache() are used by shmem_alloc_and_add_folio(). This
functionality will also be used in the future by Live Update
Orchestrator (LUO) to recreate memfd files after a live update.

Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 mm/internal.h |  6 ++++++
 mm/shmem.c    | 10 +++++-----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 0af87f6c2889..3f957e86f43f 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1585,6 +1585,12 @@ void __meminit __init_page_from_nid(unsigned long pfn, int nid);
 unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
 			  int priority);
 
+int shmem_add_to_page_cache(struct folio *folio,
+			    struct address_space *mapping,
+			    pgoff_t index, void *expected, gfp_t gfp);
+int shmem_inode_acct_blocks(struct inode *inode, long pages);
+bool shmem_recalc_inode(struct inode *inode, long alloced, long swapped);
+
 #ifdef CONFIG_SHRINKER_DEBUG
 static inline __printf(2, 0) int shrinker_debugfs_name_alloc(
 			struct shrinker *shrinker, const char *fmt, va_list ap)
diff --git a/mm/shmem.c b/mm/shmem.c
index 2e3cb0424a1f..c3ed2dcd17f8 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -219,7 +219,7 @@ static inline void shmem_unacct_blocks(unsigned long flags, long pages)
 		vm_unacct_memory(pages * VM_ACCT(PAGE_SIZE));
 }
 
-static int shmem_inode_acct_blocks(struct inode *inode, long pages)
+int shmem_inode_acct_blocks(struct inode *inode, long pages)
 {
 	struct shmem_inode_info *info = SHMEM_I(inode);
 	struct shmem_sb_info *sbinfo = SHMEM_SB(inode->i_sb);
@@ -435,7 +435,7 @@ static void shmem_free_inode(struct super_block *sb, size_t freed_ispace)
  *
  * Return: true if swapped was incremented from 0, for shmem_writeout().
  */
-static bool shmem_recalc_inode(struct inode *inode, long alloced, long swapped)
+bool shmem_recalc_inode(struct inode *inode, long alloced, long swapped)
 {
 	struct shmem_inode_info *info = SHMEM_I(inode);
 	bool first_swapped = false;
@@ -890,9 +890,9 @@ static void shmem_update_stats(struct folio *folio, int nr_pages)
 /*
  * Somewhat like filemap_add_folio, but error if expected item has gone.
  */
-static int shmem_add_to_page_cache(struct folio *folio,
-				   struct address_space *mapping,
-				   pgoff_t index, void *expected, gfp_t gfp)
+int shmem_add_to_page_cache(struct folio *folio,
+			    struct address_space *mapping,
+			    pgoff_t index, void *expected, gfp_t gfp)
 {
 	XA_STATE_ORDER(xas, &mapping->i_pages, index, folio_order(folio));
 	unsigned long nr = folio_nr_pages(folio);
-- 
2.51.2.1041.gc1ab5b90ca-goog

