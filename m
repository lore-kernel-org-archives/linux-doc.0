Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9A836CDFE
	for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 22:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780007849; cv=none; b=YmaS9mZG0bMFLMQer8+2mrfUHwjyPOwHY2/3ZWoQKB4neKa2FdRqGHQI3ZevKHnoYHahJFAAolu7pcy8Y3xYakvzylCoXDjx8tTVT191FGO+wC2xBRV6L9NZTQHyf2gLoqwk7dJRxnvIQ/ln5a4V6KoR9F9En6tqB7J3Gh07mvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780007849; c=relaxed/simple;
	bh=QvjOUVcvSpWfuFqJupTUEnHGBg0XQxvgwFD++LL9Wa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GAmtmPF33voP/ECh6Vy5VZjeaaSkQBnLCQaU0Rlfvid+RB+ZZ5D/5yrsB/SEAy67vTtAM0zmPNAoO1Wha7NN8oVAjVfNVmCklHF+IR0awsSEm42nOTl0JTrTHKaedgec/yiTWbtbjRnZdp85leq5OBGhsBWdp4e42zCTg7NhdRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9PmXxDj; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9PmXxDj"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49056b9f04aso74465335e9.0
        for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 15:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780007846; x=1780612646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a5m+WvyMC+bIy8a0vdthZB52udcKqc3YLrb8WNsYpZg=;
        b=E9PmXxDjuzsv5Y1e6XK627cbOHCnqiBrUqlOnBbZvL5QUaNUGreDAsN+NkTD9xWQFp
         eJm7GEan2krqafu0YGBEAakxKmyri+FoIM5UW8jPtB6nzqapyiyag+gAQBCuR6RAeBGT
         yR45GhwNwbp+HgqRQXqMXRZgPGKoFwD3TmsfEOGa9rk+jJq2A1N0oGavJsoPfNq7zEfV
         WH5dtnGkOKdhaVALdpfUXnePFekKKSh9TX+XGGAZ3s2lkfvMtqqvK/0XVdSVFDRpbETi
         2XyeEk5kxafaXPG++Q9F08QKYIFn9ssev166ID1CEn8Gae9Sm2sZvzHIc0aCFwcWqhun
         NX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780007846; x=1780612646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5m+WvyMC+bIy8a0vdthZB52udcKqc3YLrb8WNsYpZg=;
        b=K23PaxWhH2/44hqQE7hdQo2GyfxnV1x7My6RcxxgkoD9UXAu2P+db4zLZGiD22jaKk
         OqQXK50q8OUd3bRXZGn9lkS2dbfN1qfxgJ+i9QHud7EwbXV2K5P5XTLbRuSmXbMtAvHa
         x2AC7+EwpG9PHkmdcDLaXITgnblW5yACDB8cB351WLoV67FZi00Q6thhpz/H91R/K/s7
         kS839cxitDGHwkNvR2B/bV/AE7agwG6N3b777bK8AwseJzGAAQ6FX8z8OE+lQDq/fltO
         b/qG/MkbvtM4wiVd8XFIRE9mVehjzXQDI1h0+ZRWEHgzavX7dNiIk3Ign1vJw/AKRMJX
         e1Lw==
X-Forwarded-Encrypted: i=1; AFNElJ8OJNx5uWcvsS0nHNRy1GbKfopPbTjjGzEadXnuOo6unahAKlhbzjWEXS8fZLOaHT7EOjwQ76DDpt0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHY/qA06K5H8YaVQrOSUCwf3PIjtrMw/cTNie/lzymWAMX8dFl
	EcutqRSBw0PIWBD0omXSDZvK16oeUZPEKKMHuNAi1V4vOmvPyyWcEWAF
X-Gm-Gg: Acq92OE2BWqqDy74K4/kYf+GGkwiSPmIxUtnvL7AVOKX7Za2z8QAHZGn5atYRhATIrt
	1daDrfopl72bphccP+esZs0wRpY8F/DfyxDYhyXhl4bTPUv+iZT5ULhrRoKuQZPMkSO0fX3IpLm
	5PKllGzDc2siImTMfzEJ6HxrBoRyEdW3KSYee0c0i66EdVTwoNM/kubFXMwdr1RlbJRVjmLsNsC
	O/JoSPT1MGl0MHPTrghqmeYvAlAwnaLEdwyWZLGSV2ndaG53ir95UQHcz+YPTwCiFhw7dR2lfu2
	Q1LYayNBg4BysQd6mDHM11hOmVoKMEwUW9rmdZ85sdtxSW5H1Jeexchwr0hlryT5zU7lb3zXcbS
	+d7PzsDrfzOYRxbWvhAVcwQKAv3t/5MgvX+yI9SItE9qVQ4b70eEfnMCo5XKYo1WiORWlKQEhK3
	kliyXZBEWTb5eb2c1i6KCGRIU0Ekt0JhMrauClKgYkVA==
X-Received: by 2002:a05:600c:a55:b0:490:6869:46c3 with SMTP id 5b1f17b1804b1-4909c0cfa37mr6101135e9.30.1780007845583;
        Thu, 28 May 2026 15:37:25 -0700 (PDT)
Received: from Godswill ([102.88.111.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909ca6575csm5829475e9.4.2026.05.28.15.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 15:37:25 -0700 (PDT)
From: Godswill Onwusilike <onwusilikegodswill@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Godswill Onwusilike <onwusilikegodswill@gmail.com>
Subject: [PATCH v2] docs: gpu: todo: fix spelling of "fucntion"
Date: Thu, 28 May 2026 23:37:15 +0100
Message-ID: <20260528223715.26645-1-onwusilikegodswill@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the spelling of "fucntion" to "function" in
Documentation/gpu/todo.rst.

v2:

Fix the actual typo instead of newline-only change

Signed-off-by: Godswill Onwusilike <onwusilikegodswill@gmail.com>
---
 Documentation/gpu/todo.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index bc9f14c8a2ec..841e4e986c48 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -55,7 +55,7 @@ There are still drivers that use drm_simple_display_pipe. The task here is to
 convert them to use regular atomic helpers. Search for a driver that calls
 drm_simple_display_pipe_init() and inline all helpers from drm_simple_kms_helper.c
 into the driver, such that no simple-KMS interfaces are required. Please also
-rename all inlined fucntions according to driver conventions.
+rename all inlined functions according to driver conventions.
 
 Contact: Thomas Zimmermann, respective driver maintainer
 
-- 
2.53.0

