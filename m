Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA61209686
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 19:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734377072; cv=none; b=dm/OrcW/d7CJtKBr2YwuQSP/NmbSjlxrMVCPl0mCI+TbaFTCg2LeUepy7ZMG6pzHTLJeKM8h2VUiQWemLQsRtqbWmSQqKtvwHA0fYlVKjIIqOxUtMZNAZHpPmq5+0K19tGPFP3EWFx9iaUcCzbVHZfKc1KooACNyeJjazdGDj7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734377072; c=relaxed/simple;
	bh=OwfOVDl+AeBnqohswLkwlqnaJ4+jypTPvJQiyj/gY1g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=av62ZtWYl+hN3RcEpppg+Dvb6LBQdEL1yzU3SoW880kJfBQypFiqKSNhDtep39Rn4D0edYSw9jVtH/Z7MlLivQokjPlCe+R0Yx3hlN1yT5SqVDzgHyIiKj1LYLIX/Vv5Aq405g3nzAOiy++sE+UEN5YXfV279r2OcAQlS3qMAMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Iyy1YSro; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Iyy1YSro"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-725e59e41d2so4106747b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 11:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734377069; x=1734981869; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tPcYammI4P+bTAfQ+4gtRvMOMTfi6gzN2lD/68NUW0U=;
        b=Iyy1YSroCJB9Jyk4Bl8pg8m5HCr0qUKzKZPDK5kgztkqcnZAj0bOEFlEPinHqdCLLx
         jlk8dv3gFHyAKNHzFkFW/DAkKF9q4a2JGiu1xt1OyG84ZGgD41rGb7Wr2SySG1PnICPP
         vXnaCIsVaXYZyIKFl/U2MpK7PMs/hjnbAUoOhpzpXTpcoZBoV6OUgR79svwCbMEfUkzJ
         0LnXFCtCXKgx0IFLIYhJ7vIwwLJHyzDHzoMnuMkDYmcUmNHKopYgtN3loZmcbt5x5YJl
         ss/YUmfN2YKpQKxRsC91r3n61XQEgTG1l49SwesinX5aRwb9cj73PATUrJhF2mbbi4ws
         7KBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734377069; x=1734981869;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tPcYammI4P+bTAfQ+4gtRvMOMTfi6gzN2lD/68NUW0U=;
        b=KRlvkt9V60sPAbuCZfaI3piag9lfRStcIvxoQHdxbR/fA9+2oAO3ba3pojIiiVJhCA
         0bWZQJrLrh8+KLq3JgLWsko8Ekr1ZGUA8Ofh6uLX5t7t9M6GaIKI/aXkXSpPmE8T1awf
         S4MPIp5f8J1ZGB5G8UELNmbAl+BRu6WYPdnMm3T7Aq3veMUL4XuHRxItp4VR1KSSLAFk
         WZBZaiGizTYUsVdPdk9S28tDw73GnM+UmYXCQUYUXtMmZFV1hrebHlivB/8wXlEDXSHD
         STVO6zB7dtuncnPMQKYnrTjCQGaS3rVIDQzARF4FX54CMdP23DiYZzp47dOjD7wbLpRU
         XGQw==
X-Forwarded-Encrypted: i=1; AJvYcCX+IITQHjjt5unkV68V8WBnFJCaAJbi5vo83f4cjV8aPAT5ecEwAPnMncPzy6DXmYsels6z5BACos8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJLFTAfbpX8Jn8HmXDmQoYXGIRzt3WSHmaxoB8rZmTuBTKhj3/
	MLgBgZ2mB9H4D8TGgbTS/NwkolTl+jvMT6KJr0BcT4+s5laJxkse/bNATUS47unxz8667O2E/1W
	dow==
X-Google-Smtp-Source: AGHT+IHuIz3KcGOEBSL7UPXAppbQsIUkVSUTnN31px7An8YO7VAcBSifJ3+A4XtsuM0O2Sd96qkE9oQILpU=
X-Received: from pgbcz14.prod.google.com ([2002:a05:6a02:230e:b0:7fd:4e21:2f5a])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a120:b0:1e0:d32f:24e2
 with SMTP id adf61e73a8af0-1e462d97415mr1129422637.38.1734377069542; Mon, 16
 Dec 2024 11:24:29 -0800 (PST)
Date: Mon, 16 Dec 2024 11:24:06 -0800
In-Reply-To: <20241216192419.2970941-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241216192419.2970941-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216192419.2970941-4-surenb@google.com>
Subject: [PATCH v6 03/16] mm: mark vma as detached until it's added into vma tree
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
---
 include/linux/mm.h               | 27 ++++++++++++++++++++-------
 kernel/fork.c                    |  4 ++++
 mm/memory.c                      |  2 +-
 mm/vma.c                         |  6 +++---
 mm/vma.h                         |  2 ++
 tools/testing/vma/vma_internal.h | 17 ++++++++++++-----
 6 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index e1768a9395c9..689f5a1e2181 100644
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
index eb3e35d65e95..57dc5b935f79 100644
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
index 2d97a17dd3ba..cc7159aef918 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6350,7 +6350,7 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 		goto inval;
 
 	/* Check if the VMA got isolated after we found it */
-	if (vma->detached) {
+	if (is_vma_detached(vma)) {
 		vma_end_read(vma);
 		count_vm_vma_lock_event(VMA_LOCK_MISS);
 		/* The area was replaced with another one */
diff --git a/mm/vma.c b/mm/vma.c
index 6fa240e5b0c5..fbd7254517d6 100644
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
@@ -1222,7 +1222,7 @@ static void reattach_vmas(struct ma_state *mas_detach)
 
 	mas_set(mas_detach, 0);
 	mas_for_each(mas_detach, vma, ULONG_MAX)
-		vma_mark_detached(vma, false);
+		vma_mark_attached(vma);
 
 	__mt_destroy(mas_detach->tree);
 }
@@ -1297,7 +1297,7 @@ static int vms_gather_munmap_vmas(struct vma_munmap_struct *vms,
 		if (error)
 			goto munmap_gather_failed;
 
-		vma_mark_detached(next, true);
+		vma_mark_detached(next);
 		nrpages = vma_pages(next);
 
 		vms->nr_pages += nrpages;
diff --git a/mm/vma.h b/mm/vma.h
index 61ed044b6145..24636a2b0acf 100644
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
index 568c18d24d53..0cdc5f8c3d60 100644
--- a/tools/testing/vma/vma_internal.h
+++ b/tools/testing/vma/vma_internal.h
@@ -465,13 +465,17 @@ static inline void vma_lock_init(struct vm_area_struct *vma)
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
@@ -484,7 +488,8 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 	vma->vm_mm = mm;
 	vma->vm_ops = &vma_dummy_vm_ops;
 	INIT_LIST_HEAD(&vma->anon_vma_chain);
-	vma_mark_detached(vma, false);
+	/* vma is not locked, can't use vma_mark_detached() */
+	vma->detached = true;
 	vma_lock_init(vma);
 }
 
@@ -510,6 +515,8 @@ static inline struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 	memcpy(new, orig, sizeof(*new));
 	vma_lock_init(new);
 	INIT_LIST_HEAD(&new->anon_vma_chain);
+	/* vma is not locked, can't use vma_mark_detached() */
+	new->detached = true;
 
 	return new;
 }
-- 
2.47.1.613.gc27f4b7a9f-goog

