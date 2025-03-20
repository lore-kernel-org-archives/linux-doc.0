Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05931D435F
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 01:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742435764; cv=none; b=QbJUzlS3FB+eb3vHzg8Cr6yTbJaoTt5xQTPwIr7Ox+zPQCwOhUh2luZ0nbxMud1gSXFT49GSwH0LL8rD2zYFeLZFFlsNvihWuEiaaUwI/jsoQzYVeA6UBfYckxwg4HpQFf6ReDp024OisaKGlzMi+MrX3K9PpdavD2x/aX1hI8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742435764; c=relaxed/simple;
	bh=B+qYOGhJFDAceoX7ga8HkHVOQunVrboad8cUr9L75EU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kkBlwT1ldF/EplVzMu+jLiKfGnByB5p4uA/maU1pWryZmNGmreVATpeJrIjZNSAZj4gkqG8wxO1Yr8GgZM4s65BvQ2mTPKJOwiyvV9ftNZYihvivSEAkJgr1MYVmMPlD/S4nTbG29adXmhbVZr5drSRm6yBdpvjiS9REt67qGwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=17RDJ1R1; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="17RDJ1R1"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff68033070so409087a91.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Mar 2025 18:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742435762; x=1743040562; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MyKsFNp8HnVmgjRlr9CxzqXpTdvZkVjeQqS6GTtSoj0=;
        b=17RDJ1R1uDoun9sbhFnd6PVnAgsWrkFjwa7p4IsSxcgsS/sQ/eHu3j9NS1Oz4XRPzo
         bj1dh5zl8dx/P1kPvfUXWk+Pv6omIhbOq4Abghr/12vZkeCFsCw9oX4re3dVp55Dv+SF
         RNy40wOXLwFF8z813XOlzaX8bT4Cq2N5E9apq1ZVkTlQnkciHz2PQKNn9wqsC+y0HXxp
         g9aZO1ipH1D0o4bS6zteg4m669kg/FDV2efHf+EEdrpctEE4CfLHjERNCRjshZEUtKgz
         fFjgbVhl9RjYlCoduR9g44CeYokg67BtMsPMN7dYTr6PoKvYrKKGAYO0lHcAqRa0ZWuY
         AZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742435762; x=1743040562;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MyKsFNp8HnVmgjRlr9CxzqXpTdvZkVjeQqS6GTtSoj0=;
        b=QNhX9CvfW35/DDfSAhoztHbtf5Q4TYfWEcucVFzeaM5llZuW1gTHPqCtKjFvVv6f/0
         YGkh/xj0CNgM8VylOEtCsQ6qfkkePEZfUyAdc8p/lDqplo211UwNwzWvSQyesb6MrFGb
         3kY3a4RsTh98FwULRx7neTfdjju8HLm/P3+a7BYjsUy+V0utM75JwdLHSuZGf4Tz9AfK
         wMcd0Wwj01p5WPoxn5W+Ugge3Kd76YBiRVMu4Val/P2UMvi97hHZUHQmKAyfLgcbuIae
         UxU4lANjxBxhTSOuHYA5gpFQZXA4qFD16WWuhj4sXpADkSBSqy/I6/RTe9b8bT4iQKDy
         n/LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYwL8W/DTbDB3uRUgYVCOER3I6Hh0llibRyJwqpHHPCFcsX/IzeF1AY5kE5Ekqyk6+pi47qGBtwtc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcldqIo03KUdCpllnd7T+GLVKakxsNQekcyFlPfT9ty7W3ABw3
	Kjp109JZs9baBWnPAnGJ7NFpI9rCKW9pkPpfGdrKhnG1l36wXwbTtjumdChCLhyc8llFHLlTf5R
	rXXtntCWAw7DV6Z64jQ==
X-Google-Smtp-Source: AGHT+IH4fNuT0QWlfSI42heq+dLpm/GFEXTXaL6bQRWMvudZOwxIJGtvzZFRNXPgaqxisIVnXeLUFEDTHfoI9HMH
X-Received: from pjur6.prod.google.com ([2002:a17:90a:d406:b0:2ee:4a90:3d06])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4fc5:b0:2f6:d266:f462 with SMTP id 98e67ed59e1d1-301be20750dmr7815826a91.35.1742435761976;
 Wed, 19 Mar 2025 18:56:01 -0700 (PDT)
Date: Wed, 19 Mar 2025 18:55:36 -0700
In-Reply-To: <20250320015551.2157511-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250320015551.2157511-2-changyuanl@google.com>
Subject: [PATCH v5 01/16] kexec: define functions to map and unmap segments
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	dave.hansen@linux.intel.com, dwmw2@infradead.org, ebiederm@xmission.com, 
	mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, krzk@kernel.org, 
	rppt@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	pasha.tatashin@soleen.com, hpa@zytor.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh+dt@kernel.org, robh@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, rostedt@goodmis.org, tglx@linutronix.de, 
	thomas.lendacky@amd.com, usama.arif@bytedance.com, will@kernel.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, x86@kernel.org, steven chen <chenste@linux.microsoft.com>, 
	Tushar Sugandhi <tusharsu@linux.microsoft.com>, Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

From: steven chen <chenste@linux.microsoft.com>

Currently, the mechanism to map and unmap segments to the kimage
structure is not available to the subsystems outside of kexec.  This
functionality is needed when IMA is allocating the memory segments
during kexec 'load' operation.  Implement functions to map and unmap
segments to kimage.

Implement kimage_map_segment() to enable mapping of IMA buffer source
pages to the kimage structure post kexec 'load'.  This function,
accepting a kimage pointer, an address, and a size, will gather the
source pages within the specified address range, create an array of page
pointers, and map these to a contiguous virtual address range.  The
function returns the start of this range if successful, or NULL if
unsuccessful.

Implement kimage_unmap_segment() for unmapping segments
using vunmap().

Signed-off-by: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Signed-off-by: steven chen <chenste@linux.microsoft.com>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 include/linux/kexec.h |  5 ++++
 kernel/kexec_core.c   | 54 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index f0e9f8eda7a3..fad04f3bcf1d 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -467,6 +467,8 @@ extern bool kexec_file_dbg_print;
 #define kexec_dprintk(fmt, arg...) \
         do { if (kexec_file_dbg_print) pr_info(fmt, ##arg); } while (0)
 
+void *kimage_map_segment(struct kimage *image, unsigned long addr, unsigned long size);
+void kimage_unmap_segment(void *buffer);
 #else /* !CONFIG_KEXEC_CORE */
 struct pt_regs;
 struct task_struct;
@@ -474,6 +476,9 @@ static inline void __crash_kexec(struct pt_regs *regs) { }
 static inline void crash_kexec(struct pt_regs *regs) { }
 static inline int kexec_should_crash(struct task_struct *p) { return 0; }
 static inline int kexec_crash_loaded(void) { return 0; }
+static inline void *kimage_map_segment(struct kimage *image, unsigned long addr, unsigned long size)
+{ return NULL; }
+static inline void kimage_unmap_segment(void *buffer) { }
 #define kexec_in_progress false
 #endif /* CONFIG_KEXEC_CORE */
 
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index c0bdc1686154..640d252306ea 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -867,6 +867,60 @@ int kimage_load_segment(struct kimage *image,
 	return result;
 }
 
+void *kimage_map_segment(struct kimage *image,
+			 unsigned long addr, unsigned long size)
+{
+	unsigned long eaddr = addr + size;
+	unsigned long src_page_addr, dest_page_addr;
+	unsigned int npages;
+	struct page **src_pages;
+	int i;
+	kimage_entry_t *ptr, entry;
+	void *vaddr = NULL;
+
+	/*
+	 * Collect the source pages and map them in a contiguous VA range.
+	 */
+	npages = PFN_UP(eaddr) - PFN_DOWN(addr);
+	src_pages = kvmalloc_array(npages, sizeof(*src_pages), GFP_KERNEL);
+	if (!src_pages) {
+		pr_err("Could not allocate source pages array for destination %lx.\n", addr);
+		return NULL;
+	}
+
+	i = 0;
+	for_each_kimage_entry(image, ptr, entry) {
+		if (entry & IND_DESTINATION) {
+			dest_page_addr = entry & PAGE_MASK;
+		} else if (entry & IND_SOURCE) {
+			if (dest_page_addr >= addr && dest_page_addr < eaddr) {
+				src_page_addr = entry & PAGE_MASK;
+				src_pages[i++] =
+					virt_to_page(__va(src_page_addr));
+				if (i == npages)
+					break;
+				dest_page_addr += PAGE_SIZE;
+			}
+		}
+	}
+
+	/* Sanity check. */
+	WARN_ON(i < npages);
+
+	vaddr = vmap(src_pages, npages, VM_MAP, PAGE_KERNEL);
+	kvfree(src_pages);
+
+	if (!vaddr)
+		pr_err("Could not map segment source pages for destination %lx.\n", addr);
+
+	return vaddr;
+}
+
+void kimage_unmap_segment(void *segment_buffer)
+{
+	vunmap(segment_buffer);
+}
+
 struct kexec_load_limit {
 	/* Mutex protects the limit count. */
 	struct mutex mutex;
-- 
2.48.1.711.g2feabab25a-goog

