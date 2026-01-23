Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7B531079B;
	Fri, 23 Jan 2026 07:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769154468; cv=none; b=uaNnPva/lKVV+LgZCL/Cvva6Mz4LZZNIuzN4tKPieMWHN72tqEfnOrXqlJWZ8rJAMoap9bdvpBKITRtWWyyD9ITtj6zN6+w/NM8r+LFSc7m6w4nSY+v6bsNRCRjU55SF38VLfPR8eSURtfPIOCTZrlftpcQuHOjcogZ1ZtqVNgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769154468; c=relaxed/simple;
	bh=qUcLnToOvorjLz9B6ZCQPLE+QQQSR46GViCUXzmoLV4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DfdHAcdQt8/TSMYOrak2kGG4TA1tVoIseANIUNirkP4SAGe4eiczteiYi1zTjTN0itFEyNdL/IIoen+HoKbtk5izARyOapcjRbB2ovvO71qNRDuvPkflMoBg4xGlLSCVSoN/2YgZHzXIPiaduNHG4llke1ZscB48LxXy0BwdUzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ucu8Aktj; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="ucu8Aktj"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9X1GTVnY0vt9hujadDkLN3Ggzel/zKjPMR+QmU9tNoM=;
	b=ucu8AktjpJc1oUrYKgWpv0dmCjXJsGJMgJBb6YSnPQSonNZmy6RN/OMbBwmJbaSsigiz9KZFk
	TY/ViQFjwBzswmGsqwZA3u4mpZB19kYjc8kQ0aBEiCbSGsVjYLj7VzB57vQFWknsSwFKzEioW3P
	icxQgUfUc1ccX4CGgbDHous=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4dy91G5jHNz1K96y;
	Fri, 23 Jan 2026 15:44:18 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id AFE234055B;
	Fri, 23 Jan 2026 15:47:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 23 Jan
 2026 15:47:40 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<akpm@linux-foundation.org>, <bp@alien8.de>,
	<pawan.kumar.gupta@linux.intel.com>, <mingo@kernel.org>,
	<feng.tang@linux.alibaba.com>, <kees@kernel.org>, <elver@google.com>,
	<arnd@arndb.de>, <lirongqing@baidu.com>, <fvdl@google.com>,
	<bhelgaas@google.com>, <leitao@debian.org>, <bhe@redhat.com>,
	<dave.hansen@linux.intel.com>, <rppt@kernel.org>, <ryan.roberts@arm.com>,
	<ardb@kernel.org>, <osandov@fb.com>, <jbohac@suse.cz>,
	<sourabhjain@linux.ibm.com>, <cfsworks@gmail.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] arm64: kexec: Add support for crashkernel CMA reservation
Date: Fri, 23 Jan 2026 15:48:20 +0800
Message-ID: <20260123074820.310605-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)

Extend crashkernel CMA reservation support to arm64.

The following changes are made to enable CMA reservation:

- Parse and obtain the CMA reservation size along with other crashkernel
  parameters.
- Call reserve_crashkernel_cma() to allocate the CMA region for kdump.
- Include the CMA-reserved ranges for kdump kernel to use.
- Exclude the CMA-reserved ranges from the crash kernel memory to
  prevent them from being exported through /proc/vmcore.

Update kernel-parameters.txt to document CMA support for crashkernel on
arm64 architecture.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  2 +-
 arch/arm64/kernel/machine_kexec_file.c          | 15 ++++++++++++++-
 arch/arm64/mm/init.c                            |  5 +++--
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 1058f2a6d6a8..36bb642a7edd 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1119,7 +1119,7 @@ Kernel parameters
 			It will be ignored when crashkernel=X,high is not used
 			or memory reserved is below 4G.
 	crashkernel=size[KMG],cma
-			[KNL, X86, ppc] Reserve additional crash kernel memory from
+			[KNL, X86, ARM64, ppc] Reserve additional crash kernel memory from
 			CMA. This reservation is usable by the first system's
 			userspace memory and kernel movable allocations (memory
 			balloon, zswap). Pages allocated from this memory range
diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index 410060ebd86d..0ee679167664 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -48,7 +48,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	u64 i;
 	phys_addr_t start, end;
 
-	nr_ranges = 2; /* for exclusion of crashkernel region */
+	nr_ranges = 2 + crashk_cma_cnt; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
 		nr_ranges++;
 
@@ -64,6 +64,12 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 		cmem->nr_ranges++;
 	}
 
+	for (i = 0; i < crashk_cma_cnt; i++) {
+		cmem->ranges[cmem->nr_ranges].start = crashk_cma_ranges[i].start;
+		cmem->ranges[cmem->nr_ranges].end = crashk_cma_ranges[i].end;
+		cmem->nr_ranges++;
+	}
+
 	/* Exclude crashkernel region */
 	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
 	if (ret)
@@ -75,6 +81,13 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 			goto out;
 	}
 
+	for (i = 0; i < crashk_cma_cnt; ++i) {
+		ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
+					      crashk_cma_ranges[i].end);
+		if (ret)
+			return ret;
+	}
+
 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
 out:
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 524d34a0e921..28165d94af08 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -96,8 +96,8 @@ phys_addr_t __ro_after_init arm64_dma_phys_limit;
 
 static void __init arch_reserve_crashkernel(void)
 {
+	unsigned long long crash_base, crash_size, cma_size = 0;
 	unsigned long long low_size = 0;
-	unsigned long long crash_base, crash_size;
 	bool high = false;
 	int ret;
 
@@ -106,11 +106,12 @@ static void __init arch_reserve_crashkernel(void)
 
 	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
 				&crash_size, &crash_base,
-				&low_size, NULL, &high);
+				&low_size, &cma_size, &high);
 	if (ret)
 		return;
 
 	reserve_crashkernel_generic(crash_size, crash_base, low_size, high);
+	reserve_crashkernel_cma(cma_size);
 }
 
 static phys_addr_t __init max_zone_phys(phys_addr_t zone_limit)
-- 
2.34.1

