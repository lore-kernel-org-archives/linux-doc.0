Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DA437756F;
	Wed,  3 Jun 2026 06:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780467658; cv=none; b=AzoKI+ceSwbaG74J5LoR8Q3s0w5Wf6FarmYpuo8cI7iRKxrosGdrsmPF3IxdKnqVjYlHP/fKZWZqRAAMZEB8Lm7URXp1/IwGcPCGG5o8MzKpdUCSHp+tS6iTAjsPOMogZVS+XKKAYEhFCnhsruT2dTjkmJnVrgvRg1Ny01/u7YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780467658; c=relaxed/simple;
	bh=Ts33ZPjowL53LM4zHYGuB9Jj/D8KSTOodKScOiSs1mE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=An3aX5ouID7+efdAPG4AyQzKxOp6nOf8YavQMS9N8fsktimb0cN+wKfPQ0iuqcROx98yOUH0UM9s7PBmX2y2tWihhGD+Ku94ggClsL4Hof2FbWc7yQ2GEfTmPXY/VHdQiOBtP6R9q0ITHJAQeZUBe1iavQQP1c1PN9b2vuewNTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gVcxp57RVzKHMSW;
	Wed,  3 Jun 2026 14:20:14 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 2C5B14056F;
	Wed,  3 Jun 2026 14:20:40 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.87.109])
	by APP1 (Coremail) with SMTP id cCh0CgBHlzytxx9qYt3IAQ--.56787S6;
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
Subject: [PATCH v4 2/2] arm64: kernel: Disable CNP on HiSilicon HIP09
Date: Wed,  3 Jun 2026 14:20:25 +0800
Message-ID: <20260603062025.1504083-3-zengheng@huaweicloud.com>
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
X-CM-TRANSID:cCh0CgBHlzytxx9qYt3IAQ--.56787S6
X-Coremail-Antispam: 1UD129KBjvJXoWxJw47Jr45ZrWUWw45Kw4DArb_yoWrGF13pr
	43Jr1xJFyUWF13JryUJw1UXr15Can3Jw1DXF1Utry8Xr1jy34UZr18Kw1xGFWUXry8Xr4U
	WF1j9FyUtr47ArUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
	Ij6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI
	0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07jI
	sjbUUUUU=
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/

From: Zeng Heng <zengheng4@huawei.com>

HiSilicon HIP09 implements TLB entry matching behavior that deviates
from the ARM architecture specification when the CNP (Common not Private)
bit is set in TTBRx_ELx.

When TTBRx.CNP=1, TLB entries may be incorrectly shared between CPU
cores, leading to TLB conflicts and stale mappings. This affects
coherency and can result in incorrect translations.

Add the hardware erratum workaround (Hisilicon erratum 162100125) to
disable CNP on affected HIP09 cores.

Co-developed-by: Tong Tiangen <tongtiangen@huawei.com>
Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>
Acked-by: Wei Xu <xuwei5@hisilicon.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 16 ++++++++++++++++
 arch/arm64/kernel/cpu_errata.c              |  6 ++++--
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 211119ce7adc..cd50059edb85 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -284,6 +284,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Hisilicon      | Hip09           | #162100801      | HISILICON_ERRATUM_162100801 |
 +----------------+-----------------+-----------------+-----------------------------+
+| Hisilicon      | Hip09           | #162100125      | HISILICON_ERRATUM_162100125 |
++----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | Kryo/Falkor v1  | E1003           | QCOM_FALKOR_ERRATUM_1003    |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index f297517a83b9..75638e37883d 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1273,6 +1273,22 @@ config HISILICON_ERRATUM_162100801
 
 	  If unsure, say Y.
 
+config HISILICON_ERRATUM_162100125
+	bool "Hisilicon erratum 162100125"
+	default y
+	select ARM64_WORKAROUND_DISABLE_CNP
+	help
+	  On HiSilicon HIP09, TLB entry matching behavior when CNP
+	  (TTBRx.CNP=1) is enabled differs from the ARM architecture
+	  specification.
+
+	  TLB entries may be incorrectly shared between CPUs, potentially
+	  causing TLB conflicts and stale mappings.
+
+	  Disable CNP support for affected HiSilicon HIP09 cores.
+
+	  If unsure, say Y.
+
 config QCOM_FALKOR_ERRATUM_1003
 	bool "Falkor E1003: Incorrect translation due to ASID change"
 	default y
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 08eb9d6545d1..310e6f120992 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -612,6 +612,9 @@ static const struct midr_range erratum_ac04_cpu_23_list[] = {
 static const struct midr_range cnp_erratum_cpus[] = {
 #ifdef CONFIG_NVIDIA_CARMEL_CNP_ERRATUM
 	MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
+#endif
+#ifdef CONFIG_HISILICON_ERRATUM_162100125
+	MIDR_ALL_VERSIONS(MIDR_HISI_HIP09),
 #endif
 	{},
 };
@@ -812,8 +815,7 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 #endif
 #ifdef CONFIG_ARM64_WORKAROUND_DISABLE_CNP
 	{
-		/* NVIDIA Carmel */
-		.desc = "NVIDIA Carmel CNP erratum",
+		.desc = "NVIDIA Carmel CNP erratum, or Hisilicon erratum 162100125",
 		.capability = ARM64_WORKAROUND_DISABLE_CNP,
 		ERRATA_MIDR_RANGE_LIST(cnp_erratum_cpus),
 	},
-- 
2.43.0

