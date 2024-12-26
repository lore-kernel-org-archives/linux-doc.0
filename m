Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F0A1DA309
	for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 17:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735232866; cv=none; b=bASEfiiHI3qImu2sqc2+Tc3CF0qMl7YBk/asiC7BNL2MVsejQE0RlIaDzjcs8e/6wqitcF59nJjPneBKzvEHSZscPllBmm2v2OpqBu7YnmAsNI04aRmQT7kG21iLG5BHvmMxbvDxHcV+1ku4ZEFMXOtZLpFAP9mK3JjI0Tw07Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735232866; c=relaxed/simple;
	bh=/0bGUl5184tFDePXHZ4jRFWAcn0sSk/E9p6ppVaBLHA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UwnOcvjElwINTyEoI7CKGzKIG+RiTtk8xYHtEfE4h3wQZ1DoT3VeDiB7i3+66jA0W1h0LuXcvsR30exzjDURgMfOhQoJSJ/hLMaPnCM8qipHrUoO75xxk8EwQmu0eW7E7bjp/kH7Hc/+PRCJqImNxU0hkGftB+8Siz0Drat9/GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P3L9PEY3; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P3L9PEY3"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2163a2a1ec2so139982695ad.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 09:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735232864; x=1735837664; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wJt30IjlBNVAevAu7cS4hzA6cm3MdBwy61U0C7q4UdM=;
        b=P3L9PEY3T7v+qlPLRI3KcwAq/g8HrIJbfXgaS3G6T2uyoDpf9khOA1tVb3+I3rl3Ku
         6sSTNQB5dPdabFZiS83wyzFzi6H+C6XMZdw5sePmQRYlSpSNUuvMZuJI9YpJaDFLbOU7
         /Ie9klNxaczg6NvJxpD9YSGFLbo0u7LASrpg9vzhN8x750DhFohdUU8BCYxuRRCW1GPG
         tbRGFqJmsmbZamR6UeIR9NzQy0aCVS6rTJHYrE7sFbwFnSrVs2n92dsVdEU/P+kukZPC
         9JFheFMVW6P2lQEv8JuJDfn+RUThqWbmBMGLXeml9yhJwMyEgNI/JqUiI5+dPQZ3C3ZH
         re1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735232864; x=1735837664;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wJt30IjlBNVAevAu7cS4hzA6cm3MdBwy61U0C7q4UdM=;
        b=BL21zsVaCl4cmVa4kN3eEJzqhVxnCsTzTW72/YhuFvSzupGuMI96igWTuyjalshlhc
         MAxuAcyAAU/JQg/yax2kzdXsnmg1M5TtNe529cpixzDa++4VABXJePoT0gt6aDrxA0hI
         ow+nq4UXemhtqFdeDIfuoWhHbuKXbNXlxdAavlIf1jXxDTIDADm80PMBX3oVF/hMVyh5
         YYMK9Cl8lVZYl8RPatlT2IeEC7Rkc+Il0O3+SGCbXnAccLj0iPIXsHfXe1KEEqQ33+N3
         U5gHEOpauBG/Auwu5ICpkcYLeP4twbZPZ6n8iSSERy0dv1PR2SJqGotJ1dS3qdINbKFR
         4IXg==
X-Forwarded-Encrypted: i=1; AJvYcCXGKgxf6OPp92DbmfeOtkbu+74YbQP4lleWFryem68k8ciVLOjP5fbDkIIJ6qq80Yi1NfXA9g/v0kE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTqVbuRnbGzMX1ZYw7+ObsFFrmv97Y7+S0B9e/ZcJSSY0ikcfW
	b4i6GDfJ4w3uQA3CZZ4WUiQL0EKdKuncnaSrI5FXxozZHQ0YBFwoZKrq+bqp6ppHibGwZ5kzGdw
	uNA==
X-Google-Smtp-Source: AGHT+IFXJnhfwZOHdM4geNls1CRjrBe2ovOlMU/gzO5O0nW/gc0UsQXMJYqFrpyCsqUXFXBoYnj2R8jomuo=
X-Received: from pgjg7.prod.google.com ([2002:a63:dd47:0:b0:801:9858:ef95])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:339e:b0:1e1:aba4:209c
 with SMTP id adf61e73a8af0-1e5e07ffc0amr38092469637.29.1735232864140; Thu, 26
 Dec 2024 09:07:44 -0800 (PST)
Date: Thu, 26 Dec 2024 09:07:07 -0800
In-Reply-To: <20241226170710.1159679-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226170710.1159679-16-surenb@google.com>
Subject: [PATCH v7 15/17] mm: prepare lock_vma_under_rcu() for vma reuse possibility
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

Once we make vma cache SLAB_TYPESAFE_BY_RCU, it will be possible for a vma
to be reused and attached to another mm after lock_vma_under_rcu() locks
the vma. lock_vma_under_rcu() should ensure that vma_start_read() is using
the original mm and after locking the vma it should ensure that vma->vm_mm
has not changed from under us.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h | 10 ++++++----
 mm/memory.c        |  7 ++++---
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 40bbe815df11..56a7d70ca5bd 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -730,8 +730,10 @@ static inline void vma_refcount_put(struct vm_area_struct *vma)
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
 
@@ -742,7 +744,7 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
 	 * we don't rely on for anything - the mm_lock_seq read against which we
 	 * need ordering is below.
 	 */
-	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(vma->vm_mm->mm_lock_seq.sequence))
+	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(mm->mm_lock_seq.sequence))
 		return false;
 
 
@@ -767,7 +769,7 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
 	 * This pairs with RELEASE semantics in vma_end_write_all().
 	 */
 	if (unlikely(oldcnt & VMA_LOCK_OFFSET ||
-		     vma->vm_lock_seq == raw_read_seqcount(&vma->vm_mm->mm_lock_seq))) {
+		     vma->vm_lock_seq == raw_read_seqcount(&mm->mm_lock_seq))) {
 		vma_refcount_put(vma);
 		return false;
 	}
@@ -905,7 +907,7 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 
 static inline void vma_lockdep_init(struct vm_area_struct *vma) {}
 static inline void vma_init_lock(struct vm_area_struct *vma, bool reset_refcnt) {}
-static inline bool vma_start_read(struct vm_area_struct *vma)
+static inline bool vma_start_read(struct mm_struct *mm, struct vm_area_struct *vma)
 		{ return false; }
 static inline void vma_end_read(struct vm_area_struct *vma) {}
 static inline void vma_start_write(struct vm_area_struct *vma) {}
diff --git a/mm/memory.c b/mm/memory.c
index 2def47b5dff0..9cc93c2f79f3 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6414,7 +6414,7 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 	if (!vma)
 		goto inval;
 
-	if (!vma_start_read(vma))
+	if (!vma_start_read(mm, vma))
 		goto inval;
 
 	/*
@@ -6424,8 +6424,9 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
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

