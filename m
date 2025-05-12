Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6532529290D
	for <linux-doc@vger.kernel.org>; Mon, 12 May 2025 16:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747066929; cv=none; b=aHiRiVJ2g5OXFsTXk8psXa8dqhyBkY7Wf09oU7lijqBbIqa7bjaMbuYDD+KckRmlASj1kaK3GTqEgerEvagzKPiRZajKtu4Ht93RkhKXCbwg827R2lNPeHwUK3gwxwXt1n76SypSFCCNzSOIX04X5tto1BMb8PiAdfeNGj0qpLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747066929; c=relaxed/simple;
	bh=C+4bukmEyuUogjFKJzPVkC+0PLpktTTguS9gLaYvHGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ESbibEbC0H/qQS40Rw6nMuA0AvfySCTeRmh6nAPYsPbmDB4NBODKdF5LAdlSr83badH6/FKtuLbOjJhN4LOssOegvXV/KayE2VT1EB/13W2zBZ64JQqP+jpVKuHslzIV0GWoId+3rV/BTNBuhD3HZlGU82rX/aBSj/dwgnnj+As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=j1uN6XYM; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="j1uN6XYM"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c55500cf80so469419385a.1
        for <linux-doc@vger.kernel.org>; Mon, 12 May 2025 09:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1747066925; x=1747671725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTTxOKtOTvxz/X6EnOnjuA5x3BeIonRn1m9gLvf8T78=;
        b=j1uN6XYMkXQr1Ef4pnhT81/B2aFvhR9IYRwrf7OnT/XdMNgSgJGFRJkgqB6Ny4p3v0
         qEVcEuzodEC/5ZhaSueNRmjlDlLK35QiycRkZ25q9AkOFaLaG5IdeyYRNe8AWE9OmxHt
         Yiqgj6iJ9cbYk5NvlOC8yDj/X98NXJt/REQKaxmtLT/c0BDSp4yhpwoBAqeiKwqZh6Hi
         4F4IZVKyP50dNN59WnNpKu/PWcnng0rujfZCzBG2kfF21S5B3wpg1QaFiqDB20cKDmFF
         lcF55ErNc2mUL+07j0T4ptplrOTQK1pek68V5kpxRtkSqor+eG9hyBEOiWWm1tuOo50u
         Wvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747066925; x=1747671725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTTxOKtOTvxz/X6EnOnjuA5x3BeIonRn1m9gLvf8T78=;
        b=Mr9Tw3HwM5stxUhnBBH8GEYOaq9A8pjke5ANj2FekNW1Xl5h9G/ahl1gsC29K6G2Xn
         ST+Eh0B1OYFk9EkaEm3SQ6W0io4UatFkB+NqY2ce4CYK5q5KTy8GUSiY63+kc+g51QM4
         V8a2Tr+xVL5S7ga4pjZg6V9eMKszUhEZFlmdB2bsPerNXTViGDgKpxbePw4NZZsxBLZC
         HR1Dd0mFfZg4EkBFJdUgZW82wSIYwnjbVffNdFoPnJLV+Pd/KUhtyNY0u8SK23SIRHoT
         Sd67mFEbnFqdYeRiJBtdOlDKPn9xuRY6C2XH71ankT5cOGVFnJfJRQ/UoZxLJR4ZtqZW
         l/wg==
X-Gm-Message-State: AOJu0YwoGOsgJhhOvCvTMaxC7c5mCr3ya5vatzF/da6TAutmZqXOno74
	wwant68jxOTMu+as4mnhe2WC0I0U7qGrbShNoBySJRsCoG+qFBsY9hdXKuo+3z4=
X-Gm-Gg: ASbGncv8M/XNqIeCBDgaulmEWubgat9h1CnAR7msEt6BUNK1OIymr9TuDLE9Qamxgqa
	Vl9KeCIKNlhuA/DajfhDq/swK94JLTeRoADd0pLNLG9vxj/oyhDkUaZWi0uP7gnFKcNtHNuvJ2D
	NPyKW9hl30ced5YjU6mumIgoX3kxCwLHIUG69kU0mqDT7NpflwMk8j+b6Q1tFYPNTyQgq8BWN9r
	0jaPNIgQfts5nY72QxQrL/Z5v95kGl3k12talwGPUo65q1hwIUqr4bZZFmKJBM0iuQl8OGcnRw9
	Ps9e8uiRfDO4jMt3CfNZ4LrxEAvYnaIt5vni0m4rmJ5sz6Es8D6Y/3uoL8pZSBIIihUH1I0Y6MG
	LT+WlM8kfxdmkSeLt1fXLFi+dXLhfJ8sDy6IX
X-Google-Smtp-Source: AGHT+IHV0UN/KhozVIrARpAytA6jarV108Aoyqsz27PknFZSu3HGQ8itoHJAY+cqjXAR3dS9EUlrqQ==
X-Received: by 2002:a05:620a:4403:b0:7c5:9a6c:b7d3 with SMTP id af79cd13be357-7cd01157590mr2261077885a.37.1747066924959;
        Mon, 12 May 2025 09:22:04 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49452583961sm52461791cf.58.2025.05.12.09.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:22:04 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-cxl@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	dave@stgolabs.net,
	jonathan.cameron@huawei.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	vishal.l.verma@intel.com,
	ira.weiny@intel.com,
	dan.j.williams@intel.com,
	corbet@lwn.net
Subject: [PATCH v3 15/17] cxl: docs/allocation/reclaim
Date: Mon, 12 May 2025 12:21:32 -0400
Message-ID: <20250512162134.3596150-16-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512162134.3596150-1-gourry@gourry.net>
References: <20250512162134.3596150-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document a bit about how reclaim interacts with various CXL
configurations.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 .../driver-api/cxl/allocation/reclaim.rst     | 51 +++++++++++++++++++
 Documentation/driver-api/cxl/index.rst        |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/driver-api/cxl/allocation/reclaim.rst

diff --git a/Documentation/driver-api/cxl/allocation/reclaim.rst b/Documentation/driver-api/cxl/allocation/reclaim.rst
new file mode 100644
index 000000000000..f40f1cae391a
--- /dev/null
+++ b/Documentation/driver-api/cxl/allocation/reclaim.rst
@@ -0,0 +1,51 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======
+Reclaim
+=======
+Another way CXL memory can be utilized *indirectly* is via the reclaim system
+in :code:`mm/vmscan.c`.  Reclaim is engaged when memory capacity on the system
+becomes pressured based on global and cgroup-local `watermark` settings.
+
+In this section we won't discuss the `watermark` configurations, just how CXL
+memory can be consumed by various pieces of reclaim system.
+
+Demotion
+========
+By default, the reclaim system will prefer swap (or zswap) when reclaiming
+memory.  Enabling :code:`kernel/mm/numa/demotion_enabled` will cause vmscan
+to opportunistically prefer distant NUMA nodes to swap or zswap, if capacity
+is available.
+
+Demotion engages the :code:`mm/memory_tier.c` component to determine the
+next demotion node.  The next demotion node is based on the :code:`HMAT`
+or :code:`CDAT` performance data.
+
+cpusets.mems_allowed quirk
+--------------------------
+In Linux v6.15 and below, demotion does not respect :code:`cpusets.mems_allowed`
+when migrating pages.  As a result, if demotion is enabled, vmscan cannot
+guarantee isolation of a container's memory from nodes not set in mems_allowed.
+
+In Linux v6.XX and up, demotion does attempt to respect
+:code:`cpusets.mems_allowed`; however, certain classes of shared memory
+originally instantiated by another cgroup (such as common libraries - e.g.
+libc) may still be demoted.  As a result, the mems_allowed interface still
+cannot provide perfect isolation from the remote nodes.
+
+ZSwap and Node Preference
+=========================
+In Linux v6.15 and below, ZSwap allocates memory from the local node of the
+processor for the new pages being compressed.  Since pages being compressed
+are typically cold, the result is a cold page becomes promoted - only to
+be later demoted as it ages off the LRU.
+
+In Linux v6.XX, ZSwap tries to prefer the node of the page being compressed
+as the allocation target for the compression page.  This helps prevent
+thrashing.
+
+Demotion with ZSwap
+===================
+When enabling both Demotion and ZSwap, you create a situation where ZSwap
+will prefer the slowest form of CXL memory by default until that tier of
+memory is exhausted.
diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index 7acab7e7df96..d3ab928d4d7c 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -46,5 +46,6 @@ that have impacts on each other.  The docs here break up configurations steps.
 
    allocation/dax
    allocation/page-allocator
+   allocation/reclaim
 
 .. only::  subproject and html
-- 
2.49.0

