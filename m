Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758C333F59A;
	Tue,  5 May 2026 22:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778019354; cv=none; b=d9+8SqnoOHmEtEAOjBGV1FPf4I+bstQjiKsG/PZywc97rT4uCTjRxgFE2bgDxEdu6+15H8KyDAxTl/RGo/ECwo+9SabAY9vr4s+Si50gq8Cy6aFwVb1lMVdhlTmmkOMq4VDCSAuGTLnCHeBaySNrL13pfco92/vaiRwUhMi65FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778019354; c=relaxed/simple;
	bh=5yp+6GCw/b9Wj2eQ79huhd1UlYFxqmSWXY8o22olazs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jQdE+/VjHVOtlMqgrs8NKuHF2tDGZ17wzA5dF8i3lOcoWm9XtenB6Z0haEzphLAA59fjF43NCNwh71K1cjoPi69hiiPmSj7TEs8oHBRKRzJil6qV9aWn4BKFaH95flVlobHNylBhVlMB0INWfDz+a60cK10gZOzwh2Cg783Qias=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HqCNbtyZ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HqCNbtyZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=6jmaeTtszvufSCkIcJFmIruuDH0CqbDcCjtWGJswEPk=; b=HqCNbtyZdWjia83KLFp+U09g+S
	hPgBK4cdu8811Zk9U1xhqLGVTiGHqmEfeqw9BthaXU2AdeCpFIGRWdN0fDnvf+JEf9sfhoTbdGOeR
	b1H4LfFUnqqUPNl/nvbwhjUI0dM9nthcb20uAvXXZnHIOH2JfseJFsYLGBoQSNPXeqWcQcG7n7ZnB
	Rfm0G21yut5QUJtnuvoM6Yi5Ffp1zS+2nhc/KmIeIqPrVxyPZcbVcf9EH3XsgeNpeXLzOUnLApbMJ
	uToGDb4PLgv9jtlQjZQ9wPqc/cZvkrCqAmJFkYX9Ce+oOaH4lw+4VET7zVDeZsAAwX7wzqRN1WRWU
	ws5Z8miA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKO3R-000000002FY-1fmn;
	Tue, 05 May 2026 22:15:49 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] kdoc: xforms: move context attrs to function_xforms list
Date: Tue,  5 May 2026 15:15:48 -0700
Message-ID: <20260505221548.163751-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The context analysis macros are function attributes that should be
in the function_xforms list. Somewhere along the way they were
inserted into the struct_xforms list instead. This causes docs build
warnings to continue to be emitted for context macros.

Move the context analysis macros to the function_xforms list where
they should be to eliminate these warnings.

Documentation/core-api/kref:328: ../include/linux/kref.h:72: WARNING: Invalid C declaration: Expected end of definition. [error at 96]
  int kref_put_mutex (struct kref *kref, void (*release)(struct kref *kref), struct mutex *mutex) __cond_acquires(true# mutex)
Documentation/core-api/kref:328: ../include/linux/kref.h:94: WARNING: Invalid C declaration: Expected end of definition. [error at 92]
  int kref_put_lock (struct kref *kref, void (*release)(struct kref *kref), spinlock_t *lock) __cond_acquires(true# lock)

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>

 tools/lib/python/kdoc/xforms_lists.py |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

--- linux-next.orig/tools/lib/python/kdoc/xforms_lists.py
+++ linux-next/tools/lib/python/kdoc/xforms_lists.py
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
         (CMatch("__(?:re)?alloc_size"), ""),
         (CMatch("__diagnose_as"), ""),
         (CMatch("DECL_BUCKET_PARAMS"), r"\1, \2"),
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
         (CMatch("__no_context_analysis"), ""),
         (CMatch("__attribute_const__"), ""),
         (CMatch("__attribute__"), ""),
