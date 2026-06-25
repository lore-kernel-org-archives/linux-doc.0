Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7E22D94B5;
	Thu, 25 Jun 2026 21:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782421417; cv=none; b=keD7sHeEjeXoTtboR6Kz2hBJgGqXbyN2+rNCYLqOgjGE8weyqrx5n0YyRGuTEPdwwx9r1m4EqnuaiCGIwqZmkHQ34Q6bZTMNGPGDuyF925nzOFQEEN3RMPwmQ/4jEiSp4Ibw0VWTHfaCZn7dArbkKk66zLxmipy5h6tq7qxSuKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782421417; c=relaxed/simple;
	bh=tLPP50T+AjL+3ER33LA0nLwinLfAmtMsgsVgyxe3WzA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O0B7Qgv4SVNbnisT0iLNQARBglhHOU22EhsyAXMQGyM+KhaYMf+xJySJODC06/i1U6Fhk4g4iUBksygXA6dBWJeqOvw85VW6Ah+qL9vaYfLdHER+hY3SUslKPudOOVIACK4ckIFc7QSTeXDYftWKsXN5vjd2T89muEgXrWt7LTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LXWKSAnr; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LXWKSAnr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=HzG/AEKzdWyLb8n7Knf5fYigFbHXOG0uc/AW+wlyR5Q=; b=LXWKSAnrJx6+shPtNJSUCPesRy
	LThDqTcwA2PnfzIav2VEkntucWBgVdL7HJ+MphQpvVPgoAGR7YyZm0jJp+HUU1Crr7nPr31rx1z/R
	WhanrfiPNtAhi8XDE1asoi3ck21ah+aTD4MWPOmr6lf7yioAiq1FETesyzXRntv0BT0G0HXZn7doT
	wbxKVAzqSXRwp5t+DKd6Ryia39CvOMFVMEx0CXet6ANgtLMa+yevJwqLCDa8NlpEBK8s6lSgvHObH
	dE5CNAV+N8efA1k67qQJWmg3maJn2N04hOeTsV+bSLAYtb+nVTpf6Ny8OWP6zdaPqglAT83Vi+xwR
	V8rGx0bA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcrES-00000009pnu-2ofw;
	Thu, 25 Jun 2026 21:03:32 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] Docs: SMP: add an SMP docbook chapter
Date: Thu, 25 Jun 2026 14:03:31 -0700
Message-ID: <20260625210331.1050915-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SMP primitives to the core-api documentation.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>

 Documentation/core-api/SMP.rst   |   11 +++++++++++
 Documentation/core-api/index.rst |    1 +
 2 files changed, 12 insertions(+)

--- linext-2026-0623.orig/Documentation/core-api/index.rst
+++ linext-2026-0623/Documentation/core-api/index.rst
@@ -81,6 +81,7 @@ Documentation/locking/index.rst for more
    padata
    ../RCU/index
    wrappers/memory-barriers.rst
+   SMP
 
 Low-level hardware management
 =============================
--- /dev/null
+++ linext-2026-0623/Documentation/core-api/SMP.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+==============
+SMP primitives
+==============
+
+.. kernel-doc:: include/linux/smp.h
+   :internal:
+
+.. kernel-doc:: kernel/smp.c
+   :export:
