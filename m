Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8545187346
	for <linux-doc@vger.kernel.org>; Sun,  8 Mar 2026 03:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772939947; cv=none; b=JtBA8MsN0MWkmViuJiHb0r6a3ZnvsR3uWG77Rwcg5eBfBn4kvSiPtLs3HHFoBRd/9VqzjH9FUf+GA5v1XOQrYUMzFWeTYrXTOkM0X2EN6CRgyK2bK4XpQu2kWeap+29ttzobZcLF0ayr3MRY6GrVjm+/FP8fsKXkMCUNHwbV7xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772939947; c=relaxed/simple;
	bh=dy/k8Ld8lreAZZpwnSwCEzMD/M4mnZXel/sJ/te+YEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lSFFKychKTP0utAk2jRJ+omDMKdMjsArwEMouy1/lVxyt1BEdkM5NwGn5d/opis7uo/t4nHyZFEE7hrCUctp3Ae+M6f5XnLi4SzY8k2n5oxUHgTA7RNAWmzJ83HqiLfYLABKFqT20gIquCGsruZPcd3yvy4ZXf9PaVoXS9XahZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVNlos+5; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVNlos+5"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-506cb1b63d0so12622121cf.2
        for <linux-doc@vger.kernel.org>; Sat, 07 Mar 2026 19:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772939945; x=1773544745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/5PPTP1bytZy0bNsMCBbdG+U9hPc2DiZHiMu5MgnVGQ=;
        b=GVNlos+5TSYZQRR8TNnt+Q3TmNtfjaw2icEcv5T6aQOcNq/GD4aR/i6ZYvkgsQFHln
         PbvykDXNovS6KMGt6pfzRjYJu67MmVR7MLcWM4dW6fb3Qn68AqcaxJItdXr28k0EZ69w
         EqvlgsCh02mqaiA36iSqiIPxxmnqvxb8VzDm19zw0w+Qfhh6SGm9XhEPZWDRfy+EWGpL
         xdG3JZ4cemxOod04rPEj3VoED+vGzAsbZz10Wl2oO+drTkDiird9AZN8XvtQQuqQRzsW
         0lQaXh8x+7OrFhcI9SN6ncWsCn3aIWasuV2rGNBCWTeHGMIrIJMY3F/KbqzzEsTsyJOF
         EZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772939945; x=1773544745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5PPTP1bytZy0bNsMCBbdG+U9hPc2DiZHiMu5MgnVGQ=;
        b=m7V5RUjdQUP/6dEZBhbXXyw/CN4n7TgZadHYUDN1tYUFirDC6TVuMnIH0k5F92tzW+
         /WWFXqjh+0mov8+FYFcT/dS60IG9etdiw+AmOGvR8xoV4MBA9vk4+6RdBgigX4FBybYo
         wgzs+sXX7/tm7uNj1YGthgOi83euUnFFRf9wUGuscHIdo4PQEqn3pATb9S3yetYD2DLf
         PrTdGmxpM39AKUEYFJSmkAfXnr3V2gqGjCqfwMaD4RZ0OgQB/tjInSUen9c/AGg3sYzX
         i+lUsl0qeW+pk+kop2p7q1ncSCf0ZVkEa+vOsKBq8T9dTvUr+BllRBnlVaXiK4iUwhaL
         0DZw==
X-Forwarded-Encrypted: i=1; AJvYcCUsSo9kxlHvso6GZv9mtD+c7UNrDxJrAwCtZISb3eueGcKiiSELaRiTcqL85929xX0xjwaZTInfh0I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhu5SsPQ/Kc5WHkLqugZ8uzg2TRmwlfV6IBgAhHX27X6IkVD4k
	YuM6eHBWi19aOHnz8aSLUwi8ZG1Y+AJmR2dHvH/Z3HK2buJ77e0hY7adYnW7KhQ/
X-Gm-Gg: ATEYQzz2oMgTZXb/XJpMgAGC/+hsDxK/iKU4q4LJP5v0D4msOjMyTiGXtl9rGRubCEw
	GJUw1FTgtlmtIoNkj0lzvCid+0j0752snWZsCNqIvBAx+SmFezMYP94bEM/zX2NeuGN593wCVgs
	UIpGZ4Y9yGdRPD0UzNk5kgmn2tJXiSrSxM0fx3WLQ+eeJvNPTCnPlbPnUta1hgbWGn67YK1mHXV
	exZ7LhYODSHDwkcxxDP6yRFS6EMLwFltTt/CGSG3WzbCU5w2X5CyOEDaNNarE5jY2jEEJwN+snn
	0CyVTzY+8C5+bOMniRWANaDxvCuhDUrgrl2jlmcguYffXM79QruI/pVGLkQHljvtv83XpPnPivg
	5avzfyOKyg1xN2eRg3bI/PCNX9EUsyjz1OAmJqv+jYmdV04Y3Frs5Y/gMrv19TTZo5xfEWdWFRg
	WNFQZwYby/1UBI0QfMEeeeonkseU4vaMHTAWgo/vFKyvlv8omubAChjYPh2k5FMt29rzweLUSXc
	VkG
X-Received: by 2002:a05:622a:1914:b0:4f1:e9da:e876 with SMTP id d75a77b69052e-508f499ef56mr92284771cf.62.1772939944685;
        Sat, 07 Mar 2026 19:19:04 -0800 (PST)
Received: from Ecomp.localdomain ([163.252.225.68])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-508fd453ff3sm31481581cf.17.2026.03.07.19.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 19:19:04 -0800 (PST)
From: Evan Ducas <evan.j.ducas@gmail.com>
To: wufan@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-security-module@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Evan Ducas <evan.j.ducas@gmail.com>
Subject: [PATCH] docs: security: ipe: fix typos and grammar
Date: Sat,  7 Mar 2026 22:16:33 -0500
Message-ID: <20260308031633.28890-1-evan.j.ducas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several spelling and grammar mistakes in the IPE
documentation.

No functional change.

Signed-off-by: Evan Ducas <evan.j.ducas@gmail.com>
---
 Documentation/security/ipe.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/security/ipe.rst b/Documentation/security/ipe.rst
index 4a7d953abcdc..d29824d7fd2d 100644
--- a/Documentation/security/ipe.rst
+++ b/Documentation/security/ipe.rst
@@ -18,7 +18,7 @@ strong integrity guarantees over both the executable code, and specific
 *data files* on the system, that were critical to its function. These
 specific data files would not be readable unless they passed integrity
 policy. A mandatory access control system would be present, and
-as a result, xattrs would have to be protected. This lead to a selection
+as a result, xattrs would have to be protected. This led to a selection
 of what would provide the integrity claims. At the time, there were two
 main mechanisms considered that could guarantee integrity for the system
 with these requirements:
@@ -195,7 +195,7 @@ of the policy to apply the minute usermode starts. Generally, that storage
 can be handled in one of three ways:
 
   1. The policy file(s) live on disk and the kernel loads the policy prior
-     to an code path that would result in an enforcement decision.
+     to a code path that would result in an enforcement decision.
   2. The policy file(s) are passed by the bootloader to the kernel, who
      parses the policy.
   3. There is a policy file that is compiled into the kernel that is
@@ -235,7 +235,7 @@ Updatable, Rebootless Policy
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 As requirements change over time (vulnerabilities are found in previously
-trusted applications, keys roll, etcetera). Updating a kernel to change the
+trusted applications, keys roll, etcetera). Updating a kernel to change to
 meet those security goals is not always a suitable option, as updates are not
 always risk-free, and blocking a security update leaves systems vulnerable.
 This means IPE requires a policy that can be completely updated (allowing
@@ -370,7 +370,7 @@ Simplified Policy:
 Finally, IPE's policy is designed for sysadmins, not kernel developers. Instead
 of covering individual LSM hooks (or syscalls), IPE covers operations. This means
 instead of sysadmins needing to know that the syscalls ``mmap``, ``mprotect``,
-``execve``, and ``uselib`` must have rules protecting them, they must simple know
+``execve``, and ``uselib`` must have rules protecting them, they must simply know
 that they want to restrict code execution. This limits the amount of bypasses that
 could occur due to a lack of knowledge of the underlying system; whereas the
 maintainers of IPE, being kernel developers can make the correct choice to determine
-- 
2.43.0

