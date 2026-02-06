Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D1E335BCD
	for <linux-doc@vger.kernel.org>; Fri,  6 Feb 2026 06:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770360885; cv=none; b=kT71TLrk/ZA3sl4P85cidYmSTAlJIivQt/GbEgi99BPfVVS8vPNhzoPovjDbFhea6lsPwT1LFJePhOwB0l/qapVaFEusuXhwvNvRp/2R8nSiOSbQlo1iIMqUC0DqjR0AdVAW4Bpuruq6MXHFQ1yj2Xoqezd1h0DxSSKbp0kDkZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770360885; c=relaxed/simple;
	bh=3oTWdqwWvXRMB9C3HNjj0F6PR03MBSw8jI5GliF/NLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e6JaCVeX/NmOPmyYTDIY2322/+VISe8s0+daLDm/LG6ezrX5cwChCL81P8ZciDf0SNEgA/jEGppSKcgjHhDidRiEPz6DPdhAtqgna0sB4T64kCTL6kXYIMBP48DIIC/dO3aXl/r7+mzt/9aC4T40oDtXdMJlBNPetiRXuEx0N00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=F9Dz3QsE; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="F9Dz3QsE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=9xNs+9VWc7Ygo9BV05swnUFHNFQfyvhK7EPSHEJBvPs=; b=F9Dz3QsE7xFZU2e4ocOG/UowSH
	TJMgVPo3YUwUCXRZ8LuWEdyNNLK2TiHhfou/TCE5QJg78LXLAJsrERGkKMMMUz9mqTtyPvBl+yWxC
	dqB6biX+YlUL/maWHLFTEv88CHlvsA43K1jRE3vKqIKLF8UB2MNt2bxRfHI9ukiltOoKIhfPPiN17
	O44eScQ/nrJqFuMguuJjJ8tAcnN5hsnXzJX584f7C0mz3gpt7NgemHI/cZ+6gXTtKnciGFBYdobjt
	xmlzAkDex29s+sX+3deB56xkmO5P3w7NaFcu1b8Zjg7crWFXAHFQSkC64TMqwejghcBcGu0RexjzS
	Ih+ecJOw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voFjm-0000000Axc1-3HPB;
	Fri, 06 Feb 2026 06:54:43 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH] docs: kdoc_parser: allow __exit in function prototypes
Date: Thu,  5 Feb 2026 22:54:40 -0800
Message-ID: <20260206065440.2412185-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Handle functions that are marked with __exit to prevent warnings:

Documentation/networking/iucv:35: ../net/iucv/iucv.c:1918: WARNING: Error in declarator or parameters
Invalid C declaration: Expecting "(" in parameters. [error at 12]
  void __exit iucv_exit (void)
  ------------^

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>

 tools/lib/python/kdoc/kdoc_parser.py |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20260204.orig/tools/lib/python/kdoc/kdoc_parser.py
+++ linux-next-20260204/tools/lib/python/kdoc/kdoc_parser.py
@@ -176,6 +176,7 @@ function_xforms  = [
     (KernRe(r"^__FORTIFY_INLINE +"), ""),
     (KernRe(r"__init +"), ""),
     (KernRe(r"__init_or_module +"), ""),
+    (KernRe(r"__exit +"), ""),
     (KernRe(r"__deprecated +"), ""),
     (KernRe(r"__flatten +"), ""),
     (KernRe(r"__meminit +"), ""),
