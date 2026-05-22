Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601493672BE;
	Fri, 22 May 2026 17:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779472745; cv=none; b=oPib3BADDECHz5R5G5He5cBocV+/kqLaMI/a6/PLodpIGsalpmNJRxDlv8XZRaC18EeA3do9DwIdOSEal8VKyYZUbO03JoNmrj+m8UTXpoHhH5zX6PNMpmtpGAYIQb7qXHK2fz8GOl4knJgYWEa9cJ8JGQQ+ENUiIKWkMW+Z+zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779472745; c=relaxed/simple;
	bh=9GYV0ftpEJl4lFndesuOAU5IJOWKdhaJW8q3YmPKl70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pdWq6Y4IBzT+PNxKFVSSYCILaYVzDJA6Iow62TjpgDab13k/1oSiM/7i7GA+jMDLDmdr9s/nCWPReM6j2vASfFYhGU/jaXjY5AyFM9ewMilZoryIMRCxQxmfeCLG21oFTYnmoQMdpik1ux7tdiTt/CSX3Gc7PJO/Q3v+diC15Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=denzt7Bo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="denzt7Bo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC0B1F000E9;
	Fri, 22 May 2026 17:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779472744;
	bh=QMgm0LxQlLuFc2zsZd1wTo2E41aWk+l7bTvyq+/nFPA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=denzt7BoSfQRu8XdwAMCOdNhqRqx4TWNzOl0plLWhiTNR0lhztyBd/kiKfq7SOBb5
	 6Ao5OLLN+mBV051JffpmVWN/WbgBNGXYcq5URvmpvBm63f0/Y2DBRUX6qnEm04wSU3
	 navtF/wmY0Fdp15CAp/5bsla5KQ6RIF2jSt1ea7tec2k1aXkEd86z85iIWmwPPz3l+
	 30HHkASFGdoHYVbTE6CFRfWW0fxX1l6+tlXeSyQhpoDoEDCbEg5R2YUdoKG/0k1ofE
	 a3OBpJONW4W5KTPRIgZ+PVGsJXN52WiMN6rdezah9aYkB1BpRlsf+10Dbavt9JlEgG
	 HM/mxfBdI4Ttw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 22 May 2026 18:58:37 +0100
Subject: [PATCH 1/3] arm64: Don't number registers in
 cpu-feature-registers.rst
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-arm64-cpu-ftr-regs-v1-1-19775b40faf0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5720; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9GYV0ftpEJl4lFndesuOAU5IJOWKdhaJW8q3YmPKl70=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEJlhSFvKG+iAsC8RAugbV6Xj1bdCp792yxuO/
 6ooN37/DKOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahCZYQAKCRAk1otyXVSH
 0H5HB/9uJv9FcfkBjloICAd1ZVk7Qlw/i7sJEL2GfiZ6c+3FG+K4nypM6qg5H6lAVugikDDw86e
 5cK8h2VBA9Tb8pNO1zt7nvcZYZdQQP3E7ve+VtHoig66EBSQf3jNHRGKKVzgyLhyqW0ZDlIWuOI
 j4qENg+AMIPPdzbDS0hHUaOf1ovO949zuQUHPPLP4mG9TgzjCoASrBCM4qsPS7gMGXQC30HI/2z
 tqh8C6r3NK/C9feAwqlWL8E8KeDgNAMjvyetF9rRwaX4hhBiuFWJ2C0x4K7bMLbl1xHUxQ+gIHq
 cvZkhU3mABAeOF+sCRiDz2d+fluUflAYkzKIA5Uv8Sk6NK6H
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

cpu-feature-regsters.rst documents the set of userspace visible ID
registers. At present the section for each register is numbered, this has
lead to the registers being documented in a haphazard order as new ones
have been added to the end of the list to avoid renumbering. Remove the
numbers so we can avoid this problem in future.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/arch/arm64/cpu-feature-registers.rst | 26 +++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/arch/arm64/cpu-feature-registers.rst b/Documentation/arch/arm64/cpu-feature-registers.rst
index add66afc7b03..c6e5bc053c09 100644
--- a/Documentation/arch/arm64/cpu-feature-registers.rst
+++ b/Documentation/arch/arm64/cpu-feature-registers.rst
@@ -113,7 +113,7 @@ infrastructure:
 4. List of registers with visible features
 -------------------------------------------
 
-  1) ID_AA64ISAR0_EL1 - Instruction Set Attribute Register 0
+  ID_AA64ISAR0_EL1 - Instruction Set Attribute Register 0
 
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
@@ -146,7 +146,7 @@ infrastructure:
      +------------------------------+---------+---------+
 
 
-  2) ID_AA64PFR0_EL1 - Processor Feature Register 0
+  ID_AA64PFR0_EL1 - Processor Feature Register 0
 
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
@@ -173,7 +173,7 @@ infrastructure:
      +------------------------------+---------+---------+
 
 
-  3) ID_AA64PFR1_EL1 - Processor Feature Register 1
+  ID_AA64PFR1_EL1 - Processor Feature Register 1
 
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
@@ -188,7 +188,7 @@ infrastructure:
      +------------------------------+---------+---------+
 
 
-  4) MIDR_EL1 - Main ID Register
+  MIDR_EL1 - Main ID Register
 
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
@@ -208,7 +208,7 @@ infrastructure:
    as available on the CPU where it is fetched and is not a system
    wide safe value.
 
-  5) ID_AA64ISAR1_EL1 - Instruction set attribute register 1
+  ID_AA64ISAR1_EL1 - Instruction set attribute register 1
 
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
@@ -240,7 +240,7 @@ infrastructure:
      | DPB                          | [3-0]   |    y    |
      +------------------------------+---------+---------+
 
-  6) ID_AA64MMFR0_EL1 - Memory model feature register 0
+  ID_AA64MMFR0_EL1 - Memory model feature register 0
 
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
@@ -248,7 +248,7 @@ infrastructure:
      | ECV                          | [63-60] |    y    |
      +------------------------------+---------+---------+
 
-  7) ID_AA64MMFR2_EL1 - Memory model feature register 2
+  ID_AA64MMFR2_EL1 - Memory model feature register 2
 
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
@@ -256,7 +256,7 @@ infrastructure:
      | AT                           | [35-32] |    y    |
      +------------------------------+---------+---------+
 
-  8) ID_AA64ZFR0_EL1 - SVE feature ID register 0
+  ID_AA64ZFR0_EL1 - SVE feature ID register 0
 
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
@@ -282,7 +282,7 @@ infrastructure:
      | SVEVer                       | [3-0]   |    y    |
      +------------------------------+---------+---------+
 
-  8) ID_AA64MMFR1_EL1 - Memory model feature register 1
+  ID_AA64MMFR1_EL1 - Memory model feature register 1
 
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
@@ -290,7 +290,7 @@ infrastructure:
      | AFP                          | [47-44] |    y    |
      +------------------------------+---------+---------+
 
-  9) ID_AA64ISAR2_EL1 - Instruction set attribute register 2
+  ID_AA64ISAR2_EL1 - Instruction set attribute register 2
 
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
@@ -312,7 +312,7 @@ infrastructure:
      | WFXT                         | [3-0]   |    y    |
      +------------------------------+---------+---------+
 
-  10) MVFR0_EL1 - AArch32 Media and VFP Feature Register 0
+  MVFR0_EL1 - AArch32 Media and VFP Feature Register 0
 
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
@@ -320,7 +320,7 @@ infrastructure:
      | FPDP                         | [11-8]  |    y    |
      +------------------------------+---------+---------+
 
-  11) MVFR1_EL1 - AArch32 Media and VFP Feature Register 1
+  MVFR1_EL1 - AArch32 Media and VFP Feature Register 1
 
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |
@@ -334,7 +334,7 @@ infrastructure:
      | SIMDLS                       | [11-8]  |    y    |
      +------------------------------+---------+---------+
 
-  12) ID_ISAR5_EL1 - AArch32 Instruction Set Attribute Register 5
+  ID_ISAR5_EL1 - AArch32 Instruction Set Attribute Register 5
 
      +------------------------------+---------+---------+
      | Name                         |  bits   | visible |

-- 
2.47.3

