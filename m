Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E15197A7D
	for <linux-doc@vger.kernel.org>; Sun, 27 Sep 2026 02:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477754; cv=none; b=lPzUBZoxUx0cbUaUwGzRo6DaZQsjRdZ1XoTonedLMhiHWPKE2hoMrXrv6Yyr4fCbuFVNT1A8i9ycQ+dKH14/ub9XAXn/aqAUx4Tp4au00sykxq+MnYuWiZBJOFB8IReG1Nn+itZ+6GEG2TnyHaOnm7KOty1CWwUT0Bjf/QKhQwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477754; c=relaxed/simple;
	bh=SzfK6CJnam9Dg4BVTpagUZL4n3gDBm63Y+qtGXTWOqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LRwyqzDlzxql511ZAO8D47Lo/J3VzF2t3v1pX9UbmN5FT1iclbneRZQJ0IPIXhjVSo2tEk45IsI4/PG6VCi1bFiUSjbHx0nUGxDEVFldyctraOnIZthejm7akDMbMN6kWWM37p8nyBrSOVY/uPhYQzPFI/FtVaRwnaERT/whWcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=DMZEu55R; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="DMZEu55R"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a0dc47fee0so392339a91.1
        for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 19:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790477751; x=1791082551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zUhtpwjDYsFhZVHLtQ8dC1wt8tqWIMzZ7omgfR51vXw=;
        b=DMZEu55Rkb+OspXI6D/9zwxiBqfW4g3Urf/udjbCRSviBBH1O5bWy6+dXJJKz6klut
         4U3UyB7G1cCoCVB97EK1kmgZfMumjoEo8xmf9/r0Hqf7dlnJGFsvUmjnbMM+k/02sE+l
         UfDJE0YgHzNaiFB+5AiW4pJxOLxQCoN6z5lMp4DdYje95FJALzBlVH1IaP+DPUj1E0SF
         KL9m4nV+siU72tfiocM3eQ++DfaleRBma2Ydb/+l3hk6d9FYeCwW48Xni8RheJotCuVM
         uDubPtg1qv/btgNaqeUPDJDMWpFgeYrboHhHMQLCztYHlSJ2xkTC/xhYo6fQ3qwd/wYB
         JtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477751; x=1791082551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zUhtpwjDYsFhZVHLtQ8dC1wt8tqWIMzZ7omgfR51vXw=;
        b=lVO52yunIBh1E6/v5cIyXiDCgir7muZvxVlIvnEa7RFvZKgtJYaoiPzwYeW3QNC81S
         wzf0/sVpyu03UhkjprLLsQp3CTtJ6oIg3/6DVhcLBsZlATaQQNHei8gWchckcCQpTeRq
         1LcdTC+lIHTEmgzUmQWYqveHHHcHJQYNr0H5JkZFQZAcJOFH2uaPRMk689nugdiUL2qJ
         hO1yeFMTiHCTrzZzVIW3VdVFgfUbo+c40AtXeiZe1TVVtsuJi4WyIIWM1nQRrWCRa1/y
         jztmddvDSa5QyRdpOVWZ2IOd21sRnGDdplRr+46iz+DeYuw/IbL4Yy1QnWLg50ovaPf1
         1aGw==
X-Forwarded-Encrypted: i=1; AKwUvBxcU87Pxp78b4dB1I98zivu5CiH3hK2iQnzicY8vW1VYQvxskGtLJrpVeMLxi2IWXQ9wjt5CnnTrDg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKLMzPxepRNJN1QXjdKBTZWlaQpY/KRdYU1jJsbX/1A+Ybeu2w
	7W77kbn/QI0mW5g7++krFuwh3ntf+EQyL/a+EbxPv0NzrK/cq/Jp9ih8BVKTLHq27VU=
X-Gm-Gg: AYBFou0vX0OxnvLrH7/E6M/HwibensqdwO8xqN6RaA/u2bO5tj4lQ/3nxQxHUGTqdgJ
	3OMmHHtq84mLeGUs57OuHaBcZzLoZTrofSa24CJTMDmgrTgGiZ0Aff00jt0k3oTM/tibmoaD7zP
	hCN/SLs0vo16rPimyMTCc2lv9r/IlzZqzMDbyk9T3eR/sl66seMcUkmdI4Y4yxI9EzwE5A3Lilw
	MHm9BUGELxfXJRMnGgbCFXE9AHJT5DIiUttxNwXJTPsu2xyZpiTfRwg7NOl4A7SHpda41/Hjrmq
	N0YAyYRxpBWq2PfHZUNjS1PW8l6I9kZL4eDSY03SXrF6MNVi3H5mV7dpT4pb2Wwb0NT6guoVbu3
	d2zL8m7OsWVwGDs6xJr0YV9ysHIZpLtH+4AzwOjR1zwoHfPmBS8sa2eaTuPH7KLBNa/e+4Gj2OC
	jH/wcp89FLhWIAc0MYhWiIja6l9I+vZbRBKnnDJ6ZPQ7piWWZJ/d7mC4BVD0hHAscCmT6hsrraG
	s/sXW+du4VeJE2JU+Hd
X-Received: by 2002:a17:90b:580d:b0:39e:6c69:f47e with SMTP id 98e67ed59e1d1-3a098d4ec7amr8377687a91.61.1790477751333;
        Sat, 26 Sep 2026 19:55:51 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm13461377a91.1.2026.09.26.19.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:55:50 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v5 12/12] Documentation/mm: update DAX vmemmap deduplication docs
Date: Sun, 27 Sep 2026 10:54:41 +0800
Message-ID: <20260927025441.741633-13-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927025441.741633-1-songmuchun@bytedance.com>
References: <20260927025441.741633-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device DAX now uses the common per-zone shared tail page for vmemmap
deduplication. The old documentation still described a DAX-specific
layout with a separately populated tail vmemmap page and half the HugeTLB
savings.

Update the generic and powerpc documentation to describe the shared layout.
In the powerpc document, keep the radix and 64K-specific details, drop the
duplicated 4K PUD arithmetic, and replace the repeated device-dax diagrams
with a single parameterized PMD/PUD diagram.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v3:
- Collect Acked-by from Qi Zheng

v2:
- Clarify the commit message to state that the 4K PUD arithmetic is
  intentionally dropped reported by Sashiko.
---
 Documentation/arch/powerpc/vmemmap_dedup.rst | 90 ++++----------------
 Documentation/mm/vmemmap_dedup.rst           | 32 +------
 2 files changed, 21 insertions(+), 101 deletions(-)

diff --git a/Documentation/arch/powerpc/vmemmap_dedup.rst b/Documentation/arch/powerpc/vmemmap_dedup.rst
index dc4db59fdf87..8286acbca9bc 100644
--- a/Documentation/arch/powerpc/vmemmap_dedup.rst
+++ b/Documentation/arch/powerpc/vmemmap_dedup.rst
@@ -19,82 +19,28 @@ With 1G PUD level mapping, we require 16384 struct pages and a single 64K
 vmemmap page can contain 1024 struct pages (64K/sizeof(struct page)). Hence we
 require 16 64K pages in vmemmap to map the struct page for 1G PUD level mapping.
 
-Here's how things look like on device-dax after the sections are populated::
- +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
- |           |                     |     0     | -------------> |     0     |
- |           |                     +-----------+                +-----------+
- |           |                     |     1     | -------------> |     1     |
- |           |                     +-----------+                +-----------+
- |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
- |           |                     +-----------+                   | | | | |
- |           |                     |     3     | ------------------+ | | | |
- |           |                     +-----------+                     | | | |
- |           |                     |     4     | --------------------+ | | |
- |    PUD    |                     +-----------+                       | | |
- |   level   |                     |     .     | ----------------------+ | |
- |  mapping  |                     +-----------+                         | |
- |           |                     |     .     | ------------------------+ |
- |           |                     +-----------+                           |
- |           |                     |     15    | --------------------------+
- |           |                     +-----------+
- |           |
- |           |
- |           |
- +-----------+
-
-
 With 4K page size, 2M PMD level mapping requires 512 struct pages and a single
 4K vmemmap page contains 64 struct pages(4K/sizeof(struct page)). Hence we
 require 8 4K pages in vmemmap to map the struct page for 2M pmd level mapping.
 
-Here's how things look like on device-dax after the sections are populated::
-
- +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
- |           |                     |     0     | -------------> |     0     |
- |           |                     +-----------+                +-----------+
- |           |                     |     1     | -------------> |     1     |
- |           |                     +-----------+                +-----------+
- |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
- |           |                     +-----------+                   | | | | |
- |           |                     |     3     | ------------------+ | | | |
- |           |                     +-----------+                     | | | |
- |           |                     |     4     | --------------------+ | | |
- |    PMD    |                     +-----------+                       | | |
- |   level   |                     |     5     | ----------------------+ | |
- |  mapping  |                     +-----------+                         | |
- |           |                     |     6     | ------------------------+ |
- |           |                     +-----------+                           |
- |           |                     |     7     | --------------------------+
- |           |                     +-----------+
- |           |
- |           |
- |           |
- +-----------+
-
-With 1G PUD level mapping, we require 262144 struct pages and a single 4K
-vmemmap page can contain 64 struct pages (4K/sizeof(struct page)). Hence we
-require 4096 4K pages in vmemmap to map the struct pages for 1G PUD level
-mapping.
-
-Here's how things look like on device-dax after the sections are populated::
-
- +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
- |           |                     |     0     | -------------> |     0     |
- |           |                     +-----------+                +-----------+
- |           |                     |     1     | -------------> |     1     |
- |           |                     +-----------+                +-----------+
- |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
- |           |                     +-----------+                   | | | | |
- |           |                     |     3     | ------------------+ | | | |
- |           |                     +-----------+                     | | | |
- |           |                     |     4     | --------------------+ | | |
- |    PUD    |                     +-----------+                       | | |
- |   level   |                     |     .     | ----------------------+ | |
- |  mapping  |                     +-----------+                         | |
- |           |                     |     .     | ------------------------+ |
- |           |                     +-----------+                           |
- |           |                     |   4095    | --------------------------+
- |           |                     +-----------+
+Here's how things look on device-dax after vmemmap-optimized sections are
+populated. ``N`` is the number of vmemmap pages required by the DAX mapping
+above::
+
+  Device DAX                  vmemmap pages (N pages)         backing page frames
+ +-----------+ ---virt_to_page---> +-----------+   mapping to   +-------------+
+ |           |                     |     0     | -------------> |      0      |
+ |           |                     +-----------+                +-------------+
+ |           |                     |     1     | ------+
+ |           |                     +-----------+       |
+ |           |                     |     2     | ------+
+ |           |                     +-----------+       |
+ |           |                     |     .     | ------+        +-------------+
+ |  PMD/PUD  |                     +-----------+       |        | A single,   |
+ |   level   |                     |     .     | ------+------> | per-zone    |
+ |  mapping  |                     +-----------+       |        | shared tail |
+ |           |                     |   N - 1   | ------+        | page        |
+ |           |                     +-----------+                +-------------+
  |           |
  |           |
  |           |
diff --git a/Documentation/mm/vmemmap_dedup.rst b/Documentation/mm/vmemmap_dedup.rst
index 9fa8642ded48..8c287ae3f86c 100644
--- a/Documentation/mm/vmemmap_dedup.rst
+++ b/Documentation/mm/vmemmap_dedup.rst
@@ -1,4 +1,3 @@
-
 .. SPDX-License-Identifier: GPL-2.0
 
 =========================================
@@ -192,32 +191,7 @@ to 4 on HugeTLB pages.
 
 There's no remapping of vmemmap given that device-dax memory is not part of
 System RAM ranges initialized at boot. Thus the tail page deduplication
-happens at a later stage when we populate the sections. HugeTLB reuses the
-the head vmemmap page representing, whereas device-dax reuses the tail
-vmemmap page. This results in only half of the savings compared to HugeTLB.
-
-Deduplicated tail pages are not mapped read-only.
+happens at a later stage when we populate the sections.
 
-Here's how things look like on device-dax after the sections are populated::
-
- +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
- |           |                     |     0     | -------------> |     0     |
- |           |                     +-----------+                +-----------+
- |           |                     |     1     | -------------> |     1     |
- |           |                     +-----------+                +-----------+
- |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
- |           |                     +-----------+                   | | | | |
- |           |                     |     3     | ------------------+ | | | |
- |           |                     +-----------+                     | | | |
- |           |                     |     4     | --------------------+ | | |
- |    PMD    |                     +-----------+                       | | |
- |   level   |                     |     5     | ----------------------+ | |
- |  mapping  |                     +-----------+                         | |
- |           |                     |     6     | ------------------------+ |
- |           |                     +-----------+                           |
- |           |                     |     7     | --------------------------+
- |           |                     +-----------+
- |           |
- |           |
- |           |
- +-----------+
+Deduplicated tail pages are not mapped read-only. The mapping layout is the same
+as HugeTLB.
-- 
2.54.0

