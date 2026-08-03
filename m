Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915F340DB2D;
	Mon,  3 Aug 2026 17:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785778136; cv=none; b=O8/eGRJ4NNSjxOxOIrw9YrUgpbeA48zw3tInDmJb7PZaL3gqzQe0MwVBwQJWoLAjbsoSxEeSPPgHx0hY6Sz/wbVw24uGjqKLKMQDf8JnJ/s++Henp9OdOenDPlTkqBqf2XgfrlaociR8P0s2eU0SGD8SJPc9hgVA5l2JswzpTcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785778136; c=relaxed/simple;
	bh=PK5f+psGhI4xW5AEh7SGVTVeMnz0VzDttrM6gQt/Oss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s0f9Iraofk6o6zyWKe7mzhRJSq9ZPPBgA3dkJxvR37WOZthzAnBqPrkDaqv1dG9WX2qf13wGVD/DCXWUMluoKJqIxX93B+TUJu3NN9ST21tMbhl6nigbSdhIIefs0D+QbDlot/f1iO0VKstw2W9rl3Hs+If1NQTzxR1DJ1mXMwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ub054CDT; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ub054CDT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=UOhnoC/ETQC1UTLKFnOFF5MOhOFgt3Lr7zR71I1GpcQ=; b=ub054CDTQT5Qs8G+N1SZV7smpU
	RFM6ZMc88O+srRDMgqSHMkJ0NXve0FJWNb96DQlT2phUMe9C6mhoNlmW/OnD8pukskkGaMBAhS9Te
	nFhM5rwrNnwNlmMGho1pkPMtaOWsjESeRfQQRzUwo/7vLvLt97hPvIGHoHIz1kGAMnFIDnZnBBlos
	f1VwDQl0o9cgYLhGvT00EuqcasAFbh+xertSmJrOJlv3zMCvv81ljXUtH8xhdxcMS1rzW0DMTAyR3
	ZHQcTbihtDjToi4KYeNBpTn44WLdFOPtowVftLo0WvWpEcpMyiFSYMVdxFK4oU4nI2Xdbi1gBdzV0
	A1ESkFEA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwT6-00000000Ect-2xpt;
	Mon, 03 Aug 2026 17:28:52 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] MAINTAINERS: docs: add reviewer
Date: Mon,  3 Aug 2026 10:28:50 -0700
Message-ID: <20260803172850.47704-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as a reviewer for the documentation subsystem.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 MAINTAINERS |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20260731.orig/MAINTAINERS
+++ linux-next-20260731/MAINTAINERS
@@ -7778,6 +7778,7 @@ F:	include/linux/dmi.h
 DOCUMENTATION
 M:	Jonathan Corbet <corbet@lwn.net>
 R:	Shuah Khan <skhan@linuxfoundation.org>
+R:	Randy Dunlap <rdunlap@infradead.org>
 L:	linux-doc@vger.kernel.org
 S:	Maintained
 P:	Documentation/doc-guide/maintainer-profile.rst
