Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556442;
	b=X9bEBraNkBjE+i1wvqdNWg/N9RQ7q0DTec+dFZNCmOiXaPs+kp9wkj+jtpSJTcvXPlMl
	 irWOCr5g82ujMoaUR+9/zvKl47Rc2v5+ml99YWPsE5PgFQzlKR0TYEOl3UPusZ6VEepAB
	 aXhalcKIDmbfz3JtmRXzyESMydbVuc3PMXjeqYD+mwJotP5fSwxqW4B7h8MjTHLxLt6H8
	 ap7pqouuXukonbnl/QrQ2laImo1utKfA+fc9v5AhjEaMIoB8jc8xaBkIcykHX/N7uhMS8
	 489/vLcIiCJy3AhKsifqq/eSCR5THgM0inWgdCDdhTPEx3NDvobOrTCBN6wgVd+9MYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I/Osil3p9tI+TJ45W4tyUJkbTxb/QirMyt7rDHJX8Ic=;
	b=nCHqWyXzSgCTxcujh1BW0FWeCPz17EV8Wku/creDBS8Cc4dtdfcEzsOjN7EtX8uNS1cv
	 +tYegQFL3N4T+VQgSPpqF44VuYHYZhakDb+S5LcYnn09hxiGn+VYPd4+6l9JmKANAdZ+5
	 X5X0D1TNfxn4psKadbLkruTQmcTfGDz/0MPU77RVP8QLquXmBNJPzqrhd5ToSqGfoXxpV
	 Ues+b7Axp+khr2k2mZGyPnGKSctYk0+mV4nkPwXrsn47O8YoKttU+t0/c6jZxedo6towC
	 uFQ/NXV30kLLjdJlPA8RjTS0ahbETiQ0B5qLlULC9tDGZ47QbCEghzzzDY7TbbzyZfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kzoDpsmP;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7F6606A338
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 07:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF7F6606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kzoDpsmP
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e946155442so10549335ad.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 23:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556441; x=1795161241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/Osil3p9tI+TJ45W4tyUJkbTxb/QirMyt7rDHJX8Ic=;
        b=kzoDpsmPq1DmlR/di9eXoEZUXV8AsNPrIeR0URbRK+CiTbd7Ay+Dq6HuKvSAG9cBm6
         icJQNs9eC3K+BnFluURbFBnZajQZGL/7woNxSi5G0RLcEdFYTw02gZhlLnjOjKmNRNfL
         cpcrtI83L/4BxKS9up7ObKjuqVa41vJ19Lcvlb9lrr0iBaW95ZmHRmNJTTNvWwO28+St
         F3xGe1gMsdEivSJK9pc71sTrsN/fJgkZClTfVlBS7zDGO14mM+8fxmg5YytDKI0cezq/
         I6/xnnw8FO/ByBLTwO/tkkjLzSpRdxLmCL2HVNmLntu1f3iTFeRYWQfrbtg6nxjcPdhE
         JkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556441; x=1795161241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I/Osil3p9tI+TJ45W4tyUJkbTxb/QirMyt7rDHJX8Ic=;
        b=Zm4FozqShR/dTxyKr9azoO1urjMpAt8SQ76bSX5dDwtpvHqQSolm+re+PjwZXn/P2C
         aNlWru+4Y6jQCP2jVq7ww7ejfFUKXTmtkn1kRZmSqjAkkG7YrcdP9UeYslAE8k2Z+zXz
         4+hzYfNMxdg7ddvqvw+W0wyqdhdakw4+ZOw3x23Keel2KBbPQKTGtNi/KwkhDL5ocIcv
         vEve+dNUDLMgwn4Am2mcxhB9gb058i03JsoECjFnCT79ZeMq7h73ATmEFC/xTkaLhiS6
         bs2UT+k+cRwOpMx5lzhukxutvv/bdBsqME2eEatnDO1AawCk23dCAWLklpOqlqiZrtwy
         XpTw==
X-Forwarded-Encrypted: i=1; AL+hErElhkv4VHNqwETpEeWWpIT+YUNJzWzCCbySO3VDOGsOvkUaM54z+mArRhzQBoOEPv2B7eIphfwri4U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pN1b6rCPI7JveAkpEbO7jw1zdmjmwobKvPJIinSSKJZ+QLBMj
	2gaPZWNaGOYiptoUuG/QSfbi73U/bwrWtqICwCvYuL+GyxfjAdEPeYvJ
X-Gm-Gg: AYBFou31nvYTAUAkRvaLm4cfMRIC7fzz26fei6oGTddu7JpTHZpqHs7zd3tgBmp4hmc
	iMX4SyuKsGbShbZJN6ijKcSRiEjdU4WUwu+p+OCnDkhLU6iQQClAxZbH4IxJ7M782Nw5mNGFmaV
	FxbEcGb6a1PL59gCeg7C1dIE2yCfsgkMW63T+1MhBPdTwoLE3S7ZFzQMG5YVknqHe4QYdCxfLUN
	M51QRd7yoPzg0ZNpIY/ls5e5xPyBxehcYQGfczK4LP91RMV+kpl+J5uGFdMgaYAsnSnou2G4zQf
	0BdyIZxr6zOgcdcuSrxJkPMyQ7Ij4RLar4+BVK3AP+Ar74QZE0/nbwkHgttglp2rw1K4AJD43FE
	88ylrZZgENnic7DtBDp/p76YiGJPSMgPhsHKIB8Q0rl2B/QAlyEAR+BQt3A+8wOrxQTfV2kidS2
	1LRql7poXFIaVbf5kbecYN8ZCkXeOxQQ0cLEm2UiBO90I+BhmmWreIqyopGiaFGOCtMm+YMyQr/
	OHhrFQ+K7b/MAsu3IM9PtGMeNjc5ciFwqvehfuyUG9VIijaEnSX+kUX2ZZP5c7KF0By3foi6dL2
	BFYObaCQzMfKB0GDTeAT5jVb1He5xjsC/nk=
X-Received: by 2002:a17:90b:1b01:b0:3ab:2d46:1dd6 with SMTP id 98e67ed59e1d1-3b1b087a23amr1392750a91.4.1794556441256;
        Thu, 12 Nov 2026 23:54:01 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm993234a91.4.2026.11.12.23.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:54:00 -0800 (PST)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	vladazaharova2018@gmail.com
Subject: [PATCH v7 4/4] Documentation: nova: remove completed GSP log buffer task
Date: Fri, 13 Nov 2026 14:53:17 +0700
Message-ID: <20261113075317.934264-5-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113075317.934264-1-vladazaharova2018@gmail.com>
References: <20261113075317.934264-1-vladazaharova2018@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GSP-RM log buffers are exposed in debugfs, and with gsp_keep_logs
they also survive a failed probe.

Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 Documentation/gpu/nova/core/todo.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index a01c362b1be0..28fc7329d56b 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -141,18 +141,6 @@ Implement support for instmem (bar2) used to store page tables.
 GPU System Processor (GSP)
 ==========================
 
-Export GSP log buffers
-----------------------
-
-Recent patches from Timur Tabi [1] added support to expose GSP-RM log buffers
-(even after failure to probe the driver) through debugfs.
-
-This is also an interesting feature for nova-core, especially in the early days.
-
-| Link: https://lore.kernel.org/nouveau/20241030202952.694055-2-ttabi@nvidia.com/ [1]
-| Reference: Debugfs abstractions
-| Complexity: Intermediate
-
 GSP firmware abstraction
 ------------------------
 
-- 
2.56.0

