Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7062D3BB101
	for <linux-doc@vger.kernel.org>; Sun, 27 Sep 2026 07:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790493885; cv=none; b=oV9bJ/0/Nkdu2zZ4M7Rbe/bjhqzr2cU4v+sJxwHxs76hzJtgPeztX48PxepZccaFKQ53ruUANqhbocOthgVKhJMFLrJHWOEPkHUnsc1FmEEWB1ms9JNPog3K5ZMzT+2V/1TPT1eMdySuNiiMS1SAExcjlHruv5469n0Nvr1bM6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790493885; c=relaxed/simple;
	bh=vsp3lSI5OValGOowEuR4jODoEVpNGT3LSR1v5N/mUZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YsR9pBz6GCfRqU9thTMseVcFDdBRY99XnJaEKwb+HhnMOveCtv/LKQpHjM8NElOIBWQka1i11dBRf5+UBzBlzS3P6Lw6kZ8u0M57COSJ6TCHgHueimTMTi5X6wlreMx7HBmGgXrkXh55AEmKsTRmddDwFY48i8tzjz+IvjdDCDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMGnKkvC; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMGnKkvC"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887635e952so865425f8f.1
        for <linux-doc@vger.kernel.org>; Sun, 27 Sep 2026 00:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790493881; x=1791098681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XlaV7UgTaVZy2ImXNivOnM8isWNc8kNX4SKcwgQcR50=;
        b=hMGnKkvCkJsfbXhYPrHIDUPazealjSvUGdBZRSlD1L5+qDjyvISGfscgsDxdg8DCpP
         wdpEV6pHuP2E0LBTKfpKS8YQZiLXEqlmSNpVlDjqRDI3f4rUZ7AL6FT3juDTx4REUeoa
         Q5zAcgq/7VbxI1LuFbDEUMegliu25peJiiXTjK3FuARW7RQwJftlaR2AMTJ1i0fYiN/7
         sQ8JQ1po06+yOs+3BK0c8HWEauZ6/tqazAagxaaTxDnsRa/Q18D2D/FfGgrYLEqbc9yB
         L84r25NzDyB5AympxQcQc3Ebbgrb553E+ecGS/WdZbrgtpM84pgS8LYWf6VPOLmSekHO
         JvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790493881; x=1791098681;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XlaV7UgTaVZy2ImXNivOnM8isWNc8kNX4SKcwgQcR50=;
        b=mUQQ63FvnYrWgxw9ew5nddYFPpPAXhG3B7472Sq5FgaybjnYvNRC7dSi4v/5oLvk2v
         TCmQc8zg5x34Q3tF1auDKxd2mQJ3oDwt/27COeKAuORqw2pzNSMvR/bEm6aVjAMj9vhX
         tI3l3MbrjqKHIPtWpdlnAU6Lzb5Ocs2TTAvNpIRLqcxZ5RtMMjsDLC7x5ZZHSYUXTnFz
         aO/spia9YBOZRXYOuuDKb0++kg+GGj5QZx2Ove0mw28x2eaQDoWvvppYUr7NO0IoJg/C
         LrQ0RLm0aIMqlVRXDlGsM5jYYYGKpvfdjQLo+AOS0Vr6VDm75au9UzFTTxV/f+3ndkFD
         fkVA==
X-Forwarded-Encrypted: i=1; AKwUvBzEumcP6TW64lcgt3KIsQSo+u0pi4m2uG1u87RsaDavsI18GdJo+x7I+laueC6zIn3XAs6KiuMUPcU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdyNKi6pYPiu501at5A8F71qTxWwWJ5MDL8B7QxYDbbf4AQlu3
	lF+eoYoF8Cv2wkxp088zm0SxISvOjcTB7nnn4R4vICinjtu2AJA90CE=
X-Gm-Gg: AYBFou0ostfilJQ26+P9BQYVCWq99U4TDIe/m/TurmylDOpG4OBusSs5SUc7RP6qD3A
	wyhnq8vZaNNEJr/c0gPOB5Iy3PsfYi4rGUajfOVghdTg6QjWyPxEh9JKE/JMgRrk48RfgaDOH2t
	+6qh4s6lG3tf39VvfFeV3vkgTWVPzuYv+ecGCor4c/Ulc1XJrEq3F/pQpvEfsLWXyVthjYvf49c
	bHrsICqL3dGc4VNAiiRTRMrfBBp3ADfhfb5lN/Z6W01rlz31hYhOj4x4MWwC34ZPKH0gjcitwGN
	Tssi3NtyeLB+zUQ5EzNbX6WauC9AcLeXyyGAcBN29rctAf26Zftr4jx5obE9k/d/tvrp0BO7w3m
	LCObPRbzlJTR+gAKzfVlebqMhJBrPelaVRRkYhRHz3eWglajTFbDQI01c4q8MQXKVilSovbSIkx
	17MQdxEv+rzIP0tBHi7cwF8KFikyyWKXxmtD+LRzOLDVSG8FsMrf2iKqaPCORIj8/edSxQrel5U
	LhHYoIad/0kulgQaE0x5kII6+B1ShOHHs99p2kqoy7EJrw=
X-Received: by 2002:a05:6000:4b15:b0:488:80bb:d14c with SMTP id ffacd0b85a97d-48880bbd368mr11342988f8f.5.1790493881447;
        Sun, 27 Sep 2026 00:24:41 -0700 (PDT)
Received: from localhost.localdomain ([31.223.3.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a74538asm18263754f8f.34.2026.09.27.00.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:24:41 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: corbet@lwn.net,
	clemens@ladisch.de,
	tglx@kernel.org
Cc: anna-maria@linutronix.de,
	frederic@kernel.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH v3 1/2] docs: timers: hpet: Modernize file references
Date: Sun, 27 Sep 2026 10:23:15 +0300
Message-ID: <20260927072425.7892-2-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927072425.7892-1-habilerenturker@hotmail.com>
References: <87jyo74rbv.fsf@trenco.lwn.net>
 <20260927072425.7892-1-habilerenturker@hotmail.com>
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

Assisted-by: Google Gemini
Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
---
 Documentation/timers/hpet.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/timers/hpet.rst b/Documentation/timers/hpet.rst
index c9d05d3ca..8bb51d971 100644
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
-- 
2.47.3

