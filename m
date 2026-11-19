Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111396;
	b=UMmWVN8mw8D5/a5Z/2VzCVtBXGkn4M2fSXwXy/W82U6FvRzzeVn7v1ZO/FMiJ3ab+OhI
	 e8sAx8B98/+QNl2M6os4XgNmvkTB+xarWEDRM4xkb9FnnI+CZiZkmLr3vemV3wxAnWMjH
	 DqJaShAnkYJT8srmQZgcnUlURHMFfcpKocODcxbrRfLyWbpfbGmdMiTo3wAzn8UrlDgV2
	 IgNO5s+EQj4hgwCrdYrxw+fYouoD0jVG4pm6nQAZioX7loJ/QCc2WQ/C8/QV1gMQhmMOH
	 uSCQfI+tWKES+EoMGCL7KUQ1PAi9BvXHbEk1Lry6jaz3QGJuqq6s/brQQl6ZiT6Hn0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111396;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=vQ1ZLgcFUZtCDwuIPYWV9IVqIzUqj1yLDVqQJYwH9Jw=;
	b=waVi7MpMe5RQRWJiOQldXfGpZQeW/C54Y0HamRJIeoGgeOvwgxWzTuWkuvClnVpmP/J3
	 ujfhcTYGQ2eJ0tESJD29SpBkuVmecHJqCKSOTu55zHitGFH8l1O/aewffHCRE/9ntsByB
	 Xq3kv8Z6nTDPPdvSuGlkA+LbOdjb1rfM1qMhvFJ9yS1FBsrKDSwPgnq7v6cbegTXYJfh5
	 L2FzbKAWMrpYF3yDKAtBaaoTj+D5RMEjzhdeoNZzbqIIh1ZMqPUvs37uWpYU+Q3SLG5/i
	 o3Ozv9GIrpGaqNhcBKVE7bQOe2UnhAcBTc3CseWzRf1QuBXKAJp3sYl1iRaHPvjHPjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=aVLOjJPO;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB58606A33F;
	Thu, 19 Nov 2026 18:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CB58606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=aVLOjJPO
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFCDE1C01;
	Thu, 19 Nov 2026 10:03:12 -0800 (PST)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BF963F882;
	Thu, 19 Nov 2026 10:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795111395; bh=eIVMSjtan774rHqwKkSyYCnWR4LbX246XkkkxOObdfk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aVLOjJPOC1ezbxnVKJuM0R6HTF9dvb5ryFmzIjIrXmJ+YKkraNasP9EorNWZC9bjs
	 xIy6aTfz5yT+LV0pO0ts62WKpiB40nQKi6DuFlTs8BNcJNQMQ5uM8yxqVFOovSjYbW
	 EOsbiyd7EOB+b0HgKotf3ZegpdpRQsEai9qCdNZk=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Thu, 19 Nov 2026 18:02:43 +0000
Subject: [PATCH 2/2] docs: arm64: Document booting requirements for POE at
 EL0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-poe_booting_rst-v1-2-bbae0ab68498@arm.com>
References: <20261119-poe_booting_rst-v1-0-bbae0ab68498@arm.com>
In-Reply-To: <20261119-poe_booting_rst-v1-0-bbae0ab68498@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795111391; l=1242;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=eIVMSjtan774rHqwKkSyYCnWR4LbX246XkkkxOObdfk=;
 b=me0tEkFynbzyQte8S2k+Go38bFUCipBdC9JyW3F179UPXK1R3uO4A3GQWtdfLCKPoi2S0BSyB
 RCJ9D85wzuXBXK/oTx/8x5K9y5tS9a4b1X2DE07A0HgegTtpFcG5xCq
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=

Add missing boot requirements for the kernel to enable FEAT_S1POE at
EL0 (POE is currently unused at EL1). SCR_EL3.PIEn controls trapping
for both PIE and POE registers.

Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 Documentation/arch/arm64/booting.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index 8f22aa7b2c0b..3f31eedd8551 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -515,6 +515,18 @@ Before jumping into the kernel, the following conditions must be met:
 
     - HFGRWR_EL2.nPIRE0_EL1 (bit 57) must be initialised to 0b1.
 
+  For CPUs with the Stage 1 Permission Overlay Extension feature (FEAT_S1POE):
+
+  - If EL3 is present:
+
+    - SCR_EL3.PIEn (bit 45) must be initialised to 0b1.
+
+  - If the kernel is entered at EL1 and EL2 is present:
+
+    - HFGRTR_EL2.nPOR_EL0 (bit 59) must be initialised to 0b1.
+
+    - HFGWTR_EL2.nPOR_EL0 (bit 59) must be initialised to 0b1.
+
   For CPUs with Guarded Control Stacks (FEAT_GCS):
 
   - GCSCR_EL1 must be initialised to 0.

-- 
2.56.0

