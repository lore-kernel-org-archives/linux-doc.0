Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA4737F0F4
	for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 14:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768832576; cv=none; b=A4Vf4ZUigZJcrWvcGgixRkMhpAnre2GSn0B+xMlZWaKhUpHfk0rSCYzePE12vbpdIGvwse8KvnYxAv5G0ZumTeVCINr0BJQ59llHi0+X2w2fKsY/lR8N8LqD3j00zuV0l6bUPLXkCEJLxu1KJ1KrHFpGj91TMzOtvpEIyb3+CGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768832576; c=relaxed/simple;
	bh=etOSXYsmYRMQFELu3qc1hkWPdFr4xMVn+jE7/2P81kE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q4Ft3R+LLNlGf4mrC9n62p2CFG0EW8yJ7in4oawPyP9mCPspE1uVcrfKKchq+8tdcYGon1ybkOrHgq92q/seDEQ2YJ7J2U4N6qyAWjFEQt1UxZU5l5sL0cw8zdapxrGhSAapS41YQmZK0XcjIIxeuQ6srCFr3kOhymmX/mxUeJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vtQokKD3; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vtQokKD3"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47d28e7960fso46557345e9.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 06:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768832573; x=1769437373; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ctFjNYhvimSO0VVR6mHcQICH1dILW4P6822Kd8ujTu4=;
        b=vtQokKD3GjkIALNjxl7uyYlDFN16vJZBvPzxsuIjEC4rm+5GdytAeNJnsfCUeBJ4Wn
         shKbkPYwJE4kgG6hUd7L1HNIU62ltUM/kAjg2+TUR+ZunT7B91hO7lMLA0OVMrRMRQ5y
         Iu1roPpaWs1edOot+Cz2o53QiCUA1DUmh5jY9R5VVx9xR6/Hp9rvkx3SUKbK1+DBrbhI
         S8EF8Mkh+PpZyX/R72CIgN0H0z8rWDnNTWcjewtnse9sNIvAtd5vaFDENQshg9qadQUD
         auWRnKhzW7400Wx2WObBPfZh50ivGa3UkD/oKRTNhHu1BjDP1dcryvfwTPrKWyWRvhz8
         lEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768832573; x=1769437373;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ctFjNYhvimSO0VVR6mHcQICH1dILW4P6822Kd8ujTu4=;
        b=WYCdzZjx24bN6EK9QLuZGJM06iJWimmCuMa2j+QzBb4KpAnz/6i4BjrTKizDHh2tYH
         uZSW5bKqW3a+NU6emthlRbB1r2GCQ7l1hOtG7MjXCk0/1ijFLZMa67bkw/HREV4C49vM
         JbaOeBaXVzzS8i4HZ4QCUUm45Z0AqHcyqwwWjsr2+NDQz3gGFX/gEuZ1ksLfYaP0X9t/
         GnfCDwQGfhz1/jiaAVK1tE8O6lWRtD5QuHqQ0h7RRy0uoRxIo4lddz1w+nA8BwiU6NL/
         QF8iNHsI5ymPQXBvZIaGaUrSSXM5htSCtyaRjEu2lanWnU6EkoZ1ChDKVRrigi9k1YLZ
         sHsQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6ws3SI16m0ohSx3fbml9nboilUNLTigirS43zAMrAVoHt7ZWHH6AYrdCDsrndT+rA6DACR2WmmxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx66pvA0QcE+tcWEp2wWPatNWDW/zq9JogzSBNZ8XfkW41MAsy4
	71BEEeN0TFnc98hQ/8D4OSQXfIKdx31RNg+nkS7g5aHHBX/55Q6SuD3tMV2N2xn/WDZMGCO9xnC
	6EVbLSn8LqD5JmQ==
X-Received: from wrwj14.prod.google.com ([2002:a5d:564e:0:b0:432:85e9:432f])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b81:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-4801e2a2176mr148484965e9.0.1768832572948;
 Mon, 19 Jan 2026 06:22:52 -0800 (PST)
Date: Mon, 19 Jan 2026 14:22:46 +0000
In-Reply-To: <20260119142246.3821052-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260119142246.3821052-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260119142246.3821052-3-smostafa@google.com>
Subject: [PATCH 2/2] iommu: debug-pagealloc: Use page_ext_get_phys()
From: Mostafa Saleh <smostafa@google.com>
To: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Cc: corbet@lwn.net, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	akpm@linux-foundation.org, vbabka@suse.cz, surenb@google.com, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org, 
	xiaqinxin@huawei.com, baolu.lu@linux.intel.com, rdunlap@infradead.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

Instead of calling pfn_valid() and then getting the page, call
the newly added function page_ext_get_phys(), which would also
check for MMIO and offline memory and return NULL in that case.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/iommu-debug-pagealloc.c | 31 ++++++++++++---------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/iommu-debug-pagealloc.c
index c080a38f45a4..9343af3bdbb6 100644
--- a/drivers/iommu/iommu-debug-pagealloc.c
+++ b/drivers/iommu/iommu-debug-pagealloc.c
@@ -30,14 +30,6 @@ struct page_ext_operations page_iommu_debug_ops = {
 	.need = need_iommu_debug,
 };
 
-static struct page_ext *get_iommu_page_ext(phys_addr_t phys)
-{
-	struct page *page = phys_to_page(phys);
-	struct page_ext *page_ext = page_ext_get(page);
-
-	return page_ext;
-}
-
 static struct iommu_debug_metadata *get_iommu_data(struct page_ext *page_ext)
 {
 	return page_ext_data(page_ext, &page_iommu_debug_ops);
@@ -45,18 +37,26 @@ static struct iommu_debug_metadata *get_iommu_data(struct page_ext *page_ext)
 
 static void iommu_debug_inc_page(phys_addr_t phys)
 {
-	struct page_ext *page_ext = get_iommu_page_ext(phys);
-	struct iommu_debug_metadata *d = get_iommu_data(page_ext);
+	struct page_ext *page_ext = page_ext_get_phys(phys);
+	struct iommu_debug_metadata *d;
+
+	if (!page_ext)
+		return;
 
+	d = get_iommu_data(page_ext);
 	WARN_ON(atomic_inc_return_relaxed(&d->ref) <= 0);
 	page_ext_put(page_ext);
 }
 
 static void iommu_debug_dec_page(phys_addr_t phys)
 {
-	struct page_ext *page_ext = get_iommu_page_ext(phys);
-	struct iommu_debug_metadata *d = get_iommu_data(page_ext);
+	struct page_ext *page_ext = page_ext_get_phys(phys);
+	struct iommu_debug_metadata *d;
+
+	if (!page_ext)
+		return;
 
+	d = get_iommu_data(page_ext);
 	WARN_ON(atomic_dec_return_relaxed(&d->ref) < 0);
 	page_ext_put(page_ext);
 }
@@ -104,11 +104,8 @@ void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys, size_t siz
 	if (WARN_ON(!phys || check_add_overflow(phys, size, &end)))
 		return;
 
-	for (off = 0 ; off < size ; off += page_size) {
-		if (!pfn_valid(__phys_to_pfn(phys + off)))
-			continue;
+	for (off = 0 ; off < size ; off += page_size)
 		iommu_debug_inc_page(phys + off);
-	}
 }
 
 static void __iommu_debug_update_iova(struct iommu_domain *domain,
@@ -123,7 +120,7 @@ static void __iommu_debug_update_iova(struct iommu_domain *domain,
 	for (off = 0 ; off < size ; off += page_size) {
 		phys_addr_t phys = iommu_iova_to_phys(domain, iova + off);
 
-		if (!phys || !pfn_valid(__phys_to_pfn(phys)))
+		if (!phys)
 			continue;
 
 		if (inc)
-- 
2.52.0.457.g6b5491de43-goog

