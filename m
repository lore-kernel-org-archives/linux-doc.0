Received: from mail-oa1-f73.google.com (mail-oa1-f73.google.com [209.85.160.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C30212F99
	for <linux-doc@vger.kernel.org>; Fri,  6 Dec 2024 22:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733525531; cv=none; b=h/Bx7UdLywCgi7mouB9yFd4Gts5+PEvsR70NF2b2OC+ESoGtcchX+ZVkHARqcRzHoaaHHnfo+ri3WwPsw2R8RHduDnPJcuJF64IXHhALwTJJGl2FTi+EJCf5rOwe3y+PrplIbEFDEQpfYCMqZqllv3qJErsjXwrZ6FQq+pEGpYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733525531; c=relaxed/simple;
	bh=2j1BzXPRuP+UhOQHpNJNISGx3R6QvDIWF84DWtljS3M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QVigaDfxV4z1K9N3w+wdlxNsJtDvk8xG0KtjfDCeKK02dDx5fuAlr91R0DmXL9hawTOiIpcvsmo9eg1llTB6jAVHlh2g9AUAb/Oztr4WU5EqyeVqsYG9czgBGNlz8gd1O/vqwOm0SrIFbpgTzzH+QhkEUXZ27+TyFe5kdGDHsIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cvxbFSAz; arc=none smtp.client-ip=209.85.160.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cvxbFSAz"
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-29e82f6ba5eso3419190fac.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Dec 2024 14:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733525529; x=1734130329; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2XVlPHpEZtu9xIw4Qap8alaO3+SGpEYwVQX0iy/v7kQ=;
        b=cvxbFSAzZLVRrz8SUlDqgxhO83eb/7TedstGzq+UVNvkXX5ZepC6ZLryjDTCEzs4e8
         xp/INd9YzpTgg2DQ31jIx9RNC2xe6cHmntP046FqHuXZ3WHQhC6wxRZviw6cAzNAG/4N
         KFjGVJZCf5w6BxI8qsexkwuDcl1sqoq7lYxJtDrWabgkCGnc5J+bB0f6oI3Adibg0LTT
         YU3iaqA/favaw5L3HkT3h0tdsvnLBJV2yhyAVC39oTxQPDhbu5/PIv8asP00cAPLh4R8
         ra7uLfARMuaB75oJ2sR/+cb68b76/IPRKCA5SUQD+asic7ucQwE3Bq3b+Fa/h9jTok4G
         6LWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733525529; x=1734130329;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2XVlPHpEZtu9xIw4Qap8alaO3+SGpEYwVQX0iy/v7kQ=;
        b=Xe8TOorntZW5G7XK5Og6ON45x4KuWE/kn6B1Idhon/aFUOnNupTSsB+fI4eCdQq6z8
         LGnwyLaPzQIgr7Kguj+G6R3GapjkBcoaxf87DM32vOPaN5/Rj15zIlO9rh453QlDfa5q
         5IURe2j1VJDlk5urQzfU86KvNS8I6Z9L6eAgqgm+A9okiA2bDgjw3PMhjP+76m2IX1hR
         bAWVh547q2+eN1l3Wf49i/Oi7r7nVTy9jtfAZno1bXLNvnT8+V7I2s1GP/vbWvbaH0+y
         QzafYZQDT9c4z13s3UfzETB/29qCh6GzWyL0uINCKcydx5goWYeFLMowR03E9lQks/mR
         jZZg==
X-Forwarded-Encrypted: i=1; AJvYcCUCWqM0yoZtVagFd/BXIV17pMVMN+vMkMwfBA6zbodbAYWPBwhnlafcE/oDFMHnr6hmGS9Igz6lQpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtczPXiZHszrAxh2lP/E4Gjcu1Z71DhhTNXgLhk7Msjw6bu/FQ
	I47PrI2WX/wgCBtg6IcFkC0nBfbrwX3FrJ2PKWhJC7IfX2lot7nFbvCk4MY7L1IR3PW+R+15qBG
	GtQ==
X-Google-Smtp-Source: AGHT+IE3XhAvDScGGmsUTdbbULESWT7yEme/wNWVflifCM9618rjWWcRcIta7LlU8v32EA39xFZwUHCJlPc=
X-Received: from oacpd2.prod.google.com ([2002:a05:6871:7a82:b0:297:2483:5994])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:e8c:b0:3ea:5161:f71
 with SMTP id 5614622812f47-3eb19ce52a7mr4865569b6e.20.1733525529219; Fri, 06
 Dec 2024 14:52:09 -0800 (PST)
Date: Fri,  6 Dec 2024 14:51:58 -0800
In-Reply-To: <20241206225204.4008261-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241206225204.4008261-1-surenb@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241206225204.4008261-2-surenb@google.com>
Subject: [PATCH v5 1/6] mm: introduce vma_start_read_locked{_nested} helpers
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: willy@infradead.org, liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, 
	oliver.sang@intel.com, mgorman@techsingularity.net, david@redhat.com, 
	peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, 
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	minchan@google.com, jannh@google.com, shakeel.butt@linux.dev, 
	souravpanda@google.com, pasha.tatashin@soleen.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

Introduce helper functions which can be used to read-lock a VMA when
holding mmap_lock for read. Replace direct accesses to vma->vm_lock
with these new helpers.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 include/linux/mm.h | 24 ++++++++++++++++++++++++
 mm/userfaultfd.c   | 22 +++++-----------------
 2 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 187e42339d8e..c4a001972223 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -734,6 +734,30 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
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
index 8e16dc290ddf..bc9a66ec6a6e 100644
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
2.47.0.338.g60cca15819-goog

