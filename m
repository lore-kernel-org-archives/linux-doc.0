Received: from mail-wr2-f13.google.com (mail-wr2-f13.google.com [74.125.225.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5745C31E85B
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 17:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790442427; cv=none; b=d4GxK3fduORgZyKLk2qPtbhusWwSIwIADFdSmMEAFmWLKi6aZzLlEBwOUDYvWIEKlHUNY2FVWOwzo9Lw3pysXjWeNSXEc1O4pg3KJMu23TuBCYX0rL5VcMSJSIyYJ2CYNZs6MZM5GHOcnPLSbYl/nRma6lKaChCRcU3vdclK/vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790442427; c=relaxed/simple;
	bh=zfp080Q5Qm/dOHYaKVJEgr59LwYdgOlPd4byHKHoi8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kec1DcjYQEN/CwC7lyt9L1fEmrv6Q6avUM2SIwphRfTGl5iYMokbNm0C012U/RvNWSJcG+G0yIqG9j9/zYS73fELxsuu80R5DYfs0yhZN4iMBvgjiaU+/FxNtApNngj8A1AYcEaVcqC1wILqqV7RVB6jU8zIpRbtKgbb08R3pHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zztc9w0E; arc=none smtp.client-ip=74.125.225.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zztc9w0E"
Received: by mail-wr2-f13.google.com with SMTP id ffacd0b85a97d-4843378fb37so1053151f8f.3
        for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 10:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790442424; x=1791047224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rc7SH1+oiRz15YUA9wEx+QwM/I7YksifiQ55uUhZaVE=;
        b=Zztc9w0EfCda0j81EpJD7zA61N6tqk0DQB/8CaFtcyB4K0+RHetcD8tBWl6eVYA1cO
         n2daNERx9/on1PDD4Evm47b1NmXxoNVWUFF7XOeijlFpCcl1TvuH8I4qktJ9nieQtl/i
         UtgNXH18TUE+IrrW0RCPEhnwkMfXjBxmADMLvVY7g6IDtx+ER6MyIRVvjvZt2kTmWeft
         Wsj0dCIm1COwLOdEEoJgzFAzhOsw3xkhJvJWq5aHr0rNFL51i3TPCO0icj7nbpwJfMFH
         +fCP1dt5IOMWuKP8andFUjkWYXgtV/7j/8vcDXYl0VrqGCzvdatKaSbkkHSQ9ltfg5hW
         sLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790442424; x=1791047224;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rc7SH1+oiRz15YUA9wEx+QwM/I7YksifiQ55uUhZaVE=;
        b=Fo4GiAENrp8Z62Uv6pAPvLq7hwx5hfyAs2u8D8hBd5uiBZ++xecdIHXQwg993btfrz
         V+f7R2Dxcc5Rzik+EsvgtPcoKGERHAWyLWu4hGLoqULZ8FbtnQxlgYXMaa41uwj07+5G
         VeUeOZ0O29poq/bCKN2sMk2zwffgqjfpCgPcAPZZxGhoNV3jN1+MCA2HoxYqSNAsE/Iu
         Flb31OOJRCnrJ+8ewwSz8UEx879X2TnCbOrjojxi2dYkdbi7EQ2xDVdERMfZNFQ0h8UR
         gicz+DsWXcwhiikflSm1dC3gB8FO4pOp7aOdShUadcGjCmUlWHE4ibCIXNHvRZmuTdLI
         khog==
X-Forwarded-Encrypted: i=1; AKwUvByzTvZtjcEzDju3Ql5wzqqU2L2IM8p/i9vGnPtGwLTeKKn6DKZf4hRxmCZsZBYZudN4JqM/q1ggumg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoQo+jSn2edEKtPPHOUjvhtjk6fjnXiOtZZeqcRYm1L6cnBHpQ
	gwxmrq9rF2HX72jaUs4qFMYww1apRpsY71X7zMP/4TDx315kCb3/n18=
X-Gm-Gg: AYBFou0OCc+/CVaxhLpsrsdiTaVxqVJ35ZqTRYjMdYV7ablR1HLDD7Z1DEqzWfCVAaK
	E8Ow6VLyiciJuNiBiu+cSjOkOBtUaaRUqCgmc8O85/9o/4yutG2Soly9UZ/mRqnCiEix65Uq5dR
	uBWZtmQmC1q7yA2lz+4QCmZCBuaQJ1/oAlw9E5j6BMRnd74Wj5tbCVvr+1yarFGQtRBBHg8wJaN
	8ipFC4ZIUr0icLfJ2gWKDnMDDGdE8vt+wsqd1C/ob6yknpE4xh1MifspwGamtP0CEk7f5i5ap6j
	8eNwmUX5tNLkHv2g5zNNkyXhsBeHTDgtDgtvRYI7ZXl2nEVu+PA/b6+20aZbM8ggiM27ji2Knra
	uXEynv/iRaT4N8gynbu2MHdkBEclqv0uzhn3ZU9e7PmkxTBVT6tgHb0iArNObQh0STIiRC/wshU
	e7PrXS0y869P7hHqmezVpAXQJfi6TKGFC20mc0Sl+YGxDIukJb9lDkRiT0qMOZ6TkElDAz/5ovC
	BgZvSHZEV8RYyRrBhu07FzH42J0wphZ28unH8Z6lTAW3CE=
X-Received: by 2002:a05:6000:4103:b0:488:7496:15b5 with SMTP id ffacd0b85a97d-48874961605mr12187402f8f.47.1790442424390;
        Sat, 26 Sep 2026 10:07:04 -0700 (PDT)
Received: from localhost.localdomain ([31.223.3.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64ed6esm16561651f8f.29.2026.09.26.10.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:07:03 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: clemens@ladisch.de,
	corbet@lwn.net,
	tglx@kernel.org
Cc: skhan@linuxfoundation.org,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	linux-doc@vger.kernel.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH] docs: timers: hpet: Modernize file references and document userspace API
Date: Sat, 26 Sep 2026 20:06:49 +0300
Message-ID: <20260926170649.6346-1-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
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
formatting. Additionally, add a dedicated 'Userspace API and ioctl
Commands' section to clearly document the supported ioctl interfaces
extrapolated from include/uapi/linux/hpet.h and samples/timers/hpet_example.c,
including the layout of struct hpet_info.

Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
---
 Documentation/timers/hpet.rst | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/Documentation/timers/hpet.rst b/Documentation/timers/hpet.rst
index c9d05d3ca..e21a6185b 100644
--- a/Documentation/timers/hpet.rst
+++ b/Documentation/timers/hpet.rst
@@ -23,8 +23,35 @@ The driver supports detection of HPET driver allocation and initialization
 of the HPET before the driver module_init routine is called.  This enables
 platform code which uses timer 0 or 1 as the main timer to intercept HPET
 initialization.  An example of this initialization can be found in
-arch/x86/kernel/hpet.c.
+``arch/x86/kernel/hpet.c``.
 
 The driver provides a userspace API which resembles the API found in the
 RTC driver framework.  An example user space program is provided in
-file:samples/timers/hpet_example.c
+``samples/timers/hpet_example.c``
+
+Userspace API and ioctl Commands
+================================
+
+* ``HPET_IE_ON`` / ``HPET_IE_OFF``
+  Enables or disables the interrupt generation for the timer channel.
+
+* ``HPET_INFO``
+  It is used to query the capabilities and current status of the HPET. 
+  When the ioctl call is made, the kernel populates the ``struct hpet_info`` 
+  structure and returns it to userspace:
+
+  .. code-block:: c
+
+     struct hpet_info {
+         unsigned long hi_ireqfreq;	/* Hz */
+         unsigned long hi_flags;	/* information */
+         unsigned short hi_hpet;
+         unsigned short hi_timer;
+     };
+
+* ``HPET_EPI`` / ``HPET_DPI``
+  Enables or disables periodic interrupts. When activated, the timer triggers continuously at the specified frequency.
+
+* ``HPET_IRQFREQ``
+  Sets the interrupt frequency for the periodic timer. 
+  This request takes an unsigned long argument specifying the desired frequency in Hz.
-- 
2.47.3

