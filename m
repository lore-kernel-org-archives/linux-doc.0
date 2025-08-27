Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C04218E97
	for <linux-doc@vger.kernel.org>; Wed, 27 Aug 2025 14:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756306105; cv=none; b=iBrz1eN8CCgncL0/6+al9bDDuWzcGrnqT/Q9sTIM16iGPrKidQQQX4FOvtUA6KfMslephnOTGo63d7EhwX1qW7EjX5BkJ5PLvTdimXLi2Gq3YLIgypsHjxJfNKkLxuTXNm/0FqpqpuQz0kqH3fm5WDkDbQIUCu1RFVe7+EeOtaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756306105; c=relaxed/simple;
	bh=8ZilA80MCJAMf5BXQVQk6vZvGkIeIsf/cUxvkz6kllU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CunlXqIySPd/n1Blv5sjO2xhMvuY4DzdU4Oe3jxkgovpLFeBbn8KVPZJdy+dR84lsBD1auB3OyzSpvwuCODFJsgmRPs666JyEUX6pbyp8EVCW3yPzQ9dYbFOvymcWZHaa6fBiUHqvRQF948D/D4ugYCVBtZ61hH4mOrPZk7yxCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dyWjE8Ui; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dyWjE8Ui"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756306100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WUat8dTvmu9vrcx/Az++te/7zJHiZ/fdv8U7AAxKddc=;
	b=dyWjE8Uip7kDbnMC5Rxu1r29myw0b4jQBM2/jEl/he5sVCMBzRej8X614ALgjLBKHtvgxn
	nqK74ZnVroa3IENlc2QPyb+G2GXmQvgpwbbvB7E3afEA9eJBy9nAMp2o0eMv6W7kyluO5O
	/zzFloDTlGD+fj15jh17WBa3jwqUHEM=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: corbet@lwn.net,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH] docs: admin-guide: Fix typo in nfsroot.rst
Date: Wed, 27 Aug 2025 22:47:38 +0800
Message-Id: <20250827144738.43361-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

There is an obvious mistake in nfsroot.rst where pxelinux was wrongly
written as pxeliunx. Fix it.

Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---
 Documentation/admin-guide/nfs/nfsroot.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/nfs/nfsroot.rst b/Documentation/admin-guide/nfs/nfsroot.rst
index 135218f33394..06990309c6ff 100644
--- a/Documentation/admin-guide/nfs/nfsroot.rst
+++ b/Documentation/admin-guide/nfs/nfsroot.rst
@@ -342,7 +342,7 @@ They depend on various facilities being available:
 	When using pxelinux, the kernel image is specified using
 	"kernel <relative-path-below /tftpboot>". The nfsroot parameters
 	are passed to the kernel by adding them to the "append" line.
-	It is common to use serial console in conjunction with pxeliunx,
+	It is common to use serial console in conjunction with pxelinux,
 	see Documentation/admin-guide/serial-console.rst for more information.
 
 	For more information on isolinux, including how to create bootdisks
-- 
2.34.1

