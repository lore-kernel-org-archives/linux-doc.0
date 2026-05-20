Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C0E4A35
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 05:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779254308; cv=none; b=J2MymmyRH4/JZ5F57iez3NdVk0/KfIc5rrgs8VRGnoyeZOTjFH0UeBiBRdSbWkmH0l7JKr8vbjkWIrQVZTLVy5YXMi+K3E/fRfmkVcPp+RJemMLKu142F5R/Rt/88w8MOQkBBpnTcwHzHbD4jlPhgbEAcjwAKhkuYtdiPjer6os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779254308; c=relaxed/simple;
	bh=fq/G2WSuDwOQu4rGKszvteAOVLN+S2GEqf4d6e6vrlI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IHsha+b0Ui6fsh5rSqcn04SH6KSWPE0DKK1WTXc9B+pFs/Ns7lfR4TTsFG2tDrmufgdydD9sRBDG4gmBwQTn42UFK4Bp8+bxPDQ/fmdDMWh1fGUj/ZMisC6SlYUBM9fW9IZwYga8lt8taHZ0DZLkRsoYsb7IfZBUTDo8N3Ps/Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EH7Dr2J0; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EH7Dr2J0"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779254303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/E4hFESlDCdSBASIA3b9qAiiFnYXUPh4BPJLjM7N8tU=;
	b=EH7Dr2J04zATUyPgXeEnCfnrz1SI2JtndYoYjIc2DbUJOrvYi2SL/4ajiiSfEzoyfl23+2
	mS5OechCDtfChNNuivnaHzfjVq+wJF6luh7kW608rpIAfsHb+Vd3LVC+YeDdVd6XCSF5de
	b/ql8gIaL1HakD3QojO5/nQ23N0JwEA=
From: Leon Hwang <leon.hwang@linux.dev>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leon Hwang <leon.hwang@linux.dev>
Subject: [PATCH mm-new] Documentation/admin-guide/mm: Fix typos in transhuge.rst
Date: Wed, 20 May 2026 13:17:51 +0800
Message-ID: <20260520051751.74396-1-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Fix these two typos:

1. approporiately -> appropriately
2. presure -> pressure

Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 Documentation/admin-guide/mm/transhuge.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
index fc0127a36ef6..78a1b341a3b5 100644
--- a/Documentation/admin-guide/mm/transhuge.rst
+++ b/Documentation/admin-guide/mm/transhuge.rst
@@ -57,7 +57,7 @@ prominent because the size of each page isn't as huge as the PMD-sized
 variant and there is less memory to clear in each page fault. Some
 architectures also employ TLB compression mechanisms to squeeze more
 entries in when a set of PTEs are virtually and physically contiguous
-and approporiately aligned. In this case, TLB misses will occur less
+and appropriately aligned. In this case, TLB misses will occur less
 often.
 
 THP can be enabled system wide or restricted to certain tasks or even
@@ -211,7 +211,7 @@ PMD-mappable transparent hugepage::
 	cat /sys/kernel/mm/transparent_hugepage/hpage_pmd_size
 
 All THPs at fault and collapse time will be added to _deferred_list,
-and will therefore be split under memory presure if they are considered
+and will therefore be split under memory pressure if they are considered
 "underused". A THP is underused if the number of zero-filled pages in
 the THP is above max_ptes_none (see below). It is possible to disable
 this behaviour by writing 0 to shrink_underused, and enable it by writing
-- 
2.54.0

