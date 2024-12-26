Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1773E42AA1
	for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 20:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735243420; cv=none; b=dgUZmeNGxIWszh8o7P70M9Vy1RgRyGP8A2T3cgXRPHDFv/2ut/eCRce5fT30j097HfRPb+OghukCFBsHIgUNHGzojRIyo6HBVnLuSHo9M/4KywkORT6roUnHYPHATr6Sebaef9NFnFcdzSpD715rcA8urL1E1Y0FZ9RPw5in4eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735243420; c=relaxed/simple;
	bh=iHEnTUQ8WW1vippUxpUlyldX1w4H7XQ9gn0EmMel/UA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bhrJDdNbiOPSRTCrTNMIJZzlVPHcj0B8zVO/Oax4V6GtHsRjESeZwyXWIr8LoVujeC65JTf88ZFKrhIaLu/7mGgHk13MANWg7PxxF7HiRo9cKX5n5umiPwnLxgvh7jT15EmVgIG+ALRxMbE3ijpfvGPAQqfZY9rL9w9ajK8odcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jEux8co4; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jEux8co4"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ee86953aeaso8155815a91.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 12:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735243418; x=1735848218; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aTwdimbqrLzgvxzEohMdCoyRMu5oKcGm29eOp6seJ28=;
        b=jEux8co4MvRV/j6faFkhzXHIjkcuaj9LUIRY33bhev5b2hzSY7EFljWgNzQj0ril6n
         FEfc5VR9qaS+/elwi1JN4mh+LH87NHN4wcH1LI4Qhm2CTe47vkPIHvsec/PhbrzAQ03k
         MIQ8JCbj1vV1Bqkk/Y2pnz+Q4P/mjoP/9LRdm4GcuUBI0CI2RbY/+SIbiBHje8wJLaUV
         7MxFkvDiRoH4oQ4vb5dZGSNWSqvyxEFK+KWkrweQwfBuvH8cgiKjoAkNhNaONMFrxUZ8
         r77/SYA/TOKCACWeAXEKu/WunV7W89ta6l3bdbOmHPVViWpFGCAzlUH3AbvEWWakAoDP
         HwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735243418; x=1735848218;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aTwdimbqrLzgvxzEohMdCoyRMu5oKcGm29eOp6seJ28=;
        b=odIvQMfdhHMg8Z3KicmFw6vdPhdgEoHBNJ/jFjonzFcJFAmfDdrUMtvjQZwa8DVrdD
         ELeiWNWDlj+XiPnTh79NHFl9PQFN1AQVmw44YrfhPxRoK/5Zowx8FdvGhL1Mwf4Oof4r
         R25kpI1ZMVZWWFFBEYf4qh0UU5zFldbtrzMa0EZaoTGAZxBjLRsLE6l6ymsDJZU4RVP3
         DgSE5OB2HxqsL0Tk7FdhkAkTOPhIbVnaEck4t7R1vmWLu6hClOpo4Nh1e/CMdU/XuGfv
         ciIbqlr2gNs/ilUmnxeyEXAFP09AdAKeK4phUB4amrd9vq9Ade7wimjVqiEb4iYQ2ibT
         NygQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrHJkROw18iCaGTllfEQiiClUTPgkovsNR9G50gX91FS0bmWy3fyqP+2EVj9gaYsWkTCblr5b4dlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrXJjjVnupQbJpetDbQ2QZ4omXIG/u0gpOFN1eM7YGdlM2LVK2
	Hz/o4DQDrTkqBtxUW0HkL1h26YcA+ea6AmzigUPp+ZbDf93BrpMZhDOKMNyXKYolM8M8h4AKiZo
	UhQ==
X-Google-Smtp-Source: AGHT+IFKuFHb/tV8+kvISxe/RGHcG/GVadVlTBIkNnm3OYqCY+RuHpRtRCzuwCqfDOqzCGcJoiDvWD0TkhA=
X-Received: from pji12.prod.google.com ([2002:a17:90b:3fcc:b0:2ef:95f4:4619])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2805:b0:2ee:d024:e4f7
 with SMTP id 98e67ed59e1d1-2f452d37b34mr42943311a91.0.1735243418406; Thu, 26
 Dec 2024 12:03:38 -0800 (PST)
Date: Thu, 26 Dec 2024 12:03:35 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226200335.1250078-1-surenb@google.com>
Subject: [PATCH 1/1] fixup for mm/debug: print vm_refcnt state when dumping
 the vma
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
	surenb@google.com, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

vma->vm_refcnt does not exist when CONFIG_PER_VMA_LOCK=n, therefore
when CONFIG_PER_VMA_LOCK=n and CONFIG_DEBUG_VM=y we need to avoid its
usage in dump_vma().

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412270328.HiJX1mRt-lkp@intel.com/
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
Fixes https://lore.kernel.org/all/20241226170710.1159679-14-surenb@google.com/
posted over mm-unstable.

 mm/debug.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/mm/debug.c b/mm/debug.c
index 68b3ba3cf603..9c4cbc3733b0 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -178,6 +178,7 @@ EXPORT_SYMBOL(dump_page);
 
 void dump_vma(const struct vm_area_struct *vma)
 {
+#ifdef CONFIG_PER_VMA_LOCK
 	pr_emerg("vma %px start %px end %px mm %px\n"
 		"prot %lx anon_vma %px vm_ops %px\n"
 		"pgoff %lx file %px private_data %px\n"
@@ -187,6 +188,17 @@ void dump_vma(const struct vm_area_struct *vma)
 		vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
 		vma->vm_file, vma->vm_private_data,
 		vma->vm_flags, &vma->vm_flags, refcount_read(&vma->vm_refcnt));
+#else
+	pr_emerg("vma %px start %px end %px mm %px\n"
+		"prot %lx anon_vma %px vm_ops %px\n"
+		"pgoff %lx file %px private_data %px\n"
+		"flags: %#lx(%pGv)\n",
+		vma, (void *)vma->vm_start, (void *)vma->vm_end, vma->vm_mm,
+		(unsigned long)pgprot_val(vma->vm_page_prot),
+		vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
+		vma->vm_file, vma->vm_private_data,
+		vma->vm_flags, &vma->vm_flags);
+#endif
 }
 EXPORT_SYMBOL(dump_vma);
 
-- 
2.47.1.613.gc27f4b7a9f-goog

