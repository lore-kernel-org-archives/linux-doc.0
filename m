Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1671CD13
	for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2024 11:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710848591; cv=none; b=axeXO2TV/naj6ocG7o3MZpHaL8gyYp/kGDt+YKUDNLeHD6soVdlCCrupXkYpxRIQitOYHPadRvLRqHUFpTvNSoI8SdPw7OqMNCyG9pdDJULuc8Vbkr4IuupORK14tBxJO1ajyq4ZUfI6ScHefF1+BGkhMZKn1Xo6e5ojcrC+yn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710848591; c=relaxed/simple;
	bh=8ZMUpgK3Z6hIqdtCkXqxSIP0A5IccIzO29qkl6Hfp68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B+oMjIyXvoFcsaKzgE/clEDTRHGbEOAKRg6ZJIzLFMzSYv3B9MgeweboLzpRaJnoL5pyFSTJuDqArn1z1NYTAjzyWKRb/cabNE3ew7i8xRLOnvfrpvrMAJIzHxah6S9y5eDTVO0bXcOaVtQ7AnS6VzP10+gxQxqe566UayyA+24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mttj3nlG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mttj3nlG"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1dddbeac9f9so36687735ad.3
        for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2024 04:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710848589; x=1711453389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zED+VPMX8owEzzj9Z9IA55eUtcCwnMhQE0Tmr1XY3PQ=;
        b=Mttj3nlG3S13zvDRFdVocKzR02DuSdzd3TNOXV7SrqGCOVBldTJi5uuu+tlM8x9zzr
         tN9JlgofSswqnpwD3psyc+RHAJOElni0LdjctNV1Ys28MAynPrBKpYhX8THaCCNLGAYT
         /Tcc1l0y1aszC6IY6AkEPyAXOAbElJQhGZW2vULVJHoO1qXywLVacG0qb3l1MsSxSa8Y
         bEC/KaLSVkYmMACMqbl+Ptl8JKzFvIiQPEcAcpIADiVjNMJV3o3cY6KpZqNFN/AYfNWO
         aHMFvg2UTYtM36rg1YhDF3fTCWg0MaYUYoA/xfEtbcLE0f/Zz1F3ls33qTSejXNEFm8I
         QrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710848589; x=1711453389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zED+VPMX8owEzzj9Z9IA55eUtcCwnMhQE0Tmr1XY3PQ=;
        b=UCl84KyL3u2NNUFrbPvh455uuM28SNteHGv4qBLj5UC2Aj7HTxz1W/+786F+nxbZ4J
         HENC2fj7abPbm5pggn0UAN2jG4s0DY7V7JUmv4KSSqN6EIqJF9AjPZScEWs/YeZaf6r3
         Dj2HyDhX/xTKNG/jDSpjz3x4/XUv8LdpHlkRxEJ7NuWx/WIINSMPxs2p6bhKojV+pdJP
         ilksx9k9DMf9xHyDBRyFisorvMHXvNh6Cx5u1d1w406GZw4lM6lCPH1izinn3mAMxyAu
         aL7IAKPLObr83KTL2E+egdrBQ2o0GsJcQmKvOIF9UT0NnwRQIruK1f2ZsL4BGb0SYd4p
         mHQQ==
X-Gm-Message-State: AOJu0Yw17w5ES8gHsINgj6tbqnMBwf2Hf6H1TICGLnMOyWjXgqtYJk2a
	aP0vKZaXwQO0GH5tr/lKqxAMNyXUxmKgDU8PWTopGZ8WSIvPrs5vI08FpyustjWE6RaI
X-Google-Smtp-Source: AGHT+IHscPUcpmwezV7SpIdU5r+OoegGoiRprqy4A5wZXIEwDPopMgLYtcsmXwQSYYNjLYvzd/p7Kw==
X-Received: by 2002:a17:902:ce0f:b0:1e0:4afe:b70d with SMTP id k15-20020a170902ce0f00b001e04afeb70dmr767850plg.64.1710848589044;
        Tue, 19 Mar 2024 04:43:09 -0700 (PDT)
Received: from localhost.lan ([195.180.150.202])
        by smtp.gmail.com with ESMTPSA id jx18-20020a170903139200b001dcc2847655sm11177567plb.176.2024.03.19.04.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 04:43:08 -0700 (PDT)
From: Weiji Wang <nebclllo0444@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Weiji Wang <nebclllo0444@gmail.com>
Subject: [PATCH] docs: zswap: fix shell command format
Date: Tue, 19 Mar 2024 19:42:15 +0800
Message-ID: <20240319114253.2647-1-nebclllo0444@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Format the shell commands as code block to keep the documentation in the
same style
Fixes: 501a06fe8e4c ("zswap: memcontrol: implement zswap writeback disabling")
Fixes: b5ba474f3f51 ("zswap: shrink zswap pool based on memory pressure")
Signed-off-by: Weiji Wang <nebclllo0444@gmail.com>
---
 Documentation/admin-guide/mm/zswap.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/mm/zswap.rst b/Documentation/admin-guide/mm/zswap.rst
index b42132969e31..13632671adae 100644
--- a/Documentation/admin-guide/mm/zswap.rst
+++ b/Documentation/admin-guide/mm/zswap.rst
@@ -155,7 +155,7 @@ Setting this parameter to 100 will disable the hysteresis.
 
 Some users cannot tolerate the swapping that comes with zswap store failures
 and zswap writebacks. Swapping can be disabled entirely (without disabling
-zswap itself) on a cgroup-basis as follows:
+zswap itself) on a cgroup-basis as follows::
 
 	echo 0 > /sys/fs/cgroup/<cgroup-name>/memory.zswap.writeback
 
@@ -166,7 +166,7 @@ writeback (because the same pages might be rejected again and again).
 When there is a sizable amount of cold memory residing in the zswap pool, it
 can be advantageous to proactively write these cold pages to swap and reclaim
 the memory for other use cases. By default, the zswap shrinker is disabled.
-User can enable it as follows:
+User can enable it as follows::
 
   echo Y > /sys/module/zswap/parameters/shrinker_enabled
 
-- 
2.43.0

