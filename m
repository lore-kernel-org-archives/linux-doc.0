Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6016639A051
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 22:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773873026; cv=none; b=RYHYr148MD7UJu8annkMp0pThnMaAhYvrcFcitPumFEwBMgH2ErmyFsoaTfgZRYrNA2ry7ujtYoC+Ry6R4XX1ThX7DWtTLnNtdzBdyVEMBOos2z/tFnD8hQakEzTb98uItk6wunH7c/SgwCExmpOMuQ4xRd2wTeHue+IDrM8I48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773873026; c=relaxed/simple;
	bh=fnjImx7VCwMKBpHwkDW1K85lk6CY/A2Ul7Cqjhn0QzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nxOW9iEKZxUXPHwas73ER90+WwYSINlnK7b6xmuAOm5m+Z0kHyjtH9JTPPy+K8Q2tPSx0IjG/BJtYbSLqCKzuNcUSFie3Ecx6POzq+6/UX34vYdxMj18gHOwUj0vH0aKBustuQu5pwZ7qftACWGKXLMYOcUkKioG3pO23nGlimk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODFnzVc8; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODFnzVc8"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d75371d873so415916a34.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 15:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773873022; x=1774477822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKrmsaRryTJ5nHXiiuirqMc/v+zxITLhw4bMyN6ZWm0=;
        b=ODFnzVc858qDi1mXZysSz7VqRXZ85fqpT46m+xw2hCc9HoK+NtVe89BIpGAhlBGfyU
         5ezJDUWEqTUnfH7FhbRGCtzJSao3DOonIXH+/ApmLLNzbaIGxGaD9QGgBvPvfFwqMXth
         aN659UwJvSnoeL3AchKQx8fAL8UOMCQVpaIWi4IvXdYuS3kU0hOElHN4vlALkfnXKXwj
         2oMnALciPcEHPy4MUeOKoj/X8Rn5DSoCAsUlfhFXaZCjT6aYTVkpuq99Iuf9aRG+PT55
         fRbqLOmnGkYGR7qFQXb9U3tgQ7ui2Stny67g/GdX2maZCsudg/LosPB3Q2U9xP043z/E
         n1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773873022; x=1774477822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FKrmsaRryTJ5nHXiiuirqMc/v+zxITLhw4bMyN6ZWm0=;
        b=mRCjcs7jfhYVIx/pkoT+CbgZXXt9lJgJy5EsVL+QWOk2vxhmJ6+HfjwaoGYPkTAuLb
         BhXPoKAqZxl75Avo6yUw6T66N3DW2m6OP+e0sRoRuX2bRQ/x7HPD3pbGD+5D+s1iCiJl
         K979U+uARbYr72TnCp7ksHu1jnkRKO9HwhYMxbsJQsxe4IzLYQtO6lF+5a1QXH1hkd80
         qcgVvncayzCANdxOk7Wr64h+8Q8Izjy871Jdo6YyrD0TjJh3vWODEr2Uave/vIi5UGJx
         UAil4rCTLeLHEN7tDc8AZ/PkMNPoAJ7BfPCtIPIvle6wcNcaL0Lttk+l39tLKCz5DVjs
         21IA==
X-Forwarded-Encrypted: i=1; AJvYcCWWs6asNXRo7axmGvTRJ0XXwxVWhl6g6EjK9Ltym035GbBNXK8XM1r+0yfteSoXCE3WHXvWAoPd6dw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiz7GGekrYT+0P6/g2KoLk8tvUH08Sq33M0lD7vQ3ayYwd0uS4
	dlxmQ0jVI8cmKqjjwrov7v0Q0Y3wAajtXn6MSpn4IYrOTmRk9Y+jJJIU
X-Gm-Gg: ATEYQzx99c2hPqLhSL4rELTP4hicOgXkY9zloLr106l6uFj2Sn5yRxchVAnNV5/5FtE
	+PX6SDubmGwlSxDluzNTzip1DmjQA/hydg9Jh7Zmo6+73spWSmhsVfrRAPWVRE1uqMXeXCbtO1i
	XFFCxVPfSsguEKLjZbUuQqfNGTHWYc3CfrJBcCVSO5IZaNcfy10PUcL7L0Ai180jWKWJAnmdNzW
	gFUCJ+LHV+Yfefh1TTVN+LFMeLvgPT5VlxptG9K6WpscIpb0Y2u+RLEg5ra9bwtFz8UC3JvjM8z
	+7FwoDClqhuAMeKYtDteDJcqifKtPd3p1DSQwOd81ZWPzeoRXwPG+2fdJEsMlijH+ZSNPXBFDVn
	2tXml+Kz6fqKrPBRVTWSZs5k9xB3s1gFy+f6JPy8ovvtll3sT0oyw8KughMhTzWJyyDLh44AURZ
	QSqiONsJSJ2OGQgcZN6vrRaPTtJZkS0DILjlZn/jpZeK/5pQ==
X-Received: by 2002:a05:6830:6af5:b0:7d7:d217:5116 with SMTP id 46e09a7af769-7d7d21752afmr1935454a34.17.1773873022052;
        Wed, 18 Mar 2026 15:30:22 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:48::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7c9b3696asm3133813a34.16.2026.03.18.15.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 15:30:20 -0700 (PDT)
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
Subject: [PATCH v4 16/21] swap: do not unnecesarily pin readahead swap entries
Date: Wed, 18 Mar 2026 15:29:47 -0700
Message-ID: <20260318222953.441758-17-nphamcs@gmail.com>
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
index fbb7c6003ad8c..b391511e0f0b9 100644
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

