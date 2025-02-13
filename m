Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9053281369
	for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 22:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739486855; cv=none; b=SQQsa8GA2D6uR2snUb0zzf5wmle1Wb/zMv4QUHEWmfTGr3oyaeNSnALiS+Ylxv7iAhwNmFy2ucu1Tt6SFtegX1zQuyGVnPTRSWR0V+pSEE5HSJmdy2ufWurfvUBI33ISQdI5VRPAHd0OxtXwvcgn1B7DxZ+L0CQM4WzZyl2903Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739486855; c=relaxed/simple;
	bh=PUJSTy45dtpyUmxXxenkiNMkF+uifqCqHqbn1BfbXCI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o2+Q7bgZOA+bfnRVN//baitGavYX6oGWFwOuxYD7OhHapZA3tnEYUmT38FS0zUM0RIjQRABVIF8SksVeF8z1kOZ98Jp0olSVaW1yKzSXWnRqX6MPb7aQrUtFMxrErIOQMCnTPYL8bCEF1nyptVqt6UJPS5T3QKO0eWBdu1jLOf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o76BVUCG; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o76BVUCG"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fa57c42965so3266885a91.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 14:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739486852; x=1740091652; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3PBMMH2moGlibOV+gRj99WpX+TZ+10z7I1DXCC5PdQ8=;
        b=o76BVUCGJCk47Z1ErORyJfPR++QMfO2WsB1YmhK7DedLiyQa3Soe495iIjVeLw4ifq
         Ug3kT43T2uiHGrtpZkHjO4TWMVgP42xMDva07jNf64eEDnBtx6rl/RVFUn/IJU0gtmmg
         9/WqxB94fCPCBN/nNiu7n2GonrsJXnq9b8jDWRMSSQp9cZLltoONRp9dhdoM2DpTzRHt
         2BHXQ88tJzP0kSCf+X2lZlN/cnZwP3690jUB/fHMm+xlDueoSb744qUL/Uey7jn76s4i
         lKP33ZTl7k0XDjjFm7YPNflGtNSRvgeLnbk4YbbT8zK8Ea/MEumt1XdsyEZ8oBbdpcCP
         bjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739486852; x=1740091652;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3PBMMH2moGlibOV+gRj99WpX+TZ+10z7I1DXCC5PdQ8=;
        b=eANFUTHCSycnGRKqrMwGYLPE/fAzLvO4+4KW+Zp8+s47MCYddEbezJM64dEYyWqw62
         OZn/HrrAyAytk5pTg3zUGvUmWwsUPlzZe4xf7A2umZGVSPvqj+8CjM51G7hT+CBLCcu3
         7naY3YhkS488H3DYpHnzD8W59f/NHi4EoqdcejmYofX9wF355mFAA6S9QHZGmBFBHNa+
         NmsUaTvJWzbMSy9HOfAau4s0QpWimg7BswLfaFS0JDzQcmnU+M7v30pmbbtBb3HW22WP
         8vdPWhYneeWf4ZnFye0UYw/JydqFfd+xJmhL+vqfrdDXZF/I48h7yxkS/ig+8NtDSocH
         KNtA==
X-Forwarded-Encrypted: i=1; AJvYcCXGyh0OjRnPCqErewEQFgL6i5nmwVldPsj1nXvhs6/oTLugkonz7CDyJYLTEaL6GqbzzDfCykH2dM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMq9r+pkRS7GH4vb0J4maqHZig8nwqRnTK2UUQynMVBozhf4uO
	tV/iqOuFBgew4/i0O5+xxppTqhQwEKkEGq7qyziVGSo3F7SVUiyV1VMsG9IkGixrLeyadG3vh3F
	qAA==
X-Google-Smtp-Source: AGHT+IGMj8N9UltRndmqK4fcmCOY71dV/ZTT0TWqfMv3mL8UIMVUEmmB9CXosWINwjoG+HVa2iESOUWrDew=
X-Received: from pfblc21.prod.google.com ([2002:a05:6a00:4f55:b0:730:9378:98c1])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2585:b0:1ea:e81c:60fa
 with SMTP id adf61e73a8af0-1ee5c78b20bmr13938165637.20.1739486852080; Thu, 13
 Feb 2025 14:47:32 -0800 (PST)
Date: Thu, 13 Feb 2025 14:46:53 -0800
In-Reply-To: <20250213224655.1680278-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250213224655.1680278-1-surenb@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250213224655.1680278-17-surenb@google.com>
Subject: [PATCH v10 16/18] mm: prepare lock_vma_under_rcu() for vma reuse possibility
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
 include/linux/mm.h | 12 ++++++++----
 mm/memory.c        |  7 ++++---
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 327cf5944569..88693568c9ef 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -739,10 +739,13 @@ static inline void vma_refcount_put(struct vm_area_struct *vma)
  * Try to read-lock a vma. The function is allowed to occasionally yield false
  * locked result to avoid performance overhead, in which case we fall back to
  * using mmap_lock. The function should never yield false unlocked result.
+ * False locked result is possible if mm_lock_seq overflows or if vma gets
+ * reused and attached to a different mm before we lock it.
  * Returns the vma on success, NULL on failure to lock and EAGAIN if vma got
  * detached.
  */
-static inline struct vm_area_struct *vma_start_read(struct vm_area_struct *vma)
+static inline struct vm_area_struct *vma_start_read(struct mm_struct *mm,
+						    struct vm_area_struct *vma)
 {
 	int oldcnt;
 
@@ -753,7 +756,7 @@ static inline struct vm_area_struct *vma_start_read(struct vm_area_struct *vma)
 	 * we don't rely on for anything - the mm_lock_seq read against which we
 	 * need ordering is below.
 	 */
-	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(vma->vm_mm->mm_lock_seq.sequence))
+	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(mm->mm_lock_seq.sequence))
 		return NULL;
 
 	/*
@@ -780,7 +783,7 @@ static inline struct vm_area_struct *vma_start_read(struct vm_area_struct *vma)
 	 * after it has been unlocked.
 	 * This pairs with RELEASE semantics in vma_end_write_all().
 	 */
-	if (unlikely(vma->vm_lock_seq == raw_read_seqcount(&vma->vm_mm->mm_lock_seq))) {
+	if (unlikely(vma->vm_lock_seq == raw_read_seqcount(&mm->mm_lock_seq))) {
 		vma_refcount_put(vma);
 		return NULL;
 	}
@@ -914,7 +917,8 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 #else /* CONFIG_PER_VMA_LOCK */
 
 static inline void vma_lock_init(struct vm_area_struct *vma, bool reset_refcnt) {}
-static inline struct vm_area_struct *vma_start_read(struct vm_area_struct *vma)
+static inline struct vm_area_struct *vma_start_read(struct mm_struct *mm,
+						    struct vm_area_struct *vma)
 		{ return NULL; }
 static inline void vma_end_read(struct vm_area_struct *vma) {}
 static inline void vma_start_write(struct vm_area_struct *vma) {}
diff --git a/mm/memory.c b/mm/memory.c
index 528407c0d7cf..6378a873e7c1 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6492,7 +6492,7 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 	if (!vma)
 		goto inval;
 
-	vma = vma_start_read(vma);
+	vma = vma_start_read(mm, vma);
 	if (IS_ERR_OR_NULL(vma)) {
 		/* Check if the VMA got isolated after we found it */
 		if (PTR_ERR(vma) == -EAGAIN) {
@@ -6512,8 +6512,9 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
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
2.48.1.601.g30ceb7b040-goog

