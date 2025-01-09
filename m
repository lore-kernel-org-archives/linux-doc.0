Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4CD2A1BB
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 02:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736389837; cv=none; b=PUbO7YParvUVAYT4cmVDL1DqDkEE41TPVHeK9hTkgMrJOTvbw91vZyCuFoNGjiMrjTGcoToohAwg6vvH0gaf0932jQ3MRwE7MRhTUQq00c+r2YR0xnf670PReaILwCLuWyqSvoDEPGOPub3NhfPs8gb3iQwo5R+7qlgwdH6FIq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736389837; c=relaxed/simple;
	bh=i8zxi1afzsVImDxoAoRFcBHsQ16h9cPBb3qsx/RJJOs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SyzxT5/UrWNDqj4D6AoqeAqNH+UWtP348HOmRKuLSt9uY9IeXwfJVRHMqupv84snNbT2DhIHrfZCtJsM549kdlkkcg3swFodhWX3+mY53XGu1OrJZZkxfV+RMYGCa8yeH/PKPNQ6IFP2mqDVGJtD08Uz/ypkt8c3my7vSRq8dQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1diFkFsI; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1diFkFsI"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ee6dccd3c9so748642a91.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 18:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736389835; x=1736994635; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mca0wUeRB8q4/QThhp2wCRFx+30mwBcyzZfjxbePC2g=;
        b=1diFkFsIMXXMtXgyt4KxU17P1ATJYxzc0i1nT5ZLa7/5R4m1nCeDJZ87smXmv09IGY
         yVgcJNIcoQKlIaj3HPMXZa8Wu9+oxghr5DBI6s7OzVEd9S7yJxARd0gZLnZaYhn6ybQC
         ZEoEzR55pfzW4D+4rJ0rOXXPVmo7TRN9g6FHk8/bSVed6y+n9wxHK2tnEnO+/zYiab13
         DqrtZ89TLwXxk8yAVzI1Kaj+PNeEDo9OsFa4RfR5B2iDlG+okSlqNd8SLtxn+TBVFy1S
         dXu2j9fZqPHgofMnMhJCeRfRTUGC9t/4xeDEy3wYwMkZsHcHliutcYd2uN/9Cz1yi8WC
         LFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736389835; x=1736994635;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mca0wUeRB8q4/QThhp2wCRFx+30mwBcyzZfjxbePC2g=;
        b=tkksDe2mfJPZiM3nJx8w81n/EGq38dUXVRCmdaab0Lz08i8iUXJDVAxqvIsCf2oZ/d
         ViX0bwk/OjZ5vZ0hz3AnLi4UWe/8OOxPk8bVgTV76Mbs2/9l/+jCbKN3dhOfLB4/zEsi
         srWkPIBclAMgGtcU7EJ3/a/wfX9MmBwUmNfbPg3627y5b3kcFHyNJrBPlLOBrUcw9q28
         ipcPNpG3syKQHPoy49XkierLrTYvoIEAYs5Y7WHc7llhLbrHk/mTisx4CiGe17tjd+xr
         T3u3dB5zJZlcBXq5Pj0U8YKNd002E6jJSH5ek3xZ1ZtavSa5w8RYERCF5S9tK7dou1Cu
         7Fpg==
X-Forwarded-Encrypted: i=1; AJvYcCW1NgEwKvbJsjoYP0nUU5NSVc8oDQkyZbV0v92ZMiYnXVznuJ6Cgqw695KoIFQc3L+uMY6iKPmVzHc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHgcWBVnsoIjo4cWOuSXDw4ulKHCpnHS0X5U2kF9NOEH/Vyl7c
	LC1Sjx02r+MpCVU/oiWYl+Dl7LtNArXk04cIUAiQiPYYMtZsQW/J02xouOda4JbDvFfoR9H13HD
	Hjw==
X-Google-Smtp-Source: AGHT+IEIh41j0AtPPhIvxBJK6ISgVLxnQVreV/6d3lvpOJLUFoaWqoL/DFcaBwvey98OKSYtXZrpcJIDmp8=
X-Received: from pjbsi3.prod.google.com ([2002:a17:90b:5283:b0:2ea:6b84:3849])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c4f:b0:2ee:ee77:227c
 with SMTP id 98e67ed59e1d1-2f548f102d1mr7321068a91.3.1736389835294; Wed, 08
 Jan 2025 18:30:35 -0800 (PST)
Date: Wed,  8 Jan 2025 18:30:12 -0800
In-Reply-To: <20250109023025.2242447-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109023025.2242447-4-surenb@google.com>
Subject: [PATCH v8 03/16] mm: mark vma as detached until it's added into vma tree
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
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, surenb@google.com, 
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>
Content-Type: text/plain; charset="UTF-8"

Current implementation does not set detached flag when a VMA is first
allocated.  This does not represent the real state of the VMA, which is
detached until it is added into mm's VMA tree.  Fix this by marking new
VMAs as detached and resetting detached flag only after VMA is added into
a tree.

Introduce vma_mark_attached() to make the API more readable and to
simplify possible future cleanup when vma->vm_mm might be used to indicate
detached vma and vma_mark_attached() will need an additional mm parameter.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
---
 include/linux/mm.h               | 27 ++++++++++++++++++++-------
 kernel/fork.c                    |  4 ++++
 mm/memory.c                      |  2 +-
 mm/vma.c                         |  6 +++---
 mm/vma.h                         |  2 ++
 tools/testing/vma/vma_internal.h | 17 ++++++++++++-----
 6 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 920e5ddd77cc..a9d8dd5745f7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -821,12 +821,21 @@ static inline void vma_assert_locked(struct vm_area_struct *vma)
 		vma_assert_write_locked(vma);
 }
 
-static inline void vma_mark_detached(struct vm_area_struct *vma, bool detached)
+static inline void vma_mark_attached(struct vm_area_struct *vma)
+{
+	vma->detached = false;
+}
+
+static inline void vma_mark_detached(struct vm_area_struct *vma)
 {
 	/* When detaching vma should be write-locked */
-	if (detached)
-		vma_assert_write_locked(vma);
-	vma->detached = detached;
+	vma_assert_write_locked(vma);
+	vma->detached = true;
+}
+
+static inline bool is_vma_detached(struct vm_area_struct *vma)
+{
+	return vma->detached;
 }
 
 static inline void release_fault_lock(struct vm_fault *vmf)
@@ -857,8 +866,8 @@ static inline void vma_end_read(struct vm_area_struct *vma) {}
 static inline void vma_start_write(struct vm_area_struct *vma) {}
 static inline void vma_assert_write_locked(struct vm_area_struct *vma)
 		{ mmap_assert_write_locked(vma->vm_mm); }
-static inline void vma_mark_detached(struct vm_area_struct *vma,
-				     bool detached) {}
+static inline void vma_mark_attached(struct vm_area_struct *vma) {}
+static inline void vma_mark_detached(struct vm_area_struct *vma) {}
 
 static inline struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 		unsigned long address)
@@ -891,7 +900,10 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 	vma->vm_mm = mm;
 	vma->vm_ops = &vma_dummy_vm_ops;
 	INIT_LIST_HEAD(&vma->anon_vma_chain);
-	vma_mark_detached(vma, false);
+#ifdef CONFIG_PER_VMA_LOCK
+	/* vma is not locked, can't use vma_mark_detached() */
+	vma->detached = true;
+#endif
 	vma_numab_state_init(vma);
 	vma_lock_init(vma);
 }
@@ -1086,6 +1098,7 @@ static inline int vma_iter_bulk_store(struct vma_iterator *vmi,
 	if (unlikely(mas_is_err(&vmi->mas)))
 		return -ENOMEM;
 
+	vma_mark_attached(vma);
 	return 0;
 }
 
diff --git a/kernel/fork.c b/kernel/fork.c
index 40a8e615499f..f2f9e7b427ad 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -465,6 +465,10 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 	data_race(memcpy(new, orig, sizeof(*new)));
 	vma_lock_init(new);
 	INIT_LIST_HEAD(&new->anon_vma_chain);
+#ifdef CONFIG_PER_VMA_LOCK
+	/* vma is not locked, can't use vma_mark_detached() */
+	new->detached = true;
+#endif
 	vma_numab_state_init(new);
 	dup_anon_vma_name(orig, new);
 
diff --git a/mm/memory.c b/mm/memory.c
index 1342d451b1bd..105b99064ce5 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6391,7 +6391,7 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 		goto inval;
 
 	/* Check if the VMA got isolated after we found it */
-	if (vma->detached) {
+	if (is_vma_detached(vma)) {
 		vma_end_read(vma);
 		count_vm_vma_lock_event(VMA_LOCK_MISS);
 		/* The area was replaced with another one */
diff --git a/mm/vma.c b/mm/vma.c
index af1d549b179c..d603494e69d7 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -327,7 +327,7 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
 
 	if (vp->remove) {
 again:
-		vma_mark_detached(vp->remove, true);
+		vma_mark_detached(vp->remove);
 		if (vp->file) {
 			uprobe_munmap(vp->remove, vp->remove->vm_start,
 				      vp->remove->vm_end);
@@ -1221,7 +1221,7 @@ static void reattach_vmas(struct ma_state *mas_detach)
 
 	mas_set(mas_detach, 0);
 	mas_for_each(mas_detach, vma, ULONG_MAX)
-		vma_mark_detached(vma, false);
+		vma_mark_attached(vma);
 
 	__mt_destroy(mas_detach->tree);
 }
@@ -1296,7 +1296,7 @@ static int vms_gather_munmap_vmas(struct vma_munmap_struct *vms,
 		if (error)
 			goto munmap_gather_failed;
 
-		vma_mark_detached(next, true);
+		vma_mark_detached(next);
 		nrpages = vma_pages(next);
 
 		vms->nr_pages += nrpages;
diff --git a/mm/vma.h b/mm/vma.h
index a2e8710b8c47..2a2668de8d2c 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -157,6 +157,7 @@ static inline int vma_iter_store_gfp(struct vma_iterator *vmi,
 	if (unlikely(mas_is_err(&vmi->mas)))
 		return -ENOMEM;
 
+	vma_mark_attached(vma);
 	return 0;
 }
 
@@ -389,6 +390,7 @@ static inline void vma_iter_store(struct vma_iterator *vmi,
 
 	__mas_set_range(&vmi->mas, vma->vm_start, vma->vm_end - 1);
 	mas_store_prealloc(&vmi->mas, vma);
+	vma_mark_attached(vma);
 }
 
 static inline unsigned long vma_iter_addr(struct vma_iterator *vmi)
diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
index 96aeb28c81f9..47c8b03ffbbd 100644
--- a/tools/testing/vma/vma_internal.h
+++ b/tools/testing/vma/vma_internal.h
@@ -469,13 +469,17 @@ static inline void vma_lock_init(struct vm_area_struct *vma)
 	vma->vm_lock_seq = UINT_MAX;
 }
 
+static inline void vma_mark_attached(struct vm_area_struct *vma)
+{
+	vma->detached = false;
+}
+
 static inline void vma_assert_write_locked(struct vm_area_struct *);
-static inline void vma_mark_detached(struct vm_area_struct *vma, bool detached)
+static inline void vma_mark_detached(struct vm_area_struct *vma)
 {
 	/* When detaching vma should be write-locked */
-	if (detached)
-		vma_assert_write_locked(vma);
-	vma->detached = detached;
+	vma_assert_write_locked(vma);
+	vma->detached = true;
 }
 
 extern const struct vm_operations_struct vma_dummy_vm_ops;
@@ -488,7 +492,8 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 	vma->vm_mm = mm;
 	vma->vm_ops = &vma_dummy_vm_ops;
 	INIT_LIST_HEAD(&vma->anon_vma_chain);
-	vma_mark_detached(vma, false);
+	/* vma is not locked, can't use vma_mark_detached() */
+	vma->detached = true;
 	vma_lock_init(vma);
 }
 
@@ -514,6 +519,8 @@ static inline struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 	memcpy(new, orig, sizeof(*new));
 	vma_lock_init(new);
 	INIT_LIST_HEAD(&new->anon_vma_chain);
+	/* vma is not locked, can't use vma_mark_detached() */
+	new->detached = true;
 
 	return new;
 }
-- 
2.47.1.613.gc27f4b7a9f-goog

