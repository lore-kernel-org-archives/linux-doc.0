Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FC63AEF4E;
	Wed, 12 Aug 2026 08:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786521876; cv=none; b=ErxOCFadf9cugY3yi0HxtROHgjy2dJ5WgTrNf1fRbKzSE13JSJAu06ZEYyYb1zBJ2D0TKFdbVcE54xBYZjzZeBiCs6o+5KSWbv3WFnHdKTjbf4DtjIxpDBsHIOK8o1YJU9I/4N9cwijrXm4BGRFvFYY57yG16qlX/nxUoyh7M2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786521876; c=relaxed/simple;
	bh=tDOlBreQlwuXeKWp8KQ2AXqqUKnJCje8Swzl5xhNDd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WV893uIY/EuMji5j73YQ4UVrgdSmOs2z5HL2EXx8HBxn1aHAxr/cgNZ7LRiI7f0JV6pZ9rl/mRolljl4qqMoyWo8zf+CK3tSLKoWas/Q/DkiBqwgleWoNfIdd/4vf2tWLL5V0MpHl6NOEvuIcM/WUmAY0cVrlIQGIvVBGZR95g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 6f30d654962411f1aa26b74ffac11d73-20260812
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
X-CID-O-INFO: VERSION:1.3.12,REQID:805cb2e1-2a05-4900-82e9-39d0179a355c,IP:10,
	URL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-10
X-CID-INFO: VERSION:1.3.12,REQID:805cb2e1-2a05-4900-82e9-39d0179a355c,IP:10,UR
	L:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:EDM_GE969F26,ACTIO
	N:release,TS:-10
X-CID-META: VersionHash:e7bac3a,CLOUDID:8a5fe3aa4b666b997e91bda91c6aa5d7,BulkI
	D:260812160428G7BWOWO4,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|81|82|10
	2|127|865|898,TC:nil,Content:0|15|50,EDM:1|-100,IP:-2,URL:0,File:nil,RT:ni
	l,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,
	BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_AEC,TF_CID_SPAM_FAS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6f30d654962411f1aa26b74ffac11d73-20260812
X-User: husong@kylinos.cn
Received: from ctao-book.. [(111.162.215.50)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1613457883; Wed, 12 Aug 2026 16:04:25 +0800
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
Subject: [PATCH 2/2] Docs/mm: fix THP policy counts in transhuge
Date: Wed, 12 Aug 2026 16:03:13 +0800
Message-ID: <20260812080313.330413-3-husong@kylinos.cn>
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

transhuge.rst claims seven policies for transparent_hugepage_shmem= and
four for transparent_hugepage_tmpfs=.  Both boot parameters are parsed by
shmem_parse_huge(), which accepts six: always, within_size, advise, never,
deny and force.  The "four" applies only to the per-mount huge= option
(shmem_param_enums_huge).  Fix both counts to six.

Signed-off-by: Song Hu <husong@kylinos.cn>
---
 Documentation/admin-guide/mm/transhuge.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
index b187d618452f..72e944f49da5 100644
--- a/Documentation/admin-guide/mm/transhuge.rst
+++ b/Documentation/admin-guide/mm/transhuge.rst
@@ -389,14 +389,14 @@ is not defined within a valid ``thp_anon``, its policy will default to
 Similarly to ``transparent_hugepage``, you can control the hugepage
 allocation policy for the internal shmem mount by using the kernel parameter
 ``transparent_hugepage_shmem=<policy>``, where ``<policy>`` is one of the
-seven valid policies for shmem (``always``, ``within_size``, ``advise``,
+six valid policies for shmem (``always``, ``within_size``, ``advise``,
 ``never``, ``deny``, and ``force``).
 
 Similarly to ``transparent_hugepage_shmem``, you can control the default
 hugepage allocation policy for the tmpfs mount by using the kernel parameter
 ``transparent_hugepage_tmpfs=<policy>``, where ``<policy>`` is one of the
-four valid policies for tmpfs (``always``, ``within_size``, ``advise``,
-``never``). The tmpfs mount default policy is ``never``.
+six valid policies for tmpfs (``always``, ``within_size``, ``advise``,
+``never``, ``deny``, and ``force``). The tmpfs mount default policy is ``never``.
 
 Additionally, Kconfig options are available to set the default hugepage
 policies for shmem (``CONFIG_TRANSPARENT_HUGEPAGE_SHMEM_HUGE_*``) and tmpfs
-- 
2.43.0

