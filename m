Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5C118BC26
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 02:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736389857; cv=none; b=QXXQLULmdgpEkqbShxzwic2PS0M5fhZ8l9qqECz+RjMSwDUyQT0IsrfkBjFfB+Fwqbcl4HvxwNtWuY5jyr2bkg405GUJaNGRWgRGRU8hUoyjFs/YugITOcVEAd+38LCf9hmFB2l137xKd4qw7wZacYj2l36amipcN6WHu7aQ9D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736389857; c=relaxed/simple;
	bh=T13/ezDy1zA8roi/Zowvjt9SXeJDqVkDzndw5y9kEeI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eYb8VSXZokfjnEZhc66rXoagXHdfO9MBobkTw9IdF/b3uajkHKeXj1UvUjBWCfZ9LTW9N40H9/ntAickDeR/iw1ItMhnfgugWhveRwlacMLxM0jey6DdtOjoKkaMVTrczxwIahPQDhtUQKBfsAsORyHYLns/E5F8SS+bSELq36k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XE8DatbM; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XE8DatbM"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2165433e229so6680485ad.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 18:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736389855; x=1736994655; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dhc7tvmwjQaP4b5E/hXUfzy8UCkIkS3jsDCXbxBg4ZU=;
        b=XE8DatbMyLvcwj8tkrsB1CU8uHRloynCGLicn6fKLUbRlQVItDyzDndVoTsNtR1IVT
         OufbYPEAZhq9zJMSsiICJyBY1AuKnZwnRTCj9w+7uJ0sVc6E5BpbHP53i3DCCN5GlX4/
         5MKQoVbPx+OZUxZibLurRrU8suO78E38SFCnTZ6kJ+Qp6ZsgelKxmvMMqdp54lRFxJYb
         tYfvBP8IFNMNx+jPMbmwrlpAFPD7nQ9D2gdAsG0Pw5pbdnXP28AEggB881BWhnvxzhE5
         aqIPx3OVsJzCosTIvCefYq0YXSIWZIzHEP+pC3ZcURGvKb82aVkLHi9yNGkSyhcNpzdv
         kypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736389855; x=1736994655;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dhc7tvmwjQaP4b5E/hXUfzy8UCkIkS3jsDCXbxBg4ZU=;
        b=Tl3ubFSgNCtFJYif5Tdlr5Frm0x8ChHx46d7fR0Pd6+Nnr7Q+fz9K8+uX2VzvpJOhc
         2nVoi3rjKYMWZY5jGIGv7trfUmSr90BZw7VR9Q75JjSVY2K5ideM0p584yfVSVmPKZZW
         eHQmomhe1YdfyLIdGngt56TzbQjbf5EJ7tvfdDbg5bZgBdEZhU8rslXBh8b4y15YFhTA
         gVu9V26+MtryP2nVledYDnd/rCbuJw3EsIqaOf/3jSaHn9o8VfBG6SV3sUg6D65EoCaY
         lE76LJDSWKlgUQIi3rFB//KbrNtLw+gp8LuZ8nxOnTW64e68KO1LN8SkcERHIB5tBq1V
         cV/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVxhGvsgb0m9imUU69QGitI+LeskQdW5uApfCuy6JHjivqdAvWagBLruWKQWS+ysfW3ybygEmcIgI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/y6mrmZobLByDUx6EiZw+h+n25aRCVxn1zGqJd+HOhP0cAuAO
	DdbwyaCnw5tcp4eiRRZEMxCrvWvAu2sLU12E3A9xG8IApGLsiu5/umwbl72y587ynKD1/lSU39T
	AFw==
X-Google-Smtp-Source: AGHT+IGEJut09X73iREifwmtH1pTDK91otd2DkI7NLMgJYUa+WdvvMkSg9t/WQnzDQh+UWszvk42Ntw5lL8=
X-Received: from plhu17.prod.google.com ([2002:a17:903:1251:b0:216:2dc4:50c1])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ecce:b0:215:7446:2151
 with SMTP id d9443c01a7336-21a83f36facmr63729185ad.4.1736389855012; Wed, 08
 Jan 2025 18:30:55 -0800 (PST)
Date: Wed,  8 Jan 2025 18:30:21 -0800
In-Reply-To: <20250109023025.2242447-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109023025.2242447-13-surenb@google.com>
Subject: [PATCH v8 12/16] mm/debug: print vm_refcnt state when dumping the vma
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

vm_refcnt encodes a number of useful states:
- whether vma is attached or detached
- the number of current vma readers
- presence of a vma writer
Let's include it in the vma dump.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
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

