Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E34178372
	for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 04:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736569580; cv=none; b=tVCP2g8LhJHB8RA365PBzAWh0hRqn5dorKUitHvs+14kyFWLw71wkQdFkeAJgW0FBXs8jW0mUsnRE/KQXCy8q4pNeZ1+x3WqwkU41HWCTaLgqJYXegZa7bupPtdpnkrANgL4MaqyX+E2Qk2Uv33JbZ69wrIyklZCQHB6LTyVhiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736569580; c=relaxed/simple;
	bh=3wsxpxXJ0DyGL/HXs8ZOZgd3qcoYzOfkpO1qULBMBm8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JT6C15BoeO97sD03q19FX4jqUD+yTigxi9g7Xg8XXn3plRrasafTCDGi0zPWNibxEZPFe7qJXboPYM2y1Y/0Jm5pwUTIQjw9Nq4ODdAncZV3ak8cXoFGWw+2w9tHymakFPQ7nRpums1rUrjLUyseoYRibFBaOkpj33SgLLCNsBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y12chbOi; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y12chbOi"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef7fbd99a6so4773798a91.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 20:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736569576; x=1737174376; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ADhTMbqXYt1v8ykOXAPhOs0iBeUY/Z6oTrjn3gyIBaM=;
        b=Y12chbOiA1VIxpMGnUy7tCn4v2qDoW02HJLy/htanbbEKm0a6bmsMo7wc7s4tVRX8T
         tnA3mjfu/pAL3VnivK2yljeXVTXYB3b/ot3Tm6W1vQCm5obIoDY8YvQwTXraaLIrYpBp
         Gvo7KfsTgphUkb91cK0ejUGm5riH41pBCcJLrLOMBEpjaJI0OPGh/T596j96yHVwznZr
         nYmF8TZvRO4UpSeYSuFfN4SPyNR7WBShHGvqlpByXEBhoHXxxm+sS42mSUkURhkLpD8j
         Q6NKuStaiPwqx5IAYVXT50FVVG0vSehKdoL6NIs0781uAU77f2TByyhP7VdublYKT7Gg
         nA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736569576; x=1737174376;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ADhTMbqXYt1v8ykOXAPhOs0iBeUY/Z6oTrjn3gyIBaM=;
        b=TJrRanRyfMQpir5X4Ka8BN9HYXP/MqFwU0G5D28tOb2JAsOhgX1Vw5/Oo9En9kTqCl
         nYyquKaqQEmCZcu4L0FBIqcA6yUxqDQ2r8P6HwTTbTLMMG9sBsszFNtk+j69bp/NpbeV
         iwdH0wZL+gWgVzNYpbXBJiBenNIvoAWRwDUVYV6sgA+Foi63mMK++hrkhJ5NxfA9LSc2
         Q1DO0HeNM4I/KsEg1Uk5cKHJcOtjZyXbGf2KFheMIX+25/fEpN50ZdV7aGSARS8LTSsi
         oKCqTxIzDK5NCE9ITS6SiO78it7yFCV219o5fifvDtZ0N+jgTt2sv+V4fBo4j2hE2XtX
         0NWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYC5vX/ZA412V/gMqQwO6YHjnwBV63FURn48tWWcVefQxW1jQ/g601ssimPz8+Yo56iRp3fJ3ZnZY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8qSq6SJ3+9oAYBBVybpiy+WIX3Ijchf/uPciKhXOMrfm37hPM
	INbrBLReXN3ggq4ylL7gsn6RgymgcR+3IzPwWjgFNK3EZHXg9V2NdSsuAK68XMYGOXiK/COfGuO
	TyQ==
X-Google-Smtp-Source: AGHT+IFORDPp3F2kDYS1t6EeTCyG81wOk/69Q07YfVbBJQQfUoW8CkvQ1ejcetFlgpXNkE764lNprKA+Q/U=
X-Received: from pfbfd28.prod.google.com ([2002:a05:6a00:2e9c:b0:727:3b66:ace])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3287:b0:725:456e:76e
 with SMTP id d2e1a72fcca58-72d21fb1d3fmr18712375b3a.6.1736569576461; Fri, 10
 Jan 2025 20:26:16 -0800 (PST)
Date: Fri, 10 Jan 2025 20:25:51 -0800
In-Reply-To: <20250111042604.3230628-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111042604.3230628-5-surenb@google.com>
Subject: [PATCH v9 04/17] mm: introduce vma_iter_store_attached() to use with
 attached vmas
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

vma_iter_store() functions can be used both when adding a new vma and
when updating an existing one. However for existing ones we do not need
to mark them attached as they are already marked that way. Introduce
vma_iter_store_attached() to be used with already attached vmas.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/mm.h | 12 ++++++++++++
 mm/vma.c           |  8 ++++----
 mm/vma.h           | 11 +++++++++--
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 2b322871da87..2f805f1a0176 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -821,6 +821,16 @@ static inline void vma_assert_locked(struct vm_area_struct *vma)
 		vma_assert_write_locked(vma);
 }
 
+static inline void vma_assert_attached(struct vm_area_struct *vma)
+{
+	VM_BUG_ON_VMA(vma->detached, vma);
+}
+
+static inline void vma_assert_detached(struct vm_area_struct *vma)
+{
+	VM_BUG_ON_VMA(!vma->detached, vma);
+}
+
 static inline void vma_mark_attached(struct vm_area_struct *vma)
 {
 	vma->detached = false;
@@ -866,6 +876,8 @@ static inline void vma_end_read(struct vm_area_struct *vma) {}
 static inline void vma_start_write(struct vm_area_struct *vma) {}
 static inline void vma_assert_write_locked(struct vm_area_struct *vma)
 		{ mmap_assert_write_locked(vma->vm_mm); }
+static inline void vma_assert_attached(struct vm_area_struct *vma) {}
+static inline void vma_assert_detached(struct vm_area_struct *vma) {}
 static inline void vma_mark_attached(struct vm_area_struct *vma) {}
 static inline void vma_mark_detached(struct vm_area_struct *vma) {}
 
diff --git a/mm/vma.c b/mm/vma.c
index d603494e69d7..b9cf552e120c 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -660,14 +660,14 @@ static int commit_merge(struct vma_merge_struct *vmg,
 	vma_set_range(vmg->vma, vmg->start, vmg->end, vmg->pgoff);
 
 	if (expanded)
-		vma_iter_store(vmg->vmi, vmg->vma);
+		vma_iter_store_attached(vmg->vmi, vmg->vma);
 
 	if (adj_start) {
 		adjust->vm_start += adj_start;
 		adjust->vm_pgoff += PHYS_PFN(adj_start);
 		if (adj_start < 0) {
 			WARN_ON(expanded);
-			vma_iter_store(vmg->vmi, adjust);
+			vma_iter_store_attached(vmg->vmi, adjust);
 		}
 	}
 
@@ -2845,7 +2845,7 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
 				anon_vma_interval_tree_pre_update_vma(vma);
 				vma->vm_end = address;
 				/* Overwrite old entry in mtree. */
-				vma_iter_store(&vmi, vma);
+				vma_iter_store_attached(&vmi, vma);
 				anon_vma_interval_tree_post_update_vma(vma);
 
 				perf_event_mmap(vma);
@@ -2925,7 +2925,7 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
 				vma->vm_start = address;
 				vma->vm_pgoff -= grow;
 				/* Overwrite old entry in mtree. */
-				vma_iter_store(&vmi, vma);
+				vma_iter_store_attached(&vmi, vma);
 				anon_vma_interval_tree_post_update_vma(vma);
 
 				perf_event_mmap(vma);
diff --git a/mm/vma.h b/mm/vma.h
index 2a2668de8d2c..63dd38d5230c 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -365,9 +365,10 @@ static inline struct vm_area_struct *vma_iter_load(struct vma_iterator *vmi)
 }
 
 /* Store a VMA with preallocated memory */
-static inline void vma_iter_store(struct vma_iterator *vmi,
-				  struct vm_area_struct *vma)
+static inline void vma_iter_store_attached(struct vma_iterator *vmi,
+					   struct vm_area_struct *vma)
 {
+	vma_assert_attached(vma);
 
 #if defined(CONFIG_DEBUG_VM_MAPLE_TREE)
 	if (MAS_WARN_ON(&vmi->mas, vmi->mas.status != ma_start &&
@@ -390,7 +391,13 @@ static inline void vma_iter_store(struct vma_iterator *vmi,
 
 	__mas_set_range(&vmi->mas, vma->vm_start, vma->vm_end - 1);
 	mas_store_prealloc(&vmi->mas, vma);
+}
+
+static inline void vma_iter_store(struct vma_iterator *vmi,
+				  struct vm_area_struct *vma)
+{
 	vma_mark_attached(vma);
+	vma_iter_store_attached(vmi, vma);
 }
 
 static inline unsigned long vma_iter_addr(struct vma_iterator *vmi)
-- 
2.47.1.613.gc27f4b7a9f-goog

