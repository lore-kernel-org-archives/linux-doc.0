Received: from mta21.hihonor.com (mta21.honor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4B227E7F0;
	Fri, 28 Nov 2025 03:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764299431; cv=none; b=eMtiNw+ninoQtP6+O0yIFAOtIkDu4j1mIG0Ei1wfo1OapZtioIeeUK6tQS54K4135KgreHRU1EF5J6pwmcjOWDWPa8efIwv3u80IHivaaX40iAUsPIHFMuCceyjMP8eBAHw0TBvLwS5ncLeWju8KwaNY94nMHN8sC34Xfa8pQFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764299431; c=relaxed/simple;
	bh=RvZ0qCmwZ3fJPqm5mLK+MGtwlfZWW35XmWu/Rt1Gxr0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HaGhZqT9cSFtPM4pDSlo0PcpYILBstRxYbirgoVwdqJc7wuQ1QfybqJzcjphjIMEUjE9r+fpYC3oXzv6C1oeUd/66puNs00J/s9w+OT5qfEM5w/bItwMbZuvyPXRVH4bNth/epEZR6tPIuifXfqdZVLF9BWFzDjmAICxKIqUlUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w002.hihonor.com (unknown [10.68.28.120])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4dHdBy2jyCzYmZBB;
	Fri, 28 Nov 2025 10:52:58 +0800 (CST)
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
Subject: [PATCH 2/3] mm/lru_gen: add configuration option to select debugfs/procfs for lru_gen
Date: Fri, 28 Nov 2025 10:53:14 +0800
Message-ID: <20251128025315.3520689-3-wangzicheng@honor.com>
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
 mm/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index e443fe8cd..be7efa794 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1325,6 +1325,16 @@ config LRU_GEN_STATS
 config LRU_GEN_WALKS_MMU
 	def_bool y
 	depends on LRU_GEN && ARCH_HAS_HW_PTE_YOUNG
+
+config LRU_GEN_PROCFS_CTRL
+	bool "Move lru_gen files from debugfs to procfs"
+	depends on LRU_GEN && PROC_FS
+	help
+	  Move lru_gen management from debugfs to procfs (/proc/lru_gen).
+	  This production-ready feature provides critical memory reclaim
+	  prediction and control. It is no longer experimental.
+	  The migration ensures availability in commercial products where
+	  debugfs may be disabled.
 # }
 
 config ARCH_SUPPORTS_PER_VMA_LOCK
-- 
2.25.1

