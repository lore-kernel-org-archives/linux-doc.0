Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D844F3B9D89
	for <linux-doc@vger.kernel.org>; Fri, 17 Apr 2026 19:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776453333; cv=none; b=hahtRPnxvFw2KVrMcz//I75kj+QZ9xp0Zj70wbzb7Ly4A5wh5SepZgmCFOeQtCSWApVRqhjSlyqC6ZpVTjd9XjA/AMGc/ZlWCUoAxk4Rah1qcYDOvWX/Hj35HfOhxyWzrLxyEFaG0SeOqGA5tcxbC2NMrWx2Ga+6ARfeIuWbtPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776453333; c=relaxed/simple;
	bh=zwOsI9YqoPTo8fi0WymBV6+U/2mo9JYQHx4uLvXs2r8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L0BburWt4WUyde68dyC2EAaDVJ49d2V91xsQXtoddmuvf4PZvLZTMegtP+xmr9kFkaQIHaogxi56KNpsq+Wm8yoNPKSQePz/teuLFr0UAnlHyuDUczk6sl2yKY9qpbD63+9iQrox5TchEkDF4Jt9ZzTK0zkn7O9ppb+vZddcBcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCawiCds; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCawiCds"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so1114008a91.3
        for <linux-doc@vger.kernel.org>; Fri, 17 Apr 2026 12:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776453332; x=1777058132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gh+Hk3Cy5JAjfm750WfXAcGG5BEiaUMyViuuazgvLVA=;
        b=QCawiCdsdgPE+cc02BX6NolWrQEBTXywOntlNX8sGOWQpQlSVbv8YuxLFa/CK94MTo
         P4Ee1ig1osJOCoxTSLD7owbr0r6hhm2ibdpkHgjaFEwImlmNhQNBi8HpkROfew4+vv9s
         mlhxwtMRg6yWmmwZiZ5uqCih5neFQsJR9tISv0LbZoAnL7WXJBgf8WV/+Rolj5n88p6u
         J0kd0naRT2iVitJJF5dtippORmlnE77eqBX1paC2yquw6WZ8UlIhWw2F+JPDKP2TISrh
         S6XiccTZNTUXOYfN0riULcuXpZ6ZMm4kvVNqhzFIO12id6XMKGLnFJdPfBPc0o0z10Zh
         uizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776453332; x=1777058132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gh+Hk3Cy5JAjfm750WfXAcGG5BEiaUMyViuuazgvLVA=;
        b=eaWXyNftsiAjTz7uaL3jz2h67hZH8HMfowrYR6EhUJxh2cBKXg0Q+YDjVCojzc0LG8
         GxABrR39Z2Wk1L4LiwgtHJILZNT3OlERc5Of1fbsj3AobBnFi5rsOXM2umSluENE/b3C
         Nv1wCMLwLV+DsSdMbQyP2Ku9+63yxqTN2yICnLmRTVs66Taf/tVDnQsnHNgtAhfzHu2U
         oQm9ZKQLxQmNOrRYmN/YUOZOfNzOrHWjHXScWC+3J0qC/8ZIpTMCy4LG+B1KCPolNYzY
         KNcH3YHa7341SOlTpcKaWd6nxammgapmg/l09PEwns5Gew15AQsTZUGuxzwY8axjhxsW
         y+CQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Uh4HB5zwSM4umkaaJsWiCX5BODyKQ/ElQBGrVZRgnLj0qDqdxpOHKCzCtSIXa2+IeeHmrvFpJ8bk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP30UGyerFZxVGpnPyqyfkNqHxTliSUdFTQeCWMQgwmht0GKof
	INhYB8HerNYmbTPkSZn/nCo5tCb9wlqmmnCW67Qnjlr99jFrkMB/7HMp
X-Gm-Gg: AeBDieuswCs6H1HlY1/SQwPlwe24KgJnvcPGDogdjh8ndTZ9K0xianl4F1k8oCTL3/y
	915EaiC1etFRkuh51MNCIQXazKCcbdgX5MPax55HUgmNhRGQb/A9tgwiIQpfFcVBGHs/yxZB4lq
	BXkO3zpV1KF9Jj4EcyCjEOyEV3Osb83VHibdqaAEpFCeCFLXDuJsXz/fUvDIXd8YFFJkrViwZxd
	ph2xEAGMmavStM/IRz4ixgqPHKFKS690vEpv1m1h38H/Dcbq536EZec8sVMs+HfcB2cRk72cIno
	wCAQYnKFVhYY6WOgivRnNgFPg6I3KOjhZAvjgN+vI7McS2Flm9t037TZHseAzjpWqNbsrvoEDuj
	2zEqB0Oh8GnjVh9vwS9fMBEq4OJ62M/YVCQGD1Z3sdQbCAqz6S80Zol9JD4QdblMaRODRKpFt1x
	xjwavDNMIWLZXtCwmMngP5Ype1x4JO1fivwjlN0lR2eweuwTBVJyuQ+4bmpXH918FqGMG2As1Vq
	iDQSK6lBmVsueXd2jGb3TS+xwDZ
X-Received: by 2002:a17:903:2acb:b0:2b4:6398:6aa2 with SMTP id d9443c01a7336-2b5f9f3a802mr46557695ad.27.1776453330154;
        Fri, 17 Apr 2026 12:15:30 -0700 (PDT)
Received: from fedora ([103.181.54.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa92c428sm33800605ad.0.2026.04.17.12.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 12:15:29 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: sergiomelas@gmail.com,
	linux@roeck-us.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] Documentation: hwmon: fix link to ideapad-laptop.c file
Date: Sat, 18 Apr 2026 00:44:11 +0530
Message-ID: <20260417191411.713958-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ideapad-laptop.c file now exists inside drivers/platform/x86/lenovo/
directory. Updating the GitHub link to the correct path.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 Documentation/hwmon/yogafan.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
index c553a381f772..68761947a1a8 100644
--- a/Documentation/hwmon/yogafan.rst
+++ b/Documentation/hwmon/yogafan.rst
@@ -135,4 +135,4 @@ References
 
 4. **Lenovo IdeaPad Laptop Driver:** Reference for DMI-based hardware
    feature gating in Lenovo laptops.
-   https://github.com/torvalds/linux/blob/master/drivers/platform/x86/ideapad-laptop.c
+   https://github.com/torvalds/linux/blob/master/drivers/platform/x86/lenovo/ideapad-laptop.c
-- 
2.53.0

