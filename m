Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7175220E030
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 06:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764137884; cv=none; b=PvDr/4NlSlOlmIRwc6Wi0L3Kzdln/WHKppPC2ohYRs8Pik93SqQbLG7DIa/mrgLKXr92ZkO4a6+OCNeQttFASqR92AG7fChKJRzg66pSWIgehPcuP68TC66hUkBwvDwQ6lTCFxrptQXeL/aRIxYwH7AFM+FK6nKcaKd4I+lv9HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764137884; c=relaxed/simple;
	bh=OEezmNdfxYV5bGkw/FB7mcTpQyrAMj47uYaOBBTospg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SfBVAkOGgJGI1muQzmB1Y3vEKfhPo6qpO+GDL3lmZ5D5PMHVXt+K5+icmIH5PiYz+R284Io4YfO7oVXC6ewN003A9CwZUT4WF40hg/a67RxUxg5o4kXX/F88Ycmlgs1tRbpzbboEXiqQoDaxnI4fdBhWMP3B6cYVAGP6jniqgtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hCFt2q0S; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hCFt2q0S"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Mxj7TJzsx2RmvKcp8LEjTZNFxnDnAbjR3n73qysOxzA=; b=hCFt2q0SaVwKkdYaPINE095f7l
	1IvUpbaKgvDFmSyV+hDXU1+u9zqP9O3lFiPJFijPCx8VxWXn37Pt67dIbEUbgIINQGEAf+eqrSAl7
	+d+oFZr1uhajeEh2FZpAoAt7BxFsQGxzUXSgbe4aEXi/McP6OiD6pFEAcesh6hKofk5C4JFlx7t6w
	KWTM81p1eQRicB2/4eoarhXrJYZnoz1LDBBI3yQSNxRgMcI5fOkzdGZ5Mw4IGtxS8/oKpPM+WHtjX
	CFhevVesOgyUPYx2km2No9e3JoArfB93BXHZFIamPeDvka3zC5noY4ejjpfXkqXGXbq6Xkjc8jLkj
	21UfRO6Q==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO8qg-0000000EQmL-3ahJ;
	Wed, 26 Nov 2025 06:17:54 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] docs: kdoc_parser: use '@' for Excess enum value
Date: Tue, 25 Nov 2025 22:17:52 -0800
Message-ID: <20251126061752.3497106-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kdoc is looking for "@value" here, so use that kind of string in the
warning message. The "%value" can be confusing.

This changes:
Warning: drivers/net/wireless/mediatek/mt76/testmode.h:92 Excess enum value '%MT76_TM_ATTR_TX_PENDING' description in 'mt76_testmode_attr'

to this:
Warning: drivers/net/wireless/mediatek/mt76/testmode.h:92 Excess enum value '@MT76_TM_ATTR_TX_PENDING' description in 'mt76_testmode_attr'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tools/lib/python/kdoc/kdoc_parser.py |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20251126.orig/tools/lib/python/kdoc/kdoc_parser.py
+++ linux-next-20251126/tools/lib/python/kdoc/kdoc_parser.py
@@ -919,7 +919,7 @@ class KernelDoc:
         for k in self.entry.parameterdescs:
             if k not in member_set:
                 self.emit_msg(ln,
-                              f"Excess enum value '%{k}' description in '{declaration_name}'")
+                              f"Excess enum value '@{k}' description in '{declaration_name}'")
 
         self.output_declaration('enum', declaration_name,
                                 purpose=self.entry.declaration_purpose)
