Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCDA192D97
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 02:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736389865; cv=none; b=NI/QGf38dVp21w9BCW1RUzsWGzC4T1rWqvk//RwXpHGgfI1LITDER+3UfHVg5VjUPE3WI/xqYg1+Ny0FXrs13sJqa79QGKPFJ+dWSfVI5o+RopzEtP+NiHa3zo8H2G4xdZwdzxcIZ06K4p+NNY06kp717MIwuoE1z3rUYGPhvrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736389865; c=relaxed/simple;
	bh=zKfjcGKw4fgC5eVw/PLaT9hCUpUPIDpZJuPQmd/+rms=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iAYtugib7gwbqptFNaUPy32FemTSQP6X/K2B79LmhgnnDJMsFZTP/UXuXEk+3d8hOB6rWcgThgHfgKPB/GWbC9I1S99ARVd7dyK1XImt7Pvy7pmov+Osqjuvv9twv6X8kqLGtjlVjQAPZ8Pl6Xfhb1XDbm8YVQyrn5ro+ruXopw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mttMEBfn; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mttMEBfn"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-216750b679eso4744235ad.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 18:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736389863; x=1736994663; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jMJU/3gn80Bp5VROzRR3pKDE/HRHDjLKawYxTpkzfvE=;
        b=mttMEBfnFeHVKyGw/npDcfQr59phLg8EkWtBQ2kqVKf9N+JobFfn5jS2jpJNQ9s833
         a0TncVkn6hItLN2RqSg6oXa9JtyHxP1ltQj3YcWHt5CId3+hpTmcEDyTsS2/SoMGqCsl
         I2pOSrMbDEdeqObltEEdPnFX2zXAdQOntqky+M2YKJ7kvjmJe1RTrEIrNHLL7Dj/C2Tu
         SwIduQBF/S0edgbmSXPLfjlaWlH9WjPTO/uAUUGBUckU7wEnJh8MGdwRqZu/dYKovhRc
         TohdaoY8/EYfkBGnnY7R35FW0RzLEOH+sgJr3VBlL+9WSBljPukziIbX4q/3HyL0lB6Z
         zmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736389863; x=1736994663;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jMJU/3gn80Bp5VROzRR3pKDE/HRHDjLKawYxTpkzfvE=;
        b=QdtvKnjE3nJ//DGR3LmMhL854hgEsUguI2PIJQfrI7jCoacBMvHXnqlM778B1LpPPB
         9P9Qo5FRvM1+XUSVDLVKa07pc/aG96EXAfbNOgf1u6s3+4hNq4eNpIIz2F6GI+QmlvAH
         7dXiLOpKdcyNlzOuDqs9helN36rYnFzthyJSLrBscxjI2vyEMbcacCdd1g156xSf1cHw
         RE/kvRG5tdBE7bx1rG8Zgceqi82rQqWu+3QgB4ePPjBEZky0NPmncHom1zV5gHccfd90
         Bwh0KnmarVQ09oC6GV28UabribrgN4N/VNZzdYK5Zp0hIrhhNcnKmEE3/ZTo9cMDSF4/
         DG5g==
X-Forwarded-Encrypted: i=1; AJvYcCWuA4MTtI8d8GEaJY/GVjlWMrxRUFQN9Wa0KzG/JmcJ3JiZWaNhspeM2N971LKzOuu2zZpMCuKFtos=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhbVyw80QVZ3m5oxH2MTVhnJ3WaFkYLaGI99d4j4TK1WVZ4WsO
	a1ikUDjs2kRHzyaeMBBGNeauzuKThp4ldDb0X35c1WNeSuIIxdv2aQA/Bl953Hn2YCGi0ismTps
	tnQ==
X-Google-Smtp-Source: AGHT+IGIq2BAYBw5AVU5HpNLwVIjRPdRRVq4DaaH9pXI9zGCBX20QcwARo1md41gddC/qz9xS8MYPY6uF8o=
X-Received: from pgcz21.prod.google.com ([2002:a63:7e15:0:b0:7fd:50e9:aabf])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f64f:b0:215:5240:bb3d
 with SMTP id d9443c01a7336-21a83fe4915mr80523945ad.42.1736389862977; Wed, 08
 Jan 2025 18:31:02 -0800 (PST)
Date: Wed,  8 Jan 2025 18:30:25 -0800
In-Reply-To: <20250109023025.2242447-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109023025.2242447-17-surenb@google.com>
Subject: [PATCH v8 16/16] docs/mm: document latest changes to vm_lock
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

Change the documentation to reflect that vm_lock is integrated into vma
and replaced with vm_refcnt.
Document newly introduced vma_start_read_locked{_nested} functions.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
---
 Documentation/mm/process_addrs.rst | 44 ++++++++++++++++++------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/process_addrs.rst
index 81417fa2ed20..f573de936b5d 100644
--- a/Documentation/mm/process_addrs.rst
+++ b/Documentation/mm/process_addrs.rst
@@ -716,9 +716,14 @@ calls :c:func:`!rcu_read_lock` to ensure that the VMA is looked up in an RCU
 critical section, then attempts to VMA lock it via :c:func:`!vma_start_read`,
 before releasing the RCU lock via :c:func:`!rcu_read_unlock`.
 
-VMA read locks hold the read lock on the :c:member:`!vma->vm_lock` semaphore for
-their duration and the caller of :c:func:`!lock_vma_under_rcu` must release it
-via :c:func:`!vma_end_read`.
+In cases when the user already holds mmap read lock, :c:func:`!vma_start_read_locked`
+and :c:func:`!vma_start_read_locked_nested` can be used. These functions do not
+fail due to lock contention but the caller should still check their return values
+in case they fail for other reasons.
+
+VMA read locks increment :c:member:`!vma.vm_refcnt` reference counter for their
+duration and the caller of :c:func:`!lock_vma_under_rcu` must drop it via
+:c:func:`!vma_end_read`.
 
 VMA **write** locks are acquired via :c:func:`!vma_start_write` in instances where a
 VMA is about to be modified, unlike :c:func:`!vma_start_read` the lock is always
@@ -726,9 +731,9 @@ acquired. An mmap write lock **must** be held for the duration of the VMA write
 lock, releasing or downgrading the mmap write lock also releases the VMA write
 lock so there is no :c:func:`!vma_end_write` function.
 
-Note that a semaphore write lock is not held across a VMA lock. Rather, a
-sequence number is used for serialisation, and the write semaphore is only
-acquired at the point of write lock to update this.
+Note that when write-locking a VMA lock, the :c:member:`!vma.vm_refcnt` is temporarily
+modified so that readers can detect the presense of a writer. The reference counter is
+restored once the vma sequence number used for serialisation is updated.
 
 This ensures the semantics we require - VMA write locks provide exclusive write
 access to the VMA.
@@ -738,7 +743,7 @@ Implementation details
 
 The VMA lock mechanism is designed to be a lightweight means of avoiding the use
 of the heavily contended mmap lock. It is implemented using a combination of a
-read/write semaphore and sequence numbers belonging to the containing
+reference counter and sequence numbers belonging to the containing
 :c:struct:`!struct mm_struct` and the VMA.
 
 Read locks are acquired via :c:func:`!vma_start_read`, which is an optimistic
@@ -779,28 +784,31 @@ release of any VMA locks on its release makes sense, as you would never want to
 keep VMAs locked across entirely separate write operations. It also maintains
 correct lock ordering.
 
-Each time a VMA read lock is acquired, we acquire a read lock on the
-:c:member:`!vma->vm_lock` read/write semaphore and hold it, while checking that
-the sequence count of the VMA does not match that of the mm.
+Each time a VMA read lock is acquired, we increment :c:member:`!vma.vm_refcnt`
+reference counter and check that the sequence count of the VMA does not match
+that of the mm.
 
-If it does, the read lock fails. If it does not, we hold the lock, excluding
-writers, but permitting other readers, who will also obtain this lock under RCU.
+If it does, the read lock fails and :c:member:`!vma.vm_refcnt` is dropped.
+If it does not, we keep the reference counter raised, excluding writers, but
+permitting other readers, who can also obtain this lock under RCU.
 
 Importantly, maple tree operations performed in :c:func:`!lock_vma_under_rcu`
 are also RCU safe, so the whole read lock operation is guaranteed to function
 correctly.
 
-On the write side, we acquire a write lock on the :c:member:`!vma->vm_lock`
-read/write semaphore, before setting the VMA's sequence number under this lock,
-also simultaneously holding the mmap write lock.
+On the write side, we set a bit in :c:member:`!vma.vm_refcnt` which can't be
+modified by readers and wait for all readers to drop their reference count.
+Once there are no readers, VMA's sequence number is set to match that of the
+mm. During this entire operation mmap write lock is held.
 
 This way, if any read locks are in effect, :c:func:`!vma_start_write` will sleep
 until these are finished and mutual exclusion is achieved.
 
-After setting the VMA's sequence number, the lock is released, avoiding
-complexity with a long-term held write lock.
+After setting the VMA's sequence number, the bit in :c:member:`!vma.vm_refcnt`
+indicating a writer is cleared. From this point on, VMA's sequence number will
+indicate VMA's write-locked state until mmap write lock is dropped or downgraded.
 
-This clever combination of a read/write semaphore and sequence count allows for
+This clever combination of a reference counter and sequence count allows for
 fast RCU-based per-VMA lock acquisition (especially on page fault, though
 utilised elsewhere) with minimal complexity around lock ordering.
 
-- 
2.47.1.613.gc27f4b7a9f-goog

