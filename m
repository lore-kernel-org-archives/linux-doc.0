Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA1F489875
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 09:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785488473; cv=none; b=R/PikRD8PxVqr6EaWqQ8QuLeB0/ZP9lmFOWlBUpkJS+MMsGVzhKWUfNxobWr82jEhknsZxSi+OeB4VBqZbZOFi7RxGvRvndCUNcEp0eDkUXB1HikHp0kgN/0yr6gl6x5V5UDPqYIOCy+gvEN2GZUKrTiDZfFt/MXJLR0yc7tc/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785488473; c=relaxed/simple;
	bh=NIvaoVBhQus3kGtox3o/fZFQXSOyLtgz4D1hs6OXHBY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RdTo5ZFo8dvLjejcPOnjyuQyvPYXCUdWclXsgqwXjV4JL1F9QhRe4/SxkF7qFtNYN6VU5eOCE4iw7J1SqFW6dyaoy/l99lpdjl4hR98DhGACJbgwwG/SrPrjrIDXc/DFx3ioP1QtFgqBQpOsRkoqmxlsGFYO1Yna2/8/52SWuyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Enj/1NJk; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Enj/1NJk"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=YoTlsqV3LWOTDYzIn/BMuSAECJGejw6w2jDZ1v0qjMg=;
	b=Enj/1NJk47CJ1vC7YH5BN0DYszJ+ljYBiuJzsEDqKZkRSSg5BVB4Rbw+leJNNQ+khVLKGixKX
	BEZbEBMzRDhg1Z3vQ1Pn4aig/2FUTxOiiQU0jNgJrptUG+BCkWzfXZtrVeTPeqWoCz93XYoUImo
	0oNmJezaARd4hBzcbEvwUCU=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hBKYl3BwBz1K9YC;
	Fri, 31 Jul 2026 16:51:39 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 7120C40574;
	Fri, 31 Jul 2026 17:01:06 +0800 (CST)
Received: from huawei.com (10.50.85.135) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 31 Jul
 2026 17:01:05 +0800
From: Jinjiang Tu <tujinjiang@huawei.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <xu.xin16@zte.com.cn>,
	<chengming.zhou@linux.dev>, <ljs@kernel.org>, <liam@infradead.org>,
	<vbabka@kernel.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<shr@devkernel.io>, <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>
CC: <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>,
	<tujinjiang@huawei.com>
Subject: [PATCH 1/2] docs: ksm: fix typos in sysfs knob names
Date: Fri, 31 Jul 2026 16:35:25 +0800
Message-ID: <20260731083526.3953421-2-tujinjiang@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731083526.3953421-1-tujinjiang@huawei.com>
References: <20260731083526.3953421-1-tujinjiang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemr500001.china.huawei.com (7.202.194.229)

The sysfs knob names in mm/ksm.c are "advisor_max_cpu" and
"advisor_max_pages_to_scan", but the ksm.rst documentation spelled
both as "adivsor_*", fix the two typos.

Fixes: 0710f38ad26a ("mm/ksm: document ksm advisor and its sysfs knobs")
Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
---
 Documentation/admin-guide/mm/ksm.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/mm/ksm.rst b/Documentation/admin-guide/mm/ksm.rst
index ad8e7a41f3b5..c9f533b10f6f 100644
--- a/Documentation/admin-guide/mm/ksm.rst
+++ b/Documentation/admin-guide/mm/ksm.rst
@@ -174,7 +174,7 @@ advisor_mode
         The section about ``advisor`` explains in detail how the scan time
         advisor works.
 
-adivsor_max_cpu
+advisor_max_cpu
         specifies the upper limit of the cpu percent usage of the ksmd
         background thread. The default is 70.
 
@@ -186,7 +186,7 @@ advisor_min_pages_to_scan
         specifies the lower limit of the ``pages_to_scan`` parameter of the
         scan time advisor. The default is 500.
 
-adivsor_max_pages_to_scan
+advisor_max_pages_to_scan
         specifies the upper limit of the ``pages_to_scan`` parameter of the
         scan time advisor. The default is 30000.
 
-- 
2.54.0

