Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B31346AE1
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 03:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786592637; cv=none; b=g+sA0pod4tG+W+m9PkwcXeDk7vrmMNzLLWJquF3XwOUGSPVeyRUL5porzK+nDNEx7zuz0V+8uvDWm0YkCE8nhBjbaoH0NH7cPbZOUv7RsU5PHZeT0Zyno6tlvAOypCIq/x/fJYMPUeNC/AhppSNAbSk6ZcbNefApvMZzJH9HLb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786592637; c=relaxed/simple;
	bh=0xJ4WUz/5eJ1I7Mh943MEl2K30KB9pSa1nAzaNbggyE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LRCuy1fjfN/LmH2xkqiDEUEPqZ9IWHs21MbalrBgLOoQqZ2HFZu9gWkjjuaGpEreCmqf3MENAAz/6Uzp7xrnB628UphCDs1orQTB6Id1w3rSa6vdrAy9MXni6TEuHuVoN0FWEK/p/Lxs4nchGPqKJLoBn/5pMhNPfmoHOrRWyZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=LX4wVwMe; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="LX4wVwMe"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=jjBzaVi/IBnAB+6E2zKl2/5vb4yZbYCndoVA24pa6UE=;
	b=LX4wVwMeZgkz+qMnt97vEkblyz3yQOrKqcdK/aNq6s8mE/A6b7Dzbc0Kz4SZ/YsBdPtC/OQOK
	c/5L937ERZx/tly9nHckstPsOSV44z797WTwJMnl4lzF8s//Hnhl1N6wF+feS71f7eJopKsX2Yw
	SezLjl6oK2ITvBzVw1BiZ5s=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hL9v94M8Mz1T4Fq;
	Thu, 13 Aug 2026 11:33:57 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 16F1A4057F;
	Thu, 13 Aug 2026 11:43:49 +0800 (CST)
Received: from huawei.com (10.50.85.135) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 11:43:48 +0800
From: Jinjiang Tu <tujinjiang@huawei.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <xu.xin16@zte.com.cn>,
	<chengming.zhou@linux.dev>, <ljs@kernel.org>, <liam@infradead.org>,
	<vbabka@kernel.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<shr@devkernel.io>, <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>
CC: <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>,
	<tujinjiang@huawei.com>
Subject: [PATCH v2 2/2] mm/ksm: fix advisor_min_pages_to_scan description
Date: Thu, 13 Aug 2026 11:17:22 +0800
Message-ID: <20260813031722.569983-3-tujinjiang@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813031722.569983-1-tujinjiang@huawei.com>
References: <20260813031722.569983-1-tujinjiang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr500001.china.huawei.com (7.202.194.229)

Both Documentation/admin-guide/mm/ksm.rst and the comment next to the
variable definition in mm/ksm.c describe advisor_min_pages_to_scan as a
lower limit of the pages_to_scan parameter, but that is not how the
scan-time advisor actually uses it. commit 4e5fa4f5eff6 ("mm/ksm: add ksm
advisor") only uses it to initialize ksm_thread_pages_to_scan when the
scan-time advisor is enabled. This will mislead the users.

The semantics of advisor_min_pages_to_scan was updated in the v2 patchset
[1], but the documentation wasn't updated.

Update the documentation and comment to match the semantics of
advisor_min_pages_to_scan.

Link: https://lore.kernel.org/linux-mm/20231028000945.2428830-2-shr@devkernel.io/ [1]
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
index 7d5b76478f0b..4a6cf8cf5d60 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -342,7 +342,7 @@ static enum ksm_advisor_type ksm_advisor;
  * Only called through the sysfs control interface:
  */
 
-/* At least scan this many pages per batch. */
+/* Initial number of pages to scan per batch. */
 static unsigned long ksm_advisor_min_pages_to_scan = 500;
 
 static void set_advisor_defaults(void)
-- 
2.43.0

