Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D53824167B
	for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 00:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758242228; cv=none; b=ex8vte9MSZ38mI1kFI1AR0LFgzjxlJSDBiawuJZsvW/euT5lOddgJzH3Z/Menw2JkELPgmpeJhEdGvens3s8mehDS49JV/WLuyVxRm/5gVli5niHCLxuZMHIQj/W5E7M5QPYky+JEUb2JzGvq35TNjNj349axv0fGh73nYxJul8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758242228; c=relaxed/simple;
	bh=G2Hu4yMRkujPDb60hG3BM8GKc4qdmUGfbLLUukXTBW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ORIXi8mB0h3tVujnwEZcfXJIIPGldYAK5WLkkYI8plICup87rn0/I2FBEcf6QoIlOLzyAjju/Yz8PyUeFg2vy+Bo7o2N2vDWSQNRPwA+1xCpUfSWHOjUYSUGwmk4QixhQ+a2OgUMK8+sji1Qmh3+eC5zvJz2AGaSROINgbsbqdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nb7vXwj3; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nb7vXwj3"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-267f0fe72a1so9845725ad.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 17:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758242226; x=1758847026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0dTovYaKB4gfJ0CY/rrU0WVNio86cuPsjO5eFpelmI=;
        b=nb7vXwj3dKP9n8Fd9XP3IB8Yz/53A/rXh1EPYZpjuQiBPwDAqpvx1OqAmt+E8LGbpJ
         5cJnftrciK0deOHqRuvWbXxwB5jZiShjH3QDmiTdrZEn6nBs5/rc194R2GfsZSsErS/m
         Y77Z6RKsEhDVgXsRRnvqorls0RcXomeA9OIPpdACaWikd9oG2XavoP29TxgUmmSZBSb7
         VDQVyYQUFUab578aXzbeM6PiriZAfWCjsf9+otLz/jRyRmqxPy17IEh7or2Hs8+/czOd
         o9Wj5e9D6cGM0RV173nb/3lYuat63LHGtdaA3pYgWfmE4N8a1ikwcwSLTpRe2wyE6KkL
         9K9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758242226; x=1758847026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0dTovYaKB4gfJ0CY/rrU0WVNio86cuPsjO5eFpelmI=;
        b=io94ZklFL7c8GzrHwAzI5nnCSFqYpG8/NJH/aJzwP5KdzQZ2KnkNxCqbt97La2QOZT
         Gy5esTGgqIRvF9zWHVky6r5nP1snw+A9OnWlHqeBQ+zZi5l5dwn4q/F6c2z61dlfDkFJ
         VI1N8m0th9w2dAtnUAxTta0JubPpSLLIzHszXiMhW7+3E4++swlkTyLjQlqKDfHB4Krm
         wue9a4adTBZ5BVMV0DKW+KXm2WdyIiGbG7nh5NUpmosN9Rj2G+pGJN9eVRqhQyuny27o
         NbIW0n98kN9GcvmDDIvZDV028CRgyHi74h1BTKrq9+vfPCL49c0+ejkVbjX0nhprlXjK
         ipWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLPycAvtQDNlwA3+8gRKqKASx0cjlyYuhts5cAZDqOm9T4OadfLZY3zIw8QdEMe0Adi1XosYsRYyA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvyzzcq5ATIuKPOVA5GR0R3OTgqcZ/+T5aNek2qc0olNXC3UpB
	qE5VZCJy2SxeYeFX/23yHEPX+qWVNlokfmW4juKReSa0vtcW9ugTeTsI
X-Gm-Gg: ASbGncuOobj3Gf59gc5Gy6Y2q4dz5JyUck7grSFEW6b2AIkg9ih9NKR16Pxu/+9+e6D
	Nt7vQ1IBOjoTmg3IYUZsnaFY9rMvWXup3S7BLs3wTn7pIEketndSxmv0dBAKSJlzZ54t9yBkCDw
	tDWLdWURrM3SX60zZNLnhuXf/X+USs4l7kvghzXp4IYWIYoHXdnuzhoyCFOUhh0m2azY3Wb1ejY
	yVak7C/Vrm+x4+GBGwdQV+WQ8GKxHlmHccvxXQVwQTrxwDna404tyYj14FQkPUwFo3FPsnhrYDu
	KxgFLvWgDzNw/oNppe4tQf2gSVgS97VTpGHodf+tmGGGyRDp1dPWgDYGB5V1vTNKhjQpH0pKUXC
	eryY79ylj8CR9wfyb0T+80w==
X-Google-Smtp-Source: AGHT+IEi681zBzTSG9Ssyj4xkWOW3OUSPbm/eC1b/ybWYhB5MYLrxE49bm1sZeX5rT7wDfvU6s02qg==
X-Received: by 2002:a17:903:1a27:b0:264:70e9:dcb1 with SMTP id d9443c01a7336-269ba5464c0mr18768295ad.56.1758242225932;
        Thu, 18 Sep 2025 17:37:05 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32eaa46da99sm4203712a91.1.2025.09.18.17.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 17:37:03 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 64A8D4227239; Fri, 19 Sep 2025 07:37:00 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Framebuffer <linux-fbdev@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Helge Deller <deller@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Bernie Thompson <bernie@plugable.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arvind Sankar <nivedita@alum.mit.edu>
Subject: [PATCH 3/3] Documentation: fb: Split toctree
Date: Fri, 19 Sep 2025 07:36:40 +0700
Message-ID: <20250919003640.14867-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919003640.14867-1-bagasdotme@gmail.com>
References: <20250919003640.14867-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1785; i=bagasdotme@gmail.com; h=from:subject; bh=G2Hu4yMRkujPDb60hG3BM8GKc4qdmUGfbLLUukXTBW8=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBlnlrSr3Zj+wsvph7LOdPl4pzZmxqII9c1r8pdlhSvbH akoj3DvKGVhEONikBVTZJmUyNd0epeRyIX2tY4wc1iZQIYwcHEKwESK3BgZGvYccrr55/DPTTMC FyRdqDO54N+3dn0HX/7cwzsu/mPklmb4H32l8YTDnhfPQubOiPBesWBT9v6n/psdXoaI/eL/X8e kxQ4A
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Framebuffer docs toctree consists of driver-independent docs
(e.g. API docs) and driver-specific docs. The latter has much
more entries.

Group the docs into separate toctrees.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/fb/index.rst | 80 +++++++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 35 deletions(-)

diff --git a/Documentation/fb/index.rst b/Documentation/fb/index.rst
index 33e3c49f885695..e2f7488b6e2e42 100644
--- a/Documentation/fb/index.rst
+++ b/Documentation/fb/index.rst
@@ -4,42 +4,52 @@
 Frame Buffer
 ============
 
-.. toctree::
-    :maxdepth: 1
+General information
+===================
 
-    api
-    arkfb
-    aty128fb
-    cirrusfb
-    cmap_xfbdev
-    deferred_io
-    efifb
-    ep93xx-fb
-    fbcon
-    framebuffer
-    gxfb
-    intel810
-    internals
-    lxfb
-    matroxfb
-    metronomefb
-    modedb
-    pvr2fb
-    pxafb
-    s3fb
-    sa1100fb
-    sh7760fb
-    sisfb
-    sm501
-    sm712fb
-    sstfb
-    tgafb
-    tridentfb
-    udlfb
-    uvesafb
-    vesafb
-    viafb
-    vt8623fb
+.. toctree::
+   :maxdepth: 1
+
+   api
+   cmap_xfbdev
+   deferred_io
+   fbcon
+   framebuffer
+   internals
+   modedb
+
+Driver documentation
+====================
+
+.. toctree::
+   :maxdepth: 1
+
+   arkfb
+   aty128fb
+   cirrusfb
+   efifb
+   ep93xx-fb
+   gxfb
+   intel810
+   lxfb
+   matroxfb
+   metronomefb
+   pvr2fb
+   pxafb
+   s3fb
+   sa1100fb
+   sh7760fb
+   sisfb
+   sm501
+   sm712fb
+   sstfb
+   tgafb
+   tridentfb
+   udlfb
+   uvesafb
+   vesafb
+   viafb
+   vt8623fb
 
 .. only::  subproject and html
 
-- 
An old man doll... just what I always wanted! - Clara

