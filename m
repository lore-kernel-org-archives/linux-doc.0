Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D663404BD9
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 15:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538062; cv=none; b=qE3yyISH8lSt6P+jrLG3ylwzcptBkp67AU4yLC88sCqkoCFHbnOlHdui+HR0fDx0+cMyH5e2OqfqeQ8ck5N6pEaiQLCVhm2rC0gftKe/j9qVdh6stBU5dQgE5KKyX5W06dJcqw8t02nfTJ6Ij4GeiaFQ2kRAQskUAGR4WYz1WEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538062; c=relaxed/simple;
	bh=AXCqWusZrG0HQrAC+w3KgIiFOdFBnu4cqceaWF4y7+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r+wRON30ooDiahRklXdMVXp2i9q3o1RZREn1SbhngVqB/zZqscda9NNw9vYObyLP+t6zUnFIiNz7KsbrECGY7s+03Pd7vYYDZKqjGoq04YAYIUDZW+uhfJQmQ9STRE13AVlLJzyAFXMEHnxU7cMj2VXST1IsKlwuSATqwqWdxCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NWm6zsUp; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NWm6zsUp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=LOcasZbEmU+CYU2TCsGUkxYypbPTT17WmkQ9suQ7iNw=; b=NWm6zsUp9sU/TNPnPHgO1SLOW+
	/WcuedB7/epUIrUHg+oNzgKo68pPfFPELP3PO0KBXUsSFN3+dOoI4QB7jpeRsi/tXdkRgXYmP5S0Z
	++AjmVHaLd5x1dz0dmOetQuGxi2bvfOnQlCuG/qIol1JMI8bmxzCogm1IcNl2KO6iNp8mgdmfhwt2
	sVPL1wWwAV6RqXd9KsFAXHEoLGAhFmu9GuVaHYnHVubSa1vL82TRGDErfDkpl0bleWahlZ9FR50gZ
	KbBdr/m11xhkCCI8x501eEwV82VYxXJNeV38d1gp2k7sm3i0XMv3LhYT+iFvO9LbR4Rir8+X19GIW
	BNRmq0cw==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ9Qo-0000000931t-2cSR;
	Mon, 15 Jun 2026 15:40:58 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Fix regex for kdoc
Date: Mon, 15 Jun 2026 16:40:55 +0100
Message-ID: <20260615154057.2156589-1-willy@infradead.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The trailing '*' means "all files in this directory, but not
subdirectories" which excluded tools/lib/python/kdoc/.  This is surely
not intended.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0d94420eae3d..999957a3e0ca 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7653,7 +7653,7 @@ S:	Maintained
 P:	Documentation/doc-guide/maintainer-profile.rst
 T:	git git://git.lwn.net/linux.git docs-next
 F:	Documentation/
-F:	tools/lib/python/*
+F:	tools/lib/python/
 F:	tools/docs/
 F:	tools/net/ynl/pyynl/lib/doc_generator.py
 X:	Documentation/ABI/
-- 
2.47.3

