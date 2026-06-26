Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B66E219E8
	for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2026 00:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782435174; cv=none; b=nusCWxtZoFR82RpVKF5z5DwyBFvCxyaKp2+Dnr9b1ucPyL7hSA/bvWoe/mYIS7aScwUBJDhI9YLhRmLpQz0GOEokj5pD/o7/agc/wzg6UL796Hv5XDzW7i2kKNlzm0kXpQMhuGtKaOsatUq0bdnZX3h62F2Co561gLFaHFAvM6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782435174; c=relaxed/simple;
	bh=bW6LIXdbznhOdeU0iEJ6mTaffjorqPEf/ap0ygO237U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h1Ke+ztJW6FT998Zn+5GxQvXljUWzqiOQ0DgsKE3Hhm3zSO+s/8iTqBIjzh3kqXHT54zCSDBHsN+pfHOesXohje131IKpYoK6qqwOzUk0ZXMZ0JsKQHkWycSOEFEs7Cb3tz6inkcpoo2xWSujQNSbFAYxKyKrrcIt/yhAzRND+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pawHE1M7; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pawHE1M7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=FrBLcvuq98RJ13aJB92b+mK4t2QYxNXjcNA9FvpY+EU=; b=pawHE1M7DJuXxXu3Fhixc3PlGv
	hBhpDOhEOHmJrwz8LNqOez64QiARBR7y849d3UI/cxwEXrX4TJwe4AJU7Cd2CupowgUlyeMn9BBSq
	tpATelVzoalsQyQPwUAfQ0qSs2xG+LBDPtrzUkLScQRYODeyUKPxcge2XPdsPOSGAAUtEmRKTAKUU
	6EjUyPas/iIoBrKaL1JaYtXu2tQadFo30r2cwj7Ww83TGEVxhWr0HpIoVtbgYZratv6xgBculAPvJ
	Qhq5Ob1FlG4fhiUmEv/xT+bFzphpRJy9Bagj5lbKD3hlZi/OvXOcMks+zZi3rVTAV/UprANk0s1u0
	KZLtyPSg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcuoL-0000000A3Ru-2yeL;
	Fri, 26 Jun 2026 00:52:49 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] Docs: conf.py: fix typos in comments
Date: Thu, 25 Jun 2026 17:52:48 -0700
Message-ID: <20260626005248.1121464-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change "variabled" to "variables".
Change "relative patch" to "relative path".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>

 Documentation/conf.py |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linext-2026-0623.orig/Documentation/conf.py
+++ linext-2026-0623/Documentation/conf.py
@@ -61,12 +61,12 @@ manpages_url = 'https://man7.org/linux/m
 
 def config_init(app, config):
     """
-    Initialize path-dependent variabled
+    Initialize path-dependent variables
 
     On Sphinx, all directories are relative to what it is passed as
     SOURCEDIR parameter for sphinx-build. Due to that, all patterns
     that have directory names on it need to be dynamically set, after
-    converting them to a relative patch.
+    converting them to a relative path.
 
     As Sphinx doesn't include any patterns outside SOURCEDIR, we should
     exclude relative patterns that start with "../".
