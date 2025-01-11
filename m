Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E43A191F6A
	for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 04:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736569601; cv=none; b=S3O6LKAeMCGHQL2uYrO+h6OWz9DS/kPVqeZkWBrLrztsPRyCNJAoiTI2OUOqxRl4aCoQuqHwQkyS5Z3ZM0RUWqQavUdpArPuVtHM2PQJpn3fJxYP94d8mJPdFT8qdJ/li40gk45ang9x/eKM8hFHtqINaOHp2WY/Pv+CypIhk6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736569601; c=relaxed/simple;
	bh=bMFnoPr0vvMm61gosasQGe/t4yH8uJ1rFqZuK9xLtds=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IAU58HfBC66Sq934khLKsnPhr16CIiLxzKeuIuZ+6or3XFE9388wWQT2vKWW3E05eMu0ATa6AgHA7dvC8MVsgOFafIl2suIavI7c12wBfmiLw/whc4PGlxpjq+8bwNXk6Wjoqm30s1V17PuE57f1sXpWrX978yXKMTp4NmZOhpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=loBJwYJ5; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="loBJwYJ5"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-216728b170cso51247915ad.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 20:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736569599; x=1737174399; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sqweZn90u3nkindBXw7O0ID50FUbfbOsDRIP3ctel0c=;
        b=loBJwYJ5r1BVvdRFPgm2kNlRt+qIHwFKEb/+03kmH+cDFiWkVUBGNQYgsROcRek3+r
         AfFW0gGRfudq7VhqSkWG01zliJNOANJM8COtlhqEge2hYuo0COA3KneQvZUaNUWjWG/f
         1ob2VtdkAbGCmFzCzka0UVZxHPEoSDQ3Kx4dUnFYOOuoPeypHi6jWJNYk2M3C4OKWe1S
         crRYhYgnQieLGd5GtC7Gn3uFKwPTV90uBx8LcxGGUJ60/+gFh6wK5NpXCcufVk0R2ZvF
         L4GVIdF+QeP17YhBQ+IooGAKYFq5naAdGsWRF7E4MrmLSkJgL9u8KYWPRAhO44SPHcNp
         1oKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736569599; x=1737174399;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sqweZn90u3nkindBXw7O0ID50FUbfbOsDRIP3ctel0c=;
        b=en8scks7DIdkjrcHIgvvWmOWz/H2HCpctQ8DDptVVwzvDz8o5R92GpTTnolthg2nRm
         Nf/yL6q8G+5zNjPpUY+rNzV1gg2v0OpQHy1sxg9BkzPrizCJrFfS5YpHQDAxgOdOWHXk
         zDuOETG35FaVJHjdZhjC39YU8dI97PZBT/gbNwRB0VY+skIIrYEr3Z6lu/8qKcom02GH
         GKhLqAXl0mJA8oolEsY+E4KzE41RFeqyGG/0+y4B/d73Ih/l3OGS9vmWgw/UGcDs4z11
         4nDL2lPzzoEJy1ryPmTvCcfgLAY6WGZcINKvn0j0FtiNwnSyVGJ5/CaXUhE9QSYKTUB2
         8hEA==
X-Forwarded-Encrypted: i=1; AJvYcCXJz8MY1NEmE4udjDPLaUhK2Q0vMI4ZC2JJh31wr/cak263FqQ3up8nm0AZXEj5oO6VP5AN6v7i+uk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Pq6ePPlMZhu37zbOo+++bb4oNdgQcCfiD2gQd6jr5a1d4Ao+
	mzt8unOQKENfwppW7MOhSf2cmQYnMNK33B4HkY8w2tx7GRUgMDG3+VXQqyTriwqaanY+85321Cs
	b4g==
X-Google-Smtp-Source: AGHT+IEDi9vLxcvUpqCWBPMXXF0Y8lrMfIatGu39C3DhS1ZkGtjS5dUciQm8YtZJQiW79lEU0cSQ1XI24iE=
X-Received: from pgg14.prod.google.com ([2002:a05:6a02:4d8e:b0:7ff:d6:4f07])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c996:b0:1e3:e680:8c91
 with SMTP id adf61e73a8af0-1e88d2d5ea9mr24704039637.31.1736569599645; Fri, 10
 Jan 2025 20:26:39 -0800 (PST)
Date: Fri, 10 Jan 2025 20:26:02 -0800
In-Reply-To: <20250111042604.3230628-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111042604.3230628-16-surenb@google.com>
Subject: [PATCH v9 15/17] mm: prepare lock_vma_under_rcu() for vma reuse possibility
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

Once we make vma cache SLAB_TYPESAFE_BY_RCU, it will be possible for a vma
to be reused and attached to another mm after lock_vma_under_rcu() locks
the vma. lock_vma_under_rcu() should ensure that vma_start_read() is using
the original mm and after locking the vma it should ensure that vma->vm_mm
has not changed from under us.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/mm.h | 10 ++++++----
 mm/memory.c        |  7 ++++---
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index c8da64b114d1..cb29eb7360c5 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -739,8 +739,10 @@ static inline void vma_refcount_put(struct vm_area_struct *vma)
  * Try to read-lock a vma. The function is allowed to occasionally yield false
  * locked result to avoid performance overhead, in which case we fall back to
  * using mmap_lock. The function should never yield false unlocked result.
+ * False locked result is possible if mm_lock_seq overflows or if vma gets
+ * reused and attached to a different mm before we lock it.
  */
-static inline bool vma_start_read(struct vm_area_struct *vma)
+static inline bool vma_start_read(struct mm_struct *mm, struct vm_area_struct *vma)
 {
 	int oldcnt;
 
@@ -751,7 +753,7 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
 	 * we don't rely on for anything - the mm_lock_seq read against which we
 	 * need ordering is below.
 	 */
-	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(vma->vm_mm->mm_lock_seq.sequence))
+	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(mm->mm_lock_seq.sequence))
 		return false;
 
 	/*
@@ -774,7 +776,7 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
 	 * after it has been unlocked.
 	 * This pairs with RELEASE semantics in vma_end_write_all().
 	 */
-	if (unlikely(vma->vm_lock_seq == raw_read_seqcount(&vma->vm_mm->mm_lock_seq))) {
+	if (unlikely(vma->vm_lock_seq == raw_read_seqcount(&mm->mm_lock_seq))) {
 		vma_refcount_put(vma);
 		return false;
 	}
@@ -906,7 +908,7 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 #else /* CONFIG_PER_VMA_LOCK */
 
 static inline void vma_lock_init(struct vm_area_struct *vma, bool reset_refcnt) {}
-static inline bool vma_start_read(struct vm_area_struct *vma)
+static inline bool vma_start_read(struct mm_struct *mm, struct vm_area_struct *vma)
 		{ return false; }
 static inline void vma_end_read(struct vm_area_struct *vma) {}
 static inline void vma_start_write(struct vm_area_struct *vma) {}
diff --git a/mm/memory.c b/mm/memory.c
index dc16b67beefa..67cfcebb0f94 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6426,7 +6426,7 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 	if (!vma)
 		goto inval;
 
-	if (!vma_start_read(vma))
+	if (!vma_start_read(mm, vma))
 		goto inval;
 
 	/*
@@ -6436,8 +6436,9 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 	 * fields are accessible for RCU readers.
 	 */
 
-	/* Check since vm_start/vm_end might change before we lock the VMA */
-	if (unlikely(address < vma->vm_start || address >= vma->vm_end))
+	/* Check if the vma we locked is the right one. */
+	if (unlikely(vma->vm_mm != mm ||
+		     address < vma->vm_start || address >= vma->vm_end))
 		goto inval_end_read;
 
 	rcu_read_unlock();
-- 
2.47.1.613.gc27f4b7a9f-goog

