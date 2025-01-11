Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318A91922D3
	for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 04:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736569597; cv=none; b=mQSjg4l6bDtcndguaYt23pMnpyP/+LdA/MFVC6DY/ZwSD9ZlfgCL+scjTDnbrE2b1Q7xY5RdS46e73HMfS3LpzPOcBulO4ByBIGdr/zQmQIGRs4CklSB9jnmoZu++uDMiBGJVHZ/ByrHBBuUjugNoNmx3Z4Jpxpy0HTH7ytbuqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736569597; c=relaxed/simple;
	bh=xrCJxJ8xCeea7DfOdcyGDHC3o5JGvEYZQC59p2slgWc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KkayI5jIhQUGj2q5VxTOKReGr8zDKWMUu1XytrW0HYq29TL8qEcGE0QAnFYaJrbcsXPNAinMyVXaP6JJ/SkRdGuyiMyog0NpEOQGv3sR1TMh5fPJ0R3KXHvAXUDR41lkhQOec/yCTnA5fwxOo+hu/keMXgog8ed9mJcBBPcZ1S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gwlb02md; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gwlb02md"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2eebfd6d065so6968244a91.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 20:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736569595; x=1737174395; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hRZ4wMzIwoFaVH+QKckb3zqa5H5+gDzhM3t6myutkJ4=;
        b=gwlb02mdcWIs9LKyTkDgMcqq762wkPB14hosKiXqFgD4Di15uM1bykBm/llqeVhKsc
         Mr+n1hI4MZo74l41knoykRT8SnMZ3D/qb4t0X+Aep6ZNmDok7hwXyFFNqNjQaRTQZtt+
         6Ze3KkFuxYVtTmtzgptdE4AL+ZxnJVnzn8Pc6bvknSQ9LvNU4sO6zFlp+1yu2egABFLD
         lKE6ulZRC2Gb+eTxaKtpJxsA+H8Pfv7P7c9ei7EmFIbu+WQE3RQlvvPkogg62HF0kHSE
         0HuURi9unvo79D0HDJgd89cb9gobjIu7xcjuPQi/5XDVkqf7l4N89dcYn7u79pglTFhc
         O/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736569595; x=1737174395;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hRZ4wMzIwoFaVH+QKckb3zqa5H5+gDzhM3t6myutkJ4=;
        b=sl5xhA9q6Wte1mP6yt0V/ZHLMCF6VvehXb359LUNK1TNeTorquCLksXq+ItIuUnjC2
         LY5dvjwuElo7rQ853A9pn2QSwespmlw258vKMZDu8dwi/N072wxTsmBUX0gvkXmuBb7l
         r9IiTuV4PeYA8j6n2FfD2mcwYTjLAVWFKfZIceTra/4LRHE61ilMeau/mdJ0dUuDZS+x
         bwSkYESp50VmNTbaLlftgk77+fpY8h9ViQ+JH45NLPZLuxudmI+zNUMh6FAaCIp2h/ul
         NOrzROTuhH1br8nSRnjWwNhaK7CsFoVvV+DMkSjB1XaxDMADHlZWyWRSiWZw9KdtVp7B
         kkWg==
X-Forwarded-Encrypted: i=1; AJvYcCWkREzopmYOgJQRMlloUIIUjRJfdE4RW4mO2yaTxyFqhaTgqPm6XLzY+4DPCwVFMOVMGgqUpSgBrSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWKdOHNP28/wZcrc+Ym8N6af7rQtxjV9aL6/z0DwHFmhTTkDVg
	UQCV+ULmgFMICye27rLkzUjxvFt9HwpZbCXUxZQop+nFgW2AFo5RphiuUYBgpchVZbBuJb+GwMQ
	n6Q==
X-Google-Smtp-Source: AGHT+IFTyAfsIAx+W8ijjylMHsN3oJ/EjAkXBdrJzAHIWy/euYIgMSi4UM4+efBYB633hSURtx6BkjgnB9k=
X-Received: from pjbtb14.prod.google.com ([2002:a17:90b:53ce:b0:2ef:7352:9e97])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:548f:b0:2ee:7870:8835
 with SMTP id 98e67ed59e1d1-2f548f80206mr20438054a91.33.1736569595602; Fri, 10
 Jan 2025 20:26:35 -0800 (PST)
Date: Fri, 10 Jan 2025 20:26:00 -0800
In-Reply-To: <20250111042604.3230628-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111042604.3230628-14-surenb@google.com>
Subject: [PATCH v9 13/17] mm/debug: print vm_refcnt state when dumping the vma
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

vm_refcnt encodes a number of useful states:
- whether vma is attached or detached
- the number of current vma readers
- presence of a vma writer
Let's include it in the vma dump.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/debug.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/mm/debug.c b/mm/debug.c
index 8d2acf432385..325d7bf22038 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -178,6 +178,17 @@ EXPORT_SYMBOL(dump_page);
 
 void dump_vma(const struct vm_area_struct *vma)
 {
+#ifdef CONFIG_PER_VMA_LOCK
+	pr_emerg("vma %px start %px end %px mm %px\n"
+		"prot %lx anon_vma %px vm_ops %px\n"
+		"pgoff %lx file %px private_data %px\n"
+		"flags: %#lx(%pGv) refcnt %x\n",
+		vma, (void *)vma->vm_start, (void *)vma->vm_end, vma->vm_mm,
+		(unsigned long)pgprot_val(vma->vm_page_prot),
+		vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
+		vma->vm_file, vma->vm_private_data,
+		vma->vm_flags, &vma->vm_flags, refcount_read(&vma->vm_refcnt));
+#else
 	pr_emerg("vma %px start %px end %px mm %px\n"
 		"prot %lx anon_vma %px vm_ops %px\n"
 		"pgoff %lx file %px private_data %px\n"
@@ -187,6 +198,7 @@ void dump_vma(const struct vm_area_struct *vma)
 		vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
 		vma->vm_file, vma->vm_private_data,
 		vma->vm_flags, &vma->vm_flags);
+#endif
 }
 EXPORT_SYMBOL(dump_vma);
 
-- 
2.47.1.613.gc27f4b7a9f-goog

