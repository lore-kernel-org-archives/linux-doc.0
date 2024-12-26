Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCF61D9A76
	for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 17:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735232862; cv=none; b=uMU/FFgzTB3wRYNnTTTyhD0un21rE0xNdJyV7M4dCDmQU/yGFCah6gsNq/bwYXGsHYK5RvFdp/bjbyuAbowN6hqZ5g8xF55l+wEgZUQn4VV0mWj5x7GHItm2cGaTZVbSBgYdsEdF6P+s+FfMbRWZsQOUsn8cDrDuQ6peT73P2Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735232862; c=relaxed/simple;
	bh=bbw6pVuUSpPlySGCFqTY1teRdTcfZlASZvWIhGr3QJ8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CWXZ+rL5vnSpV5Sv2RwQYzuT3QMwvXCvmWW6PGk6S62elhbY3nSodD0W2XXN1O8spXhtylokFZVsQddwX5Hz3a+t9dGJepRLdp54XxPfd2ScmHfuNGuf3bhiMnlLndb6dcFPXQ7b9yO7RIIKVueBhdp+BebnNiwGyAAYv2xrwLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ksvurq5q; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ksvurq5q"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef728e36d5so8305403a91.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 09:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735232860; x=1735837660; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbUgy+N8PHmQQlIfNLhjvtNZcxZdtPERK00HNSuusW4=;
        b=ksvurq5qiBjeu67KSoT4ll2+LZ/X9topEPcjJ19pie9Cm4RS6UuSTHOnzBe+kFN7MD
         UImVTe0q1jiZxXga3H8aDOSWvcDcLxizf2qUa2lbyoJrxYpyohnagMLfLVQeqazVTPnZ
         U0uzArnWskFLDbELXh3o6NdWvttgj+JVmh9YMUy6C/LU6KzEbvnddooU69noy1P0TywV
         rwQdvTU8tHCsNGgS0NC/CYChnu3jHPPCZL7XETVeNXee00IX62Tg2OfheV5f4QU2zsdC
         bgMhXQjvdn1lZiflZSkJ9lCPOXG8TmWOLr3Uz1Gj5Qh2YNF0vnseLMfn0UpzyZRp18y3
         g3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735232860; x=1735837660;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbUgy+N8PHmQQlIfNLhjvtNZcxZdtPERK00HNSuusW4=;
        b=w3rYOKqRideJYsRBIM4rwS5wja95/CS8PDpFUHoo/XteTJu2iZlltmnAcWraJ5BP1A
         14XIkY0pJDLAEa534yJ1f1/XyBH5yEnMoabCJZgtN+5iHa/60xUHtz4Nnb6KWO47O/Ek
         FKvHvxxRXa+3HD67QU0ET8vhTguRWPKD0bOkvraDFS2dzLwK1X9x+jhB7l6w3oVeOqEg
         keUGxAtRNn6EedS3lhIZT51UylozRvOYtnoH5++UARc1xkPr19wU5uiWk/gvcs39kGMQ
         HMIRsENO3T9c/uYVTbSZudcVIE3hrLKARW6rZydBMzt4Ka/Qp4uMswy6vev5FlKUO8+e
         +dmA==
X-Forwarded-Encrypted: i=1; AJvYcCVxFNEp2iapR8ecTQFAa3EsyyxifHx4MYA8q4zt58pNJEToWtZsdCF/qhJblufhEqw9VasNYjdWW2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwFakOTEodZjaRBfmKrvlxH2oBO9ggcM2Y4p2obGucWq9DtQG3
	/y69fJR3apCeApGVv3nQ2RXo5N6hsFIrLGqxROS2rYQIp5Kgd2tkk4gccJLg6XfzqEyqZ81OTqJ
	WpQ==
X-Google-Smtp-Source: AGHT+IEG5TzQ5WphA3eoGz/MbiJJmFDDNhcID7zswYwLoeBJDVpj8ipi2aVpjRu++rbXJdGfCBLbRXGohaw=
X-Received: from pfbdc3.prod.google.com ([2002:a05:6a00:35c3:b0:725:cd3b:326c])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:8412:b0:1e1:a671:7122
 with SMTP id adf61e73a8af0-1e5e044635dmr39159145637.2.1735232860104; Thu, 26
 Dec 2024 09:07:40 -0800 (PST)
Date: Thu, 26 Dec 2024 09:07:05 -0800
In-Reply-To: <20241226170710.1159679-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226170710.1159679-14-surenb@google.com>
Subject: [PATCH v7 13/17] mm/debug: print vm_refcnt state when dumping the vma
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

vm_refcnt encodes a number of useful states:
- whether vma is attached or detached
- the number of current vma readers
- presence of a vma writer
Let's include it in the vma dump.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/debug.c b/mm/debug.c
index 95b6ab809c0e..68b3ba3cf603 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -181,12 +181,12 @@ void dump_vma(const struct vm_area_struct *vma)
 	pr_emerg("vma %px start %px end %px mm %px\n"
 		"prot %lx anon_vma %px vm_ops %px\n"
 		"pgoff %lx file %px private_data %px\n"
-		"flags: %#lx(%pGv)\n",
+		"flags: %#lx(%pGv) refcnt %x\n",
 		vma, (void *)vma->vm_start, (void *)vma->vm_end, vma->vm_mm,
 		(unsigned long)pgprot_val(vma->vm_page_prot),
 		vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
 		vma->vm_file, vma->vm_private_data,
-		vma->vm_flags, &vma->vm_flags);
+		vma->vm_flags, &vma->vm_flags, refcount_read(&vma->vm_refcnt));
 }
 EXPORT_SYMBOL(dump_vma);
 
-- 
2.47.1.613.gc27f4b7a9f-goog

