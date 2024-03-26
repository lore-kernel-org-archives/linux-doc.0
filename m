Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EEA13E037
	for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 23:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711494902; cv=none; b=Kh2IGfTcrDetkNYMc3GY89f/J6YGt8BBRQ188789jF9+ewAwECCazMctFHYidd+NCD/J23oiFOo3xgj5Ik4kp+6OrpjsaUpiiqGLhQ5GZhz9ALb0u70V8WPcLV5ENnfSrIdqfHp0gylSu8jhtZaRZeYBpTSKhqeSyMNbqqc2fCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711494902; c=relaxed/simple;
	bh=xEHMysv+AfGCb1V+L20YYqzei2G1GyDnYE4/axORCik=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W8VsRUT+/mATVJqzLA7b3AZ/QYsZZbvJZwsDROx2f8YwXyFeZ8PlTTSIsuW9ROcWxSC6PpjBFiBgh5clThjQarQhkkX76nn+6YAx8A2+3TRRgCwJI+3Fhir9klboXxa/jgPOrEbn7ThnjrzO3X2eSA+lD0Crnpgo1NFKDkHXiZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qXTLZkfP; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qXTLZkfP"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc693399655so11100030276.1
        for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 16:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711494900; x=1712099700; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fZ0AptqFbHaa8l5RVSul3P+vBeLsm0KpJ9iAetoEOwQ=;
        b=qXTLZkfPFFJ8e4a5qXi6yvWBsCRy+oXhr9R6DHghyr1oD20Khlkrw8IOkU+kGFBxur
         Q9k5V5I7JRtTlrIMN22qksqggseEAABGTVJUTWbP7SnhpGrEYaUd2DRh/nsA5RkD84Y6
         vZtj1MiCD9Iqqaq4tEv1JNVK9FZaN8ZpJTiaNcRXGHPhMeM3pIOy9+D3wYR/4+dL8DYH
         wivvGvTltVhUGqFNDGnHfooK8iINiIcQURRaua9k6Jn18wwVNGHe7d/b7iWFhd3N+Vm+
         kNE8kwYNcrJKsAc0EadLmD7OoSIygeGJftVxUC8E3tKtMp6oLoiXAdXigbmvVxASslfj
         oFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711494900; x=1712099700;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fZ0AptqFbHaa8l5RVSul3P+vBeLsm0KpJ9iAetoEOwQ=;
        b=drDLGZVjWzVhpHr1p0+/U7aKl9b0v1neiNT5TISyjKExyj6m9BXIyjpXRDISRvYEvr
         miALQIgAW5lCUxo7U5gaq/CMqtYFFRp3pM/z7iwemPiZ7SzQHkVHxgQC1XANpzMkEi0e
         NOg9WoQHQihTmpVnWl3toDR4FPxt/9awfgBxQr1TSY+Mp0EIaGng81PJOmfWcb3PgJ5V
         GFnqxhJnQlUSIruIYgeZWFwBR5PSSuILH1EknXeUdvhHTtj+ZjQUtlK44D6e7f6lxUhd
         i/JdMsWDnzm4tJrYkNkOGhZohJQvm1cPg2EcX0mbpPmZW7zSVl/nqvTN2ut6EU/liWFs
         8Gug==
X-Forwarded-Encrypted: i=1; AJvYcCUAI0+EZo7oToFsDytJs0iVThzlveWrhV4O9QSt12leDMPN/QRCUvz6xVX7phLLn60dx11cm/Mm2aiSCAndsAB/ny2gkOE8TxKj
X-Gm-Message-State: AOJu0YwDYpxHUn4K2MOGwfUroz8G+msC07/5VQ2q8oH61NrDOqSL6YGs
	oT5gTjIRl19U4WA00mqa+paSRNMrXifKeJKO3bSUZR+BifxgzTHtQGG66sc+IbX/1QR36sJ2WDm
	rig==
X-Google-Smtp-Source: AGHT+IEA9Rpdukbz9+6xqwV8nMLm+iRqIPHJBT8MtBvx/AJB4VLaK2gBkpwd12G/n4lHvqZzK50RlqanDZA=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:cef2:761:ad8:ed9a])
 (user=surenb job=sendgmr) by 2002:a05:6902:1207:b0:dc9:c54e:c5eb with SMTP id
 s7-20020a056902120700b00dc9c54ec5ebmr3468134ybu.7.1711494900028; Tue, 26 Mar
 2024 16:15:00 -0700 (PDT)
Date: Tue, 26 Mar 2024 16:14:48 -0700
In-Reply-To: <20240326231453.1206227-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240326231453.1206227-1-surenb@google.com>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240326231453.1206227-3-surenb@google.com>
Subject: [PATCH 2/6] Documentation: mm: undo _noprof additions in the documentation
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: rdunlap@infradead.org, sfr@canb.auug.org.au, kent.overstreet@linux.dev, 
	surenb@google.com, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

With kernel-doc script change to handle xyz_noprof() names, the previous
documentation changes and not needed anymore.

Fixes: 6522e08ac1c6 ("mm: enable page allocation tagging")
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Cc: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>
---
 mm/mempolicy.c  | 6 +++---
 mm/page_alloc.c | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 3fae74b62c51..913cff5da5a3 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -2209,7 +2209,7 @@ static struct page *alloc_pages_preferred_many(gfp_t gfp, unsigned int order,
 }
 
 /**
- * alloc_pages_mpol_noprof - Allocate pages according to NUMA mempolicy.
+ * alloc_pages_mpol - Allocate pages according to NUMA mempolicy.
  * @gfp: GFP flags.
  * @order: Order of the page allocation.
  * @pol: Pointer to the NUMA mempolicy.
@@ -2278,7 +2278,7 @@ struct page *alloc_pages_mpol_noprof(gfp_t gfp, unsigned int order,
 }
 
 /**
- * vma_alloc_folio_noprof - Allocate a folio for a VMA.
+ * vma_alloc_folio - Allocate a folio for a VMA.
  * @gfp: GFP flags.
  * @order: Order of the folio.
  * @vma: Pointer to VMA.
@@ -2309,7 +2309,7 @@ struct folio *vma_alloc_folio_noprof(gfp_t gfp, int order, struct vm_area_struct
 EXPORT_SYMBOL(vma_alloc_folio_noprof);
 
 /**
- * alloc_pages_noprof - Allocate pages.
+ * alloc_pages - Allocate pages.
  * @gfp: GFP flags.
  * @order: Power of two of number of pages to allocate.
  *
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 370ea1711828..8cdb8cc2958e 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4973,7 +4973,7 @@ static void *make_alloc_exact(unsigned long addr, unsigned int order,
 }
 
 /**
- * alloc_pages_exact_noprof - allocate an exact number physically-contiguous pages.
+ * alloc_pages_exact - allocate an exact number physically-contiguous pages.
  * @size: the number of bytes to allocate
  * @gfp_mask: GFP flags for the allocation, must not contain __GFP_COMP
  *
@@ -5001,7 +5001,7 @@ void *alloc_pages_exact_noprof(size_t size, gfp_t gfp_mask)
 EXPORT_SYMBOL(alloc_pages_exact_noprof);
 
 /**
- * alloc_pages_exact_nid_noprof - allocate an exact number of physically-contiguous
+ * alloc_pages_exact_nid - allocate an exact number of physically-contiguous
  *			   pages on a node.
  * @nid: the preferred node ID where memory should be allocated
  * @size: the number of bytes to allocate
@@ -6458,7 +6458,7 @@ int __alloc_contig_migrate_range(struct compact_control *cc,
 }
 
 /**
- * alloc_contig_range_noprof() -- tries to allocate given range of pages
+ * alloc_contig_range() -- tries to allocate given range of pages
  * @start:	start PFN to allocate
  * @end:	one-past-the-last PFN to allocate
  * @migratetype:	migratetype of the underlying pageblocks (either
@@ -6622,7 +6622,7 @@ static bool zone_spans_last_pfn(const struct zone *zone,
 }
 
 /**
- * alloc_contig_pages_noprof() -- tries to find and allocate contiguous range of pages
+ * alloc_contig_pages() -- tries to find and allocate contiguous range of pages
  * @nr_pages:	Number of contiguous pages to allocate
  * @gfp_mask:	GFP mask to limit search and used during compaction
  * @nid:	Target node
-- 
2.44.0.396.g6e790dbe36-goog

