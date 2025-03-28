Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDDF214A60
	for <linux-doc@vger.kernel.org>; Fri, 28 Mar 2025 10:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743156434; cv=none; b=Mf7jlnUCzSRkwMrC+Gwip9aWuFqSdR5wcCNvXhHgxYS7Ur035tTVk3xakgIIJZGK8bA4WlVsZzoyAwM8/g+RKOIcXcxQBscWS//QS+9WYvgG78ZZFpVd3CkcxkUoUwEQQOZpriWuGqdAPZggOUSRyKQ3ESYbkhCoFlH0Asm2VRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743156434; c=relaxed/simple;
	bh=XvJOD+5p88Dq9zCNs0XKUNhnKcG3e2uhYBow2nSpkdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NcPWBDQYi0EWwbJe/IxlbNxp71M2h7jPDj/LIBHisXroKWGdxXwvEWMSJKbnRMcPsvx2bAH/E8huiyurjgdDwPrCg9/ly+jU+wE4vhTHsgInGmllRMmtYVnzpWWslDEL6v/IngJzLhw11xMk2m9B1uWTXIYHzbu7Mm/O0aRWJ1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UmDT9hyV; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UmDT9hyV"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743156430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Wo/1nwcYwaZxzgLidLW5Kd2eIrcSPSmZC1A+nQdRUo=;
	b=UmDT9hyVVLmLCrBg4BzzrKCH0cfUiQit9mSdARyzuhfxvYEgcMBGslykTdFFwDnLOupCIx
	vgRFKkgX32RXJtSx6m3EaNhgU4+VenUknIo6hpCtEVi8QBScmWzM3rtLe8NNLDHr1aePFP
	a/0jkKqe+IbdUddQJR3g0eUm+tWBHGc=
From: Yanteng Si <si.yanteng@linux.dev>
To: alexs@kernel.org
Cc: Yanteng Si <si.yanteng@linux.dev>,
	corbet@lwn.net,
	dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 2/2] MAINTAINERS: Change Yanteng's email address
Date: Fri, 28 Mar 2025 18:06:44 +0800
Message-ID: <403fa4722ad008800086e41d412cd322243b9089.1743156287.git.si.yanteng@linux.dev>
In-Reply-To: <cover.1743156287.git.si.yanteng@linux.dev>
References: <cover.1743156287.git.si.yanteng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

I no longer work for Loongson, so I have permanently
lost my Loongson email account.

Signed-off-by: Yanteng Si <si.yanteng@linux.dev>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bee4dcc64c56..ff02f5ccb43c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5503,7 +5503,7 @@ F:	Documentation/dev-tools/checkpatch.rst
 
 CHINESE DOCUMENTATION
 M:	Alex Shi <alexs@kernel.org>
-M:	Yanteng Si <siyanteng@loongson.cn>
+M:	Yanteng Si <si.yanteng@linux.dev>
 R:	Dongliang Mu <dzm91@hust.edu.cn>
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
 S:	Maintained
-- 
2.48.1

