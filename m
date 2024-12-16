Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFA120898C
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 19:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734377098; cv=none; b=DW+FMO7n0PP3iVnyLPgaB92TZTdXHTkc3DGndBxFRPRPFAg6lrxid9WrLNupoJ1K/PFGXyqhrmIpn2pLEcetuH0gwcOKbhZUe0goqKBriTPrkD8KVwVgfDBMxYfkyUX818evRL+Q6rY3OpyWez+KnxJUpkDOzmlLtrxYM+RLMLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734377098; c=relaxed/simple;
	bh=GIO0fbE7SQZ1rtlKN8vZekgYlbMsWE+guT+3ZXk1HZ0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oBK01I1/6zh+3O/2kgUxVqKKwDmGthhUUbkWkE+ZP1bneHlS4OaNwQeOTS0b03EBzzVAu/ocWwcUgLaKddqPq7r60H3wgfmptBTICcyDNiKZyU5UlnZ6UWjj/fofpzng3bXCBeNp6kRJazF6/DuuaA7DTrlAUk6ztVrBEEvN0LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sm1OBka0; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sm1OBka0"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-725dd39ebe7so3513739b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 11:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734377096; x=1734981896; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4HhxNlm5l3oc+a05Upn5SwGTABo4qTWEjrE4UxpsHII=;
        b=sm1OBka0RuFfJ0uvG3YR4A4+GZf3g+Qj9m0Nb6epgswsUaXXu67w/3SHSoUl1IWsjB
         qeBIWRCQ6QkTkyGsQSSysazuANWhPKC/32D5DT4YCascQYesg+1r36egRSEL2y1OM1S/
         hcgygAHUJxMJv9QlNk97fxlXl7OeOgSuieS7R0eFytZ5qA4NVO0PmKOoAITG1fFAz3zQ
         n6sY2XNea9nP+IjLhJxtFTOSPHxAFvKeXH73+6FzIukFvzMbdb5OYrEXsArVcTVHWiZd
         lllw+uwZVDoOIRL1QlLDzEXsP+XT6NkfNAFajJbpQ6qTxlcU6s5/SCd6wR/gjJ4WfVTb
         YAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734377096; x=1734981896;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4HhxNlm5l3oc+a05Upn5SwGTABo4qTWEjrE4UxpsHII=;
        b=ZnQfv/Wbu7w36ACTHmJKVn3Y0tUVkCtK4eTz3qKr5LyyB8y5YHmD8ERvA0pNP/7gyc
         ytTISKS8PElQdVyDN6w3QEBFtgI8Olziu5elyAvcvMXtVwMm2TF7ohT2dh1Dj2gfVdRa
         /6cWv7wxJtqjsRxJKYs10PBPU/ya9duQ3aMe51O3TB1o6jHWpmXmbS6zeOI4fle5Vf8v
         5xPyPXKJMoMRIQQhDd7fmwDPYiTXQTUv3DeP3gpCeSkjifwTc65mu/YHdVMNhLDJC8RW
         OmD4slHGlec1DjoHKXG3LdjQ8p3RquCJzssTcpEdhm7EErhe0R+L7s3WN8zvUA9hi+Rt
         aiRg==
X-Forwarded-Encrypted: i=1; AJvYcCUWxjS7W/H360m00Ho+W6G7EBd90P5kUdaudQGTQQxBYV2vz6dmCNKS7LZMfNR2sYFX8uI8IckTn98=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHbmQQEu3fn9/O4WTZ+M8BxZUPPtHoNSomCpWjdzrZQDYWGtk/
	awV17r0bkm2mYzluzZ7nmcgFDaKtrCz5uK+X90CWuZ0buTliaS7CLupaiSkY8CIGNvOvhV7E5iN
	Ujw==
X-Google-Smtp-Source: AGHT+IFCRcSRmnDxCEXNS618C+s8AbCbrJ3sqm2+B/Vq6ZMmO1in0EJV2noWuvjJbPv4qSgauLdf86FSJXo=
X-Received: from pfbfb35.prod.google.com ([2002:a05:6a00:2da3:b0:728:b8e3:9934])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4b54:b0:729:49a:2db0
 with SMTP id d2e1a72fcca58-7290c273bfemr20412405b3a.25.1734377095966; Mon, 16
 Dec 2024 11:24:55 -0800 (PST)
Date: Mon, 16 Dec 2024 11:24:19 -0800
In-Reply-To: <20241216192419.2970941-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241216192419.2970941-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216192419.2970941-17-surenb@google.com>
Subject: [PATCH v6 16/16] docs/mm: document latest changes to vm_lock
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

Change the documentation to reflect that vm_lock is integrated into vma
and replaced with vm_refcnt.
Document newly introduced vma_start_read_locked{_nested} functions.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
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

