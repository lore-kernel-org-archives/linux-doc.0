Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8763FE4
	for <linux-doc@vger.kernel.org>; Thu,  2 Jan 2025 06:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735800974; cv=none; b=KSVNJ+c7jVaywXLG4StM0GgSAwifsAHAFLP5o9wx0qhbDk2UujQN6mXeEJMoFpLiEVn8e5QPaHnQVFZHH5x9ppxx1/8m023B1sTzOJ3PDFpWiOiwd0UsHWkrpNBhDJLlKReZAZGs6qiQlf3yIZu5944Ss0ToTuBd6LHjMsWVKR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735800974; c=relaxed/simple;
	bh=0gDW088d7CLfvK66vLEBR48uHaN95rqDbDzOk1emwJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=SuH7iwXtuV7Hb0xZaCiWC7XcsSE7j4E9spKEOgL/2v14MpSw0OA0YlD2jfnKgWExQH1S00QwZmxOXshmj0O9v+xRlj/4reN93J7T9/jPcfBo/HXxfjcigejJ5OPqj+O0sw+fNG9xnmejRPA1nZl6Kdtpq3yt3sUybkdALhTLaw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=m8Gq+02V; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="m8Gq+02V"
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250102065608epoutp045746e8817f54e15299af5a80618f35bb~WzcjS-8KF2338423384epoutp04E
	for <linux-doc@vger.kernel.org>; Thu,  2 Jan 2025 06:56:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250102065608epoutp045746e8817f54e15299af5a80618f35bb~WzcjS-8KF2338423384epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1735800968;
	bh=sNEFbUB8zkEiOY+7siydPf06XIZN3M0pujEkAF8JWKg=;
	h=From:To:Cc:Subject:Date:References:From;
	b=m8Gq+02V5thMeV0+V7yRMqPtKsWWOz4WngveGYkSMF0N0PCLdnyQ0mHXEsLMz4708
	 HIFNW/irEhnqjeV5K/Q2+70iW1hQOQvPrAmjqZosbk0m555g/HWv1LNWRD0aUsjFO0
	 m6nZzcR1XHQ12fZ99AfX+fZIdFathgwc48RxR8Vs=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250102065608epcas1p254a56b40f1c2d8a0294d221363c825cb~WzcjB92qO1051810518epcas1p2A;
	Thu,  2 Jan 2025 06:56:08 +0000 (GMT)
Received: from epsmgec1p1-new.samsung.com (unknown [182.195.36.224]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4YNyCr02Wfz4x9Pq; Thu,  2 Jan
	2025 06:56:08 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
	epsmgec1p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	CB.96.31735.78836776; Thu,  2 Jan 2025 15:56:07 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250102065607epcas1p296c550a7ba26884e1c2810f872e537f4~WzciQ4CEy1331213312epcas1p2u;
	Thu,  2 Jan 2025 06:56:07 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250102065607epsmtrp13b215c3c8fdd22b0bed816425b19b8f5~WzciQIYc82835228352epsmtrp1L;
	Thu,  2 Jan 2025 06:56:07 +0000 (GMT)
X-AuditID: b6c32a4c-4e33d24000007bf7-73-677638872764
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	4A.D1.18729.78836776; Thu,  2 Jan 2025 15:56:07 +0900 (KST)
Received: from localhost.localdomain (unknown [10.253.105.252]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250102065607epsmtip28bf1b259f7ff31a9f81095f26868ac2f~WzciEPlfK2521325213epsmtip2B;
	Thu,  2 Jan 2025 06:56:07 +0000 (GMT)
From: Sangmoon Kim <sangmoon.kim@samsung.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
	<will@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Sangmoon Kim <sangmoon.kim@samsung.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: arm64: update memory layout for vmemmap region
Date: Thu,  2 Jan 2025 15:52:37 +0900
Message-ID: <20250102065554.1533781-1-sangmoon.kim@samsung.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFKsWRmVeSWpSXmKPExsWy7bCmvm67RVm6wdapVhbvl/UwWjw50M5o
	senxNVaLhW1LWCwu75rDZnHrQSOLRcsdUwd2jzXz1jB6bFrVyeaxeUm9x+K+yawefVtWMXp8
	3iQXwBaVbZORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6DrlpkD
	dImSQlliTilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8CsQK84Mbe4NC9dLy+1xMrQwMDI
	FKgwITtjydsjrAXXJSv+brvC2MDYLdrFyMEhIWAicanDtYuRi0NIYA+jxO6WKWwQzidGiWvn
	L7NAON8YJS5u2gWU4QTr+Df7KyOILSSwl1GifxdU0RdGib2PH7KAJNgEdCW+zLsMViQiUCCx
	cs9OJpAiZoE+RokF746zg+wWFnCV+HHLCaSGRUBV4tCHZewgNq+AvcS0FxPZIZbJS0xa08oM
	EReUODnzCdh8ZqB489bZzCAzJQSusUtMO3CCEaLBRWL2ot3MELawxKvjW6AGSUm87G9jh2jo
	Z5Q41d3FApGYwigx95omhG0s0dtzgRnkOGYBTYn1u/QhlvFJvPvawwoJL16JjjYhiGo1icev
	7kKtlZHovzMfaqKHxOZlr5khARQrsWnfZ7YJjHKzkLwwC8kLsxCWLWBkXsUolVpQnJuemmxY
	YKibl1oOj8zk/NxNjOBEqOWzg/H7+r96hxiZOBgPMUpwMCuJ8EaEl6QL8aYkVlalFuXHF5Xm
	pBYfYjQFBuxEZinR5HxgKs4riTc0sTQwMTMysTC2NDZTEuc9c6UsVUggPbEkNTs1tSC1CKaP
	iYNTqoEp6uL+5H2Ce/m2NNdbJyhs8za9MHeapKT8pC3rVnSJlJ+o/3rj+Tz7uFmfDn8TjWhg
	iuZak2rEeX/CvAcl95uEuLnmLD+yUbafR1RPt2qX5Zq3Nd16aTudt5kqTbKyy3R6yM67Z93v
	IttyJYfpsxds0bo3TXr6TBuuzacf7Svn25K72f6qsu0O46aTbG+Liy25DHctPjPl4cSHx2ND
	PvjPZmBQdpKT9Ixc2T3zsM+5qRqv13U2uHb5nnnLaPIpWi3P8/Hd9T1OJ5uXCX+MlPuzfJ1D
	IfetpN1L+ldNmnTBcsnCV5ONWl8c+P9g9fwzhUdLBJwNg38dsOR43jy3yvNb7Bb1pULpPe7p
	umc7VpjvV2Ipzkg01GIuKk4EAJcYIWgNBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrILMWRmVeSWpSXmKPExsWy7bCSvG67RVm6wblfyhbvl/UwWjw50M5o
	senxNVaLhW1LWCwu75rDZnHrQSOLRcsdUwd2jzXz1jB6bFrVyeaxeUm9x+K+yawefVtWMXp8
	3iQXwBbFZZOSmpNZllqkb5fAlbHk7RHWguuSFX+3XWFsYOwW7WLk5JAQMJH4N/srYxcjF4eQ
	wG5Gic1nj7BCJGQkdl7czNTFyAFkC0scPlwMUfMJqOZTOztIDZuArsSXeZcZQWwRgSKJ1Rv/
	MoEUMQtMYJToubSRFaRZWMBV4sctJ5AaFgFViUMfloH18grYS0x7MZEdYpe8xKQ1rcwQcUGJ
	kzOfsIDYzEDx5q2zmScw8s1CkpqFJLWAkWkVo2RqQXFuem6xYYFhXmq5XnFibnFpXrpecn7u
	JkZwqGpp7mDcvuqD3iFGJg7GQ4wSHMxKIrwR4SXpQrwpiZVVqUX58UWlOanFhxilOViUxHnF
	X/SmCAmkJ5akZqemFqQWwWSZODilGpjUZ69s0zN8udJYeT9Hx+mnd6LVpEz2eK62jpsZYlj0
	5/zT6+ptqanfdk/aqBca1R+7UyRTRWhCg+zM2X7BcUGfVYUMF7f9y/HO8rywNveA5L1t53l2
	hAR7zDqwYtvKRAO534uFPJadO3DI+Ma+DX9trgrdiE848KmqIvXCueuqzIttJgsI8xd/3pHU
	2bXv5d9PQZHTMjZXlKVd/1JeccGsflqKptLnwO171ke9tfr55KMQy4l98xZVqj2Z+rNCylzy
	5+6py/kUpbP7apccOJRv6WsetTvJWXrFZwG2xDKWreommwpvms8LXP/b4PbUSW1LMnbYfeK4
	umBmZebzK65u96pvnZ5XVHGO95lx6L+TSizFGYmGWsxFxYkA+bVu18QCAAA=
X-CMS-MailID: 20250102065607epcas1p296c550a7ba26884e1c2810f872e537f4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250102065607epcas1p296c550a7ba26884e1c2810f872e537f4
References: <CGME20250102065607epcas1p296c550a7ba26884e1c2810f872e537f4@epcas1p2.samsung.com>

Commit 031e011d8b22 ("arm64: mm: Move PCI I/O emulation region above
the vmemmap region") and commit b730b0f2b1fc ("arm64: mm: Move fixmap
region above vmemmap region") have placed PCI I/O and fixmap region
above vmemmap region.

And commit 32697ff38287 ("arm64: vmemmap: Avoid base2 order of struct
page size to dimension region") has moved vmemmap region to higher
address.

Update document as the memory layout modified by the previous patches.

Signed-off-by: Sangmoon Kim <sangmoon.kim@samsung.com>
---
 Documentation/arch/arm64/memory.rst | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/arch/arm64/memory.rst b/Documentation/arch/arm64/memory.rst
index 8a658984b8bb..43c15cea2ec9 100644
--- a/Documentation/arch/arm64/memory.rst
+++ b/Documentation/arch/arm64/memory.rst
@@ -32,13 +32,13 @@ AArch64 Linux memory layout with 4KB pages + 4 levels (48-bit)::
   ffff000000000000	ffff7fffffffffff	 128TB		kernel logical memory map
  [ffff600000000000	ffff7fffffffffff]	  32TB		[kasan shadow region]
   ffff800000000000	ffff80007fffffff	   2GB		modules
-  ffff800080000000	fffffbffefffffff	 124TB		vmalloc
-  fffffbfff0000000	fffffbfffdffffff	 224MB		fixed mappings (top down)
-  fffffbfffe000000	fffffbfffe7fffff	   8MB		[guard region]
-  fffffbfffe800000	fffffbffff7fffff	  16MB		PCI I/O space
-  fffffbffff800000	fffffbffffffffff	   8MB		[guard region]
-  fffffc0000000000	fffffdffffffffff	   2TB		vmemmap
-  fffffe0000000000	ffffffffffffffff	   2TB		[guard region]
+  ffff800080000000	fffffdffbf7fffff	 126TB		vmalloc
+  fffffdffbf800000	fffffdffbfffffff	   8MB		[guard region]
+  fffffdffc0000000	ffffffffbfffffff	   2TB		vmemmap
+  ffffffffc0000000	ffffffffc07fffff	   8MB		[guard region]
+  ffffffffc0800000	ffffffffc17fffff	  16MB		PCI I/O	space
+  ffffffffc1800000	ffffffffff7fffff	 992MB		fixed mappings (top down)
+  ffffffffff800000	ffffffffffffffff	   8MB		[guard region]
 
 
 AArch64 Linux memory layout with 64KB pages + 3 levels (52-bit with HW support)::
@@ -49,13 +49,13 @@ AArch64 Linux memory layout with 64KB pages + 3 levels (52-bit with HW support):
   fff0000000000000	ffff7fffffffffff	  ~4PB		kernel logical memory map
  [fffd800000000000	ffff7fffffffffff]	 512TB		[kasan shadow region]
   ffff800000000000	ffff80007fffffff	   2GB		modules
-  ffff800080000000	fffffbffefffffff	 124TB		vmalloc
-  fffffbfff0000000	fffffbfffdffffff	 224MB		fixed mappings (top down)
-  fffffbfffe000000	fffffbfffe7fffff	   8MB		[guard region]
-  fffffbfffe800000	fffffbffff7fffff	  16MB		PCI I/O space
-  fffffbffff800000	fffffbffffffffff	   8MB		[guard region]
-  fffffc0000000000	ffffffdfffffffff	  ~4TB		vmemmap
-  ffffffe000000000	ffffffffffffffff	 128GB		[guard region]
+  ffff800080000000	fffffc1fbf7fffff	 124TB		vmalloc
+  fffffc1fbf800000	fffffc1fbfffffff	   8MB		[guard region]
+  fffffc1fc0000000	ffffffffbfffffff	  ~4TB		vmemmap
+  ffffffffc0000000	ffffffffc07fffff	   8MB		[guard region]
+  ffffffffc0800000	ffffffffc17fffff	  16MB		PCI I/O space
+  ffffffffc1800000	ffffffffff7fffff	 992MB		fixed mappings (top down)
+  ffffffffff800000	ffffffffffffffff	   8MB		[guard region]
 
 
 Translation table lookup with 4KB pages::
-- 
2.47.1

