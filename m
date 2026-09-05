Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D481428470
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 09:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601633; cv=none; b=KT6CVpKeVuUKcM2pp/YahC6AS/P6DskSCPPyeTUCN+KT3lLrrg210zFiHLpQOCgncEcn9r33cScAFxAdlkXXZIchPF/CPMzFLCB439D+gFUxW3N/Z24EOy0thvDl1B1ANOVz1fX6BXqudhdp9RFZ/wHOjPsxDEldvYnbV+c4DH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601633; c=relaxed/simple;
	bh=BaEoG/6SLaF+j+PN5tp7+Wdp37OedR46Vcq2/qxVkD4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G0PCoDTHEMeI3wOIH8E8j0XQP0ZFT4V2cE2DWAb621Gp+n/QbTtBWdzv+mRjESmxg4+skdfaG5NzyQSpqureaiv2HHXgpCcLigwVs6MNF4TKX+5R6QCpPTxVY9gqfO2mPR2UeMbOEblgAI8a+2Xbk87+yn+wVeQPuo8Ku4Hiyz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sUm8EgSF; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sUm8EgSF"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482e4998d28so1386630f8f.2
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 02:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601624; x=1789206424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8I1Jlm5MucKkfjFwaOiA/wi4L8q8pr7cNwUH5XJFU8M=;
        b=sUm8EgSFwuePVR3dg/8YeD3vvUCBHQyHHnli9XsusR7+vKD9DDfKLAcOuqxV//tEjW
         bkQXVykoOZYpgWQtwadrXsG60ZWuob8YKhNQOlMpED8Vk5Wq1OmepQwNLFTYE6mHke91
         PXt43eSDBYW5Qy61QkbR3trMXG79Klg2Ib1TuQT9xyxDyAqdI47TYUvTLLuWntcf0Zx0
         uVOjx9mMgo+mOVdU0gyCodl4l0Q4Visp/sm148NDD5eWQZ9gMf7DoPuhujlRgnfcmHGo
         bPHxEDLBltbFqDE+NBRq7Kz+3RpiAd5tSck4yhiJQmLb/UMVxDlDT2QsPYRPnJCdMr3Y
         QmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601624; x=1789206424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8I1Jlm5MucKkfjFwaOiA/wi4L8q8pr7cNwUH5XJFU8M=;
        b=sqobTCeLKXOgAnkuDxM3t37T6z76HdwXmWuhTOabw+W55Dww33t2s/u0H6H2PceRrR
         Ef+lyamkrV1oA9qeYDwnsdbT9zA66FZlpNKjp5m5cE3gKX0+B6/4VwuBLi1WPGZ/1aN9
         SM1NUkBYTto62Yjot/GNfSO6Q+BLBfxH4yizoH0FfMiapifZTSCIzmoDzSPJicQsm3Ja
         yZAyGQN7gBFtTXTEeI+mUInEKT/hshKOBatsC1MAVA6UZDGUckYRf2VTCLBfxvIJUJQU
         8oUfySuQnZEJyrqVxz00il226+1Y3wZwrSq7jZj9Zn9ItE6v2u/b11Huu/xCMEgkL0ha
         dMnA==
X-Forwarded-Encrypted: i=1; AKwUvBwJIBSwO8Tfc1VOZ2Blxl7YtfUZNpI4nG5EoeUyVtrjM5EZslI0OE1w9Z9RQUc4cYqAZvAxBx/wqQE=@vger.kernel.org
X-Gm-Message-State: AFuF++lDp+mDFJfZdjry8OpJaHs+DnfqAl5W/ep8Nl5epaal8/3jy6e5
	ymKXFWX9ZdbA5EOgQPdfeMjDML4spanmRRotJ4EzYCqVoDY/451zGA8J
X-Gm-Gg: AYBFou2D+lMxP/iRSwa3cvPJUj7nTnBanFlitn0+of+tzIJmu+Y+2TCN7pRQdkBJKSY
	/khRQW/BQXlghPjEfkIUIK+i+tgYwRHQCV4Z/XOhdxHMF5i2f46YELqO5TNtiZsuQs0t87gHKTb
	3jMIboNNwOG7h09H/FvUeHexslw5B96TGxNmVMgDdP6rsonOxx9MVKTiwL5VzR3Qtn0ozZ0GVP+
	Dyjfwq+F3iqgp9fuNUJsYEuRNJbO1cv0yapL5rP5tD1Bo3ApO0a0hi+BMGNPOjLsVWh6823eDR4
	PrkLF38ugYJfSKCA227RYRGV1vt+GRMt4F1UQopeoNoUOTIWJfLqJmdvdwDMDtgonTKHPVxDLvT
	m+naMnffkv2WW/IWqSR81r6Wmnf1ENKmGWfL1aiQ2IerRvof9TxnyLp96DzP0sdwsqjEvdOnw5p
	x20gIoJyjKJ0kMSDKTFwTaUZhDZ17uUF+wk3T17JBBGlnL70nr0+VC5jZM68ju84+Dvn4sfTv7R
	wMxEuO2dpvdpGWxMBBcPIGdtljH+diSE4o/ZQEbD9okUXgkWIxe/6/NReZX4EyCwPbgGVnGpFOe
	G6Qnr+IzjTWHHimm1j9Ip3CU6jjxiI6RgZrLrWiLq+MrgwVaU99zmIao4MtP7VPwfw6YGd0rGt5
	DNw==
X-Received: by 2002:a05:6000:18a9:b0:485:9211:6560 with SMTP id ffacd0b85a97d-485921165d7mr3155784f8f.25.1788601623937;
        Sat, 05 Sep 2026 02:47:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:03 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Mike Travis <mike.travis@hpe.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 2/9] docs: kernel-parameters: Drop the bau= entry
Date: Sat,  5 Sep 2026 11:46:42 +0200
Message-Id: <20260905094649.41996-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905094649.41996-1-kmehltretter@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bau= went away with commit 39297dde7390 ("x86/platform/uv: Remove UV
BAU TLB Shootdown Handler"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: 39297dde7390 ("x86/platform/uv: Remove UV BAU TLB Shootdown Handler")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c8d96de4c00d..99d5bb68968a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -624,13 +624,6 @@ Kernel parameters
 			Format: <int> (must be >=0)
 			Default: 64
 
-	bau=		[X86_UV] Enable the BAU on SGI UV.  The default
-			behavior is to disable the BAU (i.e. bau=0).
-			Format: { "0" | "1" }
-			0 - Disable the BAU.
-			1 - Enable the BAU.
-			unset - Disable the BAU.
-
 	bdev_allow_write_mounted=
 			Format: <bool>
 			Control the ability to open a mounted block device
-- 
2.53.0

