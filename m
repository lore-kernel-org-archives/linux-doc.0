Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5E3111BF
	for <linux-doc@vger.kernel.org>; Wed,  4 Jun 2025 19:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749067081; cv=none; b=IYLv1Qqv9K4mQ93NNpzGV+EeeGMOpgFSCoR0qmdD6/2HFcpL9sxD6b/08Crmic4QCwXm52JRH+sXDsckNHtr4Fjgf1miP2ELcaGGsIy7jYXiGhlIXbEiBvcphujZr9H691NF+kXMWTADMBNrv1tIec+CVCBDBaxXDt3UxDtv1pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749067081; c=relaxed/simple;
	bh=MtEcXvSBqlDajMvn4pxyQ9s8RlPQxxogQ42+1cKhjws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hPZ8rO/zKYD+hfxE96yB0xHZG80k82YI0r7WIT8e4g7gScftIH0kzyo8IWAXgiNQaQcgptx/feqGWFNZ35MDGG13m6xiAKW8hVRmaamye4QvZsfZIs2RWS9LntSqy9cKthOiFrTph6gCCtOuDY9z3Ih3vL+q8UaiT/Vwj+SsRlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WNn6SADB; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WNn6SADB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=2FCJ8Iv1jgWJxPYue/rI9dkZdU7wEm0Sep+qu9AYn5o=; b=WNn6SADBf7VZ5DZftzkrbHd7x+
	cagGh+03hJWxDj0kgt9PDs0wVX5eimNF9i9yVbum0U2aL5mBVOxS1nX6LLIbiCWTPCxNb8MGw7DSd
	x0rznPZYswbAkmRd9brV+IH4Ts/1lFYefv6VgNTnfUeDd831GJigaJtSnEdIwVJKdevzRnuPUW7su
	vhOSKgQkN/BTeg8j7kNXeLuLVQoFoTQxs09HbImS2zd7SptT1TttHz7GKcd1iIvR371ZKfTq2nhsw
	uB/mLFl/mHrIos9E8qDk8wAjV3LaBV+bbJKrL46SokpD8yQoQwdceZhzkDQJ7xg/jTN/nk5a+ydoe
	0pUbdzPA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMuFH-00000003SIK-0N4k;
	Wed, 04 Jun 2025 19:57:55 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-doc@vger.kernel.org,
	James.Bottomley@HansenPartnership.com
Subject: [PATCH] doc: Include scatterlist APIs in htmldocs
Date: Wed,  4 Jun 2025 20:57:51 +0100
Message-ID: <20250604195753.823742-1-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have all this fine kernel-doc written, and it's not published
anywhere.  Expose it to public view.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 Documentation/core-api/dma-api.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index 2ad08517e626..190ed8fe55ba 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -915,3 +915,9 @@ the driver. When driver does unmap, debug_dma_unmap() checks the flag and if
 this flag is still set, prints warning message that includes call trace that
 leads up to the unmap. This interface can be called from dma_mapping_error()
 routines to enable DMA mapping error check debugging.
+
+Functions and structures
+========================
+
+.. kernel-doc:: include/linux/scatterlist.h
+.. kernel-doc:: lib/scatterlist.c
-- 
2.47.2

