Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74E93859DC;
	Thu,  2 Jul 2026 19:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783019511; cv=none; b=u75iDJPZEfhqxc+VszIEB7GHatDLvZR07JTvZ2yL+rbkELRlQ/SBFDgYDgIgSvFkLgq/cDYSyp2jteOFfzgf863zMZufKQJBYOwWH4v+dMDxYLFpnoodF3/SpwS4wrJw4FuPuspRaqSBvhyv/SVUwKCUaJhSSjUfsGmDeAN5ZKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783019511; c=relaxed/simple;
	bh=9GYV0ftpEJl4lFndesuOAU5IJOWKdhaJW8q3YmPKl70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lASb/Nhwmihzv7n/MTEazAG+n088N0GnjmQkg/MoR0PJCKsqjFubWLX2LA21y1fyUignCw934/lzhtCL5lTKwMB3p9AGh9ZIRa2bJSKu1ieP1rkA0vcYUZ1pEEGcwk1mVZHejSUOnVBcPQ7NpP3PUygao4hUIbCgjT3zhCwlUWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eVoh7OUP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eVoh7OUP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E9B1F00A3A;
	Thu,  2 Jul 2026 19:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783019510;
	bh=QMgm0LxQlLuFc2zsZd1wTo2E41aWk+l7bTvyq+/nFPA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eVoh7OUPK8ZMEFqgQF/ko96u/Ax2M+Cn6NJ7ycsu7yoe9/EJ9vwZPbRvEuEi22uaz
	 4z1QxYkja5e8xmXqPf/XFn36+DDaaxQBtER8gRtlvb2PyOJuUT+VaTntrmbu6jGrYr
	 +1IEqw42i13YzdIz5kcB4j7p2agtW9qS9a+G6jRcULqTqRvyd9K85KI/2YejHrpZo2
	 qrdwXAk74DgIu3HuFfNOn5Jg7ouslyfG7p+nOoU6rrlyGNbOJbK4cV7pPZunt//e3C
	 Y2UkNI9h0HNvTqFecFa6ePy+3PNDi1LVEd/G4jknKnq2Om6stzZYbdywx9g9RMsO1d
	 kbWA+JcnjXd9w==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 02 Jul 2026 20:11:16 +0100
Subject: [PATCH v2 1/4] arm64: Don't number registers in
 cpu-feature-registers.rst
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-arm64-cpu-ftr-regs-v2-1-fe0b78f1bd93@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5720; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9GYV0ftpEJl4lFndesuOAU5IJOWKdhaJW8q3YmPKl70=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqRrfuHul71HVxmwJstl9ddKAWAYAK5deT1o0p6
 1R8pu6EQCCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaka37gAKCRAk1otyXVSH
 0HmIB/oDkZ0S/AP/P76cyV3MDCw492TBYOZ7Qii1AWy2TXPAXwvLz3lIFK4fwfgvdZCr4QOUfWt
 6IbxBjFCo5tnKNqSq3Y86EJXGI229LRhc2yP96gKaLG9MtUEF2xX81RlIh38rnZVvDJcdY7GhQC
 mfy+TBH+0p/YUua4qObrg3kbYPbe3/zYhV+3VoYuAbMvZ2iJTAYkroRIf/Gdkcn8DJKm8/zc22s
 mLm5vSgBjfkBEnZYytym9rqObiwaTzYJEu1h6pJwUH8Osn/Fo3OkYTjuwkO2grhc0aa6f9ni1l0
 6UwAbLdtGvqAFsB8Nu+zzz/KWpLZ1JIzKJVGTtzRR491Q4UG
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

