Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF755286891
	for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 17:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761412605; cv=none; b=icF91ToRGOQW6pEq0Lye34IdlaR7uLxhfccBGG9TOCWJmrZPA4ugGpG7m6bNt/yozSE6sBaw2OGgVW/QUCQyuRr0NRbiVKINQg7Aob3xckRbp8NI+1/kOS7y/yH3JIyQf3BwTzf81OUJOEpI412c0s6HpxBFSVgRh4ytVszyZuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761412605; c=relaxed/simple;
	bh=r2Om375Gpz/OuMljTFd7kK48QcMYVt8EzT4iLKOqUk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=liXBlFgmsqUavsNjH8vW6KBqVjoVU4bV+U5WJUKaXRvgNx4tV9JDoWcxfMVT1k1gDcB/cp7NMGNVBNnSpjKLxO5pgPLohs9TfHG9+X7W/KDFffshMDC5oqC7AOFvUJUtIpgADwJSiCMSx0e92FOJce652Fa3UCNCENIXdH0tsEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIn9t9GL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIn9t9GL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-475dd559a83so3248815e9.1
        for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 10:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761412602; x=1762017402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EEm6jQjbUP/ZLb0mwjDF1ek1ZnHXSkpVbfXo/n55Y+U=;
        b=FIn9t9GLSwbWRAgo3G6aW7dwAGUIxar+bq+bKEWx9HgCZLw5/gcbJQI0YNhRrOB83V
         FU9gTOuopp3b9y/HMrxacMEGc/+SKszw+D6Nz67haFCUrBNqhMXCeO9ZjitQnky8+fJ9
         lp0ND74MHC1u5VGimGRzjpt84uwaE+IFN9466Wh4ph9u5rkGz4nnZYlVHrWu5AJtutNh
         yxt+GZntWGsJ4PWLPfyGJ6CXXq1tsRgP3Cz7YyOaZtkd0TtAhaY70TSO9xtDVZ2c4AY8
         h5Jz6B6b6oRHp3E/VbC8k3dDCafvIk0kpdAWObjpP9vccPcbASFGSbG0J2FIUv4vWgg1
         Qlnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761412602; x=1762017402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EEm6jQjbUP/ZLb0mwjDF1ek1ZnHXSkpVbfXo/n55Y+U=;
        b=cXHwieMRk1nNqxymAwmRlRFhJ+/w6xclzHtTyyOL860Ljnpg27RO45lYhHfLqKB4YK
         RJ8qxYaym653A2Q0SWCqeQmFCGZcStgUEwwLpMcL8PR+JkzZ8bP/9cRJZ7lhldxm3zZk
         Xfm25xyvQQMdWni7PD6dpzTNq1H98dy8Ny3Fy/Plb3TBNrNTJFlUELC7tsdECwBOTXrB
         NinhamwnUh55PiK+TNHpbthad8O8YvoDFoPLlRPIRJ5u4Riuqp9kliFBxwajP2IjvB9W
         mUcfPzsyS6WYDE734XCFV56v4SxP08V9oH/oXfhWzTrTUBS+TR8rQTy3dP/U8F3eQMC0
         52Tg==
X-Gm-Message-State: AOJu0YzAa5D3hOiR0EV1bPO+74815jJ494Lp6gQvDg2dXpCV2oIEEEXV
	zSU/j6mEI2JvDSu0Y9MPgTW9X9ZrG+C4nBEYObqbv15emCA5zWxtooYW276WBg==
X-Gm-Gg: ASbGncv6xLDtO/osp79cRSnwhbfK/v9iH+nHoUuEkmQIJRJNmK5Spb2YqR/FkcFS1Ji
	dt2D+mEcUucP6D0vDKT2Pg5hR8MPzk6ZDkUHCl13AwOHBrMTM3Jb6ivtEHWFjT80KDDftWWs95F
	GJlQ8SSgANBlDZwIH1VEDBNCEHmE9gCoxNdhSMxziZjA8rq/X91nofSGxkw9dFPInXcmfUOwDIQ
	WMrTQ156gmSThmtxjmgD2WV84VDLIvBCmoe7UDf42WmSgFgy5z0Z1Mzu0aQ4H/NSJ7lZ4oze07i
	eTVFh5WwpTe/S4moX3iKXq/uvlxQivR2d8ijdKU35dOQV5CPXAWMh/K/KIKTexlc1ELj2wBCDiH
	h6SvfmUWpZZlTlEqm48XBB+KyXO6BKH0moOZI9PHsh1C7XIC3f8Ob5vSREcRBxsyz0dYCtauQJa
	bkQeACyInd/nTth6utqQQkKWqwwmcCFOrESzDzDtx6Rp/AR8/ITPAWroBJ5L4oGtM3GMM6kLx04
	ZF7dg==
X-Google-Smtp-Source: AGHT+IETiH6reF9yPWlfM21dO17Uv5A8dtC1Are9hXbWiATaPdqLT8Ej4bIbVxMZ/9xCDbB1zZYEcQ==
X-Received: by 2002:a05:600c:3e16:b0:45b:9afe:ad48 with SMTP id 5b1f17b1804b1-475d2e8c68fmr45738125e9.16.1761412601518;
        Sat, 25 Oct 2025 10:16:41 -0700 (PDT)
Received: from nadav-lenovo.tail4fd44.ts.net (85.64.200.239.dynamic.barak-online.net. [85.64.200.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd477c92sm42510045e9.2.2025.10.25.10.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 10:16:41 -0700 (PDT)
From: Nadav Tasher <tashernadav@gmail.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: corbet@lwn.net,
	Nadav Tasher <tashernadav@gmail.com>
Subject: [PATCH] docs: replace broken links in ramfs-rootfs-initramfs docs
Date: Sat, 25 Oct 2025 20:16:25 +0300
Message-ID: <20251025171625.33197-1-tashernadav@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

http://www.uwsg.iu.edu/ doesn't seem to exist anymore.
I managed to find backups on archive.org, which helped me find
the right links on https://lore.kernel.org/.

http://freecode.com/projects/afio was also down, so I figured
it could be replaced with https://linux.die.net/man/1/afio.

Replace broken links to mailing list and aifo tool.

Signed-off-by: Nadav Tasher <tashernadav@gmail.com>
---
 Documentation/filesystems/ramfs-rootfs-initramfs.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/filesystems/ramfs-rootfs-initramfs.rst b/Documentation/filesystems/ramfs-rootfs-initramfs.rst
index fa4f81099cb4..a9d271e171c3 100644
--- a/Documentation/filesystems/ramfs-rootfs-initramfs.rst
+++ b/Documentation/filesystems/ramfs-rootfs-initramfs.rst
@@ -290,11 +290,11 @@ Why cpio rather than tar?
 
 This decision was made back in December, 2001.  The discussion started here:
 
-  http://www.uwsg.iu.edu/hypermail/linux/kernel/0112.2/1538.html
+- https://lore.kernel.org/lkml/a03cke$640$1@cesium.transmeta.com/
 
 And spawned a second thread (specifically on tar vs cpio), starting here:
 
-  http://www.uwsg.iu.edu/hypermail/linux/kernel/0112.2/1587.html
+- https://lore.kernel.org/lkml/3C25A06D.7030408@zytor.com/
 
 The quick and dirty summary version (which is no substitute for reading
 the above threads) is:
@@ -310,7 +310,7 @@ the above threads) is:
    either way about the archive format, and there are alternative tools,
    such as:
 
-     http://freecode.com/projects/afio
+      https://linux.die.net/man/1/afio
 
 2) The cpio archive format chosen by the kernel is simpler and cleaner (and
    thus easier to create and parse) than any of the (literally dozens of)
@@ -331,12 +331,12 @@ the above threads) is:
 5) Al Viro made the decision (quote: "tar is ugly as hell and not going to be
    supported on the kernel side"):
 
-      http://www.uwsg.iu.edu/hypermail/linux/kernel/0112.2/1540.html
+    - https://lore.kernel.org/lkml/Pine.GSO.4.21.0112222109050.21702-100000@weyl.math.psu.edu/
 
    explained his reasoning:
 
-     - http://www.uwsg.iu.edu/hypermail/linux/kernel/0112.2/1550.html
-     - http://www.uwsg.iu.edu/hypermail/linux/kernel/0112.2/1638.html
+    - https://lore.kernel.org/lkml/Pine.GSO.4.21.0112222240530.21702-100000@weyl.math.psu.edu/
+    - https://lore.kernel.org/lkml/Pine.GSO.4.21.0112230849550.23300-100000@weyl.math.psu.edu/
 
    and, most importantly, designed and implemented the initramfs code.
 
-- 
2.43.0

