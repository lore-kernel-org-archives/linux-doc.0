Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C702343BE;
	Mon, 26 Jan 2026 08:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769414820; cv=none; b=uwVyGhssvgEbJrZHrMri2pm9zVysPQwbOU45LG////IfveTxrYukjh2Lht2Abz+P8YP0sN7l1R5Iz5MOFhOi6CmdZV1LmUHFm6Em5RErYR97PFperm2FCETF7F7KrakTWlp+ZpnxCWDWa9RqCjF3ZB0P1vjEH62kxCnQ6GPo2bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769414820; c=relaxed/simple;
	bh=KInPdW+CqToXWu1IQdYKg6tm+N4Nx5AIY4r2UQ8VSXQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I72R0ks/U+1BwPfcnuVAjEzxDnfnbLH9d2C+rzGwc/fMeQFn2+K+OE0XVEKpCUcNTOHwCP5TmGBa8FcClobaw1l3VRhlyuGhUptCidTpDrXQrTXQkQ2E5/TRjgIn+uVLCz/jMWoHYMNCT0j0Zf3VsKBxC+m72fvqjwjCn3CW9jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=EBYu/kGG; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="EBYu/kGG"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sOghiDouoURDtvNsJpBPALG0yovDywlbWn7RSuW8imw=;
	b=EBYu/kGG7IprOhDja66qjbVwFLKyc8+26zBLtrtFJfUnBFgKz7KsoaoVc5lVCR9QSjBZ4W8DW
	M8+F8RYTc4WAhCSflsNlzM7K7jNzkjJNhLonZUf/9gdIvmsnGg0HUbmhctW9RKxJSyXHjZtx1yW
	AbPpDlG1PFTpSfQNwAKa5+I=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4f01J070xzz1K977;
	Mon, 26 Jan 2026 16:03:28 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id AC42A40363;
	Mon, 26 Jan 2026 16:06:53 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 26 Jan
 2026 16:06:52 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <akpm@linux-foundation.org>,
	<bp@alien8.de>, <rdunlap@infradead.org>, <mingo@kernel.org>,
	<pawan.kumar.gupta@linux.intel.com>, <feng.tang@linux.alibaba.com>,
	<kees@kernel.org>, <elver@google.com>, <arnd@arndb.de>,
	<lirongqing@baidu.com>, <fvdl@google.com>, <bhelgaas@google.com>,
	<leitao@debian.org>, <songshuaishuai@tinylab.org>, <bjorn@rivosinc.com>,
	<rppt@kernel.org>, <dave.hansen@linux.intel.com>, <kevin.brodsky@arm.com>,
	<samuel.holland@sifive.com>, <vishal.moola@gmail.com>,
	<junhui.liu@pigmoral.tech>, <cuiyunhui@bytedance.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] riscv: kexec: Add support for crashkernel CMA reservation
Date: Mon, 26 Jan 2026 16:07:38 +0800
Message-ID: <20260126080738.696723-1-ruanjinjie@huawei.com>
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

Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
crashkernel= command line option") and commit ab475510e042 ("kdump:
implement reserve_crashkernel_cma") added CMA support for kdump
crashkernel reservation. This allows the kernel to dynamically allocate
contiguous memory for crash dumping when needed, rather than permanently
reserving a fixed region at boot time.

So extend crashkernel CMA reservation support to riscv. The following
changes are made to enable CMA reservation:

- Parse and obtain the CMA reservation size along with other crashkernel
  parameters.
- Call reserve_crashkernel_cma() to allocate the CMA region for kdump.
- Include the CMA-reserved ranges for kdump kernel to use.
- Exclude the CMA-reserved ranges from the crash kernel memory to
  prevent them from being exported through /proc/vmcore.

Update kernel-parameters.txt to document CMA support for crashkernel on
riscv architecture.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  2 +-
 arch/riscv/kernel/machine_kexec_file.c          | 17 +++++++++++++++--
 arch/riscv/mm/init.c                            |  5 +++--
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 1058f2a6d6a8..52414c254208 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1119,7 +1119,7 @@ Kernel parameters
 			It will be ignored when crashkernel=X,high is not used
 			or memory reserved is below 4G.
 	crashkernel=size[KMG],cma
-			[KNL, X86, ppc] Reserve additional crash kernel memory from
+			[KNL, X86, RISCV, ppc] Reserve additional crash kernel memory from
 			CMA. This reservation is usable by the first system's
 			userspace memory and kernel movable allocations (memory
 			balloon, zswap). Pages allocated from this memory range
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index dd9d92a96517..5c8f3cccbc83 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -59,9 +59,9 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 {
 	struct crash_mem *cmem;
 	unsigned int nr_ranges;
-	int ret;
+	int ret, i;
 
-	nr_ranges = 1; /* For exclusion of crashkernel region */
+	nr_ranges = 1 + crashk_cma_cnt; /* For exclusion of crashkernel region */
 	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
 
 	cmem = kmalloc(struct_size(cmem, ranges, nr_ranges), GFP_KERNEL);
@@ -74,11 +74,24 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	if (ret)
 		goto out;
 
+	for (i = 0; i < crashk_cma_cnt; i++) {
+		cmem->ranges[cmem->nr_ranges].start = crashk_cma_ranges[i].start;
+		cmem->ranges[cmem->nr_ranges].end = crashk_cma_ranges[i].end;
+		cmem->nr_ranges++;
+	}
+
 	/* Exclude crashkernel region */
 	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
 	if (!ret)
 		ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
+	for (i = 0; i < crashk_cma_cnt; ++i) {
+		ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
+					      crashk_cma_ranges[i].end);
+		if (ret)
+			goto out;
+	}
+
 out:
 	kfree(cmem);
 	return ret;
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index addb8a9305be..074d2d5f79ee 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1404,7 +1404,7 @@ static inline void setup_vm_final(void)
  */
 static void __init arch_reserve_crashkernel(void)
 {
-	unsigned long long low_size = 0;
+	unsigned long long low_size = 0, cma_size = 0;
 	unsigned long long crash_base, crash_size;
 	bool high = false;
 	int ret;
@@ -1414,11 +1414,12 @@ static void __init arch_reserve_crashkernel(void)
 
 	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
 				&crash_size, &crash_base,
-				&low_size, NULL, &high);
+				&low_size, &cma_size, &high);
 	if (ret)
 		return;
 
 	reserve_crashkernel_generic(crash_size, crash_base, low_size, high);
+	reserve_crashkernel_cma(cma_size);
 }
 
 void __init paging_init(void)
-- 
2.34.1

