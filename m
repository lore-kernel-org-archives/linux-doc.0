Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B611FF7DA;
	Fri, 10 Jan 2025 08:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736498480; cv=none; b=f9UIDezlijvHBYVKVCO/Oy12DrD2GpBaTsleOKCpC+EshrBbhCtyZUCYbP/cpirzatlkKXa51jRfih1mbYrNGrOoSqVBOsfGnTwMgiAni9OHBs29wRM4j6FEG2kq8L+6GWeH8N5KF9vVVksUW0t+gwoAgDCOys77UFwMtHgxKnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736498480; c=relaxed/simple;
	bh=fote5o0Oj9WeGqML9lH+CluM630gf4KooiiwUL4DwAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tWVowy4c6gswmRQSioUBzGkmysrtPMGTdzQzUQJmxXcVrxX50iDDEKJZpMLGIZcvKpB+rtnZdso1DA7fPePSsySSOy0jtfIA+/qHYGN0SH5zc8yXWFOQzRvrOjxBkCDXYd/WW0uxm976SEQNFJbNGRH0jyBkdEjomc0FDKG6pSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=z7VT/eob; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="z7VT/eob"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F204C4CED6;
	Fri, 10 Jan 2025 08:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736498479;
	bh=fote5o0Oj9WeGqML9lH+CluM630gf4KooiiwUL4DwAI=;
	h=From:To:Cc:Subject:Date:From;
	b=z7VT/eobJrtDIfsonQk9q0dsRF1S9VuWJHXzUq4jeL/UZtw80LPZ5zYNGJ6vc97Pe
	 y0hQOY7/M4WON0jNmRnhxtCbng3AFaFI5tu/XcJfH3eJ/mhGnGkM4qjInmSiN/EubQ
	 XvIm4jlxAlUohITJRzPMppa7amWv1SKcenvzwxL4=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greg@wind.rmcc.com,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>
Subject: [PATCH] Documentation: bug-hunting.rst: remove odd contact information
Date: Fri, 10 Jan 2025 09:41:01 +0100
Message-ID: <2025011005-resistant-uncork-9814@gregkh>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3416; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=fote5o0Oj9WeGqML9lH+CluM630gf4KooiiwUL4DwAI=; b=owGbwMvMwCRo6H6F97bub03G02pJDOkNd5VSXYzkBKbfnrfx3X92v4azmguF46Q6jrzMujdnx qoNpfded8SwMAgyMciKKbJ82cZzdH/FIUUvQ9vTMHNYmUCGMHBxCsBEbIQY5lfuqWiaoP9J7tqS rfrZvXxHvuQI8DNMdyxI+SG600D21N/T8Ypvn/prdNQDAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

At the bottom of the bug-hunting.rst file there is a "signature" which
doesn't seem to make much sense.  It seems to predate git, and perhaps
was from an earlier bug report that got copied into the document, but
now makes no sense so remove it.

Cc: <greg@wind.rmcc.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Alex Shi <alexs@kernel.org>
Cc: Yanteng Si <si.yanteng@linux.dev>
Cc: Hu Haowen <2023002089@link.tyut.edu.cn>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Documentation/admin-guide/bug-hunting.rst              |  9 ---------
 .../translations/zh_CN/admin-guide/bug-hunting.rst     |  9 ---------
 .../translations/zh_TW/admin-guide/bug-hunting.rst     | 10 ----------
 3 files changed, 28 deletions(-)

diff --git a/Documentation/admin-guide/bug-hunting.rst b/Documentation/admin-guide/bug-hunting.rst
index 1d0f8ceb3075..ce6f4e8ca487 100644
--- a/Documentation/admin-guide/bug-hunting.rst
+++ b/Documentation/admin-guide/bug-hunting.rst
@@ -368,12 +368,3 @@ processed by ``klogd``::
 	Aug 29 09:51:01 blizard kernel: Call Trace: [oops:_oops_ioctl+48/80] [_sys_ioctl+254/272] [_system_call+82/128]
 	Aug 29 09:51:01 blizard kernel: Code: c7 00 05 00 00 00 eb 08 90 90 90 90 90 90 90 90 89 ec 5d c3
 
----------------------------------------------------------------------------
-
-::
-
-  Dr. G.W. Wettstein           Oncology Research Div. Computing Facility
-  Roger Maris Cancer Center    INTERNET: greg@wind.rmcc.com
-  820 4th St. N.
-  Fargo, ND  58122
-  Phone: 701-234-7556
diff --git a/Documentation/translations/zh_CN/admin-guide/bug-hunting.rst b/Documentation/translations/zh_CN/admin-guide/bug-hunting.rst
index decb9b26d2f1..c3f6a83294dc 100644
--- a/Documentation/translations/zh_CN/admin-guide/bug-hunting.rst
+++ b/Documentation/translations/zh_CN/admin-guide/bug-hunting.rst
@@ -329,12 +329,3 @@ sysklogd发行版附带了一个补丁，它修改了 ``modules-2.0.0`` 包，
 	Aug 29 09:51:01 blizard kernel: Call Trace: [oops:_oops_ioctl+48/80] [_sys_ioctl+254/272] [_system_call+82/128]
 	Aug 29 09:51:01 blizard kernel: Code: c7 00 05 00 00 00 eb 08 90 90 90 90 90 90 90 90 89 ec 5d c3
 
----------------------------------------------------------------------------
-
-::
-
-  Dr. G.W. Wettstein           Oncology Research Div. Computing Facility
-  Roger Maris Cancer Center    INTERNET: greg@wind.rmcc.com
-  820 4th St. N.
-  Fargo, ND  58122
-  Phone: 701-234-7556
diff --git a/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst b/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst
index c139ec99cab1..b25ecc44d735 100644
--- a/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst
+++ b/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst
@@ -332,13 +332,3 @@ sysklogd發行版附帶了一個補丁，它修改了 ``modules-2.0.0`` 包，
 	Aug 29 09:51:01 blizard kernel: Call Trace: [oops:_oops_ioctl+48/80] [_sys_ioctl+254/272] [_system_call+82/128]
 	Aug 29 09:51:01 blizard kernel: Code: c7 00 05 00 00 00 eb 08 90 90 90 90 90 90 90 90 89 ec 5d c3
 
----------------------------------------------------------------------------
-
-::
-
-  Dr. G.W. Wettstein           Oncology Research Div. Computing Facility
-  Roger Maris Cancer Center    INTERNET: greg@wind.rmcc.com
-  820 4th St. N.
-  Fargo, ND  58122
-  Phone: 701-234-7556
-
-- 
2.47.1

