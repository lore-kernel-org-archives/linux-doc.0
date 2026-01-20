Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7573F3C1988
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 09:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768900776; cv=none; b=Qj4YIixvRzGj5ZLd3UQI0J3X01QI2QvLpD80Xk0op2r6VYiTcS2EPs01PF4y8duCJt3H28+4700n6JQNcbGYmfbD7dSQXsFEbXZBQdFmobH7O9y3XoK9lF0PHuWtSTCVTi4Q5v/tANRMF2d8VU9cVOZULSc7+urwJVDEMIJysmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768900776; c=relaxed/simple;
	bh=PHSBhI8m1+DcVKrA3sW1DexLR5nKSBb/1XCqhctyF0Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X06YH8PE2zdL0/8JchRGyhtWoIQU/PvuQ16Zem7AieZ9I0YYY7E7alI7T9uWUSMHno1gbNJWcq1bwk9iiExkd+6hULWdJVPj05Px/qIFs+9pRj0LGRrPZUvI+xt1GkEdryubt0guVqj8rumDNpWOdrkZX6vPUY+GxBHoP5yHSkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TMC8Tria; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TMC8Tria"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47d62cc05daso35497655e9.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 01:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768900773; x=1769505573; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=X0gVSCji/amPzVpAugMKA+gNQb8Vp/dW4y1DM63bYO0=;
        b=TMC8TriayohpgXeZqQmISsBrPaCOHIOAYbLbf1UoahMD6hZSLDdHkDIWmZxhNujbyf
         jIon9ivtqYZyAc//x2Vekbe12v8DYmTGa8veBxvtvSgwb2mr2KUzboKIY/o/LSiRNWzn
         9WxJkTfk2XEh/uNgdtGqUSe6aIFBO363voS3+jjOufU6VwxTkbKwpDtNuvWnewVtuoyE
         CyrXO9KGuXZz2mevlm/OhEuWd/niO7+il+DLJT5TuZl/yrtsCiltUu7VKOE6dVl4ulqV
         3kNkPAhhe6CWX6PvVdU3M+46o8sNCZ2BTOdNuvuAvhAMrgrC4FVf4q49B3k86oU4niGG
         X7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768900773; x=1769505573;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X0gVSCji/amPzVpAugMKA+gNQb8Vp/dW4y1DM63bYO0=;
        b=oOBtUnfDuJtTkWw6VT9MBQssJmMXN0QZvKHPjCDsO4tTKsmgXQdwgVsykwgGIoJrEA
         pV3U1wYm8E9AtBXmzkC9rQd9YdSkLqLOJ9ltbDW/4Kj1W/+88C2OhC3/KpZ3O+OHeLpR
         CZIwT6xUJhlnHFcJdRN/Nl0oufw94mnwCOL8XBxkC7VDeZaTYPje+qKtiAKXZxKF/b/N
         Q67OH5XgazM23nNYsFRWeFwfQ8qooDTBKw44CDEzGk0HSTXgnM+p/XU9mc6wSSuifgRV
         t+iYHpHcRQutssqH5VO/0gAXVzA/2otXIWWrj4GaoJUZxGRPpseVrCSI0l11HWgEShKc
         LHbA==
X-Forwarded-Encrypted: i=1; AJvYcCX60wJaQed5OpSZe4mmNw3O4+ukPelzEHAugQ8FQvfEBdFdDi+DhmEvgMCqXCTt+HW+HeAhC+Bm0sk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyauMdtPWeQviNpOE15UT+UvTGxiGHt5ze+rlewu1GGwBCGSI49
	nNgJcFQN8FlOhwyTyLiG+8HtzUP0HIYzswfPjZEm5rhPj21or8ogSbskwCRIY+EUdxfXeE8g0xk
	TyYVB3Z6qSjmvxg==
X-Received: from wrbgz21.prod.google.com ([2002:a05:6000:4815:b0:435:64f6:e987])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6099:b0:47e:e952:86ca with SMTP id 5b1f17b1804b1-4803e79b81dmr13478605e9.2.1768900772778;
 Tue, 20 Jan 2026 01:19:32 -0800 (PST)
Date: Tue, 20 Jan 2026 09:19:25 +0000
In-Reply-To: <20260120091926.670155-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260120091926.670155-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260120091926.670155-2-smostafa@google.com>
Subject: [PATCH v2 1/2] mm/page_ext: Add page_ext_get_from_phys()
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

The IOMMU code operates on physical addresses which can be outside
of system RAM.

Add a new function page_ext_get_from_phys() to abstract the logic of
checking the address and returning the page_ext.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 include/linux/page_ext.h |  6 ++++++
 mm/page_ext.c            | 23 +++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
index 76c817162d2f..61e876e255e8 100644
--- a/include/linux/page_ext.h
+++ b/include/linux/page_ext.h
@@ -93,6 +93,7 @@ static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 #endif
 
 extern struct page_ext *page_ext_get(const struct page *page);
+extern struct page_ext *page_ext_from_phys(phys_addr_t phys);
 extern void page_ext_put(struct page_ext *page_ext);
 extern struct page_ext *page_ext_lookup(unsigned long pfn);
 
@@ -215,6 +216,11 @@ static inline struct page_ext *page_ext_get(const struct page *page)
 	return NULL;
 }
 
+static inline struct page_ext *page_ext_from_phys(phys_addr_t phys)
+{
+	return NULL;
+}
+
 static inline void page_ext_put(struct page_ext *page_ext)
 {
 }
diff --git a/mm/page_ext.c b/mm/page_ext.c
index 297e4cd8ce90..e2e92bd27ebd 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -538,6 +538,29 @@ struct page_ext *page_ext_get(const struct page *page)
 	return page_ext;
 }
 
+/**
+ * page_ext_from_phys() - Get the page_ext structure for a physical address.
+ * @phys: The physical address to query.
+ *
+ * This function safely gets the `struct page_ext` associated with a given
+ * physical address. It performs validation to ensure the address corresponds
+ * to a valid, online struct page before attempting to access it.
+ * It returns NULL for MMIO, ZONE_DEVICE, holes and offline memory.
+ *
+ * Return: NULL if no page_ext exists for this physical address.
+ * Context: Any context.  Caller may not sleep until they have called
+ * page_ext_put().
+ */
+struct page_ext *page_ext_from_phys(phys_addr_t phys)
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

