Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E910146D59
	for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 17:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735232842; cv=none; b=orBjfNxnl4bsgmr84Ktia7gjpw4li8hH1MY3/g1QLK96zU7Y8i+SLwfPB7cuNqOwLRws/JCSZQ0xfhRN/RLaxilFzefaWg7/y9Jtl0tpOmy4W5+3P/nD18GKU2vl8SRGxj7SQ22QvJAWDrxn4QRUSzn7eVnp7QPYTbOO6s7HluQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735232842; c=relaxed/simple;
	bh=Vjvp6aRKQ9utdAT+qEZMT61k/JXlv8Qbyaf2UHbSZjs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=k3Kfbq37pvd22yFfiO35lrEDY/Ln66pBsiuN7C9VHIS6rpZRRWK8W5nv7jN/cxVYjIPqRsDcO5rd1xhPonAIN0OVAgLNBl47Vt7pKpJ6/CN+8EIm4mKJCvsgg4lgl6Q1G2Tdyi493HogNu4aASxmv3Z21XjCfV70xf1LAlQNDvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W5r07BBe; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W5r07BBe"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2efa0eb9cfeso7839857a91.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 09:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735232840; x=1735837640; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cAz4Nb0K6HeFkqWg5wvl8l9ILYUUia2eSNvAxmroFu8=;
        b=W5r07BBe5waXfXMd0I0iTkZuaEhw8eD8ugjyxYqEB3QoZ5FiPiw/ydR5SBRrH6C3eq
         hUy5+2LWK4BGO45aKnLDlbwYj5Ets8xR135g07MKmqkmct2mk4///TBW78Vx6/O1kXLO
         lTKWJuqaQLr0z09/X1i8CkFiIP4nftqWGC0Cvs9Ygw2k6YHWYZARpT/XRp4+tXV92jQK
         W4wASscuDGHVXWrc++2AQfoALNY45kVaBV31dblxFihe6+ZzG4JOOwrPcBrDEdZc3fbg
         Jzh8CLliGdn8As3xHy79LK3Rw3SRcagq9RfiwEvcynF5OO2smipmZtbgGvqH3+pmOSAc
         qcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735232840; x=1735837640;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cAz4Nb0K6HeFkqWg5wvl8l9ILYUUia2eSNvAxmroFu8=;
        b=FB6b1d6jNB2bZ8g8C9SouSWW1S3o3Mmltvw2cn8MEnGBjq7dvbCG0uz0Gg4+4b0pyA
         xUFCrJNck3tG+qMDE085/GWACME1+duApFvVTMUiOn5WpSJDS/6NXf32Ua2tfz98tSkE
         4IyHvBgjzPyIQR7UTvNpUA6aWqp5BUUkGwpNhFiegmSWbtkeEptTQawbhVKvJPuuVOXV
         iShu+c8jP6WRhrHoh9bqVr28u9i8J5peMtL1205tW6SCstqXIMlBrzqCCW+6ELkGJf/H
         Am9iWxU4rhw5CPADc3TF1N36hp2ldiBz3CvDyTfUUePmDmFEVQqoC/2bKH3j5A/cMcqJ
         Zkxg==
X-Forwarded-Encrypted: i=1; AJvYcCW8uEEWRY7ifoWcWfWR7bdP8d+Xam/x60duHIoksS3p1rrym405ZJG9M3WPprtYjqhE3WR/kLW39us=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx97hettbz8EvLKNFKUbYbQb0R0vy9gDmMU2PUFQY0onHBD4r1D
	tHN0b5f0reyKlDo7sNYbM23fXBBuwWN70eL4kT2mRUdkmEO9E09fTdGvVFyRZxSVPghalVNXvAK
	gcQ==
X-Google-Smtp-Source: AGHT+IHG75OaLxopGAtkxZlDDT2v+C2m79NALqlAe4xW7nBDhmw9thNrZbKpynlUfVT/naik0hkFrK8zsZY=
X-Received: from pjbtb12.prod.google.com ([2002:a17:90b:53cc:b0:2ef:7483:e770])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5251:b0:2f2:a90e:74ef
 with SMTP id 98e67ed59e1d1-2f44353f0b2mr41720800a91.1.1735232839810; Thu, 26
 Dec 2024 09:07:19 -0800 (PST)
Date: Thu, 26 Dec 2024 09:06:55 -0800
In-Reply-To: <20241226170710.1159679-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226170710.1159679-4-surenb@google.com>
Subject: [PATCH v7 03/17] mm: mark vma as detached until it's added into vma tree
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
index f3f92ba8f5fe..081178b0eec4 100644
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
index 2a20e3810534..d0dee2282325 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6349,7 +6349,7 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 		goto inval;
 
 	/* Check if the VMA got isolated after we found it */
-	if (vma->detached) {
+	if (is_vma_detached(vma)) {
 		vma_end_read(vma);
 		count_vm_vma_lock_event(VMA_LOCK_MISS);
 		/* The area was replaced with another one */
diff --git a/mm/vma.c b/mm/vma.c
index 0caaeea899a9..476146c25283 100644
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
@@ -1220,7 +1220,7 @@ static void reattach_vmas(struct ma_state *mas_detach)
 
 	mas_set(mas_detach, 0);
 	mas_for_each(mas_detach, vma, ULONG_MAX)
-		vma_mark_detached(vma, false);
+		vma_mark_attached(vma);
 
 	__mt_destroy(mas_detach->tree);
 }
@@ -1295,7 +1295,7 @@ static int vms_gather_munmap_vmas(struct vma_munmap_struct *vms,
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
index d19ce6fcab83..2a624f9304da 100644
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

