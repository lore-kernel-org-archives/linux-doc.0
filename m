Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793002189;
	b=xD6ftev7Mwe3rOH247Jg5s1V/eOZeIA7/UCO8vl1Cs9HVWgLbNIvRBaQ5mg3z3+AgcwC
	 xdU+/2VInkIgbnpNIQSvmJUSAd4Of2/RW1RvkMlKn6jMxgukl+S0gcm9RzfEJnOMtLZyh
	 mPYLgM7F+Gvai/zO3I11MQOOawxzF3WDn7o7El1KwOO3JsZrZCyMNJnNBGUA2Yy043kU4
	 g50O6gNAXrZE/XCYhCkK1BkAolhS79l6HCHwcEd//8alKy4Q7fnU/UVKdgSuOUxgKPLjY
	 mCLVKUHocF/KsxTA8B2BvpZ5y9RlAoQsDmJUJRD3U3QpxpgU7Ez30pAIDYxYSIxfSgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793002189;
	h=DMARC-Filter:X-UUID:X-CTIC-Tags:X-CID-P-RULE:X-CID-O-INFO:X-CID-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kaXgUnQxIrgvPK4dCGjQGvShDGNk1RfsioOGgqsxil0=;
	b=oVux+yroXhHZYPNL0nYWEwVvW2HCw5o1HgyAmtYikttpryLl1kdFOr4wc7ZX1mQMmHiK
	 AIjzx+K8Jf+sJPLTtw+c2Aova234BKC+gPiFvU83044786nwAhwfiZ3b0wXcZS2HYys5S
	 jzikZDfNfk5G+i33R13eoiT3YrtulyWlVkUUgVVYD9JhGQfylyGD7dxi56JDKppHj10dQ
	 TZcYbWiALog77+RUQwHY5xBLMTFlFQSwLQyGX7ufOO4M72GYSwKyckjkvgfhsbYVapfEw
	 hKsEpfXO4ChNL9A0XqiFHzOiAb4BXjIX5Q5ok62dZ48jsZRjD+iFMhcFe5vbFkTHFfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C024606A326
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 08:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C024606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9643bdb2d11411f19a56ed5b684f684d-20261026
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, SA_TRUSTED, SA_EXISTED
	SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
	GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:e3ce8c80-15f6-4922-b9a6-3123de19c510,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:e3ce8c80-15f6-4922-b9a6-3123de19c510,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:005ba305c1385bacd18b1f73694b1e49,BulkI
	D:2610261609416N1QUB3E,BulkQuantity:0,SF:17|19|38|66|78|102|127|850|865|89
	8,TC:nil,Content:0|15|50|99,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS
	:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
	RC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9643bdb2d11411f19a56ed5b684f684d-20261026
X-User: lienze@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 648359560; Mon, 26 Oct 2026 16:09:37 +0800
From: Enze Li <lienze@kylinos.cn>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	danielmaraboo@gmail.com
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	Enze Li <lienze@kylinos.cn>
Subject: [PATCH v2] docs: hugetlbpage.rst: clarify HugePages_Total in hugetlbpage.rst
Date: Mon, 26 Oct 2026 16:08:56 +0800
Message-ID: <20261026080856.76175-1-lienze@kylinos.cn>
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

"the size of the pool of huge pages" confused me, since it sounds like
a size in bytes.  It's actually the number of huge pages of the default
size in the pool, surplus pages included.  Reword it and point to
/sys/kernel/mm/hugepages for the other huge page sizes.

Suggested-by: Daniel Pereira <danielmaraboo@gmail.com>
Signed-off-by: Enze Li <lienze@kylinos.cn>
---
Changes in v2:
- Drop "persistent" from the description
- Reward the note on other sizes.

 Documentation/admin-guide/mm/hugetlbpage.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/hugetlbpage.rst b/Documentation/admin-guide/mm/hugetlbpage.rst
index 2075f1f14a42..282bc420d97b 100644
--- a/Documentation/admin-guide/mm/hugetlbpage.rst
+++ b/Documentation/admin-guide/mm/hugetlbpage.rst
@@ -43,7 +43,10 @@ The output of ``cat /proc/meminfo`` will include lines like::
 where:
 
 HugePages_Total
-	is the size of the pool of huge pages.
+	is the number of huge pages of the default size in the pool,
+	both persistent and surplus.  Counts for the other huge page
+	sizes are available in ``/sys/kernel/mm/hugepages`` (described
+	below).
 HugePages_Free
 	is the number of huge pages in the pool that are not yet
         allocated.

base-commit: 3fdcce698abd9193752ee89fb1a440cdceb1b74a
-- 
2.56.0

