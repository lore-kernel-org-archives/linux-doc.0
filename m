Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CA720967C
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 19:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734377078; cv=none; b=aW3Aet/zMHM7rTQ4gHDyWygJ+v9Th6SYJYxJHhKVoiomxh6tg8bW8vk3/gKUzu69mDrm3ue247j5Px0f9acW8cJZQoaeZUb+uXgvryznCqgfwbKMq8nIjBX0sKrILb32E/5XQjR05Kkl/RA1ijEinO8uVDWMR5KFhUOXXTX+Z80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734377078; c=relaxed/simple;
	bh=xnU2+nk7SpTe6JV+i63325HLgR21aNoQ+OOoHR3eG1s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l4n0vB//+X2Mf85BG0mZ748vTIbRwac0G7c9AeO1l3bPTToO5DKe8lj5Rq341KgnZTW5owdjzDIijZMyOgGuct6mzlkYVAEhnA7pEuZsVdntVzwf2gdfZrtj9ns+PPJnbr7/TZcV3EAJ99G6RKF0TjmC9Csc39+a8Mrf0WbEdIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a4oaNIN0; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a4oaNIN0"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2178115051dso36560775ad.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 11:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734377076; x=1734981876; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1gkuZWwQBkEGAXVOS6gJMPBIIwpS2AmmvzoNNuLoLbs=;
        b=a4oaNIN0Hm/6mh34emTGvwo7Fi8sgKg7GNsvt/OyBeG6gO5aQVSLQg9GhZR6DMbemw
         sCtn+hlQDuCBtYqnZ8NNViTE7FBXQG5RYYpvSpmp2ARbW+vIACqDUBWvpOV9OoAREPGS
         ba3BSx2/KkGBspNf3QtAsLBDor04WQyWQttpfKdv9osX1gAMuPfW9BR1Hyw10d/YfxFm
         7mBYht/k49ZQgApfR9DR4so2zi4NBvrn1N2AXoduagINDh7PpT2UOVDgNC/1pNhkt7mH
         58mNiJpWDuvfh/id5IpaZWyM1AEsrNHz5Yw677umBpc/cqbn3hwGzBuElFP9U0NkucQZ
         IONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734377076; x=1734981876;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1gkuZWwQBkEGAXVOS6gJMPBIIwpS2AmmvzoNNuLoLbs=;
        b=k+47EnCsCLbAVdM5vBNf24/k0KqpxbIJ1mqD0bFxMH++Lj0MslhSfzxu8/8bB+vEKu
         4mBbZc6BRCLqaLsSi3uOu61slJLNuvs6v8sDc1VyJMi0vF72FEDLNvlVijv/e/mCH8cn
         /W4oIEZloGs2Xc5uI9wXL9+Nw9je/Fa/vwstl6FcA/TKuYHdbNcn83WZcY53LTWPX4Jz
         9a45ZAt7+RctR7orl0LDxh5nURhm2mVOf/qpGAJT1GxK5TTT7wcQRHoeRs8/NTi3OWbU
         q06h8tneYmQpBb2mHPHZU587NE7LXAGErR39mUzhO/2UBE2v4FPuc2VECof6tPJ30e/x
         hwrg==
X-Forwarded-Encrypted: i=1; AJvYcCUeiE7jxz+1gTWIGioC6+Xc94KTU9eUEJ//+riHGnuiE6v5P8FRTBtKY70OzXDD9JO34HfagHb64AE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkn28t0LrYjN91LkXWe1AdWxZLjEBLt5YgmCwcXL6XU0MaVcnO
	qAmNSPh60NO9j4EKFWdVD2aKCGUPbVSW8I9+F30cZWrwwcelKP4vqoBS7HoC+ui7X/puH115Upi
	t4w==
X-Google-Smtp-Source: AGHT+IFRpgE3svFkQGxxP8t9jtfuJXCqP6DbanV+kjCkw5VL6vSIPipGx+mrpM9/g8/yEqYCZ44EecENvBs=
X-Received: from pjbsp4.prod.google.com ([2002:a17:90b:52c4:b0:2ee:4679:4a6b])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2744:b0:2ef:33a4:ae6e
 with SMTP id 98e67ed59e1d1-2f2d7d9fd46mr1314965a91.12.1734377075865; Mon, 16
 Dec 2024 11:24:35 -0800 (PST)
Date: Mon, 16 Dec 2024 11:24:09 -0800
In-Reply-To: <20241216192419.2970941-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241216192419.2970941-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216192419.2970941-7-surenb@google.com>
Subject: [PATCH v6 06/16] mm: allow vma_start_read_locked/vma_start_read_locked_nested
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
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	surenb@google.com
Content-Type: text/plain; charset="UTF-8"

With upcoming replacement of vm_lock with vm_refcnt, we need to handle a
possibility of vma_start_read_locked/vma_start_read_locked_nested failing
due to refcount overflow. Prepare for such possibility by changing these
APIs and adjusting their users.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Cc: Lokesh Gidra <lokeshgidra@google.com>
---
 include/linux/mm.h |  6 ++++--
 mm/userfaultfd.c   | 17 ++++++++++++-----
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 689f5a1e2181..0ecd321c50b7 100644
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
index bc9a66ec6a6e..79e8ae676f75 100644
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
@@ -1483,10 +1484,16 @@ static int uffd_move_lock(struct mm_struct *mm,
 	mmap_read_lock(mm);
 	err = find_vmas_mm_locked(mm, dst_start, src_start, dst_vmap, src_vmap);
 	if (!err) {
-		vma_start_read_locked(*dst_vmap);
-		if (*dst_vmap != *src_vmap)
-			vma_start_read_locked_nested(*src_vmap,
-						SINGLE_DEPTH_NESTING);
+		if (!vma_start_read_locked(*dst_vmap)) {
+			if (*dst_vmap != *src_vmap) {
+				if (!vma_start_read_locked_nested(*src_vmap,
+							SINGLE_DEPTH_NESTING)) {
+					vma_end_read(*dst_vmap);
+					err = -EAGAIN;
+				}
+			}
+		} else
+			err = -EAGAIN;
 	}
 	mmap_read_unlock(mm);
 	return err;
-- 
2.47.1.613.gc27f4b7a9f-goog

