Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F113264C7;
	Wed,  4 Mar 2026 22:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772664125; cv=none; b=pskq8mjCxBAzkG/rRkaQ4H/2KIjDLh9DhM8FyBmNDYH84xJWO6PTb82VHExDdAS9g7KocfpCUk8ohwIZ53+0AP30VmMKd4nZKlUs6FoENhFc4UKM6e5aajsuZmGDkTpuB/xrygAGLVpVt8UjtsZCa7yLc98Q3ORfFKqn4ECHeXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772664125; c=relaxed/simple;
	bh=fHiVTtrfRVJu8ehVBESJmhRcLTwp6QG6oEB2ExqzsdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SJut0qORe6spbC69tI0c11jcaRSu7KIR9Trxs8lNda0i/GYEHwIm/aWGq1W3ivwuDH/EfQtgnQQ7iPB0pri41c+3iVXvJ2c87PvwTgs3u+UZXMcOhm9x9Q7kSKCF68GNxb+xjPJjPW0OjHo1ys21ZT8N1iDCiAIQqk0qWcUAkSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kNuWiUbP; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kNuWiUbP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Lzi27hghvN+yXJ2rKl3QSduXheLlM+tDwY8btE6yp/4=; b=kNuWiUbPnLcOGMKRFAyIZskdHV
	q3vn2jkFFDxcZc/iFNN4FwjYLC5WiJbjAm23RWDkAeT/V0ySbwxiA4kMQygDLJrd6N8MrD4/o1e0Q
	FqE7pvU7QKDa/53EATSGNiml9dJg3GK7i8q7A9gGM7WejDViYS+c62mWKAjey5+Rz2qgiKceMSALZ
	nNlF8TYiTNVMIIQ/FkFqmjDuzWC1RUyft6Ajk0BOU2myHP2xNynu8dRh5Ypi16DC7rGB0wuclAvev
	gS3Jbpm9Wbn4lWTWcoc3AcpQMEhlfjFap3d5al89Dwf4ppHLezNeDVZRjOs3ipoNje65ahCgaIH3F
	0Gv5EM6A==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuuo-00000000bT8-0w8t;
	Wed, 04 Mar 2026 22:42:02 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Kees Cook <kees@kernel.org>
Subject: [PATCH] MAINTAINERS: fix '*' wildcard formatting
Date: Wed,  4 Mar 2026 14:42:01 -0800
Message-ID: <20260304224201.1072044-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It seems that these wildcards confuse some parser (docutils, sphinx,
or maintainers_include.py), so quote them to avoid this issue.
Also insert a hyphen ('-') before "all files" in several places
to make the html output easier to read.

Fixes this htmldocs warning:

linux-next-20260304/MAINTAINERS:40: WARNING: Inline strong start-string without end-string. [docutils]

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>

 MAINTAINERS |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

--- linux-next-20260304.orig/MAINTAINERS
+++ linux-next-20260304/MAINTAINERS
@@ -32,10 +32,10 @@ Descriptions of section entries and pref
 	   Type is one of: git, hg, quilt, stgit, topgit
 	F: *Files* and directories wildcard patterns.
 	   A trailing slash includes all files and subdirectory files.
-	   F:	drivers/net/	all files in and below drivers/net
-	   F:	drivers/net/*	all files in drivers/net, but not below
-	   F:	*/net/*		all files in "any top level directory"/net
-	   F:	fs/**/*foo*.c	all *foo*.c files in any subdirectory of fs
+	   F:	``drivers/net/``  -	all files in and below drivers/net
+	   F:	``drivers/net/*`` -	all files in drivers/net, but not below
+	   F:	``*/net/*``       -	all files in "any top level directory"/net
+	   F:	``fs/**/*foo*.c`` -	all *foo*.c files in any subdirectory of fs
 	   One pattern per line.  Multiple F: lines acceptable.
 	X: *Excluded* files and directories that are NOT maintained, same
 	   rules as F:. Files exclusions are tested before file matches.
@@ -44,7 +44,7 @@ Descriptions of section entries and pref
 	   X:	net/ipv6/
 	   matches all files in and below net excluding net/ipv6/
 	N: Files and directories *Regex* patterns.
-	   N:	[^a-z]tegra	all files whose path contains tegra
+	   N:	[^a-z]tegra -	all files whose path contains tegra
 	                        (not including files like integrator)
 	   One pattern per line.  Multiple N: lines acceptable.
 	   scripts/get_maintainer.pl has different behavior for files that
