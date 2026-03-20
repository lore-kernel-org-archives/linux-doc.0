Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484073EE1CF
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 19:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774034888; cv=none; b=Qh80Z/lYag/IqyXoG0u8gVfS3ksKbwoKs1G08jIIJHFQMdPcbIQfJkqOJqI+HdgdMNBKC7QKX7YEwd0UgWwFB07S5YeFDL7/QP0ipOyih4gcWJ6s4a8z6rPX6PJQNRRPy+hePbgKdGBmQynstKHQdljosB2sr2vQZaE9JpXKfMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774034888; c=relaxed/simple;
	bh=0lBeslgTwumQ6urHnq8I/VnBlJMW9R3VWIV0MRlceUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJoqjJVN910kYjhFZEzR+tZaMTPCvWFKfgAY6LMkAPwcVUbrm7qOK9ClEeC/SOqyPfCJTOPry/azBC5SyZhKwvLN6kHzvhfVtqOGYpQB+dLoil57mkDdeqgTN2qrmLQNQZxPzErd4xBcnELbMEQLxJdiJ7mb45VR3gNCN5+FLLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=axLPzN6b; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axLPzN6b"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-467ed6463b1so524858b6e.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 12:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774034882; x=1774639682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRgUJ4HYnVe4CBYlwtFXukX7KCRZK3pYV2dpIHw1BJw=;
        b=axLPzN6bCHXoa8URBDvzI6IIOgpda+FO4AkKeH1YXcPZHvMZxN4uer5DfzSAhKT3nP
         nd4cvxWXYxu6pUh8DqGDI8CvE3znj3u7aM2jjzbOri6GUB6xaLLKeHbAhmZ0qQsa8ncB
         rFa0AO1noZJLRzyIedAzMkcJ+CNxI8OfIH+UHhBbU1SykdAHbEDW6tKmpcP0rvRRkrSd
         BfG9yxoYYfLRlpxoib+YlvXD8HZCtl085Ho8pXeN8isrFrYZqCyiPloiMjSmcvq6XM+Q
         iUj/b2Dy1Lg+weNF+2tFl+/h7ZEiYqOe0qxsQmtIsvuH/4FD6CY7R2qO/YzKZh70dYxB
         msLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774034882; x=1774639682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kRgUJ4HYnVe4CBYlwtFXukX7KCRZK3pYV2dpIHw1BJw=;
        b=duolcFoO/pMqiH0iITy48u10lJT1aPpUxIB79PKEw2nP+AvOtgZf5Jl5wsXc6WtOpM
         T3sQ5J7MEqTmQY14k9/vZJomqcImnfKglurWgUeu4e/9LJkLJQwYPdrNjMwbpgCVi0He
         jQhmia2aHQGMsFoR/9Fz+l8d0TL3DMNovUVhn/jFiEOF8du7XN9oxtzS+YMt6UZBbqkp
         sRzSPFaopt0Zm8Hez+rxAIMwLM3sJFilZ+2c+pCPm4yoZStVqh3TCCNWNztpKMMZEQkJ
         Ks+zp70B/veko/eASfE8sl/B7ulSoj9ZeDqwEkkDdoiaAMsQggvYnv4mzZZ6htQwuzVU
         NZZg==
X-Forwarded-Encrypted: i=1; AJvYcCUsxlVDAX98Wxkn9FVcbZ+nyrH/BJU+1EtFROgxGv6CJ582Li3nqs+PxySX/Qj8/NIqL+vKW93Lokc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVxdwlfy/RTbtTYbghO5tJ0X/FMFQ0Hyq6PiD4udDbVNOVJOcE
	fYEqZieBJEYN3DmgXZzrdpCjcgNlJdQ1DZu5TogyeW+Oan5Vng3YegvD
X-Gm-Gg: ATEYQzzG+YTJBhRvdlwxwpR7VgN9Rk+apoFlzUjSD7pS1mbuTdedBg6ejPG8noEd6BG
	PzEm7ZUjm8MH32T3OBKHjJZZgzHPZfjIXvMEsHqBdr56vt2uSmKb5TnPIGetIXCkcQn6DlW0BkV
	/qDx+KoWhM9ovyUGGA1WOtiuTQKDzYGVjKNZxlGkTQ3uIiBXCYdlRMkyu6VuKtd1dEfRFynBmoK
	8qW4ZKLUXdMUI1YM31z+9V8ddCF515Q79nCfNM1TdAu5ZKkcJdc04hihAWVZbMQ0/c0WR97SKNW
	ncy05uC2qsIY6Z/ONhoeqFKnPzoVvkTEyZ3VPcqhsJneVYsNg0fowj8XbxkiNkpZH2vyPywYetf
	smEXY8bRGUXTM3+GKkOGIlaSz/5DWLN+Bk26DkcAWGACC6dZePTiQLsV8ylEJpZK6lljZjGv4a+
	Jd4zoCMzouduFjG0Ycb7kezCVqJP9U2HUfAPHpqRNQcJ90XA==
X-Received: by 2002:a05:6808:130b:b0:467:24cb:c00 with SMTP id 5614622812f47-467e5fbd406mr2192297b6e.57.1774034881749;
        Fri, 20 Mar 2026 12:28:01 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:49::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-467e7d4c447sm1921168b6e.6.2026.03.20.12.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 12:28:01 -0700 (PDT)
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
Subject: [PATCH v5 16/21] swap: do not unnecesarily pin readahead swap entries
Date: Fri, 20 Mar 2026 12:27:30 -0700
Message-ID: <20260320192735.748051-17-nphamcs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260320192735.748051-1-nphamcs@gmail.com>
References: <20260320192735.748051-1-nphamcs@gmail.com>
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
index d7981ec82cf49..2229c3485b7e2 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -213,6 +213,7 @@ void swap_cache_lock(swp_entry_t entry);
 void swap_cache_unlock(swp_entry_t entry);
 void vswap_rmap_set(struct swap_cluster_info *ci, swp_slot_t slot,
 			   unsigned long vswap, int nr);
+bool vswap_same_cluster(swp_entry_t entry1, swp_entry_t entry2);
 
 static inline struct address_space *swap_address_space(swp_entry_t entry)
 {
diff --git a/mm/swap_state.c b/mm/swap_state.c
index ad80bf098b63f..e8e0905c7723f 100644
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
index 861a504c9fbfd..1040bb8a9f320 100644
--- a/mm/vswap.c
+++ b/mm/vswap.c
@@ -1418,6 +1418,16 @@ void put_swap_entry(swp_entry_t entry, struct swap_info_struct *si)
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

