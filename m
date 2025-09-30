Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13B3279908
	for <linux-doc@vger.kernel.org>; Tue, 30 Sep 2025 05:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759211968; cv=none; b=p8uYPw6kFD8vEckdc6U7kgN/6D23GA53scybVD4Iba3DSZ1HPZcmQIHWM90363np4HvNuwi6Isp6lA+G6qShO5Jb2XT/jFtYRl7yWGcZr0XeLDZknh2ZJHJadT+aDedwiYZUdxBdutea2yjuqOM8vSU1WNq66r20nh5qkSUcPV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759211968; c=relaxed/simple;
	bh=4VkQKrS6FikymCfZ1+5puhT+uYYqYYXhQgE3Hi/wt0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mbjsBILYdq13lz2BpkJocpALlciLTndfF5LRWoHUtjt5JHJgyKEbqtZrsmoXObFfbcwDm/3Y9jys9u8MGk/Ln5z0Ukg4x3ZCtFRzx8FiPEb45YDr1M/3Uw8W+ZU1I2C8IC5I4m8kA/7NbV/SDM2oaE+eRLwIt/6IOX9nE1ewSi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lst4y7dB; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lst4y7dB"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b5579235200so3956947a12.3
        for <linux-doc@vger.kernel.org>; Mon, 29 Sep 2025 22:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759211966; x=1759816766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bj30sQDVRkZpxPh0yEwciSjpXqkKKqMqk3AWrRPDElU=;
        b=Lst4y7dBYV6F49SB2gq8lqFojT9lOwA0/hTZKSmEvuQxysLhsV87b7g4LJefLfElOB
         sfhPeAqdMCa1mim0Pfbs57Tk1l7c/VUSNt6X7NoAAPi5IIeqQXjfLk3w+ae4psFPhEGc
         7fEDbFZMOUoUE1TNywu5tJ3vHacVJLuQ/2K/2fLOgTY+fbx4zEr4mEiU3zie2+h6UPB7
         JdQk4E1JmNrQaFaRWjvljdbEhFHg/0cXIzzAuRfz3RVSka5W3bjfvHKfwzJPRiw3iXga
         gkcaWuah+0QBWekZGSJu9z11IsewWc1eWQ5f8tAfE7wjkVwoKxFwOjskdL4mAMqN1jlF
         djVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759211966; x=1759816766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bj30sQDVRkZpxPh0yEwciSjpXqkKKqMqk3AWrRPDElU=;
        b=TMkPjnS6ts/tLHAm0Fl0w+rOHNCkDLVFs4/lrHwln8NioK2Ulh7Wbp8ZrfhZqywkPZ
         xQJCJoQY6D6E5jl/59aEAKc+16daEIcd3HqCnGXs9r95n7N3T3H1fnmJy7j2sYxfcHKX
         6dJINaZa0Tapp85cHrE/E5Wt1QSnvcikyou49oIczldliDPGQXdt6PHHiFMA04tK23R2
         VIpexTaAr1GN6UDYI+PiQq+CEyTgYAicdr57eGiyRXb6+dPLGlCxcMEAag6F+MZAHErX
         G4138ZU8yFvirlHM3MAmv/rHZ9H/QGvciaKgkOxnyhLZj5Fx86LFZrN1uVVGx0/B3jke
         4XlA==
X-Forwarded-Encrypted: i=1; AJvYcCVVjqC2ecE3atynStQ7G4GahjV/su9nJSkeJ97RiDilbHhMs6gbHl5ODByPA8tiT+agHGt7U/47hZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxSHp0dzsimtP5q6XO1obo1ecDGNTBIKpnQWZKc3dizgB5ICtb
	9mTWj5qXlvAvUSfAJhfQzKDqTt7Xnf5GufCehRYc4PRBgqWMQDfTXPZs
X-Gm-Gg: ASbGncuU94xZsgDe0HG/R4dLQy8B96Rsx/IJMYXxrYWntdq6bpuPdkMFbI1oNGYrOKP
	uUFxc/z1bRFKqEsO7mlyUYgUHOYLWe/p7tv81bkIqY764B6EZJtgDekbwIEBVj3nl5YL3wI8ovo
	9fi95WQRlXBucEsH7nxnqRbsM51l11xZ8RVWM2zZmNihFvu84wAK8BAUa2jNZI8diUtS+WNGi1t
	HZnJJI2TnJYBs59XAal4adP3+QsUv/qpXII14WvOicCsrqL911C9keoLhJEfSSbsqeF95dRwjpX
	+vUG2P+lUF/prmkKKiEbmiHqwwrOX0C/St7XhCgtZpsLWYaOye9HNgVb24t+saYqotQMyadrnCw
	Re3yfaPwxR/qJqanuzgjD1MQrIIdGIlLQ4asWu58K6X7MQK7hdd8DmyRxE6BwtZZQdy9mGQQvs0
	ygTRRaarJFt3J7tju6h+0BP4YbDqk5t9BJVM1rYw==
X-Google-Smtp-Source: AGHT+IEmo2u/7V63Fa+4aKjEO7zXO6V10zopA5XEUoYxrgliFdmiMUfOOebvAfkXMDqtGOOwYbddwQ==
X-Received: by 2002:a17:902:fc86:b0:269:8407:5ae3 with SMTP id d9443c01a7336-27ed4a60923mr250920865ad.54.1759211966029;
        Mon, 29 Sep 2025 22:59:26 -0700 (PDT)
Received: from localhost.localdomain ([61.171.228.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d43b8sm148834065ad.9.2025.09.29.22.59.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Sep 2025 22:59:25 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	hannes@cmpxchg.org,
	usamaarif642@gmail.com,
	gutierrez.asier@huawei-partners.com,
	willy@infradead.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	ameryhung@gmail.com,
	rientjes@google.com,
	corbet@lwn.net,
	21cnbao@gmail.com,
	shakeel.butt@linux.dev,
	tj@kernel.org,
	lance.yang@linux.dev,
	rdunlap@infradead.org
Cc: bpf@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v9 mm-new 04/11] mm: thp: decouple THP allocation between swap and page fault paths
Date: Tue, 30 Sep 2025 13:58:19 +0800
Message-Id: <20250930055826.9810-5-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20250930055826.9810-1-laoar.shao@gmail.com>
References: <20250930055826.9810-1-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The new BPF capability enables finer-grained THP policy decisions by
introducing separate handling for swap faults versus normal page faults.

As highlighted by Barry:

  We’ve observed that swapping in large folios can lead to more
  swap thrashing for some workloads- e.g. kernel build. Consequently,
  some workloads might prefer swapping in smaller folios than those
  allocated by alloc_anon_folio().

While prtcl() could potentially be extended to leverage this new policy,
doing so would require modifications to the uAPI.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Usama Arif <usamaarif642@gmail.com>
Cc: Barry Song <21cnbao@gmail.com>
---
 include/linux/huge_mm.h | 3 ++-
 mm/huge_memory.c        | 2 +-
 mm/memory.c             | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 02055cc93bfe..9b9dfe646daa 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -97,9 +97,10 @@ extern struct kobj_attribute thpsize_shmem_enabled_attr;
 
 enum tva_type {
 	TVA_SMAPS,		/* Exposing "THPeligible:" in smaps. */
-	TVA_PAGEFAULT,		/* Serving a page fault. */
+	TVA_PAGEFAULT,		/* Serving a non-swap page fault. */
 	TVA_KHUGEPAGED,		/* Khugepaged collapse. */
 	TVA_FORCED_COLLAPSE,	/* Forced collapse (e.g. MADV_COLLAPSE). */
+	TVA_SWAP_PAGEFAULT,	/* serving a swap page fault. */
 };
 
 #define thp_vma_allowable_order(vma, type, order) \
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 1ac476fe6dc5..08372dfcb41a 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -102,7 +102,7 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
 					 unsigned long orders)
 {
 	const bool smaps = type == TVA_SMAPS;
-	const bool in_pf = type == TVA_PAGEFAULT;
+	const bool in_pf = (type == TVA_PAGEFAULT || type == TVA_SWAP_PAGEFAULT);
 	const bool forced_collapse = type == TVA_FORCED_COLLAPSE;
 	unsigned long supported_orders;
 	vm_flags_t vm_flags = vma->vm_flags;
diff --git a/mm/memory.c b/mm/memory.c
index cd04e4894725..58ea0f93f79e 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4558,7 +4558,7 @@ static struct folio *alloc_swap_folio(struct vm_fault *vmf)
 	 * Get a list of all the (large) orders below PMD_ORDER that are enabled
 	 * and suitable for swapping THP.
 	 */
-	orders = thp_vma_allowable_orders(vma, TVA_PAGEFAULT,
+	orders = thp_vma_allowable_orders(vma, TVA_SWAP_PAGEFAULT,
 					  BIT(PMD_ORDER) - 1);
 	orders = thp_vma_suitable_orders(vma, vmf->address, orders);
 	orders = thp_swap_suitable_orders(swp_offset(entry),
-- 
2.47.3

