Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530CD304BB3
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 09:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785488479; cv=none; b=jW62W8fGGN8Pw0iJb9imsg9gnSZqmAIB7mxTLJmoX3fZi1bklYFIlY+XnzudPai9RGCi+AXZq6GxdUWkf4NE8GhzWYMg1FiXcRk6jJRXfrxtRpLAiEmNJ3tmDKodOygqSxUO72XVDhSkfOas6gHHcAq/1sI+MGiIaTYVzDyQQmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785488479; c=relaxed/simple;
	bh=7JkLvZ2MaFIMVfuNxBNAqx7HJFiX9F3DJo0Xss+UGlM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D1F9VE+FlNUq1RBatPKzdB/ZjQuzEjJzLWn7gAQk0cng4gKDGCVtm2/ZrwBJyJoWdaEzlwyUIrh3XIRIAKv9QgJNeUS4CFogPsyRnkIDXujxeGxGHnzo1cUKLhCoXeVwGZa/Lf7mFj+jxgD0bWf8EBaooALASWA4xvmqkET20Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ar2P7v/V; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="ar2P7v/V"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=QWHNu5nnHvi1saS37X/nC9nHmu6f5Mr/HJ2eHj6UvJo=;
	b=ar2P7v/Va4ljkTEdmQImY53t3Col+VJahJqZJM50prKhJT/2RYzHbTTr020jiPWtw/9IU751e
	0paf7PyxophY5LW3YKEwP8I42KfjTuFqH43++9Lw3eBZ8y0FBmiWi47k+lRhwezu73LbLhASNcZ
	Nx4FVD5IdsCTNw69SHTpVHw=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4hBKYl6rdwzRhWS;
	Fri, 31 Jul 2026 16:51:39 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id E9D3A202E6;
	Fri, 31 Jul 2026 17:01:06 +0800 (CST)
Received: from huawei.com (10.50.85.135) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 31 Jul
 2026 17:01:06 +0800
From: Jinjiang Tu <tujinjiang@huawei.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <xu.xin16@zte.com.cn>,
	<chengming.zhou@linux.dev>, <ljs@kernel.org>, <liam@infradead.org>,
	<vbabka@kernel.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<shr@devkernel.io>, <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>
CC: <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>,
	<tujinjiang@huawei.com>
Subject: [PATCH 2/2] mm/ksm: fix advisor_min_pages_to_scan description
Date: Fri, 31 Jul 2026 16:35:26 +0800
Message-ID: <20260731083526.3953421-3-tujinjiang@huawei.com>
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

Both Documentation/admin-guide/mm/ksm.rst and the comment next to the
variable definition in mm/ksm.c describe advisor_min_pages_to_scan as a
lower limit of the pages_to_scan parameter, but that is not how the
scan-time advisor actually uses it. commit 4e5fa4f5eff6 ("mm/ksm: add ksm
advisor") only uses it to initialize ksm_thread_pages_to_scan when the
scan-time advisor is enabled. This will mislead the users.

The semantics of advisor_min_pages_to_scan was updated in the v2 patchset
[1], but the documention wasn't updated.

Update the documentation and comment to match the semantics of
advisor_min_pages_to_scan.

Link: https://lore.kernel.org/linux-mm/20231028000945.2428830-2-shr@devkernel.io/ [1]
Fixes: 0710f38ad26a ("mm/ksm: document ksm advisor and its sysfs knobs")
Fixes: 66790e9a735b ("mm/ksm: add sysfs knobs for advisor")
Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
---
 Documentation/admin-guide/mm/ksm.rst | 4 ++--
 mm/ksm.c                             | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/mm/ksm.rst b/Documentation/admin-guide/mm/ksm.rst
index c9f533b10f6f..c329ca747b8c 100644
--- a/Documentation/admin-guide/mm/ksm.rst
+++ b/Documentation/admin-guide/mm/ksm.rst
@@ -183,8 +183,8 @@ advisor_target_scan_time
         pages. The default value is 200 seconds.
 
 advisor_min_pages_to_scan
-        specifies the lower limit of the ``pages_to_scan`` parameter of the
-        scan time advisor. The default is 500.
+        specifies the initial value of the ``pages_to_scan`` parameter of
+        the scan time advisor. The default is 500.
 
 advisor_max_pages_to_scan
         specifies the upper limit of the ``pages_to_scan`` parameter of the
diff --git a/mm/ksm.c b/mm/ksm.c
index 7d5b76478f0b..1e3a9c657a64 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -342,7 +342,7 @@ static enum ksm_advisor_type ksm_advisor;
  * Only called through the sysfs control interface:
  */
 
-/* At least scan this many pages per batch. */
+/* Initial number of pages to scan per batch when the scan-time advisor is enabled. */
 static unsigned long ksm_advisor_min_pages_to_scan = 500;
 
 static void set_advisor_defaults(void)
-- 
2.54.0

