Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794635714;
	b=vYRGkMJg0wxoBX9Wv+moZjU2g26scutFtib4UgWN/pgd9KvW5LWHP/4IeULjlLVGUUCM
	 Goci4XMfoRS3CDG4Kd+BoqoCw2qFL6+t7Cm44FHYwpl2Jh2OPvQ4f3ZGgi00LTJtNqddY
	 UtgP5t+v8t2qp/M3IFth2sYJWvTnmbu2XRCkNc8Y6bNDQNBZXV1UU9+TCgaXvoggxB3q4
	 +V/gv6wOhvh/qa3NWtNyhRk3UK6bvkQAgMEdbcdkoCMmGnRD/tDb7Mw9UvecNIXZjubAo
	 t3ftJJzhRblIff/JsVhyI8r8aDrySaQxjFpuSOOE9hD6VkxonFTWLQpFbZ7bBuwzhVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794635714;
	h=DMARC-Filter:X-UUID:X-CTIC-Tags:X-CID-P-RULE:X-CID-O-INFO:X-CID-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zGy1vdLayt8lRYKcl1ZixKiv5rYlTz4T8Pjmfj56gUQ=;
	b=lkEUI4yWeHFPlau44UHFVko+JARbXyUWMUzXfzeHltSB+AChznwCMI4QSywOIVwfr9Xf
	 7il6rQp/cQ6YBaPUGvtI6L8r3SyhmJVUpwK7pAKZ+ghCIxKC55o+wSVGPsvEVBouSZIY1
	 IAkpxMMH6N9QpW6AofMrfimZ1sXKHBpfqiNn9R0vBNScnALw1ijmoinlbpBNzC4B1J9bP
	 2gTw/xR3Z6gAEghXMOAwAmIam7PlkWj2D3oCPpJxJwnq4EZuZWCJGQ1AuDauxLxTF562/
	 R9Dq4McqvqPmq4uCnrKs5HhHSZDoYRhCm9JdGyQArhqUS6Be4uzkLCkU2SwyIG79x+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E6F606A327
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 05:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49E6F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: eec1f348dfef11f19a56ed5b684f684d-20261114
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
X-CID-O-INFO: VERSION:1.3.19,REQID:3275e801-7e8f-49bc-b2a9-4c4c6dff9e31,IP:10,
	URL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-10
X-CID-INFO: VERSION:1.3.19,REQID:3275e801-7e8f-49bc-b2a9-4c4c6dff9e31,IP:10,UR
	L:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:EDM_GE969F26,ACTIO
	N:release,TS:-10
X-CID-META: VersionHash:7db8b62,CLOUDID:c028a24d930a5a1200e4ebd263531e5a,BulkI
	D:261114135506IBV1DO4P,BulkQuantity:0,SF:17|19|38|66|78|102|127|153|865|89
	8,TC:nil,Content:0|15|50|99|100|101|118,EDM:1|-100,IP:-2,URL:0,File:nil,RT
	:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP
	:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_AEC
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: eec1f348dfef11f19a56ed5b684f684d-20261114
X-User: lienze@kylinos.cn
Received: from ubuntu.. [(111.193.136.161)] by mailgw.kylinos.cn
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 371179060; Sat, 14 Nov 2026 13:55:02 +0800
From: Enze Li <lienze@kylinos.cn>
To: sj@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	Enze Li <lienze@kylinos.cn>
Subject: [PATCH] Docs/mm/damon/design: replace "same to" with "same as"
Date: Sat, 14 Nov 2026 13:54:36 +0800
Message-ID: <20261114055436.5546-1-lienze@kylinos.cn>
X-Mailer: git-send-email 2.43.0
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

"same to" is not idiomatic; it should be "the same as" or "same as".
This doc has six such usages.  Fix all of them at once for consistency.

Signed-off-by: Enze Li <lienze@kylinos.cn>
---
 Documentation/mm/damon/design.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index b676be697158..6284b9005443 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -292,17 +292,17 @@ DAMON :ref:`context <damon_design_execution_model_and_data_structures>`.  The
 registration is made by specifying a probe per attribute.  Each of the probes
 specifies a rule to determine if a given memory region has the related
 attribute.  The rule is constructed with multiple filters.  The filters work
-same to :ref:`DAMOS filters <damon_design_damos_filters>` except the supported
-filter types.  Currently below filter types are supported.
+the same as :ref:`DAMOS filters <damon_design_damos_filters>` except the
+supported filter types.  Currently below filter types are supported.
 
-- ``anon``: Same to that for DAMOS filters.
-- ``memcg``: Same to that for DAMOS filters.
+- ``anon``: Same as that for DAMOS filters.
+- ``memcg``: Same as that for DAMOS filters.
 - ``pgidle_unset``: Matches if the page for the memory is marked as not
   access-idle.
 - ``pgidle_set``: Matches if the page for the memory is marked as access-idle.
 - ``hugepage_size``: Matches if the page for the memory is a part of a hugepage
   of a given size range.
-- ``active``: Same to that for DAMOS filters.
+- ``active``: Same as that for DAMOS filters.
 
 If such probes are registered, DAMON executes the probes for each region's
 sampling memory when it does the access :ref:`sampling
@@ -706,7 +706,7 @@ There are two such tuning algorithms that users can select as they need.
 The goal can be specified with six parameters, namely ``target_metric``,
 ``complement``, ``target_value``, ``current_value``, ``nid`` and ``path``.  The
 auto-tuning mechanism tries to make ``current_value`` of ``complement``-ed
-``target_metric`` be same to ``target_value``.
+``target_metric`` be the same as ``target_value``.
 
 - ``user_input``: User-provided value.  Users could use any metric that they
   have interest in for the value.  User space main workload's latency or
@@ -736,7 +736,7 @@ auto-tuning mechanism tries to make ``current_value`` of ``complement``-ed
 
 ``complement`` is a boolean parameter that determines whether to use
 complemented value of the target metric.  For example, if ``complement`` is set
-and target metric is ``active_mem_bp``, it is effectively same to
+and target metric is ``active_mem_bp``, it is effectively the same as
 ``inactive_mem_bp``.  ``complement`` is no-op when the target metric type is
 ``user_input``.  For the metric type, the user should be able to emit
 complemented metric values on their own.
-- 
2.43.0

