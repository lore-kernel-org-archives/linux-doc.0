Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9006F34887E;
	Fri, 22 May 2026 17:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779472236; cv=none; b=Bw3ITTPj+v5n0VfKdg2NWBcCkQru4GSnODamwtM1kBBz8ok33usOwQPcm/qvEyTntBoUEFis1EXJxna/NjpKZic3VOQgl2orYKLqAkw+pBdkTNcmke/DD+XXO58DsEFpfummQ9Sypw//HpHd+UGbZG46UW2DGJlVZMbAfynXmO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779472236; c=relaxed/simple;
	bh=85EOPZprIF603n27LeZgWXjBlnhxpFg1sY/9vXoRiMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uWPUA4G63OXPqiHnG5MurnPIBK1GsyppmBREaM2ZwfwfrJ+nOmH0xTDTD01aEgHw5ApJVSPuWEOy2GJyh70q94vCLMwxE0h602p8VFJljnaa3luuvkcZPQ2/enJ0mMi4nG6RpZNSSZa8sRegdlLk3xWt65vcpwNf9s1LDoAnBew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ie6Ah+ut; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ie6Ah+ut"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76A11F000E9;
	Fri, 22 May 2026 17:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779472235;
	bh=K2lrHdcKmrkTxvpli74gP5hQ6IevGZ88LGVyOLlviNU=;
	h=From:Date:Subject:To:Cc;
	b=ie6Ah+utwjQRDk5xVq212bvzeHsRbLgmKcIYus0irSmTQHGHvyNzF/Vb9PFUse0lj
	 Tw4AN2PxQUOGYnzrX50KF7tG9AWjOyEdKRVIVB7tnS+GNKIeZYdWwHcIQ38gd+tlIx
	 FC8HL7IXySr7lxVnEM6tHiEa16kopMwq+j75wcIokFK8OIIxq7pw7u7lM6GaWWBGhT
	 K8ACo93mjyealzfh5GwSNCy6qgZ98BgoZghCFAYxqifZ5k/5KuH0JY3vyHytHQbPjz
	 oFWEFzZFa3TLSQBxKcgsVxcgkxf82veApl0+GeocITRgtgtY8hc2OvtLhdAJ4qiPm0
	 /NdmVvT02E1ow==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 22 May 2026 18:50:28 +0100
Subject: [PATCH] arm64: Document SVE constraints on new hwcaps
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-arm64-elf-hwcaps-sve-cleanup-v1-1-07b0cedfc6fa@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGOXEGoC/yXMwQ6CMAwA0F8hPdsEFmDGXyEeyuigBseyCpoQ/
 t0px3d5OygnYYVbsUPiTVSWkFFdCnAThZFRhmwwpWnLxhik9Gxr5Nnj9HYUFXVjdDNTWCNW5O3
 V1jQ0vYVcxMRePv++u5/WtX+we/1OOI4vFkkpfYAAAAA=
X-Change-ID: 20260522-arm64-elf-hwcaps-sve-cleanup-1af7874ad5b7
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2000; i=broonie@kernel.org;
 h=from:subject:message-id; bh=85EOPZprIF603n27LeZgWXjBlnhxpFg1sY/9vXoRiMk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEJdoFDoU5qxbTx15+3Np45Stlnj4NAz9Lg7W3
 gTZyIbX9L2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahCXaAAKCRAk1otyXVSH
 0EB+B/44aGs3sudgZQ9Jbc0x1Os1sMRNkopU3J6wfKCWe6+QT0u3vT8EBlTNHdysJWSNmzGV0j4
 Yuc3priS7d/ZUraMq2oBn1MWHzNXkcTRI5x1LlIuX6Bn/qVirkFupzWx/F+yAoE0E5618hAKkuf
 ugxVANNTCitZVY0Y4tIQKrdehWeY61tAwD+Yzi0w6/82NJn593jUZtz87Mz6rHFR7olUJWgS4SX
 tcajIB0uauzx2ktwLakf8W8WdgzPIc8Ap52vOlsQGGpFKn8qnEWZ7aS5gJu0ZbAyhngcA293oDy
 gkvvYG1Ivb7TEI17iXiRi/xeMGJJpLS5krC+5oSk4eLcQUbT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Two of the SVE hwcaps added for the SVE features in the 2025 dpISA did
not explicitly call out their dependency on SVE in the ABI documentation.
Do so.

While we're here reorder the SVE and fature specific ID registers for
HWCAP3_SVE_LUT6 which did have the SVE dependency but listed it second
unlike the other SVE specific ID registers.

Fixes: abca5e69ab626 ("arm64/cpufeature: Define hwcaps for 2025 dpISA features")
Reported-by: Will Deacon <will@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/arch/arm64/elf_hwcaps.rst | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
index 07ff9ea1d605..f60ca5612daa 100644
--- a/Documentation/arch/arm64/elf_hwcaps.rst
+++ b/Documentation/arch/arm64/elf_hwcaps.rst
@@ -452,10 +452,12 @@ HWCAP3_LS64
     memory location, otherwise fallback to the non-atomic alternatives.
 
 HWCAP3_SVE_B16MM
-    Functionality implied by ID_AA64ZFR0_EL1.B16B16 == 0b0011
+    Functionality implied by ID_AA64PFR0_EL1.SVE == 0b0001 and
+    ID_AA64ZFR0_EL1.B16B16 == 0b0011
 
 HWCAP3_SVE2P3
-    Functionality implied by ID_AA64ZFR0_EL1.SVEver == 0b0100
+    Functionality implied by ID_AA64PFR0_EL1.SVE == 0b0001 and
+    ID_AA64ZFR0_EL1.SVEver == 0b0100
 
 HWCAP3_SME_LUT6
     Functionality implied by ID_AA64SMFR0_EL1.LUT6 == 0b1
@@ -473,8 +475,9 @@ HWCAP3_F16F32MM
     Functionality implied by ID_AA64ISAR0_EL1.FHM == 0b0011
 
 HWCAP3_SVE_LUT6
-    Functionality implied by ID_AA64ISAR2_EL1.LUT == 0b0010 and
-    ID_AA64PFR0_EL1.SVE == 0b0001.
+    Functionality implied by ID_AA64PFR0_EL1.SVE == 0b0001 and
+    ID_AA64ISAR2_EL1.LUT == 0b0010.
+
 
 4. Unused AT_HWCAP bits
 -----------------------

---
base-commit: abca5e69ab6268cbe1913b19da5a98c3383f8bb3
change-id: 20260522-arm64-elf-hwcaps-sve-cleanup-1af7874ad5b7

Best regards,
--  
Mark Brown <broonie@kernel.org>

