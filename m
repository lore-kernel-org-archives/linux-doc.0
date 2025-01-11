Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED6D188591
	for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 04:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736569585; cv=none; b=C0dY45e0iYkt/UTymVfoNeBFBtu9z+KmB293YOCzQpA4TLuQv4hIJ6LXtsAG6RZuWAu4LvY675Uk9doc8Y3MZK3FQi/bU492VVr6kAwNRDzhpHfN9ZjkwGLTw4rk9hVCM+qRfXIfjRBAaErTr44w2icH02adzdFs58TVD7ubCn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736569585; c=relaxed/simple;
	bh=RBaZ74So51j4aqXC7AuC9vLEqhQDweY9kqrtQ5fJJDc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YrBOYxcqU1DZOypD2GCH5Z+z73kcQoaMZ9CHjbTJAW+4To4P21Ue4iavHLs9pTyVNZsNLcv+FxrqJJ873bK0mrxADsRefidbHbBL7CYhx3b6itoLhgFwidE0+5iNXeE3YsKLMhTdeecz17G7ej65eJScRd3h6NA9aHaTAvsBbGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wAypSoED; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wAypSoED"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ee8ced572eso4929549a91.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 20:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736569583; x=1737174383; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7fOHsmOPwrKtQ1EzbWANyGDHIimQCM8l7vZM7q2M3lw=;
        b=wAypSoEDpEaoDCUnIRT8RsQ65BeO5tVZBgYysFtNh62/V6ObPFscpK26rsnX7XLiGh
         lG8AnDPzMe4GIUGY7YAIsa59L9fBzWXyhw0g3kjuI4+al8WLpd22u9XZrX8TSeAiZQFy
         gCubBlSUUcdg0DZMj0J5S18kz81ViUfpJeGRYmLg550MKIjglsG9zX9DyREXc/7+ejpW
         BdZTRx/zlLt3RuhM1yUcrFew+bM5SkgnrX9UzwJ+/OaLN9th53Khb5e5wwqNclfUKG2/
         WHgB/HAACd/uyChATLRpy5NPtw4CucHA4LoUJ61OplGeCSVWFREBgM4nxnZzJqCnJ3V+
         8qVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736569583; x=1737174383;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7fOHsmOPwrKtQ1EzbWANyGDHIimQCM8l7vZM7q2M3lw=;
        b=PQzoaZ2JQbkTfRjzjmaDebd/g3lhmbZVW6xfG7tUpLZkE8NZw0Qq9seiguvaLpIPJR
         AwbHopSne/46Lvb0PudIXsPudBy28vrB/imTm+QFUhIN34I+vVvooKKou9ki8NFtg9jX
         sw8srcyuF5jPAFGnkSVA4lBkw4nPvWK0klxr2O0gw6SDx06vCXbFb+Sx7uswCFdy3F0w
         Nho/Z1KGA+N5bXcTpFS1aeh/CX667qq+Em5622s0BoitK85qaLEKfLKlqxj06g3hI5LS
         xtDGKgcH2Y7ABEgj/v63MLhCBkWmTTVwAxkT/uibEljs8bEvV/UZcJeToiAy9xSlLMxq
         pkEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh8djIInn82atWvQ5wAEBEqOyh/hjANJl3Y5m5cyrIv9H2g64G1Lrzn6kaK2zTuKyPzUUJA7IRZjg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVlPhmjpcq78afBopKSMbhN8yGPFAFhvC1QBs+a81zrRApea/G
	viqzWtQRdOqvX9tlHsqSnT9Ko9QXnOKWqw4Wkls1mEiO2hlxXJTtWP2yKSIOHxtWIHPR38/dOmC
	m1g==
X-Google-Smtp-Source: AGHT+IEri6oWvbwaR9NKB8OaH7pKRVw+NxMfmWZU4bRXuSK8tL89q2iubRxHeJuXJzsmqdnV3Y+AwYimngo=
X-Received: from pjbsl14.prod.google.com ([2002:a17:90b:2e0e:b0:2ef:8f54:4254])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:da88:b0:2ee:5111:a54b
 with SMTP id 98e67ed59e1d1-2f548f424c7mr16967174a91.31.1736569582930; Fri, 10
 Jan 2025 20:26:22 -0800 (PST)
Date: Fri, 10 Jan 2025 20:25:54 -0800
In-Reply-To: <20250111042604.3230628-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111042604.3230628-8-surenb@google.com>
Subject: [PATCH v9 07/17] mm: allow vma_start_read_locked/vma_start_read_locked_nested
 to fail
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
index 2f805f1a0176..cbb4e3dbbaed 100644
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
index 4527c385935b..411a663932c4 100644
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
@@ -1483,10 +1484,17 @@ static int uffd_move_lock(struct mm_struct *mm,
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

