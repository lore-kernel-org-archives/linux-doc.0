Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE2313E8BC
	for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 23:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711494910; cv=none; b=N+RaB7YVzc7Ihgl1WQ/GaCmlw2e/AE+gEqv0MpT8rzguNVUciSn2srJbAqWwHFJIqAGHCxLCc8BTeoRS81+YvjX5AzbetkgNVG5LkG9UZEhk0LDgT7T6YQMokg8SmU9vlRL5axEQoi+YJRnog5WNf6dU2XOX5QQJi+HPCeN2Eqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711494910; c=relaxed/simple;
	bh=fyMrFp8V3YaU0ogcm5yJYQgEMev0swdNBsiWfJ44G44=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PCbBlNR7uk+gjyuJ4IwF7EFv0aLafQXFMQmxS5333rUayV38B5XoiBr1Ry5T5Ar95cMqdPsizPQav1nLqQ+vrZMsV6M6vGPUwDV3a3aioCYBAwE7Bmd62Tq6rAVqnmdnIThKLWVKChXtKv7s0iZf/sZYgoxzerLFkNIyo3ylwHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KRI8ogtn; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KRI8ogtn"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc6b2682870so9768281276.0
        for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 16:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711494908; x=1712099708; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iJNXXwIfWIOilmf511swDZU8Qk74qgWKC4xKQmksutQ=;
        b=KRI8ogtn7KiJBPhEXU/8qhTVR6Op3jeVF2+IBE9NmkesjFelaF3rP7hdRULyol54YA
         COmktwp4tF+INmC52WDsJdnArmMEPutOWzjJRxGjstmWpAjHU3/MdeeATRLZh1xBLhuH
         Yiyf/rMYFWh35LuCvqOuaGjLnzeQJqo2wBjx7K1Ic0GbWc3vCqk5puo2OBWRrnYE4XoM
         72Rte15IS1Ddot9Dbl/c8dt5UmWvhuWC0JQ5g4gUkUYhgXOMcKz4IJk/Gvfu/RNp4435
         vQSA878pAfu7m1FJe9yO8zVteoM8zBK6MSI4SWdV/V0szafI/0y9igVb0vEuzENM3VPg
         LUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711494908; x=1712099708;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJNXXwIfWIOilmf511swDZU8Qk74qgWKC4xKQmksutQ=;
        b=ovwsCeSjpq6+Hud+uKxM/57IigqZkxTv87t3R9MT8UYa/Bd74kqiLx+k6Zr/feCO7B
         7p2fYucqdRZldcnKIYHY3b82xalXc8MG3T0CHH0NOKesQ2Iaz6MDNmWLPIlgYOyIdp/M
         nNIITTRaMRzbXFjUkM2EnM7kZXnyuV2GuO2sKzpsj/DC/i97F2Ras/8xrhlISVxDGwNm
         1tCHvhJHXpFSrsW7Q0lmChzj965IFcq4sRAMNED3R3k8WzHCei+25qvVw01X+0Zdizw6
         dPTBMxDZenMbruuoq6G5F5HGgOVpUDeTL9WlA18FJSN4IdhwGN/rJu1r+NkT7+HT2aoP
         bwAw==
X-Forwarded-Encrypted: i=1; AJvYcCWUPBLZQ186tNelAzueXMQZtql/JZbro4q9Q+ajutOEHqmXveEwQzlsUDWTCRIEdYZOkVKIUduYLbKyyNUyCHykaP18M0gSVjj+
X-Gm-Message-State: AOJu0YyDBlIVxDfdSn38xpeNNNCpYdHB52VNrUK55NJeHcEHO7d/sSzx
	PXBJI+5ZMHNpMHGhmYW2BgBEMSQtYNM2J0Nt3jAY1ifnNguMOQ+E5X+51Mwko0NdDWD0ONo2UKK
	OvA==
X-Google-Smtp-Source: AGHT+IHEoaKEBsWwxbO1jgiLciNOYILWX/kr3OXU7eYFR8oe2h78U8w1/qkNR8huCRpwnRfRtdoPQg5B9JI=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:cef2:761:ad8:ed9a])
 (user=surenb job=sendgmr) by 2002:a05:6902:1141:b0:dd9:3a6b:11f8 with SMTP id
 p1-20020a056902114100b00dd93a6b11f8mr3483289ybu.5.1711494908452; Tue, 26 Mar
 2024 16:15:08 -0700 (PDT)
Date: Tue, 26 Mar 2024 16:14:52 -0700
In-Reply-To: <20240326231453.1206227-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240326231453.1206227-1-surenb@google.com>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240326231453.1206227-7-surenb@google.com>
Subject: [PATCH 6/6] Documentation: mm/slab: undo _noprof additions in the documentation
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: rdunlap@infradead.org, sfr@canb.auug.org.au, kent.overstreet@linux.dev, 
	surenb@google.com, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

With kernel-doc script change to handle xyz_noprof() names, the previous
documentation changes and not needed anymore.

Fixes: bc7b83f5e4bf ("mm/slab: enable slab allocation tagging for kmalloc and friends")
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Cc: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>
---
 mm/slub.c | 2 +-
 mm/util.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 7b68a3451eb9..be047279c9e9 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -4091,7 +4091,7 @@ void *kmem_cache_alloc_lru_noprof(struct kmem_cache *s, struct list_lru *lru,
 EXPORT_SYMBOL(kmem_cache_alloc_lru_noprof);
 
 /**
- * kmem_cache_alloc_node_noprof - Allocate an object on the specified node
+ * kmem_cache_alloc_node - Allocate an object on the specified node
  * @s: The cache to allocate from.
  * @gfpflags: See kmalloc().
  * @node: node number of the target node.
diff --git a/mm/util.c b/mm/util.c
index 73703d6cd3dc..a9e911b22b99 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -115,7 +115,7 @@ char *kstrndup(const char *s, size_t max, gfp_t gfp)
 EXPORT_SYMBOL(kstrndup);
 
 /**
- * kmemdup_noprof - duplicate region of memory
+ * kmemdup - duplicate region of memory
  *
  * @src: memory region to duplicate
  * @len: memory region length
@@ -594,7 +594,7 @@ unsigned long vm_mmap(struct file *file, unsigned long addr,
 EXPORT_SYMBOL(vm_mmap);
 
 /**
- * kvmalloc_node_noprof - attempt to allocate physically contiguous memory, but upon
+ * kvmalloc_node - attempt to allocate physically contiguous memory, but upon
  * failure, fall back to non-contiguous (vmalloc) allocation.
  * @size: size of the request.
  * @flags: gfp mask for the allocation - must be compatible (superset) with GFP_KERNEL.
-- 
2.44.0.396.g6e790dbe36-goog

