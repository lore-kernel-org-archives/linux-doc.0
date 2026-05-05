Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7321C48C8D9
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 15:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995579; cv=none; b=DR0Yrbt3ZVU1hOh/Bfn5FCvAZBFwgqvGWwilzNx7pAZgEK/sGdJfnRc9hgnMRUep9TiqLNgSHjdTlEp1daEVSY9369puj2VLg0Jh4bIvNsMsGgSBmN0W2Gym296I5U9y3ZOcGZ1sBZ1mOZQ4vuCJy6MzczfNw7tKSIACZbdSEFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995579; c=relaxed/simple;
	bh=pUn9b9LUhmis+nxUstyTj7eYl6B+eZR5n7i3p7grHPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aLvrenQUTnh+6ehq6N/1vK/j1ROiSUkhzmeyy1Do+fb9ORbQiVlLVbuVFbFlOKNv+CnfoKr7ElKC0P5yW7EiKPMhK1RC8n1/Bx7KGraaj0Y++nckYGOyl0AXhsA6Vbf2kqis8yk9LXXcmcCmJEY45BFNfGlmq+b3Fo+YmtsIFyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iC7KU6nY; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iC7KU6nY"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6967fd0416bso2606295eaf.3
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 08:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777995573; x=1778600373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spNG7IJraDg4T5BsvCQ+9NVFqbAOm2jy1KvenC+2iQ4=;
        b=iC7KU6nYG/tY8Ny1bm8Kpi+rZ3yzy0iLcf6xFHKPhzDCygHcclsBRTj+j8CWXrD4V0
         4OOFblwHDbetkaTTs54VPGCRZtV/ibx6fwX8jdItj5VOfanC3Qj5a1grJPHXIwQRZjgI
         /ogGxc2K+GMblW2HD4dawSW2f7v9Rrt9GeQ4ZKmo+6HYUV2bgrk/Ce+JkUdXbyobaVry
         98uvKXNfH8HgpKrKITI2K2rKRxDLz91SmtcDP5CcVG5m4007VOlPd30hfHLzqahEzOj9
         zjFL8ECPVudXzxJ+AB41c39WzHGc//X+s6TiqcSqSb2Tn/m7ooXERBwgG6NPe+QUGJy1
         RO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777995573; x=1778600373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=spNG7IJraDg4T5BsvCQ+9NVFqbAOm2jy1KvenC+2iQ4=;
        b=QdULJcio4f97WIda0DcAC9pfX2z7gsFKoT/hcLcvCZBpNV3OMduzkRbeR0uUl4RTRf
         2mrgPaieInWPoMtHxSsh3JJ+WQzsd4jEiLaLynrxfgCSxmSgVlrTXAs2JxReNu9T6MUQ
         YyGLB6gh3Qmei1zj84iLuncbrsbC/3onKdXKz1JFKML2uk9RCOt/fRJhm/az/nXkeM0h
         GsInrvnfEjBijmtH1s+h5HbMgyYHYTkYchqt2KOKDRpFlDYZSIVm3Nk+TdMk6dd2D0sa
         LVszj8xQ/Um27/jo7/GqQBk65C2gPqBQuuQS7ROp2XpwYKzsNnvFLqti6Gw8oWf656Nr
         2rfA==
X-Forwarded-Encrypted: i=1; AFNElJ/mZDVnExNZKWXB4Y77Vp/L+8ZFyTq4xaKabqaNJgnoeXYyN6LTPUhX0R62Xgpv33lkrRUSiaLkKQc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq3vKKnYNR3j5Q/ywmm6qwurNpTKKjoJGXmiK/uEtotK/+bygt
	IjPTB9+R5F4obNbkAFmTA/lwUp//4NLb8rd6KNI/BjAk/lYMQ7C62V4E
X-Gm-Gg: AeBDiev4za8cv9rd4Z9MjfnvKJTHp9Fy8EJOGh/1s2V8DMLC6VsjLNSzvTB5e/yQ7cC
	U0Z3sGa7cSXac+Pn9jYeJho8mZlPF+yO+TOVoDY0OSFlLrtdJ6cpU/R4RrIqdJ4qgO5DYy4wP8u
	0/Z224k1+Ic6nTFIERLa3ZQMjcG9qxYmkJy6QBwMGAZcOPkWKFyTOxt2haKmFsXJ5J2fZvT9rxG
	cZ5G7tUr9ZZbcBN9WJWUOSdDV1IP7Z7Bt9HVNmYoSTZ/8no4JcZsZLLlFmtT8vynGmoDnyqHII1
	U1XUg9kBkIwBQjlzICP/cDtju5sT8RvBozzlUTrAUY6gshFxYEAEnfXU6laevTESRACOdAYitqR
	7rxNctKpB4e4u5avoZbfLlTH7h3OAQ1XddrJ+3cEM2ZBweXgEXhgrEK2yL/J00zBJJI6JMv2sNT
	85h2wRJbZYZ5bC8WcoCnVD8ja8GDrI0RFfIlGbF43YZELNaSwAcHraojmCvNgmVSIrmSk=
X-Received: by 2002:a05:6820:3109:b0:694:8ad6:245f with SMTP id 006d021491bc7-69697dd52eemr7034578eaf.43.1777995573227;
        Tue, 05 May 2026 08:39:33 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:52::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43454d324a4sm13945195fac.14.2026.05.05.08.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 08:39:32 -0700 (PDT)
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
	riel@surriel.com,
	haowenchao22@gmail.com
Subject: [PATCH v6 16/22] swap: do not unnecessarily pin readahead swap entries
Date: Tue,  5 May 2026 08:38:45 -0700
Message-ID: <20260505153854.1612033-17-nphamcs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260505153854.1612033-1-nphamcs@gmail.com>
References: <20260505153854.1612033-1-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When we perform swap readahead, the target entry is already pinned by
the caller. No need to pin swap entries in the readahead window that
belongs in the same virtual swap cluster as the target swap entry.

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 mm/swap.h       |  1 +
 mm/swap_state.c | 22 +++++++++-------------
 mm/vswap.c      | 10 ++++++++++
 3 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/mm/swap.h b/mm/swap.h
index d46b2f243f83..f3f2afc6751b 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -156,6 +156,7 @@ void swap_cache_lock(swp_entry_t entry);
 void swap_cache_unlock(swp_entry_t entry);
 void vswap_rmap_set(struct swap_cluster_info *ci, swp_slot_t slot,
 			   unsigned long vswap, int nr);
+bool vswap_same_cluster(swp_entry_t entry1, swp_entry_t entry2);
 
 static inline struct address_space *swap_address_space(swp_entry_t entry)
 {
diff --git a/mm/swap_state.c b/mm/swap_state.c
index 7fe4d9529e4a..39daea7bed66 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -553,22 +553,18 @@ static struct folio *swap_vma_readahead(swp_entry_t targ_entry, gfp_t gfp_mask,
 		pte_unmap(pte);
 		pte = NULL;
 		/*
-		 * Readahead entry may come from a device that we are not
-		 * holding a reference to, try to grab a reference, or skip.
-		 *
-		 * XXX: for now, always try to pin the swap entries in the
-		 * readahead window to avoid the annoying conversion to physical
-		 * swap slots. Once we move all swap metadata to virtual swap
-		 * layer, we can simply compare the clusters of the target
-		 * swap entry and the current swap entry, and pin the latter
-		 * swap entry's cluster if it differ from the former's.
+		 * The target entry is already pinned - if the readahead entry
+		 * belongs to the same cluster, it's already protected.
 		 */
-		swapoff_locked = tryget_swap_entry(entry, &si);
-		if (!swapoff_locked)
-			continue;
+		if (!vswap_same_cluster(entry, targ_entry)) {
+			swapoff_locked = tryget_swap_entry(entry, &si);
+			if (!swapoff_locked)
+				continue;
+		}
 		folio = __read_swap_cache_async(entry, gfp_mask, mpol, ilx,
 						&page_allocated, false);
-		put_swap_entry(entry, si);
+		if (swapoff_locked)
+			put_swap_entry(entry, si);
 		if (!folio)
 			continue;
 		if (page_allocated) {
diff --git a/mm/vswap.c b/mm/vswap.c
index 01c336ae252c..195ba3520e54 100644
--- a/mm/vswap.c
+++ b/mm/vswap.c
@@ -1542,6 +1542,16 @@ void put_swap_entry(swp_entry_t entry, struct swap_info_struct *si)
 	rcu_read_unlock();
 }
 
+/*
+ * Check if two virtual swap entries belong to the same vswap cluster.
+ * Useful for optimizing readahead when entries in the same cluster
+ * share protection from a pinned target entry.
+ */
+bool vswap_same_cluster(swp_entry_t entry1, swp_entry_t entry2)
+{
+	return VSWAP_CLUSTER_IDX(entry1) == VSWAP_CLUSTER_IDX(entry2);
+}
+
 static int vswap_cpu_dead(unsigned int cpu)
 {
 	struct vswap_cluster *cluster;
-- 
2.52.0

