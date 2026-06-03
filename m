Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4328D2253EC;
	Wed,  3 Jun 2026 06:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780467645; cv=none; b=OLrC/XhYGvIKP5YhrY7s+jB6bfW/XOBZHqoRyys8GVp0QbCC8olvRVhrHWZaipc2u/p1/mGAZHbPP5ZmWo2J6ZJCe9EGs2G5asEbJhRiFXlGIEiaf7xhp280/9xfH6b7hDoA3wuWqIMEgSugwlYNSe6q2w6RymSxL2arSySFH9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780467645; c=relaxed/simple;
	bh=W0ay1o41tkBLl44bfMWBhmm8NeRGKvG2Uwu0nxnCA4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GNwGPMb+we29+IGQPByZCHIGbST/XpduW/ucZMB0whCOgPKyCFzPQ5zXkPI5PP6JtsZla7e8bX0qvewOHvkOQcOxT7fGtzsUwH9ceh+6YRH3R1/LhVhelqj1hMMtHZzDUh5e2YPZo+XTfehHtVlGPDroUZ8ZUa+tj4jDZkVHmLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gVcy9228hzYQtk8;
	Wed,  3 Jun 2026 14:20:33 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 6C78340573;
	Wed,  3 Jun 2026 14:20:39 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.87.109])
	by APP1 (Coremail) with SMTP id cCh0CgBHlzytxx9qYt3IAQ--.56787S5;
	Wed, 03 Jun 2026 14:20:39 +0800 (CST)
From: Zeng Heng <zengheng@huaweicloud.com>
To: will@kernel.org,
	vladimir.murzin@arm.com,
	xuwei5@huawei.com,
	broonie@kernel.org,
	ryan.roberts@arm.com,
	corbet@lwn.net,
	catalin.marinas@arm.com,
	oupton@kernel.org,
	kevin.brodsky@arm.com,
	maz@kernel.org,
	yeoreum.yun@arm.com,
	skhan@linuxfoundation.org,
	yangyicong@hisilicon.com,
	thuth@redhat.com,
	kuninori.morimoto.gx@renesas.com,
	lucaswei@google.com,
	lpieralisi@kernel.org,
	miko.lenczewski@arm.com,
	mark.rutland@arm.com,
	james.clark@linaro.org
Cc: wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	zengheng4@huawei.com
Subject: [PATCH v4 1/2] arm64: cpufeature: Add WORKAROUND_DISABLE_CNP capability
Date: Wed,  3 Jun 2026 14:20:24 +0800
Message-ID: <20260603062025.1504083-2-zengheng@huaweicloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603062025.1504083-1-zengheng@huaweicloud.com>
References: <20260603062025.1504083-1-zengheng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgBHlzytxx9qYt3IAQ--.56787S5
X-Coremail-Antispam: 1UD129KBjvJXoWxGw4DGF4DWFW8uw18Jr1fWFg_yoWruF1fpw
	1UKw4rJrW3uF15G348X3ZxurWFkan3Gw1Y9rWj934qqr4av3yUAF4Fq3y7uFs29F9rur48
	GFnF9r15ZF1jy37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
	Ij6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI
	0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUIw0e
	DUUUU
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/

From: Zeng Heng <zengheng4@huawei.com>

The NVIDIA Carmel CNP erratum is not the only case requiring CNP to be
disabled. Abstract this into a common WORKAROUND_DISABLE_CNP capability
to facilitate adding errata for future chips and reduce duplicate
checks in has_useable_cnp().

This serves as a prerequisite for the subsequent Hisilicon erratum
162100125.

Suggested-by: Vladimir Murzin <vladimir.murzin@arm.com>
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>
Acked-by: Wei Xu <xuwei5@hisilicon.com>
---
 arch/arm64/Kconfig               |  4 ++++
 arch/arm64/include/asm/cpucaps.h |  4 ++--
 arch/arm64/kernel/cpu_errata.c   | 15 ++++++++++++---
 arch/arm64/kernel/cpufeature.c   |  2 +-
 arch/arm64/tools/cpucaps         |  2 +-
 5 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fe60738e5943..f297517a83b9 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1315,9 +1315,13 @@ config QCOM_FALKOR_ERRATUM_E1041
 
 	  If unsure, say Y.
 
+config ARM64_WORKAROUND_DISABLE_CNP
+	bool
+
 config NVIDIA_CARMEL_CNP_ERRATUM
 	bool "NVIDIA Carmel CNP: CNP on Carmel semantically different than ARM cores"
 	default y
+	select ARM64_WORKAROUND_DISABLE_CNP
 	help
 	  If CNP is enabled on Carmel cores, non-sharable TLBIs on a core will not
 	  invalidate shared TLB entries installed by a different core, as it would
diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index d0d3cdd5763c..25c61cda901c 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -58,8 +58,8 @@ cpucap_is_possible(const unsigned int cap)
 		return IS_ENABLED(CONFIG_ARM64_ERRATUM_2658417);
 	case ARM64_WORKAROUND_CAVIUM_23154:
 		return IS_ENABLED(CONFIG_CAVIUM_ERRATUM_23154);
-	case ARM64_WORKAROUND_NVIDIA_CARMEL_CNP:
-		return IS_ENABLED(CONFIG_NVIDIA_CARMEL_CNP_ERRATUM);
+	case ARM64_WORKAROUND_DISABLE_CNP:
+		return IS_ENABLED(CONFIG_ARM64_WORKAROUND_DISABLE_CNP);
 	case ARM64_WORKAROUND_REPEAT_TLBI:
 		return IS_ENABLED(CONFIG_ARM64_WORKAROUND_REPEAT_TLBI);
 	case ARM64_WORKAROUND_SPECULATIVE_SSBS:
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 5377e4c2eba2..08eb9d6545d1 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -608,6 +608,15 @@ static const struct midr_range erratum_ac04_cpu_23_list[] = {
 };
 #endif
 
+#ifdef CONFIG_ARM64_WORKAROUND_DISABLE_CNP
+static const struct midr_range cnp_erratum_cpus[] = {
+#ifdef CONFIG_NVIDIA_CARMEL_CNP_ERRATUM
+	MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
+#endif
+	{},
+};
+#endif
+
 const struct arm64_cpu_capabilities arm64_errata[] = {
 #ifdef CONFIG_ARM64_WORKAROUND_CLEAN_CACHE
 	{
@@ -801,12 +810,12 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 				  1, 0),
 	},
 #endif
-#ifdef CONFIG_NVIDIA_CARMEL_CNP_ERRATUM
+#ifdef CONFIG_ARM64_WORKAROUND_DISABLE_CNP
 	{
 		/* NVIDIA Carmel */
 		.desc = "NVIDIA Carmel CNP erratum",
-		.capability = ARM64_WORKAROUND_NVIDIA_CARMEL_CNP,
-		ERRATA_MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
+		.capability = ARM64_WORKAROUND_DISABLE_CNP,
+		ERRATA_MIDR_RANGE_LIST(cnp_erratum_cpus),
 	},
 #endif
 #ifdef CONFIG_ARM64_WORKAROUND_TRBE_OVERWRITE_FILL_MODE
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6d53bb15cf7b..20c5f24f74a9 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1785,7 +1785,7 @@ has_useable_cnp(const struct arm64_cpu_capabilities *entry, int scope)
 	if (is_kdump_kernel())
 		return false;
 
-	if (cpus_have_cap(ARM64_WORKAROUND_NVIDIA_CARMEL_CNP))
+	if (cpus_have_cap(ARM64_WORKAROUND_DISABLE_CNP))
 		return false;
 
 	return has_cpuid_feature(entry, scope);
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 811c2479e82d..9b85a84f6fd4 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -120,7 +120,7 @@ WORKAROUND_CAVIUM_TX2_219_PRFM
 WORKAROUND_CAVIUM_TX2_219_TVM
 WORKAROUND_CLEAN_CACHE
 WORKAROUND_DEVICE_LOAD_ACQUIRE
-WORKAROUND_NVIDIA_CARMEL_CNP
+WORKAROUND_DISABLE_CNP
 WORKAROUND_PMUV3_IMPDEF_TRAPS
 WORKAROUND_QCOM_FALKOR_E1003
 WORKAROUND_QCOM_ORYON_CNTVOFF
-- 
2.43.0

