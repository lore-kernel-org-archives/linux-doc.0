Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070454;
	b=AmuXX4Ppeu18NRUP/MLuEOJnZMywJPE9QUKwXqEmrgj1X9Bze6NsAN3ePD89D464YX0N
	 jCc2Et826hNiEVn+skm/LbgER8czkXNXzZBOEIaSExfI0y3cxc5xsyKDVOI0r34Dx32UU
	 wKrD1tj0tXXMN6rryimeN/tJzlv5ZbmMckynJoOh9FF462MGXARi4zbJKmICChbAT8srB
	 YzQ0SoePj+q8yz1Y6+eWE1sXkn8uj121iaMMsOvwQKWIBOBqK6QUgOMm45Kxwz/S3aqX5
	 dSe8l/PBsD3i3VB1Qm+DKRUQAUdX2ukp6cWfNGLkkNrTfYCkRS8ONAUILkwwFGi4JBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070454;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=ZBrOpa0p5MptB6uHOaEIkmXAYrmJEDtJeyYvGc8riU4=;
	b=T/q8pDyfY/eg5nplwqA9DV6aTEO1Wcwe7QvTTFihysSv4Fg9a4O5jIlkP7c2+eF8aqkF
	 3y9RV8dMCeHRG21DOBB74j0DkcXUoozZ0TYhU62HBdb1ocu4/AmqdEhhHYnOzQ1H/M2Gr
	 cWfJapp8A3PMAHzbMkQbdnfeMk4yArtaBIeSVWvSkUxt/fQsfvlVG236r8nll3LT5VB4h
	 BwbDIWXvO8XMZtiPwJulxhNGW8I/mRrSK+ExqxPG28W904rxJy3cgLM0Y8oJedxGK5w4q
	 oLdpqMsibSIafL5McYM8+9qQ8HHcIzKBgdDc/UQFDdyDDNidftRHHeAiu4/KLQ6v7BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=yGQZF349;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE41606A32F;
	Thu, 19 Nov 2026 06:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DE41606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=yGQZF349
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZBrOpa0p5MptB6uHOaEIkmXAYrmJEDtJeyYvGc8riU4=;
	b=yGQZF349ZQXwBSPXlGf/WDF5+TlDh6d2wuzdwzQlxlApoAeHsKjRuDayoBaTk8peUsZkmQnMp
	5AFAT4yWZhGmElIROUe/+ixnOiv8dXmTBLlpwy/eBIdoKcni4sC5ODVclf6z0tnk2RNFjuGWtIj
	QBZex74E6uiRbySLE+qMRBM=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jVTNc5cWMz12LCr;
	Thu, 19 Nov 2026 14:40:00 +0800 (CST)
Received: from kwepemo200009.china.huawei.com (unknown [7.202.195.26])
	by mail.maildlp.com (Postfix) with ESMTPS id 7B47B40561;
	Thu, 19 Nov 2026 14:40:52 +0800 (CST)
Received: from localhost.localdomain (10.50.159.234) by
 kwepemo200009.china.huawei.com (7.202.195.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 19 Nov 2026 14:40:51 +0800
From: Long Wei <longwei27@huawei.com>
To: <rppt@kernel.org>, <pasha.tatashin@soleen.com>, <pratyush@kernel.org>,
	<akpm@linux-foundation.org>
CC: <graf@amazon.com>, <leitao@debian.org>, <corbet@lwn.net>,
	<rdunlap@infradead.org>, <linux-mm@kvack.org>, <kexec@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<hewenliang4@huawei.com>, Long Wei <longwei27@huawei.com>
Subject: [PATCH v2 2/2] docs: kho: drop kho/in/sub_fdts description
Date: Thu, 19 Nov 2026 14:38:00 +0800
Message-ID: <20261119063800.698863-3-longwei27@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119063800.698863-1-longwei27@huawei.com>
References: <20261117092951.4017931-1-longwei27@huawei.com>
 <20261119063800.698863-1-longwei27@huawei.com>
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemo200009.china.huawei.com (7.202.195.26)

The incoming sub-blob debugfs directory is gone, so remove its description
from the KHO admin guide.

Signed-off-by: Long Wei <longwei27@huawei.com>
---
 Documentation/admin-guide/mm/kho.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-guide/mm/kho.rst
index 902d171a780a..4281da6be5fa 100644
--- a/Documentation/admin-guide/mm/kho.rst
+++ b/Documentation/admin-guide/mm/kho.rst
@@ -117,7 +117,3 @@ stabilized.
     kernel's state is in this file in the format of flattened
     device tree. This file may disappear when all consumers of
     it finished to interpret their metadata.
-
-``/sys/kernel/debug/kho/in/sub_fdts/``
-    Similar to ``kho/out/sub_fdts/``, but contains sub blobs
-    of KHO producers passed from the old kernel.
-- 
2.43.0

