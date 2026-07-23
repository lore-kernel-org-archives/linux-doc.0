Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33ABE2C11E7
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 19:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784833325; cv=none; b=LFsZ1ICgFLE2tS83+HvzxlraA+P/MMGv8ZQ+AVRrQWG3Kd+hXSgPabhUpXEM/FdF0Z5c8z32d3bqsHIGfOUKpgjbTK41j5Qy66UaTD+QKNIoEn60owa1gYq4W9JvaW9CmwbuDMdRjCEB9xev4LMTj0Q1srBY8hlb8X6lJUB8GHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784833325; c=relaxed/simple;
	bh=OinmQYLXXos7yyPrxhDeHOiL74jdzK621QwBmC8KgVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WzJfsZ8f0n2RhJ3HPB77Z9TK5amOu6OQ4lcoZBkPqJbtk8k48PstQdlkyHJQIHINezP8ONSfZOasMemFPapoMYOu4XgfIMDR5cbBtyXkxDo/3uNgQ5JApGRy9eILHJnaWYyFvC6ejHVWo5nz/2PCRDpzmH+ujvydZoBMtfMXIAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TqeKxqdu; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TqeKxqdu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=gcfQXsM0rU1X0Rlba5Hazb/AjNjeAeGGohOmz/C1ew4=; b=TqeKxqdulmZFDBtM/hZIRW4M/U
	D249fVqLj+3UTq16ZezZpOVT9YtkEAZ3E1jE00fDEb0K2ei25ysvuLt1Q4IbDGKfIl9Opc3jMWcpO
	l0TiNaDPbik7Z044T8x7oxU1mo5hT0U51tho+5q8RV4nUTDhtR++CiL3Y2xlfnATo+l7DB49SVLs6
	EjY84/E/B73+Qt3s7T9Kvt9LULxVmJK6/xRect3QCRXSW8er8PK0j8gRk+fJcKnDlsIRhaTRDRM2+
	XVn7gKdQ6Lmi9gAAzbU/Ghy36B+cI7tVKvK0nX8fkVed3appLQ6/3nXm16Wv3rYi9u1re0D2XwcNy
	WPNPFDLQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmygA-0000000Evf6-0ywk;
	Thu, 23 Jul 2026 19:01:58 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] docs: xforms_lists: support DEFINE_IDTENTRY_IRQ()
Date: Thu, 23 Jul 2026 12:01:51 -0700
Message-ID: <20260723190151.507295-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid kernel-doc warnings by supported DEFINE_IDTENTRY_IRQ() as a
function transform.

Warning: arch/x86/kernel/apic/apic.c:2157 function parameter
 'spurious_interrupt' not described in 'DEFINE_IDTENTRY_IRQ'
Warning: arch/x86/kernel/apic/apic.c:2157 expecting prototype for
 spurious_interrupt(). Prototype was for DEFINE_IDTENTRY_IRQ() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>

 tools/lib/python/kdoc/xforms_lists.py |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20260722.orig/tools/lib/python/kdoc/xforms_lists.py
+++ linux-next-20260722/tools/lib/python/kdoc/xforms_lists.py
@@ -90,6 +90,7 @@ class CTransforms:
         (CMatch("__(?:re)?alloc_size"), ""),
         (CMatch("__diagnose_as"), ""),
         (CMatch("DECL_BUCKET_PARAMS"), r"\1, \2"),
+        (CMatch("DEFINE_IDTENTRY_IRQ"), r"static void \1(struct pt_regs *regs, u32 vector)"),
         (CMatch("__cond_acquires"), ""),
         (CMatch("__cond_releases"), ""),
         (CMatch("__acquires"), ""),
