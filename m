Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8E515E97
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 02:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736389833; cv=none; b=cT2p7zq8YLqSBuvjJpEcXzWM6qICK9ZDe2LgP4qIjWBfg5BKUMMSAOpvUPQ1mW7Ikb1ntqvsy9LS72nmUuNeVEk5QqJuACmgK2rhESyLAY54+K6kRyCaXvAXU8iQ8tR99nGeQrnmEL26fo+qRCMyVGLTAQ7OXR7EPAjYK2nT4Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736389833; c=relaxed/simple;
	bh=hJuoXOD+Hgs/Q4Tge4AjDWFB01AUx9ksvDVIv+G6+4M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bhJdRJGBiJ/vqY46tBZsBvLQSLrp8jPGRkBk0KUY6phu8QajGLrUcc7kmrQIOCnXf0AxraxCckqDL5960mtZ3hATsntIGKNOTnliSzUgzr1qEPq6NlP3oI7X7roHbWPphByu+DssXyWGiBGVfUgnYG5DyCKVdJq1dEr/2l1Teu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VKbwklV9; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VKbwklV9"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ee6dccd3c9so748486a91.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 18:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736389831; x=1736994631; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L2pdotIvyMZQNnGmgTfsGf0xKAYx/XKZavKJSJfbFgY=;
        b=VKbwklV917NYg2LHHTu8NWDzLIReJHfpSYINoU65sQLGNnHI3X+5EhKAzJhyL/+/vv
         K3TIA2wzk4o+5VhXKAHuYfy0SDhNuyLE0JdGG4B15utO4JqAri+0CQ4gF6cGEY3WW7GN
         ceEQOh/LPDj6373Au5DMEeFlOB3CZPvbYwdChtbxfFaJRu4OnouIM8UpqFUyq2RbcHLc
         nma6SQzf4I3UOKtq904avU1Fgz2PuAZJSOefvVHpo2aXm4lMxJGibDnoAWUZJaUCPpsm
         WbszgtAsNlcrU5Kh1TiDluJZ18kH7oNx8sPbz4bNDh2OzkECDvMoq/w6aw4pFJT5NvR6
         OmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736389831; x=1736994631;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L2pdotIvyMZQNnGmgTfsGf0xKAYx/XKZavKJSJfbFgY=;
        b=e6gu1DyYg2RPhwqGt2qjO0wg+iUSIKvi85N3MygQ2GXQRomcrqaZlB/Lu5vUX/jm22
         Zra7N294PZAwlZ9G6nGarPKOIdnvbFUb1Gu/314OeMc6FanzEfJI1UVGlvm4IxSGP5wd
         pVWAYILqVHaXzMByiW5ob6JV1entBCxAP+iwsOfeQgOCgLjP+qXbj/G+DuUNDUyycbKH
         o4wypTADueEmk9vGqaM5QbM7LDfpLZVNy1ReZguudD2EPdcmYSfdVOMEpJEzRINTgYiB
         K9pC/nyWsGCrOu1Gv8dnqMX+2qBieIyM9Qcvzja7cRQhNF0I1Z5gpTNznJG5xj7/sUFl
         ohRg==
X-Forwarded-Encrypted: i=1; AJvYcCXtoSyb0odWVJreZJvl4d4uPGg86QglHQP6nXAfPLm63qPrc3qlkSpF2hFhcWGze0CnK/rj514MLto=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2toR/mmth0MayuIKFKb3+90KwmXU4oBLbEjLo1P0cnSRFPMw0
	v6fQlzE0UHprkg9u2UEHxZNrBcy2NK7PnAXiaFmEkZbWh6NjFNRE0ovCZO7xRN6hsxDNqiBa6G9
	UGg==
X-Google-Smtp-Source: AGHT+IHWgi2ldN3a83aKZv2dDntq/xf/7vQGhigjGpu6Kf8lGzADe54dCpxgONH1NIDSqnEDQ0UO7ZABvv0=
X-Received: from pjbnb3.prod.google.com ([2002:a17:90b:35c3:b0:2ee:3128:390f])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2748:b0:2f1:30c8:6e75
 with SMTP id 98e67ed59e1d1-2f5490e89e0mr6525677a91.32.1736389830966; Wed, 08
 Jan 2025 18:30:30 -0800 (PST)
Date: Wed,  8 Jan 2025 18:30:10 -0800
In-Reply-To: <20250109023025.2242447-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109023025.2242447-2-surenb@google.com>
Subject: [PATCH v8 01/16] mm: introduce vma_start_read_locked{_nested} helpers
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

Introduce helper functions which can be used to read-lock a VMA when
holding mmap_lock for read.  Replace direct accesses to vma->vm_lock with
these new helpers.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
---
 include/linux/mm.h | 24 ++++++++++++++++++++++++
 mm/userfaultfd.c   | 22 +++++-----------------
 2 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 57b9e4dc4724..b040376ee81f 100644
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
index 11b7eb3c8a28..a03c6f1ceb9e 100644
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
@@ -1490,14 +1482,10 @@ static int uffd_move_lock(struct mm_struct *mm,
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

