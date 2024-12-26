Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668301DAC9B
	for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 17:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735232868; cv=none; b=Ak2R6ZblZyHe+bGxeUDWzf8NZ02nOeDjkMLCu72rvTYL5ltJ6WthPOCR3jJMaVh4A690jpNdGv04RhKMdAM1J+GB0mZD+ll7lpsQSu0caJki758UQMCJuYCYha8obl5QCMSn7DXCIvjDJufui/CoStWj7Ms2268tbstfpdS0iR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735232868; c=relaxed/simple;
	bh=sdxn3rGcLv5zmA1rrGkq4Ky5Dn7POqqyjDqWrprIph0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JRFZedcEB62oG2il8upa2BqHzkXcItDmN6lSjpq02OpQlHeonaMuwmT584PlVjG0Vlmow4D8skYEfGN3GYjJzgzXAV2e33U0yDz6jN9WljsA1UcI1dQQAjntBdLFwTo9yJi7ILcxcMTLrmCnCO9RvbVnUmWpdUcy9kofAWtzNE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YK+8zp0O; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YK+8zp0O"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ee3206466aso8503121a91.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 09:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735232866; x=1735837666; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xy66KyEUcK4AYkPdjflJwK6nWoE6f14AOpge1PsZznw=;
        b=YK+8zp0OIq7c6etrqsoDOd1SlzaeC1++8BVbudCsYBPUAVB6Mr20i+adMbqY0m4VEr
         VUcsaHUxT/VIccIG1S/myRyhpDJxZzPF5FpSjnAS44buW5vasMHg0ObChUg9WGkx7zIF
         OBoUH4UEta0upCpxLA4mrnEMOotmrRUvgNY9YIGWW3turroNKoGpygYQqTph2NG/HMxI
         blvswYTZ8SgODl9zEPd+AJDTA7bdWMAyjjEF9A/chCvEmHi8my568d1DhMMqwwdTr2Ad
         DENjxMEwae9lMkKICoWMOrYVRLkwsehzz/BDwi54EyisYQ4Uv6yAWLPGE3ZbFedjutPA
         mVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735232866; x=1735837666;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xy66KyEUcK4AYkPdjflJwK6nWoE6f14AOpge1PsZznw=;
        b=GBEsT0jCInixd5sOLkeO6jNTaikTIlvY2g4EPXlBQc4Pkob8vMNbKPm/qi+a20au8P
         IaCputw9n2ynZfM498PCDhIRGx+mLk8198zfO/3TJrv1NmLGarVHza6SGnXlgrQsP/CD
         2wUtXKkoDKebISB/SOnZpT9P5EDDNWbPiFWIHK91uIObDdgyNGnjoMZDVs6AXT6jR27c
         4gp2bDMUdWvZoIylzwLlVLh//NnFSfbd5rWgvn20/MofJ5hAsHcPI2H3cvLmV2duco9s
         Wjda95lMZdmtoIVqpLqURihghsw4a3Y/wi9GQYlhIhHqnu9nyhyyz8jPW/X7+GHOAt+A
         /b1A==
X-Forwarded-Encrypted: i=1; AJvYcCWDbZgE0t1QaMH3Oy0PHu+VdIaKNbfd6LaCX28xo4UhzDMwtlLvc9HrGb5JHjh0YWnHJ7uUzXSNOl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT04KlU0ifFZZOu6EhanocX2vq1AKvGrHJ0PPSkAuBsK9+sPhq
	+pTcTk4ranzdxmuDGlVHvVGo2j/eAx2mGzl3dEiexaM6uC82JDNnE+b1wSAzwYCvY4FRLk/wYW1
	Bow==
X-Google-Smtp-Source: AGHT+IGAr2xLbuXi2R908ZY5it7N2onoqChj/Zox7EvU+cfvoLneDmddmW0yL/ElwVm7zYdY6Kk+YCxDfGI=
X-Received: from pjbpq10.prod.google.com ([2002:a17:90b:3d8a:b0:2ee:4b37:f869])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3a43:b0:2ee:94a0:255c
 with SMTP id 98e67ed59e1d1-2f4536d25fcmr36257223a91.13.1735232865882; Thu, 26
 Dec 2024 09:07:45 -0800 (PST)
Date: Thu, 26 Dec 2024 09:07:08 -0800
In-Reply-To: <20241226170710.1159679-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226170710.1159679-17-surenb@google.com>
Subject: [PATCH v7 16/17] mm: make vma cache SLAB_TYPESAFE_BY_RCU
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

To enable SLAB_TYPESAFE_BY_RCU for vma cache we need to ensure that
object reuse before RCU grace period is over will be detected by
lock_vma_under_rcu(). Current checks are sufficient as long as vma
is detached before it is freed. Implement this guarantee by calling
vma_ensure_detached() before vma is freed and make vm_area_cachep
SLAB_TYPESAFE_BY_RCU. This will facilitate vm_area_struct reuse and
will minimize the number of call_rcu() calls.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h               |  2 --
 include/linux/mm_types.h         | 10 +++++++---
 include/linux/slab.h             |  6 ------
 kernel/fork.c                    | 31 +++++++++----------------------
 mm/mmap.c                        |  3 ++-
 mm/vma.c                         | 10 +++-------
 mm/vma.h                         |  2 +-
 tools/testing/vma/vma_internal.h |  7 +------
 8 files changed, 23 insertions(+), 48 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 56a7d70ca5bd..017d70e1d432 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -258,8 +258,6 @@ void setup_initial_init_mm(void *start_code, void *end_code,
 struct vm_area_struct *vm_area_alloc(struct mm_struct *);
 struct vm_area_struct *vm_area_dup(struct vm_area_struct *);
 void vm_area_free(struct vm_area_struct *);
-/* Use only if VMA has no other users */
-void __vm_area_free(struct vm_area_struct *vma);
 
 #ifndef CONFIG_MMU
 extern struct rb_root nommu_region_tree;
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index b5312421dec6..3ca4695f6d0f 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -574,6 +574,12 @@ static inline void *folio_get_private(struct folio *folio)
 
 typedef unsigned long vm_flags_t;
 
+/*
+ * freeptr_t represents a SLUB freelist pointer, which might be encoded
+ * and not dereferenceable if CONFIG_SLAB_FREELIST_HARDENED is enabled.
+ */
+typedef struct { unsigned long v; } freeptr_t;
+
 /*
  * A region containing a mapping of a non-memory backed file under NOMMU
  * conditions.  These are held in a global tree and are pinned by the VMAs that
@@ -687,9 +693,7 @@ struct vm_area_struct {
 			unsigned long vm_start;
 			unsigned long vm_end;
 		};
-#ifdef CONFIG_PER_VMA_LOCK
-		struct rcu_head vm_rcu;	/* Used for deferred freeing. */
-#endif
+		freeptr_t vm_freeptr; /* Pointer used by SLAB_TYPESAFE_BY_RCU */
 	};
 
 	/*
diff --git a/include/linux/slab.h b/include/linux/slab.h
index 10a971c2bde3..681b685b6c4e 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -234,12 +234,6 @@ enum _slab_flag_bits {
 #define SLAB_NO_OBJ_EXT		__SLAB_FLAG_UNUSED
 #endif
 
-/*
- * freeptr_t represents a SLUB freelist pointer, which might be encoded
- * and not dereferenceable if CONFIG_SLAB_FREELIST_HARDENED is enabled.
- */
-typedef struct { unsigned long v; } freeptr_t;
-
 /*
  * ZERO_SIZE_PTR will be returned for zero sized kmalloc requests.
  *
diff --git a/kernel/fork.c b/kernel/fork.c
index 7a0800d48112..da3b1ebfd282 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -471,7 +471,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 	return new;
 }
 
-void __vm_area_free(struct vm_area_struct *vma)
+void vm_area_free(struct vm_area_struct *vma)
 {
 	/* The vma should be detached while being destroyed. */
 	vma_assert_detached(vma);
@@ -480,25 +480,6 @@ void __vm_area_free(struct vm_area_struct *vma)
 	kmem_cache_free(vm_area_cachep, vma);
 }
 
-#ifdef CONFIG_PER_VMA_LOCK
-static void vm_area_free_rcu_cb(struct rcu_head *head)
-{
-	struct vm_area_struct *vma = container_of(head, struct vm_area_struct,
-						  vm_rcu);
-
-	__vm_area_free(vma);
-}
-#endif
-
-void vm_area_free(struct vm_area_struct *vma)
-{
-#ifdef CONFIG_PER_VMA_LOCK
-	call_rcu(&vma->vm_rcu, vm_area_free_rcu_cb);
-#else
-	__vm_area_free(vma);
-#endif
-}
-
 static void account_kernel_stack(struct task_struct *tsk, int account)
 {
 	if (IS_ENABLED(CONFIG_VMAP_STACK)) {
@@ -3144,6 +3125,11 @@ void __init mm_cache_init(void)
 
 void __init proc_caches_init(void)
 {
+	struct kmem_cache_args args = {
+		.use_freeptr_offset = true,
+		.freeptr_offset = offsetof(struct vm_area_struct, vm_freeptr),
+	};
+
 	sighand_cachep = kmem_cache_create("sighand_cache",
 			sizeof(struct sighand_struct), 0,
 			SLAB_HWCACHE_ALIGN|SLAB_PANIC|SLAB_TYPESAFE_BY_RCU|
@@ -3160,8 +3146,9 @@ void __init proc_caches_init(void)
 			sizeof(struct fs_struct), 0,
 			SLAB_HWCACHE_ALIGN|SLAB_PANIC|SLAB_ACCOUNT,
 			NULL);
-	vm_area_cachep = KMEM_CACHE(vm_area_struct,
-			SLAB_HWCACHE_ALIGN|SLAB_NO_MERGE|SLAB_PANIC|
+	vm_area_cachep = kmem_cache_create("vm_area_struct",
+			sizeof(struct vm_area_struct), &args,
+			SLAB_HWCACHE_ALIGN|SLAB_PANIC|SLAB_TYPESAFE_BY_RCU|
 			SLAB_ACCOUNT);
 	mmap_init();
 	nsproxy_cache_init();
diff --git a/mm/mmap.c b/mm/mmap.c
index 3cc8de07411d..7fdc4207fe98 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1364,7 +1364,8 @@ void exit_mmap(struct mm_struct *mm)
 	do {
 		if (vma->vm_flags & VM_ACCOUNT)
 			nr_accounted += vma_pages(vma);
-		remove_vma(vma, /* unreachable = */ true);
+		vma_mark_detached(vma);
+		remove_vma(vma);
 		count++;
 		cond_resched();
 		vma = vma_next(&vmi);
diff --git a/mm/vma.c b/mm/vma.c
index 4a3deb6f9662..e37eb384d118 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -406,18 +406,14 @@ static bool can_vma_merge_right(struct vma_merge_struct *vmg,
 /*
  * Close a vm structure and free it.
  */
-void remove_vma(struct vm_area_struct *vma, bool unreachable)
+void remove_vma(struct vm_area_struct *vma)
 {
 	might_sleep();
 	vma_close(vma);
 	if (vma->vm_file)
 		fput(vma->vm_file);
 	mpol_put(vma_policy(vma));
-	if (unreachable) {
-		vma_mark_detached(vma);
-		__vm_area_free(vma);
-	} else
-		vm_area_free(vma);
+	vm_area_free(vma);
 }
 
 /*
@@ -1199,7 +1195,7 @@ static void vms_complete_munmap_vmas(struct vma_munmap_struct *vms,
 	/* Remove and clean up vmas */
 	mas_set(mas_detach, 0);
 	mas_for_each(mas_detach, vma, ULONG_MAX)
-		remove_vma(vma, /* unreachable = */ false);
+		remove_vma(vma);
 
 	vm_unacct_memory(vms->nr_accounted);
 	validate_mm(mm);
diff --git a/mm/vma.h b/mm/vma.h
index 18c9e49b1eae..d6803626151d 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -173,7 +173,7 @@ int do_vmi_munmap(struct vma_iterator *vmi, struct mm_struct *mm,
 		  unsigned long start, size_t len, struct list_head *uf,
 		  bool unlock);
 
-void remove_vma(struct vm_area_struct *vma, bool unreachable);
+void remove_vma(struct vm_area_struct *vma);
 
 void unmap_region(struct ma_state *mas, struct vm_area_struct *vma,
 		struct vm_area_struct *prev, struct vm_area_struct *next);
diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
index 1e8cd2f013fa..c7c580ec9a2d 100644
--- a/tools/testing/vma/vma_internal.h
+++ b/tools/testing/vma/vma_internal.h
@@ -693,14 +693,9 @@ static inline void mpol_put(struct mempolicy *)
 {
 }
 
-static inline void __vm_area_free(struct vm_area_struct *vma)
-{
-	free(vma);
-}
-
 static inline void vm_area_free(struct vm_area_struct *vma)
 {
-	__vm_area_free(vma);
+	free(vma);
 }
 
 static inline void lru_add_drain(void)
-- 
2.47.1.613.gc27f4b7a9f-goog

