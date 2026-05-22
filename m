Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B5E368D73;
	Fri, 22 May 2026 17:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779472748; cv=none; b=KoyQJUDhA0rpHfe/+hO7JK6GAsAxJEGh1q+zmOpzPDOrXdEvsCu74vTajSbeM/MgZbR21fdricXcsa+Qj8u3mxPp5Z3ivRfO942WgtRQdKkmxkECC6Na/KhdWCi4NojCq7GJrTWVKpqKjYka+BKQ79jZDaWiAMFaUZKozZL6SPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779472748; c=relaxed/simple;
	bh=BeJCPrI87ngYnWhvrn7H07d98eQ7tMnKHmjO+Ju1V94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cEb9ApTR/4KK3VWdTj96NgxaPwww2+2HC/oAmjMOyJ5gXLvX6LS7CoTpY+shl4MqV6O4GJK4I+4tX7tgP61M3IE6W3skYUq3XyW3MlRDGVT/6rj8roqxx16VjbA29zfecADK6S5MhQi8S1XYt92l8NgzXv2flVIC/2c7LnBgrdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KB1dBY/v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KB1dBY/v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 624031F00A3D;
	Fri, 22 May 2026 17:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779472746;
	bh=5M741NhNb3pK/+PV++HDDdDV2VM5+HppfDnOzOibUys=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KB1dBY/vNFe2qtuVGTGxA2lFH58eex0F4XUK9J2EUthFwgBI835a79MjPx1CkJJBx
	 rpFB9IVCIKf1e8WjzS7aK2t1SCBCx1MeZAhnoY9t9jmX60i6B7Dq02Y/VcqWam8irJ
	 sPJq50Ti37/d6tiDjaWwsrkTFt6xwKrkCaqc7ENHwqQKrBptTXuKthC14Bs+x25T0y
	 VSBZfzoYpqzf9hmB3VhExQ1SBpY+TiCY4/vljjMFq/8itJkq6heXJoYZ3VGawdB8l7
	 X6syOHOGSWPFta2Df/79k5P8elCYgVVNyUpQ7kbjewkiaEtWFOMG58cCgvPjZmL3YP
	 HJspGKSGg+LOQ==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 22 May 2026 18:58:38 +0100
Subject: [PATCH 2/3] arm64: Document missing bitfields in
 cpu-feature-registers.rst
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-arm64-cpu-ftr-regs-v1-2-19775b40faf0@kernel.org>
References: <20260522-arm64-cpu-ftr-regs-v1-0-19775b40faf0@kernel.org>
In-Reply-To: <20260522-arm64-cpu-ftr-regs-v1-0-19775b40faf0@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=12367; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BeJCPrI87ngYnWhvrn7H07d98eQ7tMnKHmjO+Ju1V94=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEJlhvMVvV3+VDHFtpPiprlLe/+9DJjp1kjFdU
 kHdNABUlcOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahCZYQAKCRAk1otyXVSH
 0Lm3B/9QNQ+fTXkMmHyyu6DWfHOd8PXwpZgOPTzE7tXfAsePSwDZVDPI/DQ27Ft3/FSDn4NiDOm
 tnoc4pBezKBDLCncwC7yMv5J42M4rnkCJnFacYD2OYflDXEXadSgOqW9Rz1KEEe7hNFRlOyWgFt
 KAx2wIrvH4T6Y2mXOM6NJnis0z57PQl8pC887rwoOikCn8VznllP6qROY9YQrM8qWA60Gdh+x5R
 i+I5PCC6piiEftEMJnB+oamHX0RlYrRX0TlbHD30Gt84hU7w7jVcyJdMGdHrByficuRlo0O3CnK
 ICWztfFqsGPOKJNvat5la0yXqHRbBEkIFrCrYfaqyrkEvAiF
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

We have been rather lax in updating the list of visible bitfields in the
ID registers in cpu-feature-registers.rst, it is currently missing several
of the registers and quite a few bitfields in existing registers. Bring it
into sync with current -next.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/arch/arm64/cpu-feature-registers.rst | 146 +++++++++++++++++++++
 1 file changed, 146 insertions(+)

diff --git a/Documentation/arch/arm64/cpu-feature-registers.rst b/Documentation/arch/arm64/cpu-feature-registers.rst
index c6e5bc053c09..02815db0c780 100644
--- a/Documentation/arch/arm64/cpu-feature-registers.rst
+++ b/Documentation/arch/arm64/cpu-feature-registers.rst
@@ -113,6 +113,30 @@ infrastructure:
 4. List of registers with visible features
 -------------------------------------------
 
+  ID_AA6FPFR0_EL1 - Floating Point feature ID register 0
+
+     +------------------------------+---------+---------+
+     | Name                         |  bits   | visible |
+     +------------------------------+---------+---------+
+     | F8CVT                        | [31]    |    y    |
+     +------------------------------+---------+---------+
+     | F8FMA                        | [30]    |    y    |
+     +------------------------------+---------+---------+
+     | F8DP4                        | [29]    |    y    |
+     +------------------------------+---------+---------+
+     | F8DP2                        | [28]    |    y    |
+     +------------------------------+---------+---------+
+     | F8MM8                        | [27]    |    y    |
+     +------------------------------+---------+---------+
+     | F8MM4                        | [26]    |    y    |
+     +------------------------------+---------+---------+
+     | F16MM2                       | [15]    |    y    |
+     +------------------------------+---------+---------+
+     | F8E4M3                       | [1]     |    y    |
+     +------------------------------+---------+---------+
+     | F8E5M2                       | [0]     |    y    |
+     +------------------------------+---------+---------+
+
   ID_AA64ISAR0_EL1 - Instruction Set Attribute Register 0
 
      +------------------------------+---------+---------+
@@ -178,6 +202,8 @@ infrastructure:
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
      +------------------------------+---------+---------+
+     | GCS                          | [47-44] |    y    |
+     +------------------------------+---------+---------+
      | SME                          | [27-24] |    y    |
      +------------------------------+---------+---------+
      | MTE                          | [11-8]  |    y    |
@@ -187,6 +213,17 @@ infrastructure:
      | BT                           | [3-0]   |    y    |
      +------------------------------+---------+---------+
 
+  ID_AA64PFR2_EL1 - Processor Feature Register 2
+
+     +------------------------------+---------+---------+
+     | Name                         |  bits   | visible |
+     +------------------------------+---------+---------+
+     | FPMR                         | [35-32] |    y    |
+     +------------------------------+---------+---------+
+     | MTEFAR                       | [11-8]  |    y    |
+     +------------------------------+---------+---------+
+     | MTESTOREONLY                 | [7-4]   |    y    |
+     +------------------------------+---------+---------+
 
   MIDR_EL1 - Main ID Register
 
@@ -213,6 +250,8 @@ infrastructure:
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
      +------------------------------+---------+---------+
+     | LS64                         | [63-60] |    y    |
+     +------------------------------+---------+---------+
      | I8MM                         | [55-52] |    y    |
      +------------------------------+---------+---------+
      | DGH                          | [51-48] |    y    |
@@ -256,6 +295,68 @@ infrastructure:
      | AT                           | [35-32] |    y    |
      +------------------------------+---------+---------+
 
+  ID_AA64MMFR3_EL1 - Memory model feature register 3
+
+     +------------------------------+---------+---------+
+     | Name                         |  bits   | visible |
+     +------------------------------+---------+---------+
+     | S1POE                        | [19-16] |    y    |
+     +------------------------------+---------+---------+
+
+  ID_AA6SMFR0_EL1 - SME feature ID register 0
+
+     +------------------------------+---------+---------+
+     | Name                         |  bits   | visible |
+     +------------------------------+---------+---------+
+     | FA64                         | [63]    |    y    |
+     +------------------------------+---------+---------+
+     | LUT6                         | [61]    |    y    |
+     +------------------------------+---------+---------+
+     | LUTv2                        | [60]    |    y    |
+     +------------------------------+---------+---------+
+     | SMEver                       | [59-56] |    y    |
+     +------------------------------+---------+---------+
+     | I16I64                       | [55-52] |    y    |
+     +------------------------------+---------+---------+
+     | F64F64                       | [48]    |    y    |
+     +------------------------------+---------+---------+
+     | I16I32                       | [47-44] |    y    |
+     +------------------------------+---------+---------+
+     | B16B16                       | [43]    |    y    |
+     +------------------------------+---------+---------+
+     | F16F16                       | [42]    |    y    |
+     +------------------------------+---------+---------+
+     | F8F16                        | [41]    |    y    |
+     +------------------------------+---------+---------+
+     | F8F32                        | [40]    |    y    |
+     +------------------------------+---------+---------+
+     | I8I32                        | [39-36] |    y    |
+     +------------------------------+---------+---------+
+     | F16F32                       | [35]    |    y    |
+     +------------------------------+---------+---------+
+     | B16F32                       | [34]    |    y    |
+     +------------------------------+---------+---------+
+     | BI32I32                      | [33]    |    y    |
+     +------------------------------+---------+---------+
+     | F32F32                       | [32]    |    y    |
+     +------------------------------+---------+---------+
+     | SF8FMA                       | [30]    |    y    |
+     +------------------------------+---------+---------+
+     | SF8DP4                       | [29]    |    y    |
+     +------------------------------+---------+---------+
+     | SF8DP2                       | [28]    |    y    |
+     +------------------------------+---------+---------+
+     | SBitPerm                     | [25]    |    y    |
+     +------------------------------+---------+---------+
+     | AES                          | [24]    |    y    |
+     +------------------------------+---------+---------+
+     | SFEXPA                       | [23]    |    y    |
+     +------------------------------+---------+---------+
+     | STMOP                        | [16]    |    y    |
+     +------------------------------+---------+---------+
+     | SMOP4                        | [0]     |    y    |
+     +------------------------------+---------+---------+
+
   ID_AA64ZFR0_EL1 - SVE feature ID register 0
 
      +------------------------------+---------+---------+
@@ -265,6 +366,8 @@ infrastructure:
      +------------------------------+---------+---------+
      | F32MM                        | [55-52] |    y    |
      +------------------------------+---------+---------+
+     | F16MM                        | [51-48] |    y    |
+     +------------------------------+---------+---------+
      | I8MM                         | [47-44] |    y    |
      +------------------------------+---------+---------+
      | SM4                          | [43-40] |    y    |
@@ -277,6 +380,8 @@ infrastructure:
      +------------------------------+---------+---------+
      | BitPerm                      | [19-16] |    y    |
      +------------------------------+---------+---------+
+     | EltPerm                      | [15-12] |    y    |
+     +------------------------------+---------+---------+
      | AES                          | [7-4]   |    y    |
      +------------------------------+---------+---------+
      | SVEVer                       | [3-0]   |    y    |
@@ -295,6 +400,8 @@ infrastructure:
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
      +------------------------------+---------+---------+
+     | LUT                          | [59-56] |    y    |
+     +------------------------------+---------+---------+
      | CSSC                         | [55-52] |    y    |
      +------------------------------+---------+---------+
      | RPRFM                        | [51-48] |    y    |
@@ -312,6 +419,18 @@ infrastructure:
      | WFXT                         | [3-0]   |    y    |
      +------------------------------+---------+---------+
 
+  ID_AA64ISAR3_EL1 - Instruction set attribute register 3
+
+     +------------------------------+---------+---------+
+     | Name                         |  bits   | visible |
+     +------------------------------+---------+---------+
+     | FPRCVT                       | [31-28] |    y    |
+     +------------------------------+---------+---------+
+     | LSFE                         | [19-16] |    y    |
+     +------------------------------+---------+---------+
+     | FAMINMAX                     | [7-4]   |    y    |
+     +------------------------------+---------+---------+
+
   MVFR0_EL1 - AArch32 Media and VFP Feature Register 0
 
      +------------------------------+---------+---------+
@@ -327,6 +446,10 @@ infrastructure:
      +------------------------------+---------+---------+
      | SIMDFMAC                     | [31-28] |    y    |
      +------------------------------+---------+---------+
+     | FPHP                         | [27-24] |    y    |
+     +------------------------------+---------+---------+
+     | SIMDHP                       | [23-20] |    y    |
+     +------------------------------+---------+---------+
      | SIMDSP                       | [19-16] |    y    |
      +------------------------------+---------+---------+
      | SIMDInt                      | [15-12] |    y    |
@@ -348,6 +471,29 @@ infrastructure:
      | AES                          | [7-4]   |    y    |
      +------------------------------+---------+---------+
 
+  ID_ISAR6_EL1 - AArch32 Instruction Set Attribute Register 6
+
+     +------------------------------+---------+---------+
+     | Name                         |  bits   | visible |
+     +------------------------------+---------+---------+
+     | I8MM                         | [27-24] |    y    |
+     +------------------------------+---------+---------+
+     | BF16                         | [23-20] |    y    |
+     +------------------------------+---------+---------+
+     | SB                           | [15-12] |    y    |
+     +------------------------------+---------+---------+
+     | FHM                          | [11-8]  |    y    |
+     +------------------------------+---------+---------+
+     | DP                           | [7-4]   |    y    |
+     +------------------------------+---------+---------+
+
+  ID_PFR2_EL1 - AArch32 Processor Feature Register 2
+
+     +------------------------------+---------+---------+
+     | Name                         |  bits   | visible |
+     +------------------------------+---------+---------+
+     | SSBS                         | [7-4]   |    y    |
+     +------------------------------+---------+---------+
 
 Appendix I: Example
 -------------------

-- 
2.47.3

