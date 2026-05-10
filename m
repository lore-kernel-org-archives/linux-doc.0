Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0464B3009ED
	for <linux-doc@vger.kernel.org>; Sun, 10 May 2026 18:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778437762; cv=none; b=j7fR2XKdv1K7Epwz1+j/ogd4BxYko09zn1s6zmBx2SD71njpEyVRt/rbzRTVcwWd3U661W/68Utojc2ZixEf/eVxQM7c03+CaDy3NhosiDkf6D6Eu8rN+zjyiotur9NX+XjdnRxcyEAEHMK+Q21ZkGafXfa2KBXBwpyZ3AHFVbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778437762; c=relaxed/simple;
	bh=2t4BKL5zskePt+1AjmU14PUO6W6EBCK+AHcU3VCOQ94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tvQdDmiy4i1uYnT2UZ5badQMO7/O7dE22bgul9Ewd9llseaDKyvbKo/LhRV1D3LbO39uGr4HbJCbsr3VJJgpMvjGW6eDrCiBNop+ahzt9qfk/w1GypPeZA6oAF88ZKFUiQ8YGpMlvP/b/eylRXKk54uFH+Q33kd9QrUgu6RDhE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICp4d/NR; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICp4d/NR"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8354461da74so1644960b3a.1
        for <linux-doc@vger.kernel.org>; Sun, 10 May 2026 11:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778437759; x=1779042559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MnjDtWjU+iUFnsNgB4AwO0xgeo8XnzRB7bbhA44EF8o=;
        b=ICp4d/NRkHttYbQXaCt62xOumATU14WnRWE/TKMFGM/4WHMipqkaV95qkBPH5VyIxd
         xSxCV6bqmwPvFyhBADuQY6yCE0Q2Ipzc8MBAMMSETaJd2PsPgb9LPOHW3AtoPr9aS0tF
         ajDVH2YNEKQdd1v/5EEKoON0gFtxb8Pw83cKXSKQzCVf8tkBiQlI/broQSNPeaF+nsUQ
         lDKPuZ9JWyfc7VlP0N59TmtPynSwBuXx1miaosxY2QFzP+0rhXx4mfEdLtF7SuCzSbNd
         sNnEYNCoIlmBg7p52iSpeGwrkuTJ3X6YUdqTKyrEIQmFrot2wiIL+sCNT7g2zNh25HeB
         wulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778437759; x=1779042559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnjDtWjU+iUFnsNgB4AwO0xgeo8XnzRB7bbhA44EF8o=;
        b=jQYL2EKRounaRO7gzFK7vC6LdY2PZRY0EoB1on/8a85BcnBFDBm4n+k+a7KPHwpty+
         ySm6v+VZ0yQ7jHcKttmo3z9UYG7za9ZHaa8cvxlc8jYMucc1yN9gyoIQpIg6hrPEnvWe
         3Lh0gctuuhoGVl4LINAGrNeB3vABWgnXJ1J6Wb51LDWE2eq3Tt00E5TjnH3cCJ4dc3rh
         jVePt8afefZwdselCz8uc8pw8w5XLtwiQ/PEMP6ST2oBGZLvOZ786kpI/qSED9pJc1Ik
         3ojmc2sXvRRvnydBpNSGT5wEBIOHrHvPysrYpxwvhzkcruZVd9dFQVvbNALDUsgsyxZx
         cZdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Q4hmSKkaUtLq9jKIzagm5+WET6eOtrEoCD7PQbVZq1vLtGh89VEX1fea7BoXE4cQbrgPxo1yineE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJEHbR0N6fmjnjzcESkm9K+PI8aH2nIFbucLGuHRJZ/iXjWxNn
	Pkx7+gafg+heZX/wf5RkDkaM9pT1leeGstwuRe9MJ7oXJ6N71XdUTp+K
X-Gm-Gg: Acq92OFfNOtlFpdbUGgT1sYUCgBO+7YhgaXLtV98BxKPbCUluXNQWzskWA+34Blyxlo
	5JvYdD4pLFwXwXCaNQm9g/DEddrqPrK5SuBrcXrGmFU+JWE2w0KM6SwqUOTInbmrUQF8EM78zw9
	IBMVX+tfqEp9OKOv58qYxXbP+xblZ9OMrm9SSBAgSHMgzBP2CFzk3So5isg2xilcBNG+7UyQosu
	Rj/bfr4+CL+GbMjJvWFocbj34P5aUMzWoCFz1/cG8GYej7BO3oBOYlaNnX8SI0cBsIPOLTFjIqp
	t1hp/NcxOlNY2YU8CeDb/0S62VxzIaSnsts5nE616HYvNfBrLhQHl7B+4KosQpWktKAglSvIzXF
	ieP7benuVh/pv3dIWcIp8ilxRYdmpNdEVJKrmUz2j7QpDtSg3euwm82yrKOxwi0mEl6u7Q/SWrs
	6Td37NCzwu2bD8lve+Qf8QWEjl6lfwH2XJrqA=
X-Received: by 2002:a05:6a00:4ac4:b0:835:7c0e:b529 with SMTP id d2e1a72fcca58-83e39c33441mr6531203b3a.12.1778437759341;
        Sun, 10 May 2026 11:29:19 -0700 (PDT)
Received: from fedora ([157.119.204.215])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a272asm18132388b3a.54.2026.05.10.11.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 11:29:18 -0700 (PDT)
From: Aayush Patil <aayushpatilsch@gmail.com>
To: ericvh@kernel.org,
	lucho@ionkov.net,
	asmadeus@codewreck.org
Cc: linux_oss@crudebyte.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	v9fs@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayush Patil <aayushpatilsch@gmail.com>
Subject: [PATCH] docs/filesystems/9p: fix broken external links
Date: Sun, 10 May 2026 23:58:56 +0530
Message-ID: <20260510182856.17569-1-aayushpatilsch@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The xcpu.org links for xcpu-talk, kvmfs, and cellfs-talk are dead
with no archived snapshots available on the Wayback Machine, so
remove them. The PROSE I/O link redirects to a dead server; replace
it with an archived version from web.archive.org.S

Signed-off-by: Aayush Patil <aayushpatilsch@gmail.com>
---
 Documentation/filesystems/9p.rst | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/filesystems/9p.rst b/Documentation/filesystems/9p.rst
index be3504ca034a..65809a1dad21 100644
--- a/Documentation/filesystems/9p.rst
+++ b/Documentation/filesystems/9p.rst
@@ -23,13 +23,10 @@ the 9p client is available in the form of a USENIX paper:
 Other applications are described in the following papers:
 
 	* XCPU & Clustering
-	  http://xcpu.org/papers/xcpu-talk.pdf
 	* KVMFS: control file system for KVM
-	  http://xcpu.org/papers/kvmfs.pdf
 	* CellFS: A New Programming Model for the Cell BE
-	  http://xcpu.org/papers/cellfs-talk.pdf
 	* PROSE I/O: Using 9p to enable Application Partitions
-	  http://plan9.escet.urjc.es/iwp9/cready/PROSE_iwp9_2006.pdf
+	  http://web.archive.org/web/20110101152020/http://plan9.escet.urjc.es/iwp9/cready/PROSE_iwp9_2006.pdf
 	* VirtFS: A Virtualization Aware File System pass-through
 	  https://kernel.org/doc/ols/2010/ols2010-pages-109-120.pdf
 
-- 
2.53.0

