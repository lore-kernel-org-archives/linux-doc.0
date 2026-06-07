Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D8D1DF72C
	for <linux-doc@vger.kernel.org>; Sun,  7 Jun 2026 06:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780814466; cv=none; b=tsycwKeGThf60yng6uBvtYQ1dQ5OcCUtZ7SHGMkZMaaLpig/OfCxdk1zmEIQWcTp6lSQn0JawWycGezKYkS7kYi9NuD7Cy97Wvy84nciI6v7Q40wgeJ/a5EZjVzv+b6UBzlCDq2ytQFGqr6DuRBzn9Jolz1Uhd+Sz6s9sJYde+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780814466; c=relaxed/simple;
	bh=UN1Ug31Azzv9rf4QmvaFWgW/3REkOEopYBll24EcvV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dGuVRx6h/azGyHRSucnEMHITL5Ihkqk7wfMkfOWJX7fC2yiJxvB3NyLTPAGAEY4NEmauYQofz3N2jRwCJApUpkQJoJK5vrvGrGAiJScxYqJbxnaKGvjf3ptX/NtI64k1jjailTVPvKidia3gyk6CHSlddNa6pQkDtBWxDRKt9wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYHV6kfe; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYHV6kfe"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-304f590dd91so3520866eec.0
        for <linux-doc@vger.kernel.org>; Sat, 06 Jun 2026 23:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780814464; x=1781419264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8HhuuqF5LxBBn4MixHfYOj/pYBiy8lGyW0X7+8esu9E=;
        b=BYHV6kfeN18F10FCwEpv8l47A2NQO+P6n7cJeQlM9gQDrVv9f5VGmNMzZyn0W4QayP
         On3SdVpfTVxa6VDG+eCOKxj8eL5uSoyImZU8eluv0siokOUmjHT/X6ENVOI3AAN3BFOn
         eVL259FNmq67BQhZNYIGZZ9dq8gbG9XxHyXBg2wxSyI/EkJ8PUfdofiKJBSi1xXEQQ+F
         pG9pcefy920o8r5lDa0C4QqqSUNkuJ21DdZAFBJsIpZorPvyz2iZ9ZyjgUJyZlYniBPg
         DgTKNHcrpExjSoJopqg3wCXEQzE+Uve2TaceRFkgS2EphtpP5x8mKlcWg1LPMDOYjOAQ
         pNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780814464; x=1781419264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HhuuqF5LxBBn4MixHfYOj/pYBiy8lGyW0X7+8esu9E=;
        b=duijPZp0Kw2lJU3fqlfbleGej55UMmL77oofkrwVbbtcEUDaQb5Ap1CpkF3fsiYpzM
         pIf0Oui+7OLEjoUasU1ObXc4FGe2Y2LKqcfZtEu/mgPflnL+tib1tDSiWPNNGTXKB/hi
         53VxQ3xs4bcvcumm7870fx8kguOesvDEh64H2riUqRISLbeh3M6FsVskG5dePpbo4C9I
         gjWBbE1egFOLpiYgKSFj9sujZjAyGxwt36yWIB5hV3x+m/kxX6o54eTaXdin+fqd3jdZ
         IsCbiJmxjZX4CTK4iWrfLtYH8FojEVeK44z9qcJm7tvR9ljTlhXu9O1BuAHgJ83WllNK
         Q87w==
X-Gm-Message-State: AOJu0YyDqQ6hM7Swn+Ce7GYGGcgykuHEohtjMR18Ke05emOaJKon0f61
	J9RrkJxh1hmyHn1TP3fTZx8P3AQfkCkqlitizH/33ZnWoraMLamRYv51PGg2Wfy9
X-Gm-Gg: Acq92OFBbiTP9+y5kzAbZtQzpYmTBhRmJeAK+Clbz5PIAqQAtCH6Wtt4ko3kyPOyc6F
	7wbzPul3GZpPbnoFBUoY7bJPtIS656BgFQsxfowmdNxDo1FnMB/tsMLLizsQTJvFAni52i6MleR
	F0tzgk2j08MgNlEZdG8ExIPlw6wqwiA+dqB2FYmyhZl3ulAXfZf0H3X22Rj9mGOHce75+bIILHQ
	r2OQQ6Lp7vPxD58RMwDqveXRCuZPEqbk474G07Ow8lBBsyuXXE0Hv11yVk+ddYayRyrOiZJWDXm
	cpop0ZqgymaRZ2wc2EBe4PbCdyD7Pj3fsx9dRJGGP1OlXmzaHlwIAwNsSx1rLElP8RUWtvtUhWb
	PcLx5KNNmUNWDuSIyvoF91zPt/06YWelKU/tJG/C1Wp5JQ+aJshe2NCG+v/e/gUrpsjjVLSMp8l
	MEz2mPxzFm2gPwV6ai0hpurSV+wXUcShG/ytEOdpsjRvMjzGGDiZ0pryITdL4l3hI5ZNlBSJw5Z
	tvvs9g0cy+ihFsRhQrs9ilrB2Qxn00FfgnXAbIkcIQ3YLGWT1KY7A0JLJGXGh27wsp2zCDRibph
	ZcPECVfKRIQdkEeubVrpuPTFwzWiS7j8T2Y5s34=
X-Received: by 2002:a05:7300:d517:b0:304:de94:1c2c with SMTP id 5a478bee46e88-3077b866467mr6790455eec.34.1780814463977;
        Sat, 06 Jun 2026 23:41:03 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcad34esm18462755eec.11.2026.06.06.23.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 23:41:03 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	stable@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Damien Le Moal <dlemoal@kernel.org>
Subject: [PATCH] ata: pata_legacy: remove documentation for removed module parameters
Date: Sat,  6 Jun 2026 23:40:49 -0700
Message-ID: <20260607064053.195166-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 3c4d783f6922 ("ata: pata_legacy: remove VLB support") removed
several module parameters from the pata_legacy driver, but neglected to
remove their documentation. Remove it.

Fixes: 3c4d783f6922 ("ata: pata_legacy: remove VLB support")
Cc: stable@vger.kernel.org # 7.0+
Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         | 37 -------------------
 1 file changed, 37 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 97007f4f69d4..47bccc148a54 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4935,18 +4935,6 @@ Kernel parameters
 			Set to non-zero if a chip is present that snoops speed
 			changes.  Disabled by default.
 
-	pata_legacy.ht6560a=	[HW,LIBATA]
-			Format: <int>
-			Set to 1, 2, or 3 for HT 6560A on the primary channel,
-			the secondary channel, or both channels respectively.
-			Disabled by default.
-
-	pata_legacy.ht6560b=	[HW,LIBATA]
-			Format: <int>
-			Set to 1, 2, or 3 for HT 6560B on the primary channel,
-			the secondary channel, or both channels respectively.
-			Disabled by default.
-
 	pata_legacy.iordy_mask=	[HW,LIBATA]
 			Format: <int>
 			IORDY enable mask.  Set individual bits to allow IORDY
@@ -4959,18 +4947,6 @@ Kernel parameters
 			with the sequence.  By default IORDY is allowed across
 			all channels.
 
-	pata_legacy.opti82c46x=	[HW,LIBATA]
-			Format: <int>
-			Set to 1, 2, or 3 for Opti 82c611A on the primary
-			channel, the secondary channel, or both channels
-			respectively.  Disabled by default.
-
-	pata_legacy.opti82c611a=	[HW,LIBATA]
-			Format: <int>
-			Set to 1, 2, or 3 for Opti 82c465MV on the primary
-			channel, the secondary channel, or both channels
-			respectively.  Disabled by default.
-
 	pata_legacy.pio_mask=	[HW,LIBATA]
 			Format: <int>
 			PIO mode mask for autospeed devices.  Set individual
@@ -4994,19 +4970,6 @@ Kernel parameters
 			the first port in the list above (0x1f0), and so on.
 			By default all supported ports are probed.
 
-	pata_legacy.qdi=	[HW,LIBATA]
-			Format: <int>
-			Set to non-zero to probe QDI controllers.  By default
-			set to 1 if CONFIG_PATA_QDI_MODULE, 0 otherwise.
-
-	pata_legacy.winbond=	[HW,LIBATA]
-			Format: <int>
-			Set to non-zero to probe Winbond controllers.  Use
-			the standard I/O port (0x130) if 1, otherwise the
-			value given is the I/O port to use (typically 0x1b0).
-			By default set to 1 if CONFIG_PATA_WINBOND_VLB_MODULE,
-			0 otherwise.
-
 	pata_platform.pio_mask=	[HW,LIBATA]
 			Format: <int>
 			Supported PIO mode mask.  Set individual bits to allow
-- 
2.43.0

