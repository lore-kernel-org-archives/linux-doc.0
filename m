Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2A244062D
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 09:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601645; cv=none; b=B8bEpXHrSAmBeiYOd/kHOX/sPCDte98SnVTGSJFAyraAV2+L0+qpgfyhJ6Nw5zrF6cGJBgclipc7TWajiiycVq+jKG4P9KDWAZu6WUM0HaMqCVOGYSaRLisbi+hgbWDYS8VmSDYbJuIbdk6Ji+aXzu25qfLgSlhRGFyXjiPNlqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601645; c=relaxed/simple;
	bh=fApNG7pEOll5/tB3rqVahJ6bvMIxHk8hHb2CY3jSzQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XGA8QIMz7C4bnVp5c+wg8vmv+Fth9wB+QTLmkhlWGaGuQLvSvmkAEW7r0QmLQFe51qhjmHmPWMGpaoBj2HtK+tbsSdiR+NDg5gCA0M0A2bfeWzl3rxQaT6UjNP2hCJX2P9lcr+mo/isVnR1ouuGMLcYS+l2mzJfZMA6HGamaJdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B18f2qkz; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B18f2qkz"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-485888b3c3dso1918780f8f.2
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 02:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601636; x=1789206436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQmExMUpeIFcvU7MdenadgThwocm9EsyaVYoR2H42kg=;
        b=B18f2qkzikKfnKphA4OculxGEwrQf0Ep8+PaGaQYv/xYwiV+a89Zau/mKSmPPjQYhK
         jBtOa3jRCJrVMt4WrCdrseZhMIzpxP7K5HyQLvnDuBXwseT6zqLPO6oYjihWs5l5VQw6
         IaPriatQT0RC9lzvBO7VOXXAMuqADXWdKOJvgkOPcub3MdhRvpJ4b7usagxcgO1SuInd
         me06Vd1NkyrlDIAyGAKSjoDVx+LUxHmS9/9ZIUdmxHwmU25+LAqgMQ6GnyW4BcJimHcz
         24lVKx1gKbJppw7SPYNA7p8cpuCncSXDDngh0Emhlo8DhQgZWF0reb0Xaz8DR7S7DvIc
         dv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601636; x=1789206436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQmExMUpeIFcvU7MdenadgThwocm9EsyaVYoR2H42kg=;
        b=CjZ4d2x/ow9oGSZHPrvNAa2xUn07I5F/LB4u9rv4VPaCnEirIiEImHv2Scun8MLwW1
         L7/CSrifFK73qbs1EF4KnuIQZ2xaRxJ2AQBMfWD7qiUV6OK8RnmQTpFzySidXFFINCMG
         dhQa6XiuW4GIWOVXevs/1pnW2c8H+lm/bHVruGl3RUb96wnH4YiGZvntToa7piBF8M0s
         eBEhSveCaNc6d+SdNpH7AplbILr594MsCMd5Ox/35uWe05Jn5a6+FF7MDZMqZFl7pdkI
         SG90TZFuGSEs2uZH9Ft1bZf54vbKZNgxUvkus6VqAugKHy9TowPYCz0wzZP9cLSw48TH
         rZ+g==
X-Forwarded-Encrypted: i=1; AKwUvBw0Mv4Yh/J0ER7Aei+5h4+sP3OxG+kHaSpM9wb8+VY/frer1Vsk1aI9UY841EqOp1QOSSz1FeMTlQc=@vger.kernel.org
X-Gm-Message-State: AFuF++kuOIc6k4cPmKBehCbaBQEW1w51ctIFF9kS8WDHHyujeMv8ntNe
	yAy7c1MD4Moo2p0KZRcpqWwDTusaTZFlDmq5aBeF4VmVFCuTycodGdC4
X-Gm-Gg: AYBFou1NQ7bsBq7xcYDvRQIjTgZ5rltHNBDEx7/5JiC1a+lGLrUD3OD4qLFaG7wHnQD
	vx3pLTFYgoHJONLERd4AaR0NEKGLL3fbNWO71tXEwlL9KW81g9ytSZVxXK7KQVqHUj/zcQ7YGz0
	klcuCp0uaRTujmV4duZSxK6cctVvT3vQDFiY31r6YbsrbmYJdp9pDeFhWQw8G8ZpL2ZTDJV+92M
	mZhFHWhGtn2e/Z47dtgkxGhcjFZ0KBnrM+F469z4BQLuXK2BE8tt1/FE9PZvimZgF3fqF2rkVwZ
	Crxjdueb1l3GelM66Y07xT55E+ir7E+Bzt7AXXkFwpHLouxDhraCPi6mA8PVuMT4SE8ev5Xhv9/
	DFJdkIuhPseT+WGQCa+st9BwjyBsOfxR4KDcrpU8uW9cgICkIJcaeK7nO62PViAtk+OVtl1WEi8
	PcmsZ2V3G0OgnMohQ6jJLGhVGMa7xounOXbdyu5oMXxbYULn4RCUwAj76fP9r5XurRrzbMZt7xG
	CmmwzFc1s1JqGEKILMrNKsFIND3vaLrLn/ptUV2YvC2b8gP4ZJL8rFuSKyOkTvwzywV7VEvo0jc
	IOlXH283diTDrTeGSk6QkrYTkWqBbbuDtysn8oG+o2ZWhpX2bW0n1NY+oTGcJxA3Dw1XLF5j8+Q
	0yA==
X-Received: by 2002:a05:6000:2287:b0:485:8b5c:da39 with SMTP id ffacd0b85a97d-4858b5ce1bdmr9454058f8f.12.1788601636313;
        Sat, 05 Sep 2026 02:47:16 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:15 -0700 (PDT)
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
Subject: [PATCH v2 9/9] docs: kernel-parameters: Drop the pata_legacy.qdi and pata_legacy.winbond entries
Date: Sat,  5 Sep 2026 11:46:49 +0200
Message-Id: <20260905094649.41996-10-kmehltretter@gmail.com>
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

pata_legacy no longer has the qdi and winbond module parameters:
commit 3c4d783f6922 ("ata: pata_legacy: remove VLB support") removed
both together with the VLB controller support. The entries also refer
to CONFIG_PATA_QDI_MODULE and CONFIG_PATA_WINBOND_VLB_MODULE, which do
not exist either.

Drop both entries.

Fixes: 3c4d783f6922 ("ata: pata_legacy: remove VLB support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Damien Le Moal <dlemoal@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 4864e37005be..33298da28b55 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4994,19 +4994,6 @@ Kernel parameters
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
2.53.0

