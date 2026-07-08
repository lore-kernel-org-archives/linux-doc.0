Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1753ACF0C;
	Wed,  8 Jul 2026 19:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783540152; cv=none; b=bOfVkl39g0CUYPNQje+HeBcwByOKvRMd3Rfhf7iV5zqvfhSQcI7m08gpMxoiSvzXQT3yl0XI3OzEG+iT0a89W5JHFPnedPtSZaXwoQ89t4n7E4io8JQCVk8/68f+n/QaStNDlBbV542rWcNxpyuYHVkmXIvYsGiwMydkOdXpTiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783540152; c=relaxed/simple;
	bh=pLRE4JgFkHItzuI3iagub5B+SnPM/rhv/Ew4PCwRLu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hRriVDC78AQYUqRKGRK8vc9NKRdEyQFoSR8RhvOtMFklNFsIdQ18xpYOa6JsAUNSTCxXD0KxjOIYy0MsTB4nYyS0bXtghhwFjmz76YqyHcxXvscLnV4oURNPsN4TtBn/jQu28zk+8/9DQQIGOKa+UOajmCYDtaqo7GausOWghm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=W3cP4Voe; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=crKqnlCH; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="W3cP4Voe";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="crKqnlCH"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gwTDy4zMmzMlJ3;
	Wed, 08 Jul 2026 21:49:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783540146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tnCNKFWG5+RYkd4rYC3cLVG3V6JWs73HNHt5pGmKfWA=;
	b=W3cP4Voeus9nY2LiOVk5IXBObnHB4TyINe/9FSIigDKaDWkho8GrcZpMDbBcxE1/23S4qI
	RX3iidXxbnZ5wIrIrzsf66Y/QqStGjx/hKNeYRKe77fUBYzhW8y8W/nENZynByMaLY/O6/
	ZbqLnsuYkRSzixrOgtQqzQGHf00Ysuh01LsXiPueJ3SvZQhlqQejidQoOXgBeeYkAXqw3A
	5d6OipWxwn7aXxznuc48/DK77HZZDc/QJYS8uJ0aq694tXU59bnp5kHaqplyqAyjg+2kQw
	WvFGnLMR9DK3B1SalGqvZ8Q0qmnnOghCXY8Rh83sB40NhhOQqsJlxMfXWzFy4A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=crKqnlCH;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783540145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tnCNKFWG5+RYkd4rYC3cLVG3V6JWs73HNHt5pGmKfWA=;
	b=crKqnlCH2styztAkjKu5MDOI5t3Fuoha8bml4r5QkrAAFRwikeEUunscArUXA1V7vP4yfW
	VS/7WUev5oAyL0cPIjxgEupn7Px6JaIs3yqtkWp8U2oavqiJw/wEwcDADCmLnLLzlPxGXo
	7AxztK4Pumuvm4+9OtXNprHy65eQI9FaXVFrVXIx2zMLYwFhvU/NjCYcnXCMPUxOcv2bPD
	KTEEdSgiXSskZ7flO02ZcKAIrjVhSO8ayDFGPASLXtFZWxFr2QuYTYmQaaT4JzHVwdfJ6g
	FRVqKFY0JluGAml6S6GlfeubjykscomscYlek7+WyR/Hyz3nd5a8blo2jBCwWw==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: dma-api: remove needless bracket
Date: Wed,  8 Jul 2026 21:48:21 +0200
Message-ID: <20260708194821.357548-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: rjxo9w6qc91snfr7qmg9s5an5kaj8ecj
X-MBO-RS-ID: 8a432433f27aae60cd8
X-Rspamd-Queue-Id: 4gwTDy4zMmzMlJ3

Remove single ')'.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/core-api/dma-api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index ca75b3541679..ba23a472f794 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -508,7 +508,7 @@ call to dma_iova_try_alloc.  This can be useful in the unmap path.
 
 Is used to link ranges to the IOVA previously allocated.  The start of all
 but the first call to dma_iova_link for a given state must be aligned
-to the DMA merge boundary returned by ``dma_get_merge_boundary())``, and
+to the DMA merge boundary returned by ``dma_get_merge_boundary()``, and
 the size of all but the last range must be aligned to the DMA merge boundary
 as well.
 
-- 
2.54.0

