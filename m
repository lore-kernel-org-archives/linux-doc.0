Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD1D1684AE
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 02:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736389846; cv=none; b=pS6hvO8I2o9O913DyFwFEdcai0UjrtPFtHDgVIEJdgAtcxo0dW50+t8jAhFSIOIJdk6vsJMlVaJyxeuTc0SpizqyiWQc1XtaJpQz10TZC+/hP+1KEYfjlfNzlilQsz8ECE0neuxECXwK868ygnUnW0PW8EFgXf0rhfYtwZLfK6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736389846; c=relaxed/simple;
	bh=TtSMcqXfqnEo39dJwOdZSKePXOTJp5aNjo8sQOWbuIc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bHKHjP3SuE+mCBWspDhmx+sG5ysrP6k2fNN7Vm21HULt+boEhhHP9nI0sciAFQSZICvcGPErVTHH6XXSH/r0lzzA/i2O1X7swsEeQ7+WtteMq2fPVgq/WD3SwDY5yGNu0ECFYTaeY2bun1pXPl14bmoMBp9rFi5MuHld+fx/C34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2wA3zqpK; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2wA3zqpK"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ef9b9981f1so1140557a91.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 18:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736389844; x=1736994644; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jHfydvSHQ3WxL2+aQStFiDlG77OuqV7nJSSFFl9LU/E=;
        b=2wA3zqpKBCIFWYeOFwlEVMWJbXpDRxd3goQ6buvryQO1iBMF+aCZD34O0TZKdd5wxp
         MlSF6IVX1e8z/FGTQSAjCl51bHTC8wB309CXa2jcH9kh5UftaymODjZfO1jlHDZgAjhR
         xZvSC/vNQgsZQ9OvmDWd1Rzj8rtu+M/6ejl6TQZrbyplTu22cFxeSvuovlNtf9HA9+8k
         pFkSjoTKc2LGSIMEKGYRJ/UdsoQDduX1q4qb3mFhzSKvWImwS5IkP/OTH0BbTefVtQLd
         7eYfaoRihUueWuTxwSpiZS2SOpufbq6l3Ea5JPElWdhEwtKNhvPzBkInMy9sfFTqIeTp
         gRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736389844; x=1736994644;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jHfydvSHQ3WxL2+aQStFiDlG77OuqV7nJSSFFl9LU/E=;
        b=J6F+TrR4hXnQdnEQ4guadSSB1vVPbOPL8EmqbD6yj1iAJA6tGKFng3a0prcSEgh2QK
         hixsea1fKqt5S5RS2tjcVC+5d7bb3h8mQpy6nU4pvcotdS7fxHuRTVGCbjFc1J122PSh
         3vEwcgzl1wAJK+s0C4l5ykxabnnd/l45Bz5AvPZw8af6wx71vEsSa/LryNW/veYPgmbr
         SXmoTjqRWwXko9qWVUVbD+6GD0qk0GL4GQnb1dqfV6urROgXRxIIDa6E6E9irsEOKn4c
         z227A/CYOChzZUe3Kg09rus2Z0QJXT3et5kBuXPqUkFxXR/GxiC3W/AJxk18Gf0T1SKb
         zr+w==
X-Forwarded-Encrypted: i=1; AJvYcCVALUzt1ebJ8okPcAlRPVQWhl/vXC6YJ9tMO5Tte7SGmkwtXc6BUj8hCrHJ8DrXIPMIw95aXaLq1eY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCr9ECEx0ZxMCiNoaQUBf7IOeQ0awfh2CUQh/vM8UZ5cZkmPoU
	1vrCqFo4AGJy8kP0Mu3HPnvG7IGsck52tZ7HUtowDvshXh6FJfCTDB/IZP8OPECPCQLlWSHzFLx
	VfA==
X-Google-Smtp-Source: AGHT+IFV1+9gbXGa72+TRMzfljX8nTas7v1/UQOwAWuQbBD3PGKS+ix9UpG8sQoR4NwvEysafdLPdictJdI=
X-Received: from pjj15.prod.google.com ([2002:a17:90b:554f:b0:2ea:448a:8cd1])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5686:b0:2ee:df70:1ff3
 with SMTP id 98e67ed59e1d1-2f548e4d0a7mr8382370a91.0.1736389844102; Wed, 08
 Jan 2025 18:30:44 -0800 (PST)
Date: Wed,  8 Jan 2025 18:30:16 -0800
In-Reply-To: <20250109023025.2242447-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109023025.2242447-8-surenb@google.com>
Subject: [PATCH v8 07/16] mm: allow vma_start_read_locked/vma_start_read_locked_nested
 to fail
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

With upcoming replacement of vm_lock with vm_refcnt, we need to handle a
possibility of vma_start_read_locked/vma_start_read_locked_nested failing
due to refcount overflow. Prepare for such possibility by changing these
APIs and adjusting their users.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
Cc: Lokesh Gidra <lokeshgidra@google.com>
---
 include/linux/mm.h |  6 ++++--
 mm/userfaultfd.c   | 18 +++++++++++++-----
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index e0d403c1ff63..6e6edfd4f3d9 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -747,10 +747,11 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
  * not be used in such cases because it might fail due to mm_lock_seq overflow.
  * This functionality is used to obtain vma read lock and drop the mmap read lock.
  */
-static inline void vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
+static inline bool vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
 {
 	mmap_assert_locked(vma->vm_mm);
 	down_read_nested(&vma->vm_lock.lock, subclass);
+	return true;
 }
 
 /*
@@ -759,10 +760,11 @@ static inline void vma_start_read_locked_nested(struct vm_area_struct *vma, int
  * not be used in such cases because it might fail due to mm_lock_seq overflow.
  * This functionality is used to obtain vma read lock and drop the mmap read lock.
  */
-static inline void vma_start_read_locked(struct vm_area_struct *vma)
+static inline bool vma_start_read_locked(struct vm_area_struct *vma)
 {
 	mmap_assert_locked(vma->vm_mm);
 	down_read(&vma->vm_lock.lock);
+	return true;
 }
 
 static inline void vma_end_read(struct vm_area_struct *vma)
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index a03c6f1ceb9e..eb2ca37b32ee 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -85,7 +85,8 @@ static struct vm_area_struct *uffd_lock_vma(struct mm_struct *mm,
 	mmap_read_lock(mm);
 	vma = find_vma_and_prepare_anon(mm, address);
 	if (!IS_ERR(vma))
-		vma_start_read_locked(vma);
+		if (!vma_start_read_locked(vma))
+			vma = ERR_PTR(-EAGAIN);
 
 	mmap_read_unlock(mm);
 	return vma;
@@ -1482,10 +1483,17 @@ static int uffd_move_lock(struct mm_struct *mm,
 	mmap_read_lock(mm);
 	err = find_vmas_mm_locked(mm, dst_start, src_start, dst_vmap, src_vmap);
 	if (!err) {
-		vma_start_read_locked(*dst_vmap);
-		if (*dst_vmap != *src_vmap)
-			vma_start_read_locked_nested(*src_vmap,
-						SINGLE_DEPTH_NESTING);
+		if (vma_start_read_locked(*dst_vmap)) {
+			if (*dst_vmap != *src_vmap) {
+				if (!vma_start_read_locked_nested(*src_vmap,
+							SINGLE_DEPTH_NESTING)) {
+					vma_end_read(*dst_vmap);
+					err = -EAGAIN;
+				}
+			}
+		} else {
+			err = -EAGAIN;
+		}
 	}
 	mmap_read_unlock(mm);
 	return err;
-- 
2.47.1.613.gc27f4b7a9f-goog

