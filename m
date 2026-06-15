Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FE8406806
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 15:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781537638; cv=none; b=tjLXXSCVZJRSBEg4GXPfKC5Uw3HvT/Y0fXJ20XaQuHnCCWjMfuWERl1Ib9WX8tzyJyssgSQ+XLL7Blo8USNY9IB695tGSAV57mi86DtlmaSQSLTEPgngrO77EMivmZuAHjEZhEe8tyBxyr4v4tvH60Pq2yvrfxdJzdPE5dbfQBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781537638; c=relaxed/simple;
	bh=CNvhGigZMaYxDYgG+kXlcZIfetpPJnZg+CA5ruT4fvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JJYAK8GcSonQBI3fRqiq6wlhwzauBfT37+1ySwu0fzAHCRb36sfqzhpk9JjojCMEadkC9qrOqMOOWfvC/WRXjb59An/xl4OtaGfqef4xZiCNWGRJssAlLhOVdKoGpS0m0GJHsPlN69PdYXDRbiUjNJbUVeigIrTZ2LhxWPuBmSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NxC7cAGq; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NxC7cAGq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=x29VLfGx28SCl7AqTaf1MY64L87af9bseoCBwNOQVqo=; b=NxC7cAGq1hN016B/kIF/0MMTkI
	zWdZK1z2f881x22wEsQF4eeEZSJ10H9oW6dQApLvZnE9WFuYRLccnVZTC8CETUF45lZHbwb38ptqE
	qgdOKxhrdAV0yu/S+TEE7zz5nGKPY48KXQ3LwscPA6AkNWKVy+oLoeGTZTS2yU5ZnGDHis+gUOBMV
	YUj+YAwzq+hg/2MwJ5whZKjPE3HBGW0nnYrEll5762k8qZSJOjJVOjkpTWo8b+GXjy8l+On6eOf1B
	AckVx4bQzZYhdm9wDFz9Y2HtPqk/wI9LjFiBaZil5YAu24HkKFgY8W4XVEPaEbbOQ1RuIw/FBVCto
	S6NdtQVw==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ9Jv-000000092On-11X2;
	Mon, 15 Jun 2026 15:33:51 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] kdoc_parser: Move __acquires and friends to function_xforms
Date: Mon, 15 Jun 2026 16:33:38 +0100
Message-ID: <20260615153340.2154110-1-willy@infradead.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These were originally added to "Transforms for structs and unions"
which led to warnings like:

./include/linux/kref.h:94: WARNING: Invalid C declaration: Expected end of definition. [error at 92]
  int kref_put_lock (struct kref *kref, void (*release)(struct kref *kref), spinlock_t *lock) __cond_acquires(true# lock)

and the documentation was a little messed up as a result.  They should
have been added to "Transforms for function prototypes" since they are
not valid decorations for unions or structs.

Fixes: 85c2a51357f7 ("docs: kdoc_parser: move nested match transforms to xforms_lists.py")
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 tools/lib/python/kdoc/xforms_lists.py | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
index f6ea9efb11ae..150fbc90f085 100644
--- a/tools/lib/python/kdoc/xforms_lists.py
+++ b/tools/lib/python/kdoc/xforms_lists.py
@@ -48,16 +48,6 @@ class CTransforms:
         (CMatch("DEFINE_DMA_UNMAP_ADDR"), r"dma_addr_t \1"),
         (CMatch("DEFINE_DMA_UNMAP_LEN"), r"__u32 \1"),
         (CMatch("VIRTIO_DECLARE_FEATURES"), r"union { u64 \1; u64 \1_array[VIRTIO_FEATURES_U64S]; }"),
-        (CMatch("__cond_acquires"), ""),
-        (CMatch("__cond_releases"), ""),
-        (CMatch("__acquires"), ""),
-        (CMatch("__releases"), ""),
-        (CMatch("__must_hold"), ""),
-        (CMatch("__must_not_hold"), ""),
-        (CMatch("__must_hold_shared"), ""),
-        (CMatch("__cond_acquires_shared"), ""),
-        (CMatch("__acquires_shared"), ""),
-        (CMatch("__releases_shared"), ""),
         (CMatch("__attribute__"), ""),
 
         #
@@ -98,6 +88,16 @@ class CTransforms:
         (CMatch("__diagnose_as"), ""),
         (CMatch("DECL_BUCKET_PARAMS"), r"\1, \2"),
         (CMatch("__no_context_analysis"), ""),
+        (CMatch("__cond_acquires"), ""),
+        (CMatch("__cond_releases"), ""),
+        (CMatch("__acquires"), ""),
+        (CMatch("__releases"), ""),
+        (CMatch("__must_hold"), ""),
+        (CMatch("__must_not_hold"), ""),
+        (CMatch("__must_hold_shared"), ""),
+        (CMatch("__cond_acquires_shared"), ""),
+        (CMatch("__acquires_shared"), ""),
+        (CMatch("__releases_shared"), ""),
         (CMatch("__attribute_const__"), ""),
         (CMatch("__attribute__"), ""),
 
-- 
2.47.3

