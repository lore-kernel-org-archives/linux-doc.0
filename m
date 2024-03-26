Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9EF13E6C1
	for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 23:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711494907; cv=none; b=kUbVFlvIyQE9dRW/PvDlbxdYlPDCJLsDXg0lTPHlCkL8G4WMqUQe1o+3o1xnoPZhkKPNY+mcAQpZf7FMA8uXJ4At/XocyVc1lmX2o6JkWMczdHdVDy/wX22y36nCIjhp9U0RsMfqs1FAUnsZ/r/OyBik0qmI8XRTFe0NK8UYqZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711494907; c=relaxed/simple;
	bh=lFeEUshSx6B71Hh+t+eI0HFSWvBQ0JmDWE2YRzMmt+o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dw0ifmqI1I5xvrS+xeWGFlCrWpVQDKAwNPqU6JplrmEmQnRl/Mi1RPF1R/uAjZpuGRRiCIY8IuUjb4mr7im2cPXOgob2anHFYp3fsN1l43dafQiDVy+PbJnM8PZkdwKUS3S+HoEbc/jb4nkGLFFlTw+zUPIki+0zMV36msrs7Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yA7u+qOR; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yA7u+qOR"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-60a2b53b99eso110844817b3.3
        for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 16:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711494904; x=1712099704; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1zpMAHTkJIGxVEr35nJnrD/WTFtttLl1QenMrHbBG0=;
        b=yA7u+qORsbvLot4y2I9zIk9G1tqDE5f7ha/ncbgCdyWY/We3bIRFFnFQlAG2+XBbbv
         /LGDtWtVzM0nHZ4NabK2xPA64RCbgNlHYSOzZgDDCX937eXC4nIBpKPVjKLxOmc7NQNC
         MRbT5wJuicbFTO1ryWxWTcd+6/WlRgw+O6WUb3mYhkPEKHQgcwkefVqMjWL+WLZZw06Q
         u4FmS3vXAtUc0PoK1vl6wamjw5jP8TNqxe4pqQNrmjE12JOQEvdiEgYxwTCNLtcL2Inj
         uhfniA8UeAMeLI8wPxDGYhyc1+sRWjwPSO4Opc3xMrz73veExgWSJxVPRsPbljfc+bXN
         Tc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711494904; x=1712099704;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1zpMAHTkJIGxVEr35nJnrD/WTFtttLl1QenMrHbBG0=;
        b=tPXPfMRjP2h2aezZp+VruYu7G+4I/mZtebVIJzaOhA2IQQ1TSpUKjKwIVlx7e88Pto
         V097FLj7n3hC7a3TWcjK65veS1SSrrQ4V3GXr7fMy514TdOpIWfPQNCJ2O7EyzUlItSE
         GVZLLeKledGe9oJIwRW2gb/+LVOE/ldtmZVfnFaw3JjQkQ5dq+oibbt/BNfoLQSRd3SI
         3A4ECGxwGinGc3fmUpVilebzi9IZaqLc7lK1OpJfvY+cCkcsO7trEHgKPn632gYaFkEG
         eQE87Gtkqoy7mD5WTIamtiOzNvEE1tJzbgEW6yMgwr87K8de782RppXlYIcvCHDPmW+q
         llNg==
X-Forwarded-Encrypted: i=1; AJvYcCXXbZo9C0mkq6p9ecMwhRECb2GmgS+3BR8n2NI3gENvMkHxPcTu6ZbfKzbfLqEO+YGudOzaGNJktc0ZiexWNGOuuxBx4U7ppd4y
X-Gm-Message-State: AOJu0YzfIfsYYT0dR9CURGHIqbBH+sMB/uWLp9BMaBilVwQFDLVbwu2R
	+XTrLual6r9tKazbhZ8DIbh1a/JrYTjDPUi9nF20K4ve4psxAS5DbVD8cAQk/nxl5poMlFmh+0T
	kNA==
X-Google-Smtp-Source: AGHT+IHj5F8DepFyhSxPhI7O3DbFDYyiys5DH6IOqbp8/7mkJ8GY2Mpdf6Up94sIeC0KXppTdKghpYr7NYc=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:cef2:761:ad8:ed9a])
 (user=surenb job=sendgmr) by 2002:a81:92c6:0:b0:611:2133:8657 with SMTP id
 j189-20020a8192c6000000b0061121338657mr2737319ywg.2.1711494904325; Tue, 26
 Mar 2024 16:15:04 -0700 (PDT)
Date: Tue, 26 Mar 2024 16:14:50 -0700
In-Reply-To: <20240326231453.1206227-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240326231453.1206227-1-surenb@google.com>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240326231453.1206227-5-surenb@google.com>
Subject: [PATCH 4/6] Documentation: mm: vmalloc: undo _noprof additions in the documentation
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: rdunlap@infradead.org, sfr@canb.auug.org.au, kent.overstreet@linux.dev, 
	surenb@google.com, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

With kernel-doc script change to handle xyz_noprof() names, the previous
documentation changes and not needed anymore.

Fixes: ed49858097c1 ("mm: vmalloc: enable memory allocation profiling")
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Cc: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>
---
 mm/nommu.c   |  8 ++++----
 mm/util.c    |  6 +++---
 mm/vmalloc.c | 14 +++++++-------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/mm/nommu.c b/mm/nommu.c
index c0c58631d6cb..331d2f778695 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -223,7 +223,7 @@ void *vzalloc_noprof(unsigned long size)
 EXPORT_SYMBOL(vzalloc_noprof);
 
 /**
- * vmalloc_node_noprof - allocate memory on a specific node
+ * vmalloc_node - allocate memory on a specific node
  * @size:	allocation size
  * @node:	numa node
  *
@@ -240,7 +240,7 @@ void *vmalloc_node_noprof(unsigned long size, int node)
 EXPORT_SYMBOL(vmalloc_node_noprof);
 
 /**
- * vzalloc_node_noprof - allocate memory on a specific node with zero fill
+ * vzalloc_node - allocate memory on a specific node with zero fill
  * @size:	allocation size
  * @node:	numa node
  *
@@ -258,7 +258,7 @@ void *vzalloc_node_noprof(unsigned long size, int node)
 EXPORT_SYMBOL(vzalloc_node_noprof);
 
 /**
- * vmalloc_32_noprof  -  allocate virtually contiguous memory (32bit addressable)
+ * vmalloc_32  -  allocate virtually contiguous memory (32bit addressable)
  *	@size:		allocation size
  *
  *	Allocate enough 32bit PA addressable pages to cover @size from the
@@ -271,7 +271,7 @@ void *vmalloc_32_noprof(unsigned long size)
 EXPORT_SYMBOL(vmalloc_32_noprof);
 
 /**
- * vmalloc_32_user_noprof - allocate zeroed virtually contiguous 32bit memory
+ * vmalloc_32_user - allocate zeroed virtually contiguous 32bit memory
  *	@size:		allocation size
  *
  * The resulting memory area is 32bit addressable and zeroed so it can be
diff --git a/mm/util.c b/mm/util.c
index 157b5edcba75..73703d6cd3dc 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -715,7 +715,7 @@ void *kvrealloc_noprof(const void *p, size_t oldsize, size_t newsize, gfp_t flag
 EXPORT_SYMBOL(kvrealloc_noprof);
 
 /**
- * __vmalloc_array_noprof - allocate memory for a virtually contiguous array.
+ * __vmalloc_array - allocate memory for a virtually contiguous array.
  * @n: number of elements.
  * @size: element size.
  * @flags: the type of memory to allocate (see kmalloc).
@@ -731,7 +731,7 @@ void *__vmalloc_array_noprof(size_t n, size_t size, gfp_t flags)
 EXPORT_SYMBOL(__vmalloc_array_noprof);
 
 /**
- * vmalloc_array_noprof - allocate memory for a virtually contiguous array.
+ * vmalloc_array - allocate memory for a virtually contiguous array.
  * @n: number of elements.
  * @size: element size.
  */
@@ -754,7 +754,7 @@ void *__vcalloc_noprof(size_t n, size_t size, gfp_t flags)
 EXPORT_SYMBOL(__vcalloc_noprof);
 
 /**
- * vcalloc_noprof - allocate and zero memory for a virtually contiguous array.
+ * vcalloc - allocate and zero memory for a virtually contiguous array.
  * @n: number of elements.
  * @size: element size.
  */
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index e94ce4562805..48344d3014fd 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3685,7 +3685,7 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 }
 
 /**
- * __vmalloc_node_range_noprof - allocate virtually contiguous memory
+ * __vmalloc_node_range - allocate virtually contiguous memory
  * @size:		  allocation size
  * @align:		  desired alignment
  * @start:		  vm area range start
@@ -3841,7 +3841,7 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
 }
 
 /**
- * __vmalloc_node_noprof - allocate virtually contiguous memory
+ * __vmalloc_node - allocate virtually contiguous memory
  * @size:	    allocation size
  * @align:	    desired alignment
  * @gfp_mask:	    flags for the page level allocator
@@ -3921,7 +3921,7 @@ void *vmalloc_huge_noprof(unsigned long size, gfp_t gfp_mask)
 EXPORT_SYMBOL_GPL(vmalloc_huge_noprof);
 
 /**
- * vzalloc_noprof - allocate virtually contiguous memory with zero fill
+ * vzalloc - allocate virtually contiguous memory with zero fill
  * @size:    allocation size
  *
  * Allocate enough pages to cover @size from the page level
@@ -3959,7 +3959,7 @@ void *vmalloc_user_noprof(unsigned long size)
 EXPORT_SYMBOL(vmalloc_user_noprof);
 
 /**
- * vmalloc_node_noprof - allocate memory on a specific node
+ * vmalloc_node - allocate memory on a specific node
  * @size:	  allocation size
  * @node:	  numa node
  *
@@ -3979,7 +3979,7 @@ void *vmalloc_node_noprof(unsigned long size, int node)
 EXPORT_SYMBOL(vmalloc_node_noprof);
 
 /**
- * vzalloc_node_noprof - allocate memory on a specific node with zero fill
+ * vzalloc_node - allocate memory on a specific node with zero fill
  * @size:	allocation size
  * @node:	numa node
  *
@@ -4009,7 +4009,7 @@ EXPORT_SYMBOL(vzalloc_node_noprof);
 #endif
 
 /**
- * vmalloc_32_noprof - allocate virtually contiguous memory (32bit addressable)
+ * vmalloc_32 - allocate virtually contiguous memory (32bit addressable)
  * @size:	allocation size
  *
  * Allocate enough 32bit PA addressable pages to cover @size from the
@@ -4025,7 +4025,7 @@ void *vmalloc_32_noprof(unsigned long size)
 EXPORT_SYMBOL(vmalloc_32_noprof);
 
 /**
- * vmalloc_32_user_noprof - allocate zeroed virtually contiguous 32bit memory
+ * vmalloc_32_user - allocate zeroed virtually contiguous 32bit memory
  * @size:	     allocation size
  *
  * The resulting memory area is 32bit addressable and zeroed so it can be
-- 
2.44.0.396.g6e790dbe36-goog

