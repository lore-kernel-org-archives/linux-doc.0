Received: from mail-oa1-f73.google.com (mail-oa1-f73.google.com [209.85.160.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C817418F2D8
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 02:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736389861; cv=none; b=A0TZmde40YLkJblQCww4U3Rs20mPh9MUl516hVYcqRnltSUv0FuO8wBS4GkuKqSO5d2aUARyKR0QUITxyhMW8YD/lWYSbpLcMv52Emv6Hx70YxsbNWdFggG4Jfj13zNB7W2IeAh2lFGDWJnY256HPrd2Z7QSqcpcZcYJvbV9mFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736389861; c=relaxed/simple;
	bh=AOkNmUQtA5+hEacSF0o3k1jRBb+bZmOaS3fwL4JYowQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CiA/X60LquzPEASGeQlKg8KUXumR78vKMA+5AN78HzVLSF9W2bN0ufKr6EZFXYSAPOgstqb2BcAw/CyzFvi23Qwe4U4rcg8tEbF91qtxm6s2eERaV/A0kR21ZEBCnVq+yjkTwyV7dWa+B6ONds7BB8sqMqK7h6fR+Hu5Zhehhws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=seECNfoT; arc=none smtp.client-ip=209.85.160.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="seECNfoT"
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-29f7ae58e1dso351635fac.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 18:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736389859; x=1736994659; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7tJeInLbN8BEQlNwxZIs7XzIeMe2D6U4SFT5BJyi6RU=;
        b=seECNfoTA7JB5he4xhJ5WUhDu9aE4CNprFCYtE3ShgdtJsnZV/qqXT18C2XoN+j2vc
         JuY8STsF67Svs6oFRguplGEN9fXWe6COVBxuxFBGsLOhCT4b2z4xjfgeX9uia5xlbINC
         gIffQMrWQcGbJl05gOdc8nAbvk45GufkvyDeqrjHIsnsAdY6OXX3JR5JM44fahBBhUOu
         siR9ALRedqkqf+OIgcUmjjA8WolSLcQr4IUAaxzPNy/hr6VKs/ebe/mGpocZTfKmQByj
         yWHQxBUx9yVR4uKz0xwdBCxTXsgF1o4hOJcCUvjaPuuVJchDduPqLmwt7n8EqdLMPhps
         FM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736389859; x=1736994659;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7tJeInLbN8BEQlNwxZIs7XzIeMe2D6U4SFT5BJyi6RU=;
        b=StAcg9udG+FNamHNShKN4Sry27cqHUjFb4NBfrUpVevqY2nAVdnJvOqwBEe2ggJ/2L
         st1SrVqQd+5FJteRlniDVC8s1ZfcGW6cZ1P1sIkeJd+RSW3dxffeT9/ZcdYWwpQlM9/t
         SomT4gMLs3/hsLATSuVR+Orn8HtMOkoC0U6r6bGvPtxVRjBdn+ASLcNKBgalgdexJMGC
         XNUG9FdcGHC+9GjOBlBOMQqQxCdpChXod64tonqrSPvHxtlAk4MlkDaK/PATwBAIEAe1
         3fdDu3A4Vh/Nv0Cgi8nwEYkuZky8IUoPDbKkb33/2MjLppJ4c1wkRyHy7/qj5exTlnhY
         cKgg==
X-Forwarded-Encrypted: i=1; AJvYcCVmslcXuKmqswdTiR84NesDvuGDk6ubRxuBZirlYvyPLUM2FaqAHs71oARHPmEQ9RcSbDKtp7gfV8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlWMeeNQKpHLpb/DfgdW35f/YcnkbPIYbBD++DJIt0yvPLYQpZ
	LlBi3AL2onr1km176ODGvIayEXyHicobhCTYK9w5759uK148gHNccPapwTBS8E1+V+uOQVG2Rl1
	zzg==
X-Google-Smtp-Source: AGHT+IHGMXCQEV8FC6jUm6LzXHjwAdfbc9NVyk/P0Er0Y7oYPXQ/fIgh5u42bhXHdFVsWWVl9KMqX04Ngxs=
X-Received: from oabqt18.prod.google.com ([2002:a05:6870:6e12:b0:29f:e638:5c2c])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:7d8e:b0:29a:ea3b:a68e
 with SMTP id 586e51a60fabf-2aabe8aa92bmr945059fac.0.1736389858958; Wed, 08
 Jan 2025 18:30:58 -0800 (PST)
Date: Wed,  8 Jan 2025 18:30:23 -0800
In-Reply-To: <20250109023025.2242447-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109023025.2242447-15-surenb@google.com>
Subject: [PATCH v8 14/16] mm: prepare lock_vma_under_rcu() for vma reuse possibility
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
index aca65cc0a26e..1d6b1563b956 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -737,8 +737,10 @@ static inline void vma_refcount_put(struct vm_area_struct *vma)
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
 
@@ -749,7 +751,7 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
 	 * we don't rely on for anything - the mm_lock_seq read against which we
 	 * need ordering is below.
 	 */
-	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(vma->vm_mm->mm_lock_seq.sequence))
+	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(mm->mm_lock_seq.sequence))
 		return false;
 
 	/*
@@ -772,7 +774,7 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
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
index fe1b47c34052..a8e7e794178e 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6465,7 +6465,7 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 	if (!vma)
 		goto inval;
 
-	if (!vma_start_read(vma))
+	if (!vma_start_read(mm, vma))
 		goto inval;
 
 	/*
@@ -6475,8 +6475,9 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
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

