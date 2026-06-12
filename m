Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C9B3911CE
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 17:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781284732; cv=none; b=j3gVxWwfhI+d48lbahTD9ULK7q3os9RIrREyb4iCxCuM9Uwok3MZDTo2eLFbmdchoG2f3LRnd4lM8wJYOsdeTySl3F0Z7TB0zhVCD3mS59k1Ei6H982tAk5m7XIWcdm83t3kzAwbERWJWU9/pubudC3C5WHoP95IdUHfZikwxK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781284732; c=relaxed/simple;
	bh=yVPBwVMtjHWN3su2wCCWfu5/mrm7yRNsCI5ALzLUUgY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=RkkA+aRYo6sg3dhGoOalvlpk5vKwPgF/bVd43u91nd38g0X86oCiiDKR9BU1yKLCDhwHyUE9reYjPy02pu2osArIlpPKw8G/O07tbaiE7Zlw4kEr1BTmlU/xuZaijc1kGXEUy/qjZPMbAbPuA1v09qbKBo/raAo90nMXLOq+iIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FldVUUR5; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FldVUUR5"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so791483a91.1
        for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 10:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781284731; x=1781889531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=swbkGlj1oq37sWL58RG9e7scbRtZucFGbZOgNpgrpEc=;
        b=FldVUUR5QtVbriYZJPjP5llIYbbrM/vlFgaAhuKVpaSXGmSmjeqRVcm3FE5ro3Jdmh
         P2B2LM8BK6lE6uZ4B0qWjFktRSvFHq6MmGVbpr6Z7X15n5Z0CvTEqwntYXPH9itV/SQA
         OPFuH6Glxj4ovDy+BOfj0TW0NC6LBfK9VMfYFbSQfunGXQ8d665XbbfFtNpULAB9qQrj
         WeuJ2V6OKb87nUnvb++KOwGtfRUoagQwqnvc/fmj9Up+4ZRSmuCYzGm+iwTH4NK/wk6B
         V/JGlAoPtxnab9M4kdXdZ5ervAk106JH7tBSB5mUbpLS69I5dncnUzYBddA54Z2Wh4KF
         JqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781284731; x=1781889531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swbkGlj1oq37sWL58RG9e7scbRtZucFGbZOgNpgrpEc=;
        b=gdeelVdSfcrqKsQFfU2K/uwqGk4Ox6XVEXV4UGFIe9U56gkBz5Qml9ENlfw6azl20U
         CrB3gUwjzi+AS+V9UE/+sBDeFz1iPnD7MsuC28p/tmEVOPFYZa4ivhM8Aiyt6UY/cSSC
         DsLgRh2Z7RUUDzk44C145TKG0ovY1p8mYcLWSNca9IhYvJakGObETsRprxES+gHA5Uxy
         NeHwHGbgUqWj+maBu+hdcc9H9ySAXAxEbIoo6LynDMmDWE/wIshF+rdONT6ClfLwOVL4
         tOhMxk4Bjyd3BKogxhULHnxCkLLKtZ4rpS6ilq3SrOc+5Jxm6T0PfBf1R+QbigW9P/YZ
         GXtA==
X-Forwarded-Encrypted: i=1; AFNElJ+8EXJrw4hm0ZEi2S5RY5TjDIPZl7b6Ftv7R5tmKQadqVvjJM5IwjGHLhHNY9uDtO45h3PcysWzRIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY6D0cj+2eFpjPDAksZU+sAp0JAvdAo2EHKEKxeM+zKo1SWJ6Y
	Sy4NMKlf+xhwQJIBajoPwbmVYYv9yKYLErYb9IYcoifoGJi39i6WniNEk/rD3njIXTI=
X-Gm-Gg: Acq92OGi3Uk/W+Q8K945o7ECORq0Rmg4ptSCY8WOheylrYTQddos932UVPAy7xgBNay
	ibPivlAJfUggXtsgDEma3JMSgH0eCLMwKnC0bUoDE1J8Nc4GaMzARnZ7/vd1ngINtqJ6gEAwCWE
	J/nXVtk8JzXtvyYc65FIO652xTdzibpZhO8X7RxzxhHVmenYs2aHYxIo2iJUqvqObzZGDB8726a
	3vBj3ysHSaBDcMrk93nbpIqc2fZBi4A9462msrf21PWrrCqxm+/JBMef0ujx3SVFb20/pbOK97L
	PESx8GLNi+XoqC88kpTQ0GFJxtrZf9oKJ0MuH8TitAn5Rc2u/SUsxhY9lMNCz79m2uhGhi6Z/mS
	DmjOC/CEM91vH3+KWlYpwir1q0GJz+KkDB+5JyVUSHGEEVpQJCFO3Q3TmVaSh50O25ro1sudg4n
	dJ0H0Gpzbu9lXAvSltlFF6+C4LwakuLkMhfyJKUg6mfMU/r8wR//c72/sGrVWxWojggf1dVyJ9B
	i15PmQ=
X-Received: by 2002:a17:90b:380e:b0:36d:79c6:1563 with SMTP id 98e67ed59e1d1-37a035f00e6mr4074983a91.17.1781284730623;
        Fri, 12 Jun 2026 10:18:50 -0700 (PDT)
Received: from shardul-ThinkPad-P16s-Gen-4-AMD.tail792e28.ts.net ([2401:4900:1c17:d4b4:80cb:f14b:59ec:7cab])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a262adbe3sm3249038a91.13.2026.06.12.10.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 10:18:50 -0700 (PDT)
From: Shardul Deshpande <iamsharduld@gmail.com>
To: Nam Tran <trannamatk@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: leds: fix broken reference to the multicolor LED ABI
Date: Fri, 12 Jun 2026 22:45:27 +0530
Message-ID: <20260612171528.728111-1-iamsharduld@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reference pointed to a non-existent .rst file.  The ABI file is named
sysfs-class-led-multicolor (without extension), so fix the reference to
match the actual file and resolve the warning from
tools/docs/documentation-file-ref-check.

Signed-off-by: Shardul Deshpande <iamsharduld@gmail.com>
---
 Documentation/leds/leds-lp5812.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/leds/leds-lp5812.rst b/Documentation/leds/leds-lp5812.rst
index c2a6368d5..12e757d45 100644
--- a/Documentation/leds/leds-lp5812.rst
+++ b/Documentation/leds/leds-lp5812.rst
@@ -20,7 +20,7 @@ Sysfs Interface
 ===============
 
 This driver uses the standard multicolor LED class interfaces defined
-in Documentation/ABI/testing/sysfs-class-led-multicolor.rst.
+in Documentation/ABI/testing/sysfs-class-led-multicolor.
 
 Each LP5812 LED output appears under ``/sys/class/leds/`` with its
 assigned label (for example ``LED_A``).
-- 
2.43.0

