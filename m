Received: from mailrelay-egress7.pub.mailoutpod2-cph3.one.com (mailrelay-egress7.pub.mailoutpod2-cph3.one.com [46.30.211.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA1422578D
	for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 14:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775833056; cv=none; b=HCIA37weBmQN6DUaadKro4g+v3WvMpxyHlvDokAKWki7fErTGSI6w++cOtrjR5Y9kFlUi41u+XfddSSP5OcuoHp/oaIf8xen8mQTpcxeDBmFBbfR2mkQ+lUP7ObuOGTWKgZALypbH60ERc3iMPLefq58bui5BlSiMxPEfdzPlUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775833056; c=relaxed/simple;
	bh=6HLPp8eiKlP4BHoFEFaXa6hwcnR8Yr8FCXMs2RkLafQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DueIjP+sqjIup4d8y/pSR1gkm0aJdXKSvPkxoo1CVLpAYwJyCcBxYDMhPfqSxpXnFCP85dDcjElpq8WWk35cS0P1fd2edTnx8kxWmVi1hjnt9BmLjw/PLh4S8TOeqr4Ax3fgC9hdqC/QtnDdUrFapZQ3mG2xWS9Sal6Pjxt28IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=knutsson.it; spf=pass smtp.mailfrom=knutsson.it; dkim=pass (2048-bit key) header.d=knutsson.it header.i=@knutsson.it header.b=Q5owrYZL; dkim=permerror (0-bit key) header.d=knutsson.it header.i=@knutsson.it header.b=n12w5VAL; arc=none smtp.client-ip=46.30.211.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=knutsson.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=knutsson.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=knutsson.it header.i=@knutsson.it header.b="Q5owrYZL";
	dkim=permerror (0-bit key) header.d=knutsson.it header.i=@knutsson.it header.b="n12w5VAL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1775832981; x=1776437781;
	d=knutsson.it; s=rsa2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=Vf0t4MxdBmTz3FyWXWkHxvC+hT5aYnnQwznRd8j4Cr0=;
	b=Q5owrYZLrXwRpXKaDbHZJMb7ngipIoX8KHf3YSKmAqcjddD5FXfPqWRGi7fPggGosc+h3dh7bb7US
	 Qxht7Tk3VcLHoMiKZRrvIeqfuMHuWeNR9NZmTQzESTMgpe4VuAXodROLsEq/BbV/tPnkbJ1uH9fFex
	 nbBLzp5/YCb2JL6Nh7w6Qq8uwgQBuafxPvK9j1yDHQs0jdpLqvKnHFQK7uazEE3T4L0rbXeKwHbDYd
	 GNsQpOCk5sNzNDV7hb2vSnIZ6DYVwiJLiItMgBWCMvToYF9KVtm2VV2qtgqvUCOOju+gBlQZEOOrR6
	 AI3520ZPIDzOUQjCmvTVWNQQPgoSehA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1775832981; x=1776437781;
	d=knutsson.it; s=ed2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=Vf0t4MxdBmTz3FyWXWkHxvC+hT5aYnnQwznRd8j4Cr0=;
	b=n12w5VALJMe8bFtVyXPOC4eXKVG0nAakOCFbbRaSBRMGvuqLPzfjKqP5gsNzp3JZBV7BQwRiG/cJM
	 bxjLXmOCA==
X-HalOne-ID: 6fa567f2-34ed-11f1-bef7-fb5fec76084d
Received: from critbfk-Desktop.int.essentialive.dk (0x573e6412.static.cust.fastspeed.dk [87.62.100.18])
	by mailrelay3.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 6fa567f2-34ed-11f1-bef7-fb5fec76084d;
	Fri, 10 Apr 2026 14:56:21 +0000 (UTC)
From: Brian Knutsson <development@knutsson.it>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Knutsson Development <development@knutsson.it>
Subject: [PATCH] docs: tainted-kernels: fix typos in documentation
Date: Fri, 10 Apr 2026 16:56:06 +0200
Message-ID: <20260410145606.774491-1-development@knutsson.it>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Knutsson Development <development@knutsson.it>

Fix two minor typos in the tainted-kernels documentation:
- 'a more details explanation' -> 'a more detailed explanation'

Signed-off-by: Knutsson Development <development@knutsson.it>
---
 Documentation/admin-guide/tainted-kernels.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentation/admin-guide/tainted-kernels.rst
index ed1f8f1e86c5..714186159536 100644
--- a/Documentation/admin-guide/tainted-kernels.rst
+++ b/Documentation/admin-guide/tainted-kernels.rst
@@ -63,7 +63,7 @@ this on the machine that had the statements in the logs that were quoted earlier
 	 * Externally-built ('out-of-tree') module was loaded  (#12)
 	See Documentation/admin-guide/tainted-kernels.rst in the Linux kernel or
 	 https://www.kernel.org/doc/html/latest/admin-guide/tainted-kernels.html for
-	 a more details explanation of the various taint flags.
+	 a more detailed explanation of the various taint flags.
 	Raw taint value as int/string: 4609/'P        W  O     '
 
 You can try to decode the number yourself. That's easy if there was only one
-- 
2.48.1

