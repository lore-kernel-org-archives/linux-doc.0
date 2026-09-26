Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33A33515F7
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 18:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790446137; cv=none; b=RXpDYTvklwn14OQ24rtxpED5ZLiTmtzKgWj9C8CPKQuW1vQRIQRuzgGGVv/vk9HC+Zp1wiuHUXllz0hw4026F3V/OpA//2mI7fbFs5Iw7pHbH25CAr4n8NBWnFy1TWfVfGRDBRr+UWxkquo6f8OmIEfz+sVEjwBkPOczicUOt1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790446137; c=relaxed/simple;
	bh=zx6IWeUtdtp5Zm8hPLuz3hPyom47FJEXLCgqQ3wiXBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n7K9EaFo4ReZEYh8VhZl4HAYSnu/qXawLX9QYMdoaUt58SQEMP5eIDQo36wKPtqDfoagDt1TE48ruNcwTKAlQM1oRQSH63YuJj3qsHAZj+o82j7t2zmfa3u0n/VntFDRBhDNBtYZBXw0RIbfBr6c81oWBGr+k02sLTwJYzAkbPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMkTA89q; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMkTA89q"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so1055020f8f.1
        for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 11:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790446134; x=1791050934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HoJYSm8uVeKQl6hyZ0pdb08729tIESncrp8CAI/z9f4=;
        b=DMkTA89qfasaCdYLk+GYqmLyCwOnLN0ppJV0IxcAmPiczWDZY42i15q/nT1pdFeXTN
         V6IzsEr1K98IKgR3gVKyk7g12e8bf6KPYra1iog9oL92HEqUUcwGkEs4U94Ux1N6cjBL
         Wc9Qr15qBfqvK3jbnYD5AM9qkRtBpDeTmRU+bFObPEShKeR09y1pvxW+bfAXGdMzlj1m
         ospGISwaLXOhb1qRvrIZra4ziJM+dmXZkEpvAy6Qx/ZG0QeFQK+7tEi6Y78FDEJXEqbc
         br4XHdJeLJP54bsXn3kYp5TVXwDtvCXg9oHQhK0m4gxdJp8JQ0TrGxNV3zXrzsB+xfiY
         NR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790446134; x=1791050934;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HoJYSm8uVeKQl6hyZ0pdb08729tIESncrp8CAI/z9f4=;
        b=A/IN+03X+u3RFpHycwdlNDgeZbi3ABuO/CXXr8COU++0AYy7OjRFm2mki4pkMJr0TI
         Rj3HdaXMGOPGWTAnvPE/Lk3F4w9Nv4XlM1WQqIYOiFkVeWALvqTUnErZoE2KmPSDrpFT
         KE3X+p7GwZ6eceBVcXjuX4Rsv4TQm0X4hYpXBvtLEHaNbNg7l7ELC9eIrGhSKsIcYLIv
         mDQaamw7nMXpKnEtK/07ou6EuIwMo5jKpb6+x6IFJbzPT3vra08DQRhJoIwzohQRwnOu
         dl6QZg1rnNUVnllRcImfVlWl6tVV5HjeG+seugUC4Aqzx2vnJsyddvrArfNiQfmKUO4g
         PcNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcflVj1wu9A8Mw4Fhz8slvJ/3GH6UudHM5CL4odr8xKHaLAfwn453itC5kWOhQKqxeq2UKklNhNfQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lRNPeILaJPYmLPAB1wHp95J6XoHdCN13Cni/FKOMo3BLTI1GZd
	bWGMhhJvRjZGaOs+gAUb6U5xs8nR5KwJ4xs3QY7sy7PUnCyA/7lx+cIbNVbS9gE=
X-Gm-Gg: AYBFou3JMMiSsDmRBmwVcz5R805t0LcE054tWoI0qeICEyjogt9CALrrWf9wcxnnvlI
	ez12BNus5hu0hZImCzFMTIsD324PUu8crfVgBWDEDQfbZjsG95/oK7kKlbRj9p90UniwsUZzUdC
	2eZeqRD5Co++TwWfLRmCODAcrSr45XNw8Yrb1i72t7v77Efrk1aH0c1hDcg/O/6yA/FEHeiduxD
	Gk6WGU0Fpbo4MpusVSdjQwh8E+RkXDJc8gDZ9RuBJdCFmxzuGi9oAPGdzAyfr5VEAV0/HWfDjfR
	7m5KDZlHexT0DlRJbDClFsSaO0DlV39YvUeUrG3jLboQLACzjxP499tKmoXJAgse7Pj0oa9opOK
	PIRdpXjeNn/XsNgEx20y/wuDQ1FGYVvdbNIbVFNq5qM7NbVNimZzlepiZtgMizEXmWCe4gZ/Ypb
	n0tnUluWZW9DFnZtNoagczukZYcDl2Q0d6znInE2lRcdyAnCEJrRxQeyqNX4n/yNNeiaq5FbCK2
	/WC1ka5LodvV2sXt1jF7DJviBTIoN7RDLlJ9wuVt8vUGSA=
X-Received: by 2002:a05:600c:609a:b0:49c:dca2:ac47 with SMTP id 5b1f17b1804b1-49ff06b2db4mr105491785e9.2.1790446133934;
        Sat, 26 Sep 2026 11:08:53 -0700 (PDT)
Received: from localhost.localdomain ([31.223.3.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef5fc189sm111337785e9.3.2026.09.26.11.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 11:08:53 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: corbet@lwn.net,
	clemens@ladisch.de,
	tglx@kernel.org
Cc: skhan@linuxfoundation.org,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	linux-doc@vger.kernel.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH v2 1/2] [PATCH v2 1/2] docs: timers: hpet: Modernize file references
Date: Sat, 26 Sep 2026 21:08:37 +0300
Message-ID: <20260926180838.8145-2-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260926180838.8145-1-habilerenturker@hotmail.com>
References: <87o72mg21g.fsf@moria.home.lwn.net>
 <20260926180838.8145-1-habilerenturker@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current HPET documentation contains outdated 'file:' prefixes for
source tree references, which breaks proper rendering and hyperlink
generation under the modern Sphinx-based documentation ecosystem.

Fix this by modernizing the paths using the standard literal backticks
formatting.

Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
---
 Documentation/timers/hpet.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/timers/hpet.rst b/Documentation/timers/hpet.rst
index c9d05d3ca..fe02bfd5d 100644
--- a/Documentation/timers/hpet.rst
+++ b/Documentation/timers/hpet.rst
@@ -23,8 +23,8 @@ The driver supports detection of HPET driver allocation and initialization
 of the HPET before the driver module_init routine is called.  This enables
 platform code which uses timer 0 or 1 as the main timer to intercept HPET
 initialization.  An example of this initialization can be found in
-arch/x86/kernel/hpet.c.
+``arch/x86/kernel/hpet.c``.
 
 The driver provides a userspace API which resembles the API found in the
 RTC driver framework.  An example user space program is provided in
-file:samples/timers/hpet_example.c
+``samples/timers/hpet_example.c``
\ No newline at end of file
-- 
2.47.3

