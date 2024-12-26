Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE9713D25E
	for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 17:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735232839; cv=none; b=MKjrakF7Mj4WDyGIzzF6sFFitI9Dn+M7l735dFDYXiigupPM0k3WJpKF/MsH0/I5ZAGCtGVeTRjZJanrrAxsjtjn1cxiHw7iv9Ui5HgIdW9mntR34EoBut+rrNQ0HZb6b3NEhucHdLDgO/ynrATkgVGtN9iSmHwNtH7F3wYiC1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735232839; c=relaxed/simple;
	bh=fvJMYV/tbE2hwCDL6WpJtnm7Rj70ZnNeVx47h6oWiYI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AB7FF8wjRxsgnihPmuyzWQx2VRhxYhsEVhGs0VVft3FYH0KG0uhYxwmvmMjfg+c498CFVdXuBHusmaIkaSPJI4OPkqUXIXt0y3hwW5PskFWF8p6PwWhGdrUospuM2VM6aqfJAZptt45pCXPgg6gaiTt2MzgO2/DCpfMcJzUWCRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=whD4LKVJ; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="whD4LKVJ"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2162f80040aso75874285ad.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 09:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735232835; x=1735837635; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lZeoQJ48TvPY6kfbB0nyOCq9qEQQ9w4ETlSFBxsMiUM=;
        b=whD4LKVJS8shdMcWypXrJiWLLf/e4Dab39HWUafy7thir014v/YFXpRJ4INtjTKP9W
         9w6TpLefIQ3HjpimX4Ukhw5MtqWopGxdp13YhpRufIZHVEC5RzDTNT//lztgeD+TrdA2
         +PIBVPYiMdd1hHMP8yrrLEKC2Ept35uZHv+YRiVGX10zg84m1UGFHjtZoehfM80OvqBQ
         clqTCilpt/I2DtBqJ85GVve+sxhth92nORdpG/TAMS9KjlKIKfs+no0yx7t5eNrGnQBl
         Ngoahn9wILBntZGbdLbtskRHzLxEmzF4rRhRKCnMLPjcEGuZCE18hRgx4dvW4o4fOtCq
         VKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735232835; x=1735837635;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lZeoQJ48TvPY6kfbB0nyOCq9qEQQ9w4ETlSFBxsMiUM=;
        b=Hx7RqCTGfKg+J5zc+PvgS/P9HFrHNLmPJhctl3DWAoKvBGOaleU3qkpQm+uk9PXhcp
         998luwsLTHILOxCg7X6xQb4GhQfOIGhVzk6aI6DemfP23/czhBEz4rOK+iMzAzIHt34I
         mCbtJsBd6NL0OKno7DoFelo99YHGYm8mAUYsP88SIMtoQysJc/9oECWzHvUSd77p0rG6
         yHj/EcGtzPcvsDWQF9uubUF+RKqfyl1jxWqQ15aEQcIy34DIi8FPBUAmf5lwanpTGtob
         liI6q4bOMTFBdM9zJLYpG3goXvd5wFssu6SYNrKygtW6RLf4TRBzXIisEpRaY/eY0klB
         Sw/g==
X-Forwarded-Encrypted: i=1; AJvYcCVITh6pQ15MlwxJH/I95++JQhietzRBbZs2SYia99F8cof+ELkLRQn9cy+L6eGwCNTEEa7wzghMuAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIKfg8CyLlu4tKqk19d2EtgZkyttn4mNHvGDTUrn2ly/WGckWI
	zCwrjs7P3v5PmNZ0s1USgyZWBGwvwgyDw+9Cifg5JtBCMVnuIavKS4Zo4E1Ny0wJqoul8ed0UFN
	UXw==
X-Google-Smtp-Source: AGHT+IGWdbrm7iCFwz72a6IFmBjvmmjFFdB3W+njMZ9BDPMzH23Ov9tsL+sC5puGq870a2X6Uofv9F0zU/g=
X-Received: from plty1.prod.google.com ([2002:a17:902:8641:b0:216:2f96:8ba1])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d587:b0:216:5af7:eb2a
 with SMTP id d9443c01a7336-219e6ebb70bmr361013645ad.33.1735232835405; Thu, 26
 Dec 2024 09:07:15 -0800 (PST)
Date: Thu, 26 Dec 2024 09:06:53 -0800
In-Reply-To: <20241226170710.1159679-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226170710.1159679-2-surenb@google.com>
Subject: [PATCH v7 01/17] mm: introduce vma_start_read_locked{_nested} helpers
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

Introduce helper functions which can be used to read-lock a VMA when
holding mmap_lock for read.  Replace direct accesses to vma->vm_lock with
these new helpers.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/mm.h | 24 ++++++++++++++++++++++++
 mm/userfaultfd.c   | 22 +++++-----------------
 2 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 406b981af881..a48e207d25f2 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -735,6 +735,30 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
 	return true;
 }
 
+/*
+ * Use only while holding mmap read lock which guarantees that locking will not
+ * fail (nobody can concurrently write-lock the vma). vma_start_read() should
+ * not be used in such cases because it might fail due to mm_lock_seq overflow.
+ * This functionality is used to obtain vma read lock and drop the mmap read lock.
+ */
+static inline void vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
+{
+	mmap_assert_locked(vma->vm_mm);
+	down_read_nested(&vma->vm_lock->lock, subclass);
+}
+
+/*
+ * Use only while holding mmap read lock which guarantees that locking will not
+ * fail (nobody can concurrently write-lock the vma). vma_start_read() should
+ * not be used in such cases because it might fail due to mm_lock_seq overflow.
+ * This functionality is used to obtain vma read lock and drop the mmap read lock.
+ */
+static inline void vma_start_read_locked(struct vm_area_struct *vma)
+{
+	mmap_assert_locked(vma->vm_mm);
+	down_read(&vma->vm_lock->lock);
+}
+
 static inline void vma_end_read(struct vm_area_struct *vma)
 {
 	rcu_read_lock(); /* keeps vma alive till the end of up_read */
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index af3dfc3633db..4527c385935b 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -84,16 +84,8 @@ static struct vm_area_struct *uffd_lock_vma(struct mm_struct *mm,
 
 	mmap_read_lock(mm);
 	vma = find_vma_and_prepare_anon(mm, address);
-	if (!IS_ERR(vma)) {
-		/*
-		 * We cannot use vma_start_read() as it may fail due to
-		 * false locked (see comment in vma_start_read()). We
-		 * can avoid that by directly locking vm_lock under
-		 * mmap_lock, which guarantees that nobody can lock the
-		 * vma for write (vma_start_write()) under us.
-		 */
-		down_read(&vma->vm_lock->lock);
-	}
+	if (!IS_ERR(vma))
+		vma_start_read_locked(vma);
 
 	mmap_read_unlock(mm);
 	return vma;
@@ -1491,14 +1483,10 @@ static int uffd_move_lock(struct mm_struct *mm,
 	mmap_read_lock(mm);
 	err = find_vmas_mm_locked(mm, dst_start, src_start, dst_vmap, src_vmap);
 	if (!err) {
-		/*
-		 * See comment in uffd_lock_vma() as to why not using
-		 * vma_start_read() here.
-		 */
-		down_read(&(*dst_vmap)->vm_lock->lock);
+		vma_start_read_locked(*dst_vmap);
 		if (*dst_vmap != *src_vmap)
-			down_read_nested(&(*src_vmap)->vm_lock->lock,
-					 SINGLE_DEPTH_NESTING);
+			vma_start_read_locked_nested(*src_vmap,
+						SINGLE_DEPTH_NESTING);
 	}
 	mmap_read_unlock(mm);
 	return err;
-- 
2.47.1.613.gc27f4b7a9f-goog

