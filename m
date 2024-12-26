Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9060E1487C1
	for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 17:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735232844; cv=none; b=EVvL8j5VxWi/gHSJgNJJIgg97bmS3dSX3nQ25O7HDvGBaNhHNtH80W1h3A1sCVpJEZI3hoUs9gTPDUQRbg2BH0t6e7IxDPFslMa6DZ+pDNFGGhNA6CoSt1ER4N7lwa0n3rZmJmfLcEtEOtKokrl0q9AlbLj8ejd2KOIJIAJyGVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735232844; c=relaxed/simple;
	bh=ruiO9aLYsTYCBSkm86yTyt9vPV6wSq57QK6xsEp5ZIU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ND6YCofxaOkzwkZVcKa21g6OPjtawqKETK9fE9or2qwrBUYsTPE2XPy/DMuF1fWkw3SUHrc7/bC82U0YqiwpXjDJB30d6+v5V5VU+pIT3rklKm55b+Z/NT5lp/YgikCKm/UCvTxE5D+oKar/ELzVN9EfXdr9R+XdvMQeGM4CHIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lDtPdHSP; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lDtPdHSP"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef7fbd99a6so8019172a91.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 09:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735232842; x=1735837642; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uC/uS/GmF3UbaohKrad0ksO3lGJZa9/e0a1asiVVa0A=;
        b=lDtPdHSPm6LoQXshi3n62O94yzLX/frfcnOpntG7kL93zTP+vzhlNnSllFFqOkXVtz
         OkNQvy/qdqBGYXQ5Z5vbGVL+vBq6IZVjrc7CPQFXBgb4u0vvQQ4qc/+ZGoCknwNri/dq
         j9to4sAzHA1uzbGt3VnXA1GRSADF8bmR/COFaBcug1yuXH+H4MZx72ElAYhPlAMQMYBL
         62Pf9s6xiTn4haZCcMp1NWZbhLzLpBFLHXp872ZQWg2fpIxvMWT+tH4twbqI/4IuswP7
         05EfH6je478Y71XSb2XHPfrtPaNTZNsN8ZFPbWeeZMcAC7BeAEHumJdFYZOfvS5/hJzc
         mc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735232842; x=1735837642;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uC/uS/GmF3UbaohKrad0ksO3lGJZa9/e0a1asiVVa0A=;
        b=Q7BK+RSnhj+amFFK/hsZBFCl46UvWF10Z2U7/APTNQbjO5kDfP9uL9j1skbC8RJ/9E
         zPeyITt/KX3Rup94yZZbl4EbMAAkHUjiN3KoLzB2kiqUGKiMmZFjF76vRhGWIHMGZd+t
         qRywkkBC4BY5zReAUJc9yghed+IxQPM1xmTjiigUXDP94JPFnLI5rM/hJt8iD8Z6Mam7
         u+M1lElRhSfV/8I6pWMq/2PYs+vWWLyzS79ToyRe7vaJ7opv48WOedHoTg/MCQDZ34s4
         y6Icx5luo0lorQt037rfdRfcuzChx8ZzAYQM0mPIyaSM1bfKPsSenTKjhbQFMTVzE2or
         lXhw==
X-Forwarded-Encrypted: i=1; AJvYcCVHQ6WilEEVeyAUMJJf9WnWJYKAHegYYkG/uZeP9KsZHrhFaBIe8QSbca2W6/jXhRUL6125tIGzC70=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7bWrST5lSH1plG9Wje85ddS14cxB1Q/Q6LffficLpaKvUPSVU
	Vf7QIl2TFmH3Ww0HTrLhC0rl58WaSioD1HHcrGMvbG6ezq1/Dzae8OqcXy4vi4b8bDgRM16HjWy
	Bmw==
X-Google-Smtp-Source: AGHT+IHCdGYEXz7DM0Oi4jA5FcxiPuZb/VK8PE48RzKkuHUHkyLtSTzBzCK0XU3Squr5UgqXBJEcCRqnrjo=
X-Received: from pjyr4.prod.google.com ([2002:a17:90a:e184:b0:2ea:3a1b:f493])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:fc4f:b0:2ea:5054:6c44
 with SMTP id 98e67ed59e1d1-2f452eeb641mr29738883a91.31.1735232841920; Thu, 26
 Dec 2024 09:07:21 -0800 (PST)
Date: Thu, 26 Dec 2024 09:06:56 -0800
In-Reply-To: <20241226170710.1159679-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226170710.1159679-5-surenb@google.com>
Subject: [PATCH v7 04/17] mm: modify vma_iter_store{_gfp} to indicate if it's
 storing a new vma
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	surenb@google.com
Content-Type: text/plain; charset="UTF-8"

vma_iter_store() functions can be used both when adding a new vma and
when updating an existing one. However for existing ones we do not need
to mark them attached as they are already marked that way. Add a parameter
to distinguish the usage and skip vma_mark_attached() when not needed.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h | 12 ++++++++++++
 mm/nommu.c         |  4 ++--
 mm/vma.c           | 16 ++++++++--------
 mm/vma.h           | 13 +++++++++----
 4 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 081178b0eec4..c50edfedd99d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -821,6 +821,16 @@ static inline void vma_assert_locked(struct vm_area_struct *vma)
 		vma_assert_write_locked(vma);
 }
 
+static inline void vma_assert_attached(struct vm_area_struct *vma)
+{
+	VM_BUG_ON_VMA(vma->detached, vma);
+}
+
+static inline void vma_assert_detached(struct vm_area_struct *vma)
+{
+	VM_BUG_ON_VMA(!vma->detached, vma);
+}
+
 static inline void vma_mark_attached(struct vm_area_struct *vma)
 {
 	vma->detached = false;
@@ -866,6 +876,8 @@ static inline void vma_end_read(struct vm_area_struct *vma) {}
 static inline void vma_start_write(struct vm_area_struct *vma) {}
 static inline void vma_assert_write_locked(struct vm_area_struct *vma)
 		{ mmap_assert_write_locked(vma->vm_mm); }
+static inline void vma_assert_attached(struct vm_area_struct *vma) {}
+static inline void vma_assert_detached(struct vm_area_struct *vma) {}
 static inline void vma_mark_attached(struct vm_area_struct *vma) {}
 static inline void vma_mark_detached(struct vm_area_struct *vma) {}
 
diff --git a/mm/nommu.c b/mm/nommu.c
index 9cb6e99215e2..72c8c505836c 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -1191,7 +1191,7 @@ unsigned long do_mmap(struct file *file,
 	setup_vma_to_mm(vma, current->mm);
 	current->mm->map_count++;
 	/* add the VMA to the tree */
-	vma_iter_store(&vmi, vma);
+	vma_iter_store(&vmi, vma, true);
 
 	/* we flush the region from the icache only when the first executable
 	 * mapping of it is made  */
@@ -1356,7 +1356,7 @@ static int split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
 
 	setup_vma_to_mm(vma, mm);
 	setup_vma_to_mm(new, mm);
-	vma_iter_store(vmi, new);
+	vma_iter_store(vmi, new, true);
 	mm->map_count++;
 	return 0;
 
diff --git a/mm/vma.c b/mm/vma.c
index 476146c25283..ce113dd8c471 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -306,7 +306,7 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
 		 * us to insert it before dropping the locks
 		 * (it may either follow vma or precede it).
 		 */
-		vma_iter_store(vmi, vp->insert);
+		vma_iter_store(vmi, vp->insert, true);
 		mm->map_count++;
 	}
 
@@ -660,14 +660,14 @@ static int commit_merge(struct vma_merge_struct *vmg,
 	vma_set_range(vmg->vma, vmg->start, vmg->end, vmg->pgoff);
 
 	if (expanded)
-		vma_iter_store(vmg->vmi, vmg->vma);
+		vma_iter_store(vmg->vmi, vmg->vma, false);
 
 	if (adj_start) {
 		adjust->vm_start += adj_start;
 		adjust->vm_pgoff += PHYS_PFN(adj_start);
 		if (adj_start < 0) {
 			WARN_ON(expanded);
-			vma_iter_store(vmg->vmi, adjust);
+			vma_iter_store(vmg->vmi, adjust, false);
 		}
 	}
 
@@ -1689,7 +1689,7 @@ int vma_link(struct mm_struct *mm, struct vm_area_struct *vma)
 		return -ENOMEM;
 
 	vma_start_write(vma);
-	vma_iter_store(&vmi, vma);
+	vma_iter_store(&vmi, vma, true);
 	vma_link_file(vma);
 	mm->map_count++;
 	validate_mm(mm);
@@ -2368,7 +2368,7 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
 
 	/* Lock the VMA since it is modified after insertion into VMA tree */
 	vma_start_write(vma);
-	vma_iter_store(vmi, vma);
+	vma_iter_store(vmi, vma, true);
 	map->mm->map_count++;
 	vma_link_file(vma);
 
@@ -2542,7 +2542,7 @@ int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	vm_flags_init(vma, flags);
 	vma->vm_page_prot = vm_get_page_prot(flags);
 	vma_start_write(vma);
-	if (vma_iter_store_gfp(vmi, vma, GFP_KERNEL))
+	if (vma_iter_store_gfp(vmi, vma, GFP_KERNEL, true))
 		goto mas_store_fail;
 
 	mm->map_count++;
@@ -2785,7 +2785,7 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
 				anon_vma_interval_tree_pre_update_vma(vma);
 				vma->vm_end = address;
 				/* Overwrite old entry in mtree. */
-				vma_iter_store(&vmi, vma);
+				vma_iter_store(&vmi, vma, false);
 				anon_vma_interval_tree_post_update_vma(vma);
 
 				perf_event_mmap(vma);
@@ -2865,7 +2865,7 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
 				vma->vm_start = address;
 				vma->vm_pgoff -= grow;
 				/* Overwrite old entry in mtree. */
-				vma_iter_store(&vmi, vma);
+				vma_iter_store(&vmi, vma, false);
 				anon_vma_interval_tree_post_update_vma(vma);
 
 				perf_event_mmap(vma);
diff --git a/mm/vma.h b/mm/vma.h
index 24636a2b0acf..18c9e49b1eae 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -145,7 +145,7 @@ __must_check int vma_shrink(struct vma_iterator *vmi,
 		unsigned long start, unsigned long end, pgoff_t pgoff);
 
 static inline int vma_iter_store_gfp(struct vma_iterator *vmi,
-			struct vm_area_struct *vma, gfp_t gfp)
+			struct vm_area_struct *vma, gfp_t gfp, bool new_vma)
 
 {
 	if (vmi->mas.status != ma_start &&
@@ -157,7 +157,10 @@ static inline int vma_iter_store_gfp(struct vma_iterator *vmi,
 	if (unlikely(mas_is_err(&vmi->mas)))
 		return -ENOMEM;
 
-	vma_mark_attached(vma);
+	if (new_vma)
+		vma_mark_attached(vma);
+	vma_assert_attached(vma);
+
 	return 0;
 }
 
@@ -366,7 +369,7 @@ static inline struct vm_area_struct *vma_iter_load(struct vma_iterator *vmi)
 
 /* Store a VMA with preallocated memory */
 static inline void vma_iter_store(struct vma_iterator *vmi,
-				  struct vm_area_struct *vma)
+				  struct vm_area_struct *vma, bool new_vma)
 {
 
 #if defined(CONFIG_DEBUG_VM_MAPLE_TREE)
@@ -390,7 +393,9 @@ static inline void vma_iter_store(struct vma_iterator *vmi,
 
 	__mas_set_range(&vmi->mas, vma->vm_start, vma->vm_end - 1);
 	mas_store_prealloc(&vmi->mas, vma);
-	vma_mark_attached(vma);
+	if (new_vma)
+		vma_mark_attached(vma);
+	vma_assert_attached(vma);
 }
 
 static inline unsigned long vma_iter_addr(struct vma_iterator *vmi)
-- 
2.47.1.613.gc27f4b7a9f-goog

