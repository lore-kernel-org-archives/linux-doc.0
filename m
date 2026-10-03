Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A5E450405
	for <linux-doc@vger.kernel.org>; Sat,  3 Oct 2026 16:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791043930; cv=none; b=CiugC+9/UG542vi8a005PPSwA8IhQ4sy4SBe3F/Cp53mD12qS8Povz1HF0EULVU30xjL09h45ZN94gK4gx7Q8f/AFFzS2uHUB24IUuoWbf2P93EjzVLp/aoR8YssgEBHLs+7q+wl7uU6tEnH2ClH6sGQH2Lxgn1pXy1m4+VlpD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791043930; c=relaxed/simple;
	bh=N9ceTkdnppyXotVHs6BYtqvBSOM5XkSH4LjhdBGGE9g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jlUvZnFuiOjJoQmE1xDQ/IpI842I8OLG7WreUNbgMen/5yqA0Tc9a48fG8Ib0NpXbEQLe2MvT5CiTLprJQjLkIdrCHsw0vVCi2/N0uk4DwLQfJoex1Fhdc3J+iVTC2xFGdXaXRCTppv0C+as3ozYP4mz6Z/LiWGumgokIdqIUcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 2635b57ebf4511f19a56ed5b684f684d-20261004
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_UNTRUSTED, SRC_UNTRUSTED, IP_LOWREP, SRC_LOWREP, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c0850011-acab-4d49-82a6-41f594baa385,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:c0850011-acab-4d49-82a6-41f594baa385,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:48e50d00358a2b9b54db0b4daa3d3f58,BulkI
	D:26100400115821J6TXFL,BulkQuantity:0,SF:17|19|38|66|78|102|127|850|865|89
	8,TC:nil,Content:0|15|50|99,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS
	:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
	RC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2635b57ebf4511f19a56ed5b684f684d-20261004
X-User: lienze@kylinos.cn
Received: from localhost.localdomain [(175.169.70.242)] by mailgw.kylinos.cn
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 366136427; Sun, 04 Oct 2026 00:11:53 +0800
From: Enze Li <lienze@kylinos.cn>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	enze.li@gmx.com,
	Enze Li <lienze@kylinos.cn>
Subject: [PATCH] docs: hugetlbpage.rst: fix typo in per-node attribute description
Date: Sun,  4 Oct 2026 00:11:25 +0800
Message-Id: <20261003161125.40485-1-lienze@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The per-node hugepages section writes the free_hugepages and
surplus_hugepages file names with stray trailing quotes.  Quote the real
names as inline literals instead.

Signed-off-by: Enze Li <lienze@kylinos.cn>
---
 Documentation/admin-guide/mm/hugetlbpage.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/mm/hugetlbpage.rst b/Documentation/admin-guide/mm/hugetlbpage.rst
index 3cc15d800be1..2075f1f14a42 100644
--- a/Documentation/admin-guide/mm/hugetlbpage.rst
+++ b/Documentation/admin-guide/mm/hugetlbpage.rst
@@ -373,9 +373,9 @@ contains the following attribute files::
 	free_hugepages
 	surplus_hugepages
 
-The free\_' and surplus\_' attribute files are read-only.  They return the number
-of free and surplus [overcommitted] huge pages, respectively, on the parent
-node.
+The ``free_hugepages`` and ``surplus_hugepages`` attribute files are read-only.
+They return the number of free and surplus [overcommitted] huge pages,
+respectively, on the parent node.
 
 The ``nr_hugepages`` attribute returns the total number of huge pages on the
 specified node.  When this attribute is written, the number of persistent huge

base-commit: 763ad0211c7b587344f03bc4d1299810aeb736f4
-- 
2.25.1

