Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF0B3859F6;
	Thu,  2 Jul 2026 19:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783019514; cv=none; b=hyWBGH7nmosdp0dmnwryp9KlfsORoPEdekgRvJcRpUAFb6B8rGDT1AvwLlZVVP/DZx7N+UOyWJVgEwk/u+lxWcNY70ue2sAxYIOuDcFSooFdLd2C7jJmmKuq9584ZuO3jQr7injN+dwxxUYeuzyQDMBhY7fAdeDM3zujZOuCa3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783019514; c=relaxed/simple;
	bh=R1ypcPNK4vh+ITuEGflNi6psif/0EKjw3aDCHPH1vdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QBh0Pcpe9s8s/YtsRzRAttM5yAw7odIRza45tNQEj8shuA8Sfw9cVacFWnXbLPVeY9SzyyEcelUQtlJYGKirNRtAk1gLcaVOEuAipKtKFll4wGEf9Uu4H2ZLs05Zs1N2DcT88qatzEcoIRaiEC0cL67bKWJVu2YnxG6YQsNkdps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c4rK5+qU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4rK5+qU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4CB91F000E9;
	Thu,  2 Jul 2026 19:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783019512;
	bh=Rk6K3fUlNpWrcLftzSAPoDYSNebZfaWPo6wcfGqizdI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=c4rK5+qUSWePB4JVmseUMdfgEEyENu4Dn4Z7Wo4SsZ0uvxahM7+Kkfpg8Od6tkdxx
	 Yj+kC7NcXJX0qh3IIaPj5XOVXNeTozGiynnQCqwSMt7D7aUVr5Rn2m3tMXoAr5zjGn
	 rgZDBIAiEvkSVOArhqybqOT7Q+CPu5kH2WLqYl9o1TtM5XYsvX3P/SkYX8KkyuZP5t
	 evZYPJ+vh2fPln5hQYvxTv9Xa7tqELY/MZzYLxJwzKtJBVkfxmIl27ovxU8EGmb4z0
	 dMgK3YcOMzAmhY590Mh/hFRfF0NvaIaelVKo6og8FTaInhS1qpQyUB/F9tZyJIntvm
	 ngXsxrZrtyDGg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 02 Jul 2026 20:11:17 +0100
Subject: [PATCH v2 2/4] arm64: Document missing bitfields in
 cpu-feature-registers.rst
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-arm64-cpu-ftr-regs-v2-2-fe0b78f1bd93@kernel.org>
References: <20260702-arm64-cpu-ftr-regs-v2-0-fe0b78f1bd93@kernel.org>
In-Reply-To: <20260702-arm64-cpu-ftr-regs-v2-0-fe0b78f1bd93@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=12369; i=broonie@kernel.org;
 h=from:subject:message-id; bh=R1ypcPNK4vh+ITuEGflNi6psif/0EKjw3aDCHPH1vdA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqRrfvy1fNLKCiv6ZHm9E8XASt4jXxGL4tUCnhs
 0OVFnAIwGWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaka37wAKCRAk1otyXVSH
 0KybCACGJ/s8mTtJGXtSxnhsOO5xJ/vmobbq47I5tyWePeJ+1HDTIMOlj+kPG+USKbz7n2RqvB1
 7iTMF2Zciae+Pe+fkyyrXfry6PoWd/aNYMxRv7WDORduSssV67fQ2k4AWE30HZoB8HaHeX943ZW
 aQY/mW4079o4LGOe01Gbl6+c9Q3wgXozbMgCpGnDFUdL2Nu4RTu5gNrV6MeYzvvcaxstsUxGPDu
 7ckvbR/t4DsyslUfeqvA9YZffb12fM1pQ/nSe1zfHKoJKJe/qQJ7z7FN3qc0HgUEQeFCL6JUhx6
 39781+bHc1/2t4XumGdnmUe84TkSkYqvzM4cGwKvLNAhAncJ
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
index c6e5bc053c09..4b10980d4a40 100644
--- a/Documentation/arch/arm64/cpu-feature-registers.rst
+++ b/Documentation/arch/arm64/cpu-feature-registers.rst
@@ -113,6 +113,30 @@ infrastructure:
 4. List of registers with visible features
 -------------------------------------------
 
+  ID_AA64FPFR0_EL1 - Floating Point feature ID register 0
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
+  ID_AA64SMFR0_EL1 - SME feature ID register 0
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

