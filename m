Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750205;
	b=NvN24aPk/NFjaAotvkqr6sKx/MgjYHrUIdNJdD2FiD0+lsA5I0Xup5FHb18YgKiL9nEN
	 SE0Oqv0yVDeW+pZOLEmMZLFZfAd9fV+55oVqQQJaPiMHptdJm8JD1eRI/rpdufZeU/Mou
	 D513jk8uGw6Sr6lsX2IKRdix+4+i/DjnsqOL1UgTR2JuXbozlXiG2ac/vqJpKKzRjl4oz
	 EIEW+9Anwc9BnI44ZwLWNqV1OF1SAAMPRCCaY88glqMK1nREJ0862ozDuw7nqQ7OD7ULp
	 RygXhT8MgxqikVwAi5yPLPMTyU0YUJedyTvoqMVqru5Arjq8IUFqubXmCuSiMZCO9hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750205;
	h=DMARC-Filter:X-UUID:X-CTIC-Tags:X-CID-P-RULE:X-CID-O-INFO:X-CID-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P2O1ni6/PtH6SUrA5XShDu4rG4rb28qgUj7QslR1v6U=;
	b=IckZn3w+C9eczBnEig8IcibfOfWY7R3U9Rm53or5az42BSnr1zMIS4rVe2iyYN9+alUa
	 aQzQYS+e2wRHNbAT31RTp+TXGcz+jKAjTDSbwZ1ceoCyD8R5ENMhMJaMkYy+yD9s4chCX
	 aOBVTMVvaO1DM0eRKheogIbKuoi871yF9/HGiKlO5ZzPQd5/ZZDUtdoZu/3MkGC+G/K5n
	 b7zLlErp8nr898co9ubh6RCpHcASIWeW3iRnuxe+RQSvugCu8gHGot0P9zkPeTIg7/C3L
	 7UO5CZ/8rc+3N+nyVSkl/qC261fJMcftjQG8dAOTN67oY1Gt2AaQgY5UkxKjs2Agz6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744EF606A31A
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 10:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 744EF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: dfe0c890cec911f19a56ed5b684f684d-20261023
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_TRUSTED
	SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD
	CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
	AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:68d9af36-cec0-4671-ab20-a6872d0fc5eb,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:68d9af36-cec0-4671-ab20-a6872d0fc5eb,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:3ed9c0dc68d48b3709c4657cbb3dbc5c,BulkI
	D:261023180950EOOPNRBP,BulkQuantity:0,SF:17|19|38|66|78|102|127|850|865|89
	8,TC:nil,Content:0|15|50|99,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS
	:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
	RC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: dfe0c890cec911f19a56ed5b684f684d-20261023
X-User: lienze@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1282895732; Fri, 23 Oct 2026 18:09:46 +0800
From: Enze Li <lienze@kylinos.cn>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	Enze Li <lienze@kylinos.cn>
Subject: [PATCH] docs: hugetlbpage.rst: clarify HugePages_Total in hugetlbpage.rst
Date: Fri, 23 Oct 2026 18:08:59 +0800
Message-ID: <20261023100859.70744-1-lienze@kylinos.cn>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"the size of the pool of huge pages" confused me, since it sounds
like a size in bytes.  It's actually the number of persistent huge
pages of the default size, and pools of other sizes aren't shown
here at all.  Reword it and point to /sys/kernel/mm/hugepages for
those.

Signed-off-by: Enze Li <lienze@kylinos.cn>
---
 Documentation/admin-guide/mm/hugetlbpage.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/hugetlbpage.rst b/Documentation/admin-guide/mm/hugetlbpage.rst
index 2075f1f14a42..01fa9f61c9a9 100644
--- a/Documentation/admin-guide/mm/hugetlbpage.rst
+++ b/Documentation/admin-guide/mm/hugetlbpage.rst
@@ -43,7 +43,9 @@ The output of ``cat /proc/meminfo`` will include lines like::
 where:
 
 HugePages_Total
-	is the size of the pool of huge pages.
+	is the number of persistent huge pages of the default size
+	in the pool.  Pools of other huge page sizes are not shown
+	here; see ``/sys/kernel/mm/hugepages`` described below.
 HugePages_Free
 	is the number of huge pages in the pool that are not yet
         allocated.

base-commit: 3fdcce698abd9193752ee89fb1a440cdceb1b74a
-- 
2.56.0

