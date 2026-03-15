Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EC2288D2;
	Sun, 15 Mar 2026 22:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773614714; cv=none; b=Q8aY7+f7RrcL0du4UBHsE6btXubXviizb1OyNmuQfbBhHJe0eWNrauUZxFOUGdCnKfpKE3yUtdFdR8NIcEgfPUgSRpYgozFHHMC7uHL3Zq9Jsj8wNuFyosnaGQntOQsch9Nm8xF2cP/84/0Dkf3f64dmH5axplFrfG4cRduBGCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773614714; c=relaxed/simple;
	bh=1kZoubyBJ0mgnXcLepr3us6t1WDkWzj4u+htiFV5N9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mZij0NMbHFviduiUreNpdhgVW6R4RdB6uMarPedtxfaENP47c84uXyCawwiRDmLug9QTGYSybAAMgV2vgok2Cmmv3kMvEPAHvPnWKQCYB+T2XsvMyTf2jxDaE1Xr2pTMFPgIzwfH5QMsuM3jmE/VX8S9UXJv4Fgl/X1Pgefy6XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=R5xsh5BC; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="R5xsh5BC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=xKp3gvUqk4FAYhqUDq8U6UmYthO6e2jpd9e3v+YrqkI=; b=R5xsh5BCWDqP0dYOUh+5E3lPHo
	6fI0lpns9SOdnSL7iZinPEFyRZD/DaAOgOV9ImgiHTvYhMcrTBNoalsihWISeZ9RsjTLZaTnWUNPG
	24lGZhxF31v31N/wylvfyUXOd/rEThTnOtFokV4GXLlZWtuXPWVyMyKsA9ckcaMzztUZwZsb1/mGv
	PGP7UhEAKl8gfO44uGwogH/7LwMUsczTs1ElB4hdiMr0fvTaaoGnllYeqW7unn6hb9Fv0PxdoX/we
	iFX36ryPXOm3Jzok/eTJ8B5hM7LMy658GEDUc272/zb8gyntZne2UGFOZxFJQQPcObq/R/aGLTx5R
	pqltrPxg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1uCu-00000002yUR-1hjG;
	Sun, 15 Mar 2026 22:45:12 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] Docs: mmap_prepare: don't italicize structs
Date: Sun, 15 Mar 2026 15:45:06 -0700
Message-ID: <20260315224506.1973566-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using a single quote mark `struct xyz` causes the html output to be
produced as italic. Omit the quote marks so that kernel-doc's automarkup
can make the "struct xyz" bold monospace ("code" style") in the
generated html.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org

 Documentation/filesystems/mmap_prepare.rst |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next.orig/Documentation/filesystems/mmap_prepare.rst
+++ linux-next/Documentation/filesystems/mmap_prepare.rst
@@ -129,11 +129,11 @@ pointer. These are:
 * mmap_action_simple_ioremap() - Sets up an I/O remap from a specified
   physical address and over a specified length.
 
-* mmap_action_map_kernel_pages() - Maps a specified array of `struct page`
+* mmap_action_map_kernel_pages() - Maps a specified array of struct page
   pointers in the VMA from a specific offset.
 
-* mmap_action_map_kernel_pages_full() - Maps a specified array of `struct
-  page` pointers over the entire VMA. The caller must ensure there are
+* mmap_action_map_kernel_pages_full() - Maps a specified array of struct
+  page pointers over the entire VMA. The caller must ensure there are
   sufficient entries in the page array to cover the entire range of the
   described VMA.
 
