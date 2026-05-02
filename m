Received: from s1.jo-so.de (s1.jo-so.de [37.221.195.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EDC2D7BF
	for <linux-doc@vger.kernel.org>; Sat,  2 May 2026 13:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.221.195.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777728466; cv=none; b=riPaWxOikxXLOGd7lgjR5dY2hZc/fjiL+5hObtCY+qX3JuPkx6Jrw1cAxcjMJxydF8Opp7sbfId9y2sANEG/V+JHKEjZLt/U500b4ExKKJNylkUJI9gaGdhIXmTl252HRdD2p0mkZN0VwLjcOmqgoseqc/2uA0lk7CyPU2OnJZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777728466; c=relaxed/simple;
	bh=A00czMAKcwXXNGopW8KD2RMSwZ4nAWBDs4qIFGTi2Es=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=caR5lAwv06OE6fusyknjxWO42zZjQjNL+V+fLJJmetE4NKePnShkSHl/wy/xEi0Q9BTRrMR7fBCQEAFKiU03x9Q9Bl3gA+zr08T8yjFXJxv+dlfQYJWofOnvy1faQR6mLVfcYOqG6cMN70NxO4WY/8KJrG1iXgnXtQeA+9VaChU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jo-so.de; spf=pass smtp.mailfrom=jo-so.de; arc=none smtp.client-ip=37.221.195.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jo-so.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jo-so.de
Received: from mail-relay (helo=jo-so.de)
	by s1.jo-so.de with local-bsmtp (Exim 4.98.2)
	(envelope-from <joerg@jo-so.de>)
	id 1wJ9pU-0000000ABUE-3OfN;
	Sat, 02 May 2026 14:52:20 +0200
Received: from joerg by tux.jo-so.de with local (Exim 4.99.1)
	(envelope-from <joerg@jo-so.de>)
	id 1wJ9pU-00000002c8K-0TY7;
	Sat, 02 May 2026 14:52:20 +0200
From: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg@jo-so.de>
To: keescook@chromium.org,
	corbet@lwn.net
Cc: linux-doc@vger.kernel.org
Subject: [PATCH] doc/pstore: Fix parameter names in examples
Date: Sat,  2 May 2026 14:52:20 +0200
Message-ID: <9e06a170f08fb5c83f0ca861cb42e0a22850b572.1777726340.git.joerg@jo-so.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Jörg Sommer <joerg@jo-so.de>
---
 Documentation/admin-guide/pstore-blk.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/pstore-blk.rst b/Documentation/admin-guide/pstore-blk.rst
index 1bb2a1c292aa..5c247c25e13a 100644
--- a/Documentation/admin-guide/pstore-blk.rst
+++ b/Documentation/admin-guide/pstore-blk.rst
@@ -35,7 +35,7 @@ module parameters have priority over Kconfig.
 
 Here is an example for module parameters::
 
-        pstore_blk.blkdev=/dev/mmcblk0p7 pstore_blk.kmsg_size=64 best_effort=y
+        pstore_blk.blkdev=/dev/mmcblk0p7 pstore_blk.kmsg_size=64 pstore_blk.best_effort=y
 
 The detail of each configurations may be of interest to you.
 
-- 
2.53.0

