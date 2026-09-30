Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CED51A744
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 14:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777356; cv=none; b=i/uC2ZmKd2n1t6VyHpA11FODzPMe2eoNonWi0/FFae0pM2hsV/nA+s0luBz0DvguBJTM/gaXNNc3f5zOy/0dZ/fhqEzGYVjTWb4Lizk3qX3UC4gxSTcjvhEatT1O3eStvJIy3fpfn97pdbL2zCWLUcPx2eQeIXv+3wEnTTc/saM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777356; c=relaxed/simple;
	bh=nX2kpSagwvrXtZW4TuK/z8xDkCLKtHJmbCTdjNDQWHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kg/drSuk7VH1fcadhiV92i8CZzuy6/r4DoOfgywuBIJ87BKkcqs+yMf+Nex7UZRH1BOrae6fzBUgWNwey0skLPJetGR0NG2Tzj8/SEt0QYMuEVJ+XKo9YsDzoeL8b3uld0XWaOHQMb05EAmNiSNaXQVSOe/NQ8ZRvP3sHbPEwiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=CPvNa5bT; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="CPvNa5bT"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a49573b8bdso1623147a91.2
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 07:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790777337; x=1791382137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wFs7N1zg+/ZEZHxojTsBYZG7Bu1MLCx/OGkj1iEK8Us=;
        b=CPvNa5bT8g18MXtAWMzScWY+i5Gq7t6xctl1j2F3vWDDUtA3sSk9D22SZV+/zDQgpS
         BridnDolE5iyS2VTG9qhy+oDEKD5YLspZtj7ReTOE4B2CJJqX81/GzTR+4XNUyytkIJo
         I9JIPA7AkItpQw5xOh1PyGiaOXADk7lkeilJ7AEGpj1aatQUTwuCkJZPgDGFtuHRWCzW
         RLwTVx7APDh1rfq2SVMiiDtlV5wNh3/DHeVePvtj3mp/vNpRJ4cC6qB+mnzx9B+yyG//
         URK8T7pfv1zyt4Swvc0IX4uFsvnlqoJSv9E8ht6baEE/GiZ5+YfVaAN9b1GVcdbQJ/gv
         HQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777337; x=1791382137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wFs7N1zg+/ZEZHxojTsBYZG7Bu1MLCx/OGkj1iEK8Us=;
        b=abjfn0jCiW3/6mak/H9EiVSN8SE753YBVSfF4ref/SdzdYjTvzKrWVO5LCPm4n3fAk
         H1YOAB4FBnwt52S9Ik2AEqrq7ll7pS0mDEtEyrccUWEc/C3rt+zz70KKVrGspQA3DWlQ
         puGQW2yCYBXivxTW3RcIImFxz2LN/yc00YstQtr7+WYWza08HsN4fBeNN66MgG0JgYJ6
         Gvv2cILld8jp3ptDlQmqj2mEg84oHb27a6mG+cNeU6ZOAj8PDhcHanxg60GWZcPr6Pd+
         AgLr7VtuAuqF++9aigtaFxDf7w6k+G6lARK+1qhuxgXp0eKViZFe/IRj/vrUU16aDVyw
         oVVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjnLK60Bh8cEzvYshUOTJ9TxtOzOPm0NzUQTABmgKM90sbJAhdGXyIrCHFv3B4drJukIfkpelpjQE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXGid+toz6Jq1s1LJBgs4a6XgLtKpH2JMo6OXeEUBbRXP8VlS0
	zUAg3+qSEiLNVw2bF0ODCnj21hFY351ExLXJZpeRSlvaufaIN1EWNmKCiA4tjIEm+DM=
X-Gm-Gg: AYBFou09imDaBarBvHd6W0mvqNEn0QLGZ/axf+/ejQHysMPf3u3SkMgYxPIdcnnNCW0
	gQ3I7foVfPG0KLVEimthVtvIVRntJvn8PZE4hIWQg9WcoO4u1soU45NQgal90Z9+FAD5x2Oelks
	vSPCw/oaesDURVEWqtYW92EMXyL3dPUXC1UnzYdOjyWSJChbJ4CwZMRGQueF0i4d/r4thtmA3EL
	irIIzS6qENDJjIZgBKT9DpAALOX6cx60jfv7E/ZgdW+bQIjQHu/KHRk/DT84tEW+Hwaqqi+Fxi9
	K+/iHLajpSk8hr0vQuNnBc4lOatJ5fjLzszEdyvvAZIaqxGppBZopeXFblWzvW2Ahan9zlYWxn9
	QQqYXbjB9t3yiDcYMhh+B2gsIzdtwpeuIMmfPRTQUiowLCjxTxJc2kiUR8I8cmbj4QBQ4MbQ64K
	/xGxq9fgN5R6MOofj9clIvZmLyp20a9BLAttmdRiAAZBHgTtNh0HflmKsNNkhbvYr74M+nuOOhj
	o0zV1AJ7TC8IoPrDac7eUCJ
X-Received: by 2002:a17:90b:3ccb:b0:39e:6a80:b796 with SMTP id 98e67ed59e1d1-3a4d18c4d32mr1414859a91.38.1790777336778;
        Wed, 30 Sep 2026 07:08:56 -0700 (PDT)
Received: from G6L4RL2QG9 ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4e60ea12csm639509a91.1.2026.09.30.07.08.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 07:08:55 -0700 (PDT)
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
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v6 12/12] Documentation/mm: update DAX vmemmap deduplication docs
Date: Wed, 30 Sep 2026 22:06:27 +0800
Message-ID: <20260930140627.57431-13-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260930140627.57431-1-songmuchun@bytedance.com>
References: <20260930140627.57431-1-songmuchun@bytedance.com>
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
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v6:
- Collect Acked-by from David Hildenbrand

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

