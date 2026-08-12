Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8153AAF78;
	Wed, 12 Aug 2026 07:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786521500; cv=none; b=mhX41w43cmcNJDN86MB/OP0l/AUBuDxveyNCgKSK+JIvgSm//qs9tyXZdzHtrgcSmNTfiXdiiwvNZ8SJ5Dl3re0P3ZSpenopxftKxxLPlHon7+0YTbtcGc8MtJPUH+ZubmcaVhqKWRw5Jr+2/uoe9zo5WBx0TC7cXC847MczRLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786521500; c=relaxed/simple;
	bh=Vm8EWN52touMzNr5DFruRuVccYDN7F6+aZpahiFYv5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PqSRkNr7c5sE9qZuoI2T3Cn1NbBDBP+iKpYEBLg45HK3x6w5MK95gnm7zdNjQQdmX1lMshn9pzT/DQEfASFqEk/xCG46rXkyeAiyt/8M3RDooAlSLWiHwTKg+p9XR+iR8LTUFVhlFK7L8IstyHJaj8MqWh7AbdsRu0mYtgW7Bbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8cb4bc1e962311f1aa26b74ffac11d73-20260812
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_UNTRUSTED, SRC_UNTRUSTED, IP_UNFAMILIAR, SRC_UNFAMILIAR, DN_TRUSTED
	SRC_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:98550444-a8cf-41c7-9a51-41e1804f628e,IP:10,
	URL:0,TC:0,Content:79,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:114
X-CID-INFO: VERSION:1.3.12,REQID:98550444-a8cf-41c7-9a51-41e1804f628e,IP:10,UR
	L:0,TC:0,Content:79,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:114
X-CID-META: VersionHash:e7bac3a,CLOUDID:5ea0803e3a002edfdd0c980c06caa678,BulkI
	D:260812155809WZRDJEWO,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|127|865|
	898,TC:nil,Content:3|15|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:n
	il,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_ASC
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8cb4bc1e962311f1aa26b74ffac11d73-20260812
X-User: husong@kylinos.cn
Received: from ctao-book.. [(111.162.215.50)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1497932409; Wed, 12 Aug 2026 15:58:05 +0800
From: Song Hu <husong@kylinos.cn>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
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
Subject: [PATCH] Docs/mm: fix outdated "radix tree" in page_migration
Date: Wed, 12 Aug 2026 15:57:39 +0800
Message-ID: <20260812075739.325441-1-husong@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Steps 7 and 9 of the migration description still say "radix tree",
unlike steps 5 and 11 which already use "i_pages lock".  The page cache
moved to the XArray at mapping->i_pages long ago.  Use "page cache tree"
for the two remaining references.

Signed-off-by: Song Hu <husong@kylinos.cn>
---
 Documentation/mm/page_migration.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/mm/page_migration.rst b/Documentation/mm/page_migration.rst
index 34602b254aa6..5b8d50308db1 100644
--- a/Documentation/mm/page_migration.rst
+++ b/Documentation/mm/page_migration.rst
@@ -110,13 +110,13 @@ Steps:
 6. The refcount of the page is examined and we back out if references remain.
    Otherwise, we know that we are the only one referencing this page.
 
-7. The radix tree is checked and if it does not contain the pointer to this
-   page then we back out because someone else modified the radix tree.
+7. The page cache tree is checked and if it does not contain the pointer to this
+   page then we back out because someone else modified the page cache tree.
 
 8. The new page is prepped with some settings from the old page so that
    accesses to the new page will discover a page with the correct settings.
 
-9. The radix tree is changed to point to the new page.
+9. The page cache tree is changed to point to the new page.
 
 10. The reference count of the old page is dropped because the address space
     reference is gone. A reference to the new page is established because
-- 
2.43.0

