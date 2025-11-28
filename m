Received: from mta22.hihonor.com (mta22.hihonor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1780027E7F0;
	Fri, 28 Nov 2025 03:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764299518; cv=none; b=UcGFIyUDwosJZdEx1hoK71Q+UpQ2XCvo0priKZGhaI1psvOHPQxAxVKMrK/F8n1vPDjm1U+7OFHmxoXb32wAZ2HOuX8Qy9lb0ps4Cz8ERpNu+WU3TgNrsTUi26Vu1RAkkEQjIv43jETpkO5uKZ/yuHm+8DGbnRsAN/cVS75B8WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764299518; c=relaxed/simple;
	bh=gU0jwzK/DYSOitX7LplGaHqyCltgRlPoQldaJbSs83I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hEekpy4Vi1MW+DJU42ZyedJgNH3SBphWeDHlJUXck4segNUjgzWVXRj07auHwDQs0NpxJ6+4znikIneWFI6k6oyuBhbeLuwdgX2pyxicDO2yAcJSXKcAJqPgpMb30ZOLvKJOqb7dgH2MbqMSA4tthIKrtizAoYwZKfLJgVbkDsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b=D/ONv38m; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b="D/ONv38m"
dkim-signature: v=1; a=rsa-sha256; d=honor.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=To:From;
	bh=ayengAhX69VuLBH0udWTRo6vLW+weVNlnBoDZD4F89Y=;
	b=D/ONv38mN1pq1e7180jj6fLd5a8259bJluYa3QO18y6zFy5F/tRiYEJP8sym2N7hA863amxvr
	UmNMVh51G4h4+er9cvTf/XqUjjc4dCIuQNJ6lR9iPwniiE+8aoFvWlI/2gJhYBYcJyOxXcb7XTV
	KBo6WDRcjPl4ShX19XnFtbQ=
Received: from w002.hihonor.com (unknown [10.68.28.120])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4dHdBN5DVfzYmwXH;
	Fri, 28 Nov 2025 10:52:28 +0800 (CST)
Received: from localhost.localdomain (10.144.5.36) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 28 Nov
 2025 10:54:19 +0800
From: Zicheng Wang <wangzicheng@honor.com>
To: <akpm@linux-foundation.org>, <hannes@cmpxchg.org>, <david@redhat.com>,
	<axelrasmussen@google.com>, <yuanchu@google.com>
CC: <mhocko@kernel.org>, <zhengqi.arch@bytedance.com>,
	<shakeel.butt@linux.dev>, <lorenzo.stoakes@oracle.com>, <weixugc@google.com>,
	<Liam.Howlett@oracle.com>, <vbabka@suse.cz>, <rppt@kernel.org>,
	<surenb@google.com>, <mhocko@suse.com>, <corbet@lwn.net>,
	<linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Zicheng Wang <wangzicheng@honor.com>
Subject: [PATCH 3/3] mm/lru_gen: document procfs interface for lru_gen
Date: Fri, 28 Nov 2025 10:53:15 +0800
Message-ID: <20251128025315.3520689-4-wangzicheng@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251128025315.3520689-1-wangzicheng@honor.com>
References: <20251128025315.3520689-1-wangzicheng@honor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: w012.hihonor.com (10.68.27.189) To w002.hihonor.com
 (10.68.28.120)

Signed-off-by: Zicheng Wang <wangzicheng@honor.com>
---
 Documentation/admin-guide/mm/multigen_lru.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/admin-guide/mm/multigen_lru.rst b/Documentation/admin-guide/mm/multigen_lru.rst
index 9cb54b4ff..d9927b254 100644
--- a/Documentation/admin-guide/mm/multigen_lru.rst
+++ b/Documentation/admin-guide/mm/multigen_lru.rst
@@ -161,3 +161,22 @@ cold pages because of the overestimation, it retries on the next
 server according to the ranking result obtained from the working set
 estimation step. This less forceful approach limits the impacts on the
 existing jobs.
+
+Procfs Migration
+================
+The multi-gen LRU control interface has been moved from debugfs to procfs
+via ``CONFIG_LRU_GEN_PROCFS_CTRL``:
+
+New Path
+--------
+- Control interface: ``/proc/lru_gen``
+- Replaces debugfs path: ``/sys/kernel/debug/lru_gen``
+
+Key Advantages
+--------------
+1. Production-ready availability (works when debugfs is not allowed)
+2. Maintains identical ABI to original debugfs interface
+3. Preserves all core functionality (working set estimation, proactive reclaim)
+4. Standardized location matching memory management conventions
+
+Note: Requires both ``CONFIG_PROC_FS`` and ``CONFIG_LRU_GEN``
-- 
2.25.1

