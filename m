Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185442DC773;
	Sat,  6 Dec 2025 23:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765062238; cv=none; b=fM8hVCT6GW1RLL10A0QFpPkkWwiWg2OTQ6qFpiyKLCi/0LiPlZWQsXaI0/S5X2ubK82X08szncR+oE/VuYDGCmSVh4wuLGAXtI7zntiPTBOpzhvpVwrXlyDQ569qSkbxcTRdkHJKmHeuZ6fLi6xG7KCNWAA0lQ3IT11uKoN8DQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765062238; c=relaxed/simple;
	bh=fGPbJKByL7S+VIwHfLLrxZLls7YbYHHkduUbnM1vhgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HR8aWVg7dR7U1PU8DUh+s/Zxl6PtVrIZT5ZqCItPWSO3eMz4eGa76T66mZ/TARcc25XD9ugMY0xdsAJEG/PfoE1V+G6rGHel7ME3n2jUggps9htSPCBk+ro/zd0p7ebr2rEq4n79xF7sHK7IBAsRVkfHrrgRkz4uKed8z0LP6+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uJ2JZwXM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uJ2JZwXM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24BDEC4CEF5;
	Sat,  6 Dec 2025 23:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765062237;
	bh=fGPbJKByL7S+VIwHfLLrxZLls7YbYHHkduUbnM1vhgk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uJ2JZwXMPZBVSnMwc5z8fugeGrViXv1sYM2jgFTCIoMG++wHeJDsoqlg2QWMyz1fG
	 /D34iNvXn6M1p4hEMRSR80EXzWx5TeD/YRn4gwPgpNUCQIsRcEdDJn4HH8cUc530+Z
	 X9dHrgt33cuDK7Q9iVwzJvfxywhfHrIuKYqc8x/HPgLuQzzPHrJPpoZCilQbQV9dOD
	 MPBWe8RhC+HfjVA/0WNKEKtWzH3M9hSus+AN8uv7wPg+eA1RA6A5l67e4n9a6VdDag
	 vDH2yDJC1sTAhvwujm6FimvTkDOlCN4Am9/l9c5dKYMRMxpQWn++1R0J682zSIP+3Y
	 3eHXsYi/SqXYA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Alexander Graf <graf@amazon.com>,
	David Matlack <dmatlack@google.com>,
	David Rientjes <rientjes@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Vipin Sharma <vipinsh@google.com>,
	Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	kexec@lists.infradead.org
Subject: [RFC PATCH 08/10] mm: hugetlb: disable CMA if liveupdate is enabled
Date: Sun,  7 Dec 2025 00:02:18 +0100
Message-ID: <20251206230222.853493-9-pratyush@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251206230222.853493-1-pratyush@kernel.org>
References: <20251206230222.853493-1-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hugetlb live update support does not yet work with CMA. Print a warning
and disable CMA if the config for live updating hugetlb is enabled, and
liveupdate is enabled at runtime.

Signed-off-by: Pratyush Yadav <pratyush@kernel.org>
---
 kernel/liveupdate/Kconfig | 3 +++
 mm/hugetlb_cma.c          | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/kernel/liveupdate/Kconfig b/kernel/liveupdate/Kconfig
index 86e76aed8a93..4676fea6d8a6 100644
--- a/kernel/liveupdate/Kconfig
+++ b/kernel/liveupdate/Kconfig
@@ -82,6 +82,9 @@ config LIVEUPDATE_HUGETLB
 	  use hugetlb memfd to back VM memory, or for other user workloads needing
 	  to live update huge pages.
 
+	  Enabling this config disables CMA for hugetlb pages. It is not yet
+	  supported with live update.
+
 	  If unsure, say N.
 
 endmenu
diff --git a/mm/hugetlb_cma.c b/mm/hugetlb_cma.c
index e8e4dc7182d5..fa3bb776c0d2 100644
--- a/mm/hugetlb_cma.c
+++ b/mm/hugetlb_cma.c
@@ -4,6 +4,7 @@
 #include <linux/cma.h>
 #include <linux/compiler.h>
 #include <linux/mm_inline.h>
+#include <linux/liveupdate.h>
 
 #include <asm/page.h>
 #include <asm/setup.h>
@@ -152,6 +153,12 @@ void __init hugetlb_cma_reserve(int order)
 	if (!hugetlb_cma_size)
 		return;
 
+	if (IS_ENABLED(CONFIG_LIVEUPDATE_HUGETLB) && liveupdate_enabled()) {
+		pr_warn("HugeTLB: CMA not supported with live update. Falling back to pre-allocating pages.\n");
+		hugetlb_cma_size = 0;
+		return;
+	}
+
 	hugetlb_bootmem_set_nodes();
 
 	for (nid = 0; nid < MAX_NUMNODES; nid++) {
-- 
2.43.0

