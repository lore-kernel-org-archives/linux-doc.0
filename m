Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9443036B075
	for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 14:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768832576; cv=none; b=JLUvnLZfzRjkVcMUffoaIns5PGa/lb9D7GGy21q1yI5moWke5v20U1ya0ZwFizGNh1OGNQWEfl5oi0ttkOrUD2SyAgxKKhKa51Tq4LhwF83vrLePvI6tO7+i5/1r/1if+G/JiDVvhqPRnt66qo1IC8wb2BNzA6C23hqY+xO1iGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768832576; c=relaxed/simple;
	bh=w2scubrWigPI5aAVKJGSmibtcgc4McVhvAh8XisAp4w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GJp2nuAW0MfCgera2bHAFBltlJsyeICIQfq2gMQlnMn7Jv2cojKifzRPTcr7nBVsXVCymXi/7Ic0MWYdZI+JhRJCMptjA9Hd1YJkw7thuz+AbmcEaDFWdljbA0zCYwMP42YmsYPPAMh2fle2Q/LiMVO5yu0SP8vK21ZZvmxlCxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aPS2OMFK; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aPS2OMFK"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b8720608e53so733152566b.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 06:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768832572; x=1769437372; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9nuz806mp9+5PhIDWKxO6w4brkXaM9E/Fe3SahLfIE4=;
        b=aPS2OMFKECv3ZXwqy1jrWAiupoUh08fCzLXss1JJnJxpddbdyeqUMD/T+73MrwikUT
         qjH0B0D/MwrT42RQ/nyJMoZohMH12Y9Ib0MorR2t0dEzn/71EJID+wqhn3e6mXVwBxp6
         WaFgJJQs761Xzr49O/OXlGljDmNbO5hBrGUIbrfxmsw0mXOc4w9/xtNiXifPTsl+L1Dt
         a9LZtMDcfI//LlVztj4dR5f9xDxGkoorBlBfJoK64QWvCdeNsxGhwoCqFW78VrxEV2/B
         tlnBsVFTjubkEu6YY6N28JTkaw2IUoYy0nmZ7lMjmimlz9vLzPCTX2O6pmrcWd+/ZrEY
         skYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768832572; x=1769437372;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9nuz806mp9+5PhIDWKxO6w4brkXaM9E/Fe3SahLfIE4=;
        b=RWNtBvfdkZbcOBHshwrfjZbQqPGdaLza6slodFD0ANWF+bLY1IQzwSZdoGrG2bQ4Ra
         1cmsnjc7cGeQNZLr+5KO41o2CWy0rbmx/g6fFi6SI+hdELhFt8QQRdVqSRq56b94loeJ
         zWmsvXO+sSxdZ8yffZg4I20C/V1Si9r1dlD9qGb7seDbg4e7JfIaSHQBr20iKzpgFO3Y
         QIhW7s78W/Uz/CTANI7pR6MlgDWbpMVkUhLYeB3dQPMOr7CS4yT0MNvVnxY5nrEAOvjJ
         i9GjTJZDdhlfzN5aiXyoJNrXgdntsjtBY254HnvuIZ8+wKlVlS4x09W0h3dpW2NEt5xu
         DsVw==
X-Forwarded-Encrypted: i=1; AJvYcCWOZfFJ278pTDm5672ceA2hXtr4Ghi+ILWt4ReA4HDsyhNmATkUg2cLJ9Z9lVUwUVC7tD0XZnLXXXE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOF6QwWN+9zqikpH3JsFDZ261oddg8+6fJi/cdOLVCKmozUUed
	Q7rRdlEa0gMMmuqtl5pmi7wxFrTSJmkyB/Rye1RnmWINvEKdkaNVl1VuM6C1At/74iTdhJjz/RG
	igao0UGKf0yCf9w==
X-Received: from edrb16.prod.google.com ([2002:aa7:d490:0:b0:650:5e46:20c])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7ba5:b0:b87:191f:4f96 with SMTP id a640c23a62f3a-b87932557e2mr1034243266b.61.1768832572024;
 Mon, 19 Jan 2026 06:22:52 -0800 (PST)
Date: Mon, 19 Jan 2026 14:22:45 +0000
In-Reply-To: <20260119142246.3821052-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260119142246.3821052-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260119142246.3821052-2-smostafa@google.com>
Subject: [PATCH 1/2] mm/page_ext: Add page_ext_get_phys()
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

In the next patches, IOMMU code will add data to page_ext.
The IOMMU code would operate on physical addresses which
can be outside of system RAM.

Add a new function page_ext_get_phys() to abstract the logic of
checking the address and returning the page_ext.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 include/linux/page_ext.h |  6 ++++++
 mm/page_ext.c            | 23 +++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
index 76c817162d2f..bd373496e166 100644
--- a/include/linux/page_ext.h
+++ b/include/linux/page_ext.h
@@ -93,6 +93,7 @@ static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 #endif
 
 extern struct page_ext *page_ext_get(const struct page *page);
+extern struct page_ext *page_ext_get_phys(phys_addr_t phys);
 extern void page_ext_put(struct page_ext *page_ext);
 extern struct page_ext *page_ext_lookup(unsigned long pfn);
 
@@ -215,6 +216,11 @@ static inline struct page_ext *page_ext_get(const struct page *page)
 	return NULL;
 }
 
+static inline struct page_ext *page_ext_get_phys(phys_addr_t phys)
+{
+	return NULL;
+}
+
 static inline void page_ext_put(struct page_ext *page_ext)
 {
 }
diff --git a/mm/page_ext.c b/mm/page_ext.c
index 297e4cd8ce90..5fe65a0ac4f3 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -538,6 +538,29 @@ struct page_ext *page_ext_get(const struct page *page)
 	return page_ext;
 }
 
+/**
+ * page_ext_get_phys() - Get the page_ext structure for a physical address.
+ * @phys: The physical address to query.
+ *
+ * This function safely gets the `struct page_ext` associated with a given
+ * physical address. It performs validation to ensure the address corresponds
+ * to a valid, online struct page before attempting to access it.
+ * It should return NULL for (MMIO, ZONE_DEVICE, holes, offline memory)
+ *
+ * Return: NULL if no page_ext exists for this physical address.
+ * Context: Any context.  Caller may not sleep until they have called
+ * page_ext_put().
+ */
+struct page_ext *page_ext_get_phys(phys_addr_t phys)
+{
+	struct page *page = pfn_to_online_page(__phys_to_pfn(phys));
+
+	if (!page)
+		return NULL;
+
+	return page_ext_get(page);
+}
+
 /**
  * page_ext_put() - Working with page extended information is done.
  * @page_ext: Page extended information received from page_ext_get().
-- 
2.52.0.457.g6b5491de43-goog

