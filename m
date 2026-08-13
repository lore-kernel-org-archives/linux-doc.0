Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD57C344D9B
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 03:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786592635; cv=none; b=hGiHmlPwwwQkRAl8X14ppbiX+u7PixPhPNcQkNf8LBY4H/dyi6akKOmeLMlZ9SmetaWgGbqULnFduc0vuS9lbq3EfIr89QG4q9/ScHEPS5QFI5X4Ydn2ROBfV9sibZl9R36Ey9KlRzppkfkUzwbIMf1/7Gwsz0lGqptyWOO4L34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786592635; c=relaxed/simple;
	bh=FFyspYGe+IPz1uaDWQQDBbyeOVHZy7zwYyOnK2Xos7c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VYc/Wp1FzCUBvK7mqJU66ofBqpwJJpHYdEMGTNBewS44hEXLpKQ4JPaFSfPKsmRvldPDhnrtF7yzJnVommfgs3yYobSix/EXrP5eCHcCuxBCsgSdqlAHwVbw63TRBlsP3y3jEFiwxaaDclwacd3CptqZq97mCRe1E06nJOKm3wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=YAoNliWy; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="YAoNliWy"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Q0WP5JdN/AIOBXWgf2qmOXq0QvCni7ganoj4mKN1n6I=;
	b=YAoNliWyelz+I/5Dr28odx6ViEOy7u5pUiMvI06de7lcxVV6oOrV0NhvYlT4dzmwRe1qMJ4/B
	qMugIzjQzMSZRzr2luYhY5OU/xUmtmvmWWrzJJOElES7rESHZMmW2WE2uUoZcN9+ytJMkM9a6pL
	cpml4UW/fn7R9dkZgCt28h0=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4hL9tG6LQfzmVX8;
	Thu, 13 Aug 2026 11:33:10 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 67CBE402AB;
	Thu, 13 Aug 2026 11:43:48 +0800 (CST)
Received: from huawei.com (10.50.85.135) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 11:43:47 +0800
From: Jinjiang Tu <tujinjiang@huawei.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <xu.xin16@zte.com.cn>,
	<chengming.zhou@linux.dev>, <ljs@kernel.org>, <liam@infradead.org>,
	<vbabka@kernel.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<shr@devkernel.io>, <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>
CC: <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>,
	<tujinjiang@huawei.com>
Subject: [PATCH v2 1/2] docs: ksm: fix typos in sysfs knob names
Date: Thu, 13 Aug 2026 11:17:21 +0800
Message-ID: <20260813031722.569983-2-tujinjiang@huawei.com>
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

The sysfs knob names in mm/ksm.c are "advisor_max_cpu" and
"advisor_max_pages_to_scan", but the ksm.rst documentation spelled
both as "adivsor_*", fix the two typos.

Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
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
2.43.0

