Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1413D9023;
	Wed, 12 Aug 2026 08:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786521874; cv=none; b=a/T5aqPaxecEqTk3R4R3jufZz2WY9/abAacqUMtWY5vyevvH/iWg9gFZK/xYNS3WX6tpBsjmYxc4deLaqqK1hnZacxGQKD9sB8aD9lnrHO3woXsW0ZyhB8u9f7QLO5aMrSZVUCbJfwCgaHrPSSlY849W9IC93UOibSZBSYl3eMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786521874; c=relaxed/simple;
	bh=+GbOoDm85hEwwnlSVh74Pd+sXCW5qZvqWW8X1E4DrgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OTNVmKnkmMHhur6MJLi+iHkxHHg+5IuCUlwgOQZT/bzeqZZagCE3yIn2y1rIYNHCuKF/q5SfI4fEf0nwC/k85PCGh9YR1XC+Vmqdnpk/CWfjM1QNhuYkMEE24ym6RqK5kSMSelJrTrLdUxJDN81Ku4ysiMEOyCng/lxVMDa1NrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 6e1474f6962411f1aa26b74ffac11d73-20260812
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_UNTRUSTED, SRC_UNTRUSTED, IP_UNFAMILIAR, SRC_UNFAMILIAR
	DN_TRUSTED, SRC_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_TRUSTED
	SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD
	CIE_GOOD_SPF, CIE_UNKNOWN, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
	AMN_GOOD
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:75e5a4f8-eae9-41d8-aad9-60c9e9fdeb0e,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.12,REQID:75e5a4f8-eae9-41d8-aad9-60c9e9fdeb0e,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:e7bac3a,CLOUDID:ef6834d9f8dad171e96e31e568c51f1a,BulkI
	D:2608121604281BMG07Q4,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|81|82|10
	2|127|136|865|898,TC:nil,Content:0|15|50,EDM:-3|-100,IP:-2,URL:0,File:nil,
	RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,D
	KP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6e1474f6962411f1aa26b74ffac11d73-20260812
X-User: husong@kylinos.cn
Received: from ctao-book.. [(111.162.215.50)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2092408523; Wed, 12 Aug 2026 16:04:23 +0800
From: Song Hu <husong@kylinos.cn>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Song Hu <husong@kylinos.cn>
Subject: [PATCH 1/2] Docs/ABI: document transparent_hugepage/shrink_underused
Date: Wed, 12 Aug 2026 16:03:12 +0800
Message-ID: <20260812080313.330413-2-husong@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812080313.330413-1-husong@kylinos.cn>
References: <20260812080313.330413-1-husong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The shrink_underused knob was added in commit 81d3ff3c6f76 ("mm: add
sysfs entry to disable splitting underused THPs") but is missing from
Documentation/ABI/testing/sysfs-kernel-mm-transparent-hugepage, although
transhuge.rst already documents it.  Add the ABI entry.

Signed-off-by: Song Hu <husong@kylinos.cn>
---
 .../ABI/testing/sysfs-kernel-mm-transparent-hugepage   | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-kernel-mm-transparent-hugepage b/Documentation/ABI/testing/sysfs-kernel-mm-transparent-hugepage
index 7bfbb9cc2c11..bbdfae2c0caa 100644
--- a/Documentation/ABI/testing/sysfs-kernel-mm-transparent-hugepage
+++ b/Documentation/ABI/testing/sysfs-kernel-mm-transparent-hugepage
@@ -10,9 +10,19 @@ Description:
 			- hpage_pmd_size
 			- khugepaged
 			- shmem_enabled
+			- shrink_underused
 			- use_zero_page
 			- subdirectories of the form hugepages-<size>kB, where <size>
 			  is the page size of the hugepages supported by the kernel/CPU
 			  combination.
 
 		See Documentation/admin-guide/mm/transhuge.rst for details.
+
+What:		/sys/kernel/mm/transparent_hugepage/shrink_underused
+Date:		Sep 2024
+Contact:	Linux memory management mailing list <linux-mm@kvack.org>
+Description:	Reading and writing this file controls whether khugepaged
+		splits underused transparent huge pages (THPs) under memory
+		pressure.  A THP is considered underused when its number of
+		zero-filled pages is above max_ptes_none.  Enabled by default;
+		writing 0 disables the splitting and 1 enables it.
-- 
2.43.0

