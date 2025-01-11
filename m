Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396D8199EA2
	for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 04:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736569605; cv=none; b=ci1eQcswsYKyUA/quu9msnYTpbF3UhSOjKjgIxp9AtsMHEgRjQXqmkPX3g7SJDMDXoR4FtJL9JXx9vhTGOPYJmaTmbsyI+KYgSkwFwY2+/TqJyUMxTqLIJLExh1gYOsoeUuyB07x6C0NEH50es8j/o8OZ9n4sFSayf8x+eDGf24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736569605; c=relaxed/simple;
	bh=zKfjcGKw4fgC5eVw/PLaT9hCUpUPIDpZJuPQmd/+rms=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S+UIpzTKOiWdtGoLzoIeW0mPgFqDB7NLI57txA0EBmMRIkGtAvHfvOCZL0B2KNjdHH2MMYucDDlCwPtyKJBVeGxoUjPPsx0RPMC552farwuBpSSUCjQJDcUhlrchh4+TLV3F9j+CUkQgsmMFFPHlLtW0Zs3UNBO4MX7AaezuUyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SeJGj0SC; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SeJGj0SC"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f5538a2356so4690177a91.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 20:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736569604; x=1737174404; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jMJU/3gn80Bp5VROzRR3pKDE/HRHDjLKawYxTpkzfvE=;
        b=SeJGj0SCuMAHaqLpRfknzAF5tYw2dkwNjvfTR7w2J1kP23Zr7jc7dPTM8qMSAXyY7g
         34aKVr1j6YxtUtBryCgF0UHE5NtWWOGkssfL0jHtMEbcuUYPYXqXRCNR615mPwthm2z3
         LDNV7zS+Y8PuBHEnNSihtP/K/ufJPfarYa7H+BExelbdrNlVuzpSR/hmj25hG5IMXa8C
         76ozz/ptoQmi9OsDu8iIAxMWOk+KADF/0dPwxpFDN2c8P342kB0slpD1HRfngvQYUrVB
         5ciwZrXd1+IJ/SHR5Q3yLmizbg+INZk/ta7kMxBi9n4H78ZHL56jvNiBKqE+AnOHFXqx
         8nDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736569604; x=1737174404;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jMJU/3gn80Bp5VROzRR3pKDE/HRHDjLKawYxTpkzfvE=;
        b=FHp+QMU/tfERV2kbFBwLiA+vhEm9lIEZuvYu6dZiQhtuHJZTwmWGDL6cx9CLmdle3o
         kIK3sOUaXXJst6xvdlRr+W9OfKmvPh1bMjCSOCKc+lmRAITlk5eNxd5ppFycbJMNPV62
         DSsj9RMmt74s0zbkQ8/zR6MVSJeyKbqd7ySEZXa+w+uMivPU4PgtonrwFH+HPpz6mH5o
         O3EQWUVjMq8iTLpGX+V3x5hMwdVd0xtHvmAuSnjZatTWO12Bu1LGFjJ+eaUZ1FSMeQt6
         IV+O8M8E9RqXp5r3lUEfpmGBFQtJylk3xBI187LzP0FZkRcut/vicHsfAyFoJvp74s66
         2A0g==
X-Forwarded-Encrypted: i=1; AJvYcCW4WHOCUXQAnwe9HGrFOqJI264ld/l3FIF81W21szf6gS7v1UOE/DhxSQnUSY+QYWYl8na88OAz9gk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzydh5Tz+ZS6XDp9fxL+jmo8Zkcj+puIGuwuHzAfmOAKATXsnod
	TXdlWudRk5RKPYm3X83zslw1JKE4ZwLMxkF8hdPtsK/ji2anGpoqrV079m3uCGbei8JUZux2+Sq
	iKA==
X-Google-Smtp-Source: AGHT+IHMJpbQc3YVt8D3m2qQgogBlgT8FIMa0JXsY8T6EvdL/cAJ/CFqkCirBdGHXn7gzQWGFp3GMnON+/M=
X-Received: from pjbqd11.prod.google.com ([2002:a17:90b:3ccb:b0:2e5:8726:a956])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:520e:b0:2ef:67c2:4030
 with SMTP id 98e67ed59e1d1-2f548f4ea90mr18504335a91.27.1736569603731; Fri, 10
 Jan 2025 20:26:43 -0800 (PST)
Date: Fri, 10 Jan 2025 20:26:04 -0800
In-Reply-To: <20250111042604.3230628-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111042604.3230628-18-surenb@google.com>
Subject: [PATCH v9 17/17] docs/mm: document latest changes to vm_lock
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

