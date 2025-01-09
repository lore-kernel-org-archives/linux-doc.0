Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A09014A4FF
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 02:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736389840; cv=none; b=B7gVNt5XjKg22ZcMnuMPj3URFnMBXufwCVOwjXs2pDZ4FgAcYlAsQ4snZ+2Gdhr/cqfk5MZg1JF/EeDWxMyaWGT2YWdu7YcykF5STptFDpknN/ZeMl4WXPkjema8rdtUpsy/1TOZSmKoUqLO/kYDKMmOCRU6RDTUIEPBuBC4dnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736389840; c=relaxed/simple;
	bh=rJ1z68qVFAhbRGcmdNEpPggyFaI/bPvfbCXzwU2oAcY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p/4O5akxRMpK4FgPEKbinmZYxWrd536Z6He2TvlmgT3htiQFQcTXEKikPYIHPj/vswss0CU/8Rm6Npd18KrHEmlc9wc1tcHxPuR+arlJOmDAFGLJTkbnWffsmmi6/A7mXDWn4uUP+ctOWM++OM77YJQLtz4uVLOK8qHxThs0wrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4wgpKl1s; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4wgpKl1s"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ee9f66cb12so823947a91.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 18:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736389837; x=1736994637; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tU8qdV00qxcThV6AIuoPhomYC//sTigTQ5m8fxahbLA=;
        b=4wgpKl1szobl7wVCEGcd88xkchN2i6fk0XiWwEeysK/lzvXietknk6paAcMKq64F+G
         FyxuK/rYAaxkCfBcjE2FZpK5qVNOzKx5ioajqdvvcTiY127e23deCWklOkVpre4Qu7Jn
         oDvR6SGakXnbuMpJSQvLvhAdWPumuDMFGZi21I1ZZSDnBGNGvdPyrg+fowbT8Fyczxi5
         HTOYeJcuhlH2jLIVDh/ECFdPCZgbxWOwwawdfTl7Oy5hmrk+ttBttIX0MNmy4sVYW3jQ
         ArlCTcf1CMbgAG0SrkEXOVjF+6NiTM4UgeKhkDzO6DaEX6WmDwBII/vFtSYB/JXq2Pgt
         Wdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736389837; x=1736994637;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tU8qdV00qxcThV6AIuoPhomYC//sTigTQ5m8fxahbLA=;
        b=sQHyu1dP1dZyQMXiwzX9tk/joWOZr0eDz3n4TuUyxz2oIFeyzm0l1pVvfq+szPyhLB
         AWzbkqrlC/RMulbr0MQvUaJJF+6tU0rKOqWEb8/CJ/ORAkQB4E5tETTWiiaGfew0lJeE
         CxwUFZtEaSrBx6xdg2h5mJdUjf+xZqyP54+XEqUhBc+dca19AEMuaACwTD/FtM/4L69s
         WKX+LnMaseQ4NB8zY1DmwvhN4oQnDQ4W/3qcn7o0BCUSxMkSupUX/KZ0gxrWgO49wh6G
         GfWH6wjaLCg+pGUoYoByFt1Ivo3AY3wvriozovMFY7McY4xZXE4LSfNvau1J+5wtthNm
         lIfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz3a1NQRZkB5nnRoE7ed0UD0BpWt59LCAuN4HIGT84FBw8fKD8FzwQHPBgMk0v78K5zi1onyPjDkY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzqN7KGEr7bzplrUK26YUBvyOZ3RpG9BvJduJaw3zWlmrtNwt7
	fUJO2JpjQF9GhHOIyx6957b+LpKf6qExcndWZwL/THcwp2ZV/U523DMm+5cTWC8yu89GFTuITKO
	ZgQ==
X-Google-Smtp-Source: AGHT+IHe7fElKYNkHiMi+Ss9Fbmy8ZuO1qg0Iy4wm9l48QbX7o9iXLM3T+s6E3Ey0ObPvizJE76ByK8fFls=
X-Received: from pjbsk16.prod.google.com ([2002:a17:90b:2dd0:b0:2ee:4f3a:d07d])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:dfcb:b0:2ee:863e:9ff6
 with SMTP id 98e67ed59e1d1-2f548eae2ecmr8238330a91.16.1736389837604; Wed, 08
 Jan 2025 18:30:37 -0800 (PST)
Date: Wed,  8 Jan 2025 18:30:13 -0800
In-Reply-To: <20250109023025.2242447-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109023025.2242447-5-surenb@google.com>
Subject: [PATCH v8 04/16] mm: introduce vma_iter_store_attached() to use with
 attached vmas
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

vma_iter_store() functions can be used both when adding a new vma and
when updating an existing one. However for existing ones we do not need
to mark them attached as they are already marked that way. Introduce
vma_iter_store_attached() to be used with already attached vmas.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h | 12 ++++++++++++
 mm/vma.c           |  8 ++++----
 mm/vma.h           | 11 +++++++++--
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index a9d8dd5745f7..e0d403c1ff63 100644
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

