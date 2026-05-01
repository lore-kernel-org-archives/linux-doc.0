Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A2C2DAFD7
	for <linux-doc@vger.kernel.org>; Fri,  1 May 2026 17:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777657961; cv=none; b=LSOM7q6xVScEVG6Ul4i50KqGu15HmZuo3D2yZz7Gyr78a4VMRGdFIq2F0hrWsQEz0a+wLlFBKKGBVNFNZrihHolgh3PcKoNgsxeK1RJcjypnvag3b5ODxXm71WQQ5UF29G//rZ9JuTJ1LmMHKJARUnVZCuO2Op7e6ZLgVe811dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777657961; c=relaxed/simple;
	bh=4k+GAVl5/mpPhN++8tD3Jxmm2Yw/1RgbUkEDOwaqdes=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aP4NbnVwfQ0P+E/lemWxobWeCp1UOPXbP8xxXo9/Hc1gJDLWckWZEt1Twhky4zR1z0YsouuAn9LtVg7DixqmlYGGuTTQAggiO0VZfX0kJ+gEbBTDfazcxIeLbU6gkeCL/UrHXEDihkbB+CD6w0PRrTG5kCAC8vQay9n2YPjCHoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Gh9kSOOZ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Gh9kSOOZ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF2481713;
	Fri,  1 May 2026 10:52:32 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 93CE33F62B;
	Fri,  1 May 2026 10:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777657958; bh=4k+GAVl5/mpPhN++8tD3Jxmm2Yw/1RgbUkEDOwaqdes=;
	h=From:To:Cc:Subject:Date:From;
	b=Gh9kSOOZnur/OOMbcuGJyormUqFMW6TrSrFOs2Q1pRZ9jAmDWFTY3FWyRUrYWGRoN
	 0ozoaxf1thjgR9Y+lntHB5YqSzv4V3FDvHcGjNMFob7nn2NGEdqZqZh7nrN+GSW+qy
	 N2RYa6G7KJ6+avVvXdR07965wZYUsR4/MeKNojcI=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	catalin.marinas@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2] arm64: errata: Reformat table for IDs
Date: Fri,  1 May 2026 18:52:28 +0100
Message-ID: <0d4c8f3968e5c5c0a6f3dc295c3e9f696b9006f4.1777657487.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have some inconsistency where multiple errata for the same component
share the same Kconfig workaround; some are one ID per line, some are
smooshed together, and some are entirely separate entries. Standardise
on the single entry, one ID per line format so that things render nice
and consistently in the HTML docs, and it's simple and clear to add new
IDs to existing workarounds without churning the table too much.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

v2: Rebase for 7.0-rc1 

One last tilt at this windmill - at least I did remember! :)

 Documentation/arch/arm64/silicon-errata.rst | 47 +++++++++++----------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 211119ce7adc..046a7fa47063 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -116,7 +116,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A73      | #858921         | ARM64_ERRATUM_858921        |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | Cortex-A76      | #1188873,1418040| ARM64_ERRATUM_1418040       |
+| ARM            | Cortex-A76      | #1188873,       | ARM64_ERRATUM_1418040       |
+|                |                 | #1418040        |                             |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A76      | #1165522        | ARM64_ERRATUM_1165522       |
 +----------------+-----------------+-----------------+-----------------------------+
@@ -136,7 +137,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A78      | #3324344        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | Cortex-A78C     | #3324346,3324347| ARM64_ERRATUM_3194386       |
+| ARM            | Cortex-A78C     | #3324346,       | ARM64_ERRATUM_3194386       |
+|                |                 | #3324347        |                             |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A710     | #2119858        | ARM64_ERRATUM_2119858       |
 +----------------+-----------------+-----------------+-----------------------------+
@@ -172,11 +174,11 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X925     | #3324334        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | Neoverse-N1     | #1188873,1418040| ARM64_ERRATUM_1418040       |
+| ARM            | Neoverse-N1     | #1188873,       | ARM64_ERRATUM_1418040       |
+|                |                 | #1418040        |                             |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | Neoverse-N1     | #1349291        | N/A                         |
-+----------------+-----------------+-----------------+-----------------------------+
-| ARM            | Neoverse-N1     | #1490853        | N/A                         |
+| ARM            | Neoverse-N1     | #1349291,       | N/A                         |
+|                |                 | #1490853        |                             |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-N1     | #1542419        | ARM64_ERRATUM_1542419       |
 +----------------+-----------------+-----------------+-----------------------------+
@@ -204,10 +206,13 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | C1-Pro          | #4193714        | ARM64_ERRATUM_4193714       |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | MMU-500         | #841119,826419  | ARM_SMMU_MMU_500_CPRE_ERRATA|
-|                |                 | #562869,1047329 |                             |
+| ARM            | MMU-500         | #562869,        | ARM_SMMU_MMU_500_CPRE_ERRATA|
+|                |                 | #841119,        |                             |
+|                |                 | #826419,        |                             |
+|                |                 | #1047329        |                             |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | MMU-600         | #1076982,1209401| N/A                         |
+| ARM            | MMU-600         | #1076982,       | N/A                         |
+|                |                 | #1209401        |                             |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | MMU-700         | #2133013,       | N/A                         |
 |                |                 | #2268618,       |                             |
@@ -230,11 +235,13 @@ stable kernels.
 | Broadcom       | Brahma-B53      | N/A             | ARM64_ERRATUM_843419        |
 +----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
-| Cavium         | ThunderX ITS    | #22375,24313    | CAVIUM_ERRATUM_22375        |
+| Cavium         | ThunderX ITS    | #22375,         | CAVIUM_ERRATUM_22375        |
+|                |                 | #24313          |                             |
 +----------------+-----------------+-----------------+-----------------------------+
 | Cavium         | ThunderX ITS    | #23144          | CAVIUM_ERRATUM_23144        |
 +----------------+-----------------+-----------------+-----------------------------+
-| Cavium         | ThunderX GICv3  | #23154,38545    | CAVIUM_ERRATUM_23154        |
+| Cavium         | ThunderX GICv3  | #23154,         | CAVIUM_ERRATUM_23154        |
+|                |                 | #38545          |                             |
 +----------------+-----------------+-----------------+-----------------------------+
 | Cavium         | ThunderX GICv3  | #38539          | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
@@ -244,9 +251,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Cavium         | ThunderX SMMUv2 | #27704          | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
-| Cavium         | ThunderX2 SMMUv3| #74             | N/A                         |
-+----------------+-----------------+-----------------+-----------------------------+
-| Cavium         | ThunderX2 SMMUv3| #126            | N/A                         |
+| Cavium         | ThunderX2 SMMUv3| #74,            | N/A                         |
+|                |                 | #126            |                             |
 +----------------+-----------------+-----------------+-----------------------------+
 | Cavium         | ThunderX2 Core  | #219            | CAVIUM_TX2_ERRATUM_219      |
 +----------------+-----------------+-----------------+-----------------------------+
@@ -258,11 +264,9 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | NVIDIA         | T241 GICv3/4.x  | T241-FABRIC-4   | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
-| NVIDIA         | T241 MPAM       | T241-MPAM-1     | N/A                         |
-+----------------+-----------------+-----------------+-----------------------------+
-| NVIDIA         | T241 MPAM       | T241-MPAM-4     | N/A                         |
-+----------------+-----------------+-----------------+-----------------------------+
-| NVIDIA         | T241 MPAM       | T241-MPAM-6     | N/A                         |
+| NVIDIA         | T241 MPAM       | T241-MPAM-1,    | N/A                         |
+|                |                 | T241-MPAM-4,    |                             |
+|                |                 | T241-MPAM-6     |                             |
 +----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | Freescale/NXP  | LS2080A/LS1043A | A-008585        | FSL_ERRATUM_A008585         |
@@ -270,9 +274,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Hisilicon      | Hip0{5,6,7}     | #161010101      | HISILICON_ERRATUM_161010101 |
 +----------------+-----------------+-----------------+-----------------------------+
-| Hisilicon      | Hip0{6,7}       | #161010701      | N/A                         |
-+----------------+-----------------+-----------------+-----------------------------+
-| Hisilicon      | Hip0{6,7}       | #161010803      | N/A                         |
+| Hisilicon      | Hip0{6,7}       | #161010701,     | N/A                         |
+|                |                 | #161010803      |                             |
 +----------------+-----------------+-----------------+-----------------------------+
 | Hisilicon      | Hip07           | #161600802      | HISILICON_ERRATUM_161600802 |
 +----------------+-----------------+-----------------+-----------------------------+
-- 
2.54.0.dirty

