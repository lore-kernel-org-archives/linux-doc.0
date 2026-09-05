Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1855B442B23
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 09:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601643; cv=none; b=BJxbHQrGG07VfahMUCr40OMLzPdNhdSbiICBnYYHACumaJJnZyufB38P6O+LBcGGKRmB+jfZgebdwih7nCPkxElk735Mrwep3OvujQshpi7s3jkVbaztLMJieJzAJ6wQVrD6B2Qiko+eCqJc157MNRM8Bd+MVLsX9GXcM/El5fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601643; c=relaxed/simple;
	bh=/cAOJWdBCi1HZBkEDQRQ71AKnd55wOx5U/6xyND51hI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KMrvZp5EcUxmhxltCEY+OP60QCboQ/rsVJ0DuWTIeu154H3J0MBmYkXNjFm6PhFGW73PWJmit3QDJrb8foKBExwqP8ctx1MNc5sx4IcOzZwdHIVvvPfjEimDc0SzyukxpPeffNSc9MmwY3xtLUx6hm89k/Ypoc9Gr378PQ4DR6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFI+tp15; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFI+tp15"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48442ea8f59so2373664f8f.1
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 02:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601629; x=1789206429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2UF/kDvW954cskV6VTtZlG+ZJZtMcv/59sgPBL3REqE=;
        b=EFI+tp158j2wiB21Myvk/wgCpoY7SpCPPV4iM44MN9ai29MJeDR2nrW4gt9EJ4yBX9
         oHU++5jfkKuVqZ3GyJ2Xu0+VD1oPEJnBtBo8yd+gPXmvF/j5RNQL5xYYUv3klx+f3DcH
         SsbYzLfoe1QR6WTm5fyyoQo2pDWEm3LXOW13u/4iwyE+GEOF2PPRMdcOCSAe9Z9TTfnT
         gwETBy1Tdw05aGpcBqwbi5tXmNFwvu6wDwNyqksYI2rWH2Nmgj0EIDCRYDI6gQqLbk2V
         vqnfZmOHbYl3KDfaVlfZrIwQEB6/XTcvA6AHdfLlrTfSYKkwn26eOhRk5UjGiB7xx2Xd
         pi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601629; x=1789206429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2UF/kDvW954cskV6VTtZlG+ZJZtMcv/59sgPBL3REqE=;
        b=VHogRwtW3ZiKbWHZ4t9qzGzXWZrr7oFVhN0HO0Js4Rna3PweNA1O1EA7DxgXdJzgVF
         gDbzEeYI35cgdfQTmSeQV2PQ2O2ZLAJFVO1Uxt5fM8EY9bJGh9pq3qpJ8/0RbFJhpPhn
         /4PdkUOWjFJxzEU1Pi9/rRK6CTqcq7gy3TJCx6jEgkPdQCoC6mgcqkMH/I3oygEX/95+
         YsTaUxmngBQsXJ9kyewI6WKzWezcTuUhDzK/IagSBsmyzpR3a7I7e51LtRl1j2z1WOiv
         qdpEivXts7LH20t8e1h96g++IxxBJDI2Xn31AdLrxVpq+lwqHlDd6VwbliyYn8/R92/q
         TvZw==
X-Forwarded-Encrypted: i=1; AKwUvByMgeTAn0+X3/RkNsJbKn52O5IGvyuDlUUVredAUHbMulijbPULa6SLqHVduhIUpNzRwLaI7kaKiLs=@vger.kernel.org
X-Gm-Message-State: AFuF++l1JwKhdPDsBh0g1B9SCY30+rrmMbZuy9/yrRCHB6b2mNIbRglG
	oAt3JqSM4TmYlyTl1zPrxzNc30OLi+CJmJ0WNdD3GswvrX4ygFPBZWJ3
X-Gm-Gg: AYBFou1xBNIg6h9iJauufY6BGawJcgTK+quiTEdFqR8r5Et3UWZOrdqsNOamnKRZ4W/
	QRKRMqq2VfV9PQoGkYR6B2Utll2JKrPb+3BbeIHyY4VfIArir5e3fU8P9kQPEk5V7h/x6MZtCwC
	qQ+mv6EiIKd2KOgTHRk57afk/RD868V7xqDtXZ/h4qShJIUGvWHmmpg1wZH+nbsVs3v2hVXlu0W
	CsJyr6yKefdO+WovbXwFEi2XbsGgevWk8ZzkNoFhE90/1sY+CFrnxZR6WvwZK8K2tj05num7vSP
	9u+sPvVidks3YOGOlvG5Ae/P6lGee+Luet7QPrSetrkv7yA8rOGUplNMA8k9UYoaXuiFLq9qKdw
	i3h6nAhnKKOpzW0pCZGsgFVnn2f54969+457wul6y80bTlwuM/uf01XStnxBUPBiiqw/ggBhjMA
	B0/dCZYP5hNZAzjKyTdPbfjRa8FaaKBFNinDs6lYF9wOABfL6NtBptq1us1ib0nxiiMYrxV1sC5
	38k7cYhM0rxJR4rlwpmg2gV8KwNrP6spGhi3Q2ooHmFMXtnT/3phbH3zxBmiimkUR5PE8RurqQy
	Hgo971QL4/VeOXE5bavnaj+5jjoNlYw5MKPy/1FsCSQuc3KKpkmbFeUcIeuUWq6Z26g=
X-Received: by 2002:a05:600c:3544:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49cf82bea0amr94305605e9.3.1788601629194;
        Sat, 05 Sep 2026 02:47:09 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:08 -0700 (PDT)
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
	Andreas Kemnade <andreas@kemnade.info>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 5/9] docs: kernel-parameters: Drop the mini2440= entry
Date: Sat,  5 Sep 2026 11:46:45 +0200
Message-Id: <20260905094649.41996-6-kmehltretter@gmail.com>
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

mini2440= went away with commit 61b7f8920b17 ("ARM: s3c: remove all
s3c24xx support"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../admin-guide/kernel-parameters.txt         | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f4314492953d..2ed1e2c03c61 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4052,27 +4052,6 @@ Kernel parameters
 			Enable or disable the microcode minimal revision
 			enforcement for the runtime microcode loader.
 
-	mini2440=	[ARM,HW,KNL]
-			Format:[0..2][b][c][t]
-			Default: "0tb"
-			MINI2440 configuration specification:
-			0 - The attached screen is the 3.5" TFT
-			1 - The attached screen is the 7" TFT
-			2 - The VGA Shield is attached (1024x768)
-			Leaving out the screen size parameter will not load
-			the TFT driver, and the framebuffer will be left
-			unconfigured.
-			b - Enable backlight. The TFT backlight pin will be
-			linked to the kernel VESA blanking code and a GPIO
-			LED. This parameter is not necessary when using the
-			VGA shield.
-			c - Enable the s3c camera interface.
-			t - Reserved for enabling touchscreen support. The
-			touchscreen support is not enabled in the mainstream
-			kernel as of 2.6.30, a preliminary port can be found
-			in the "bleeding edge" mini2440 support kernel at
-			https://repo.or.cz/w/linux-2.6/mini2440.git
-
 	mitigations=
 			[X86,PPC,S390,ARM64,EARLY] Control optional mitigations for
 			CPU vulnerabilities.  This is a set of curated,
-- 
2.53.0

