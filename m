Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5EC2DF68
	for <linux-doc@vger.kernel.org>; Mon, 29 Sep 2025 01:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759107820; cv=none; b=dC6q/oYAs5v5bUwsfPYl/htf4T9fGdWWW2ypSg23sGTM0t9sajUkLXh61Y4ynJtiIz1VUw3sr/MBzqv3TDFA32OEWjh0DndJmfJhavHlhtD8KfmB10Qmluo/Y/sB8Y2vxtJtiMDRNU87PAgEDdbjqGYM90xNiWbYjTuYCsYeBlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759107820; c=relaxed/simple;
	bh=Y/Ivo5zgLtU+RH6gb+3c1+9ZNDdvFIGCYZipUGkL+4w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pcm8ew7+GK1eNkbmwOjezleUDnXqh7qbwzCvChh6j0vzwVwfdYuIftWYKsMVPxCrokd4T7ZzpkO7ihXqpyfig4zS2+iW/Z7G8kxKBM60CxIzKsI8LdpC2tA/jZZAa4TUp9YTUuCkal72CUYxg9AO/bMt11trwTkSpIJaFpOzkTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=HFMXSoS4; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="HFMXSoS4"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-86420079b01so195419085a.1
        for <linux-doc@vger.kernel.org>; Sun, 28 Sep 2025 18:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1759107817; x=1759712617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezlL3LcjIf2ht7RpS8bynkMbzZtMKTbogv0OCRBHCJM=;
        b=HFMXSoS4PQuaDTMFFqb7ZmjXNAegr54JYRE+RyQYVFaQ/yuGeomYzk10Iq6SDbWjI7
         goGuisDvG07tJdh38tIEAnc1gRzEwSRJLEtOHwgtSDu3y51QMp18kGAmjGVWJCR0h5NW
         3/umAhto3EsVdZjEUtW2rM+X1rt5Ivxrk2+ZB7OypK+OtRDGzgNzPbpXh5/k0UCOehWA
         u/yMslRAx3pVNLrfCVoEATFhEGV9JGqVR+j3xcFZrerfe7xyKdc6z3ZkKzxncAiXE30i
         zmD4Q5yqJ8Zhtz2bsVE9sB3v20j8kc0nKJMrPXN8z4fU6gavDpqpjKsofaP75834L7t5
         gO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759107817; x=1759712617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezlL3LcjIf2ht7RpS8bynkMbzZtMKTbogv0OCRBHCJM=;
        b=vSNA6nnFgXkmtFabXdgLtWeSPje0NnmO95aabYxGM4lqXlCzcoTBN6OKvyVXjf37/f
         Wc/e7trvtGWRfqiS2G3zFbZbYFxj+69J2xYvx6hEWAEJ2oi/JS52UrIIhrFegOgEs6SS
         TQSVIBp/WBRnn1QZ2CZEYf9x3QNH9REj68/hKpgmmm1WGu3a5awLjzkq4T0JKkJU/+z5
         2MZYiYkzoZJQsfxwWXx4ckpJ1Yh/T/4CkIxp8QROVaaYs2gcNcLVX8OLFpSUWMfUGqHx
         tGgw7XjziU1ZhZ1Klo/YsNetxEcBr3EjeSMl2bfwFy0TS446K+Mzl0PhtjItcs60uoZM
         T/Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXxcJkRhLyZJNW+lKWjBhCZ1PfCr/Vqj+9t00TqKyK3GJoQu7f1L/APmn8q4xfNGhKCUtSOKfWfdc8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2kYtqZbaNRoujzslXkrxXeFHIosC9D2Ml0ARltIToTBQMvs6i
	/XQVOVb8RMJZudIb0ZiqxjTXmJMe9IazHkHqCAXW1NSyB43OQd7weKLTNG77Gm0eFL8=
X-Gm-Gg: ASbGncs3a8GM5HStUy6E2gQtsyskz0ULfKXsrlbCrTp8XPBGpbBdAQx45NFPtyvhLHC
	ks0S05p/W9E8Jt+NmIIUbTZkfO2KS6aKtSYNbM0uvmHWSET/qHBlM5/waj0l55lKLrS0Up9sbFd
	Zu8Jl69Jxlu5U9lMvHTTduJMsK3eJDu5asDvjfG8M9Z4/i9ykkyLcuJ4WAUY6TYewpjDK0+P279
	n+LhlzYXINGbcPleCqcnFfxzFFR9jlXZNhb+pZpw4N5GevGLU4v/R2GHancy4Pdl2xynmbdnqIl
	XorGIuCtK2LllKcfRrHYJdq68e3kvfx4I798XmUlY/NG0JaYz8MFhZsJTMa1lCP6psG2kVZ2MOh
	d3RhfAMEyyEEbhaA3rrzdkZ3j5pio7KT9AZ1gIEh6zj4ANU3lTI6j4HDbkqA2BVZtmBZG/UQPCw
	hVPBIG3MqB6lyrdhWMdOIzW8SHBbkW
X-Google-Smtp-Source: AGHT+IHaETUM84OTpHheMB0hdUMDHvd/ZJx9O8NiNJ3bWGiu/zS0OpwUNUxS2hk0EnKZS1qySrlkgw==
X-Received: by 2002:a05:620a:f0c:b0:855:cfe0:b6eb with SMTP id af79cd13be357-85ae9c6d420mr1897035985a.75.1759107817220;
        Sun, 28 Sep 2025 18:03:37 -0700 (PDT)
Received: from soleen.c.googlers.com.com (53.47.86.34.bc.googleusercontent.com. [34.86.47.53])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db0c0fbe63sm64561521cf.23.2025.09.28.18.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 18:03:36 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	saeedm@nvidia.com,
	ajayachandra@nvidia.com,
	jgg@nvidia.com,
	parav@nvidia.com,
	leonro@nvidia.com,
	witu@nvidia.com,
	hughd@google.com,
	skhawaja@google.com,
	chrisl@kernel.org,
	steven.sistare@oracle.com
Subject: [PATCH v4 04/30] kho: add interfaces to unpreserve folios and page ranes
Date: Mon, 29 Sep 2025 01:02:55 +0000
Message-ID: <20250929010321.3462457-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.51.0.536.g15c5d4f767-goog
In-Reply-To: <20250929010321.3462457-1-pasha.tatashin@soleen.com>
References: <20250929010321.3462457-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow users of KHO to cancel the previous preservation by adding the
necessary interfaces to unpreserve folio and pages.

Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/kexec_handover.h | 12 +++++
 kernel/kexec_handover.c        | 85 ++++++++++++++++++++++++++++------
 2 files changed, 84 insertions(+), 13 deletions(-)

diff --git a/include/linux/kexec_handover.h b/include/linux/kexec_handover.h
index 2faf290803ce..4ba145713838 100644
--- a/include/linux/kexec_handover.h
+++ b/include/linux/kexec_handover.h
@@ -43,7 +43,9 @@ bool kho_is_enabled(void);
 bool is_kho_boot(void);
 
 int kho_preserve_folio(struct folio *folio);
+int kho_unpreserve_folio(struct folio *folio);
 int kho_preserve_pages(struct page *page, unsigned int nr_pages);
+int kho_unpreserve_pages(struct page *page, unsigned int nr_pages);
 int kho_preserve_vmalloc(void *ptr, struct kho_vmalloc *preservation);
 struct folio *kho_restore_folio(phys_addr_t phys);
 struct page *kho_restore_pages(phys_addr_t phys, unsigned int nr_pages);
@@ -76,11 +78,21 @@ static inline int kho_preserve_folio(struct folio *folio)
 	return -EOPNOTSUPP;
 }
 
+static inline int kho_unpreserve_folio(struct folio *folio)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int kho_preserve_pages(struct page *page, unsigned int nr_pages)
 {
 	return -EOPNOTSUPP;
 }
 
+static inline int kho_unpreserve_pages(struct page *page, unsigned int nr_pages)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int kho_preserve_vmalloc(void *ptr,
 				       struct kho_vmalloc *preservation)
 {
diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index e0dc0ed565ef..26e035eb1314 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -153,26 +153,33 @@ static void *xa_load_or_alloc(struct xarray *xa, unsigned long index, size_t sz)
 	return elm;
 }
 
-static void __kho_unpreserve(struct kho_mem_track *track, unsigned long pfn,
-			     unsigned long end_pfn)
+static void __kho_unpreserve_order(struct kho_mem_track *track, unsigned long pfn,
+				   unsigned int order)
 {
 	struct kho_mem_phys_bits *bits;
 	struct kho_mem_phys *physxa;
+	const unsigned long pfn_high = pfn >> order;
 
-	while (pfn < end_pfn) {
-		const unsigned int order =
-			min(count_trailing_zeros(pfn), ilog2(end_pfn - pfn));
-		const unsigned long pfn_high = pfn >> order;
+	physxa = xa_load(&track->orders, order);
+	if (!physxa)
+		return;
+
+	bits = xa_load(&physxa->phys_bits, pfn_high / PRESERVE_BITS);
+	if (!bits)
+		return;
 
-		physxa = xa_load(&track->orders, order);
-		if (!physxa)
-			continue;
+	clear_bit(pfn_high % PRESERVE_BITS, bits->preserve);
+}
+
+static void __kho_unpreserve(struct kho_mem_track *track, unsigned long pfn,
+			     unsigned long end_pfn)
+{
+	unsigned int order;
 
-		bits = xa_load(&physxa->phys_bits, pfn_high / PRESERVE_BITS);
-		if (!bits)
-			continue;
+	while (pfn < end_pfn) {
+		order = min(count_trailing_zeros(pfn), ilog2(end_pfn - pfn));
 
-		clear_bit(pfn_high % PRESERVE_BITS, bits->preserve);
+		__kho_unpreserve_order(track, pfn, order);
 
 		pfn += 1 << order;
 	}
@@ -734,6 +741,30 @@ int kho_preserve_folio(struct folio *folio)
 }
 EXPORT_SYMBOL_GPL(kho_preserve_folio);
 
+/**
+ * kho_unpreserve_folio - unpreserve a folio.
+ * @folio: folio to unpreserve.
+ *
+ * Instructs KHO to unpreserve a folio that was preserved by
+ * kho_preserve_folio() before. The provided @folio (pfn and order)
+ * must exactly match a previously preserved folio.
+ *
+ * Return: 0 on success, error code on failure
+ */
+int kho_unpreserve_folio(struct folio *folio)
+{
+	const unsigned long pfn = folio_pfn(folio);
+	const unsigned int order = folio_order(folio);
+	struct kho_mem_track *track = &kho_out.track;
+
+	if (kho_out.finalized)
+		return -EBUSY;
+
+	__kho_unpreserve_order(track, pfn, order);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kho_unpreserve_folio);
+
 /**
  * kho_preserve_pages - preserve contiguous pages across kexec
  * @page: first page in the list.
@@ -773,6 +804,34 @@ int kho_preserve_pages(struct page *page, unsigned int nr_pages)
 }
 EXPORT_SYMBOL_GPL(kho_preserve_pages);
 
+/**
+ * kho_unpreserve_pages - unpreserve contiguous pages.
+ * @page: first page in the list.
+ * @nr_pages: number of pages.
+ *
+ * Instructs KHO to unpreserve @nr_pages contigious  pages starting from @page.
+ * This call must exactly match a granularity at which memory was originally
+ * preserved by kho_preserve_pages, call with the same @page and
+ * @nr_pages). Unpreserving arbitrary sub-ranges of larger preserved blocks is
+ * not supported.
+ *
+ * Return: 0 on success, error code on failure
+ */
+int kho_unpreserve_pages(struct page *page, unsigned int nr_pages)
+{
+	struct kho_mem_track *track = &kho_out.track;
+	const unsigned long start_pfn = page_to_pfn(page);
+	const unsigned long end_pfn = start_pfn + nr_pages;
+
+	if (kho_out.finalized)
+		return -EBUSY;
+
+	__kho_unpreserve(track, start_pfn, end_pfn);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kho_unpreserve_pages);
+
 struct kho_vmalloc_hdr {
 	DECLARE_KHOSER_PTR(next, struct kho_vmalloc_chunk *);
 };
-- 
2.51.0.536.g15c5d4f767-goog

