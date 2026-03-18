Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38EB38BF7C
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 22:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773873006; cv=none; b=ILy+GY5XZmMg1OpLyQDzlqY+LiQ7lTWTmxYr3t3bdNAYcjkbVCUykMpAW8HjiNh/HobQplPw8t4Vn9aXTLCVQua9GpoAu4TmvXgvftoDDkkVwpcw7WWZB2y4W4F73i640knf/TMZiPxZyzM4QlhmoJ/LDzpuXWAf3Y8O05yques=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773873006; c=relaxed/simple;
	bh=doGbf0EPfObop4nrog4GZiP31w0uYtiVtwrMZ8pit04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FSdwpawTian6MmRPqUUqOoKzTgO6lckcvWBB9npy4I1oq2err525BChhq4S7+/yELnyB1SZEmAuZQQf9ezN+tDMHNcExuP/UdMUwM0GUv0aO8DkYEJ791oSuzFqhS4oo0F0TZpj1My7QIZbiBBnoNOvJvZbsnjZApQIF1Y7Eu24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nwi1i24+; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nwi1i24+"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d7851e2cc4so317434a34.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 15:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773873004; x=1774477804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2la7S1lv8SZ13es345xjBt9aiwYWClPAry0jC6dTWYc=;
        b=Nwi1i24+ajqqGDUxg7y8XL1Ci0ZGtH6iOZmOpfK8C5oVVuP5JifUL6ktqaf6SZEQWx
         QMRzWx8rKXx/qh8PjdCZL2TokPhZTiGkwhKpq9UIjAAUj4nVHmemNjK1joTl3OqE5J+8
         TEWyvwWkCwU5tNra3sAebb50E7G9vWXOkqqPg9YtAH7PG6UQfPEgZR7ShcIjXD3RafZJ
         4hbaiepYFDIuSKMiSI7PTebxPp3B01g8m3d4dmlIYcc5I9W6Az2c5leEnv868vXBm3/+
         U7NlmL2IAEHhhZF1bAf3jmm4CZg/htOGogIWdvJjasuMTtKbqVxRqu6G+gwmzXjdzCuk
         7q/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773873004; x=1774477804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2la7S1lv8SZ13es345xjBt9aiwYWClPAry0jC6dTWYc=;
        b=hBXvcDIreXIwuqwshwzGuyC/j9jy444BNCdgLSZeQp+cQHaBCPnAbS/WiZudZUgoXa
         um6kfKgewe4ekOK5m+PyX4urZ7yOR+TipVGGTlcqLF5WNST/oPJtrrOCp1n5OmpRr9fB
         VAOUCCpkNbOeqHah1hgus39A0yN+3lgcoLGZ8mVXJMIaFCT6oCZlf5Oi0/Ynafo5vGyX
         neAUmTBMVhB2uY1VjQSId0IAd7VlmgsqDGbB3OykTzalg8i259pJrC4mPzgEFOIY5pgc
         5yyzhnC8Sodx//kjEG6XRZqOhOiNqEx4AcDkdZyCzT9HzqQORmYPH/jmNnqhKBrWD0t9
         YTzA==
X-Forwarded-Encrypted: i=1; AJvYcCWG0GSUtZkxXk5P7b0csg57zs7kHr+V9v4JLzIUAxfrDctb/MLUxCMzxU7QzarxrkvcfbWQghA1nX4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0lSejldYJJ4f3ptvhtdVLRhFAYczXcJ6JuZ3oxFlU5BmyLjOS
	NKwyTPNL9E6PKs499C3jpU9NsjycJFFphg3Qe76xidGJHFtD6hhwIjJG
X-Gm-Gg: ATEYQzwVE9nMU6jLzzXrnfjpSTigDkrE3kvbAiFQchU9MAA/zrdmZMn++z5zrOOWRR8
	nYJ8Jsv/bl9JywdDRjWr1bp0ecEt/vctNISsqo7Tx8OoSUVhGo2D36CoAL//oZLMRh0wnKE/pYy
	q4t3Ntt92TnaMGDSlGraXLnF0gBfUTMWY4MNamOSFCrdcVjTFCAKLoaHyB9P+CeHa2yYDFzLsEd
	LCzRsOPiz/zEQduBSIhQhcj3PnK1z9RFNOay+fNJ3x85O+GPCsxyXMkBX5VXbRXPtce8JLxKtRP
	/qrfwhfmfFCvKsJaN0HHkVWQD/yXnfb8EHJHl5qRnN/sFFUqbkUC9S1CUFQ6mfu99qE/LatE4gK
	/5eELD/gXZa5iPJMvG6YxqsAT5+jDoNFxm0yfZOWSj9jkltAq9GQDBTZhu9BTi6fUvpp3kmXJpV
	JDrb3Sy2XGP3f0ot5aWCc0zHGeFoiAt1NH4huodcZiVmMB
X-Received: by 2002:a05:6830:498b:b0:7d4:96c3:3f97 with SMTP id 46e09a7af769-7d7ca566cf8mr3460497a34.2.1773873003460;
        Wed, 18 Mar 2026 15:30:03 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:6::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7c9be847fsm3020992a34.27.2026.03.18.15.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 15:30:02 -0700 (PDT)
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
Subject: [PATCH v4 05/21] mm/swap: add a new function to check if a swap entry is in swap cached.
Date: Wed, 18 Mar 2026 15:29:36 -0700
Message-ID: <20260318222953.441758-6-nphamcs@gmail.com>
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

Userfaultfd checks whether a swap entry is in swapcache. This is
currently done by directly looking at the swapfile's swap map - however,
the swap cached state will soon be managed at the virtual swap layer.
Abstract away this function.

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 include/linux/swap.h |  6 ++++++
 mm/swapfile.c        | 15 +++++++++++++++
 mm/userfaultfd.c     |  3 +--
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 3da637b218baf..f91a442ac0e82 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -435,6 +435,7 @@ void free_swap_and_cache_nr(swp_entry_t entry, int nr);
 int __swap_count(swp_entry_t entry);
 bool swap_entry_swapped(struct swap_info_struct *si, swp_entry_t entry);
 int swp_swapcount(swp_entry_t entry);
+bool is_swap_cached(swp_entry_t entry);
 
 /* Swap cache API (mm/swap_state.c) */
 static inline unsigned long total_swapcache_pages(void)
@@ -554,6 +555,11 @@ static inline int swp_swapcount(swp_entry_t entry)
 	return 0;
 }
 
+static inline bool is_swap_cached(swp_entry_t entry)
+{
+	return false;
+}
+
 static inline int folio_alloc_swap(struct folio *folio)
 {
 	return -EINVAL;
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 46da28c533bbe..0471a965f222b 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -194,6 +194,21 @@ static bool swap_only_has_cache(struct swap_info_struct *si,
 	return true;
 }
 
+/**
+ * is_swap_cached - check if the swap entry is cached
+ * @entry: swap entry to check
+ *
+ * Check swap_map directly to minimize overhead, READ_ONCE is sufficient.
+ *
+ * Returns true if the swap entry is cached, false otherwise.
+ */
+bool is_swap_cached(swp_entry_t entry)
+{
+	struct swap_info_struct *si = __swap_entry_to_info(entry);
+
+	return READ_ONCE(si->swap_map[swp_offset(entry)]) & SWAP_HAS_CACHE;
+}
+
 static bool swap_is_last_map(struct swap_info_struct *si,
 		unsigned long offset, int nr_pages, bool *has_cache)
 {
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 25f89eba0438c..98be764fb3ecd 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -1190,7 +1190,6 @@ static int move_swap_pte(struct mm_struct *mm, struct vm_area_struct *dst_vma,
 		 * Check if the swap entry is cached after acquiring the src_pte
 		 * lock. Otherwise, we might miss a newly loaded swap cache folio.
 		 *
-		 * Check swap_map directly to minimize overhead, READ_ONCE is sufficient.
 		 * We are trying to catch newly added swap cache, the only possible case is
 		 * when a folio is swapped in and out again staying in swap cache, using the
 		 * same entry before the PTE check above. The PTL is acquired and released
@@ -1200,7 +1199,7 @@ static int move_swap_pte(struct mm_struct *mm, struct vm_area_struct *dst_vma,
 		 * cache, or during the tiny synchronization window between swap cache and
 		 * swap_map, but it will be gone very quickly, worst result is retry jitters.
 		 */
-		if (READ_ONCE(si->swap_map[swp_offset(entry)]) & SWAP_HAS_CACHE) {
+		if (is_swap_cached(entry)) {
 			double_pt_unlock(dst_ptl, src_ptl);
 			return -EAGAIN;
 		}
-- 
2.52.0

