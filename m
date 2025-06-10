Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DFE225A34
	for <linux-doc@vger.kernel.org>; Tue, 10 Jun 2025 12:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557382; cv=none; b=lai6LYjzyztQITiZ/OLf5yCb+Xjecy43GFnZy7Z0vchT/+tA6vfxNnH3nlKrWtytZL3vO6xzZjs6AMZo9TrdoIaIxDXmh8NyDBRrDNaLN3isoDsZJ6OwHfcKVE4KU0BIIWhPkpjAiBl5yHDGN5z904cL//UKsVTMm0rNzmkAe+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557382; c=relaxed/simple;
	bh=upqHnq3wuWArdhJfVH9Zj84u4ZeuZmsrlHOjrFsHPa0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HEX0G5RV0Yx8zriABsaA86yC8Yqo8c6aMfnRBHrj6Uz8RDK8gUlyIoEX7pQ81wzUMtZD+tU8itdxmqhgL2smfwRYVp9x4HAesxcn2HYjObLEfNSW4bsZ0Hk1RjrdrIQXMjctzNDiUfMrjGagLeA0k3eSxiHkL1BOCU5jygaARCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZmlcOPOx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZmlcOPOx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523A2C4CEEF;
	Tue, 10 Jun 2025 12:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749557382;
	bh=upqHnq3wuWArdhJfVH9Zj84u4ZeuZmsrlHOjrFsHPa0=;
	h=From:To:Cc:Subject:Date:From;
	b=ZmlcOPOxmaomHX2ncZCUdccODW6ub8S+E9UPcjklNJ0n9+TI+KGlLnk4yqPScmEAG
	 qgHk9mRV5Suxeet5DheiWtMM/ThTNbFNIyCHponvW0QdtvYYk8NGD2LDO1Hvui+LD1
	 GV2PLDi6FYOMVnVQQDvqTwq2O9FQrR8prgDXJf2+pt48BPdRHUtzxTlWOfMw55vIkf
	 w7KxsOglOCrzfQrrO9dzCYRCNbI97rTCt7TySxEJteYqKXdPqpnsCYzSNZe3K36oiL
	 tuzBSomWwiP/qItDesY20guNVT1WJlgf1nEmzP9cGq/O/lHtjzwceNXfnVt9zLmZXO
	 GlGuWp17EnNbQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH] docs: arm64: Fix ICC_SRE_EL2 register typo in booting.rst
Date: Tue, 10 Jun 2025 14:09:35 +0200
Message-ID: <20250610120935.852034-1-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix trivial ICC_SRE_EL2 register spelling typo in booting.rst.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Will Deacon <will@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>
---
 Documentation/arch/arm64/booting.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index dee7b6de864f..ee9b790c0d72 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -234,7 +234,7 @@ Before jumping into the kernel, the following conditions must be met:
 
   - If the kernel is entered at EL1:
 
-      - ICC.SRE_EL2.Enable (bit 3) must be initialised to 0b1
+      - ICC_SRE_EL2.Enable (bit 3) must be initialised to 0b1
       - ICC_SRE_EL2.SRE (bit 0) must be initialised to 0b1.
 
   - The DT or ACPI tables must describe a GICv3 interrupt controller.
-- 
2.48.0

