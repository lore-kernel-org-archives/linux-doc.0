Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C66C3DEAC8
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 07:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591860; cv=none; b=hhUvStY/SP+XdBdglEKLyjh9B/Y4erlaC+06A1jeevcTu5mabopNPdVZOBQ9+XYvpRUT8SZypJv2FiMGYfLvTgb22MnxmrcHgLV/IZDt23NGg+3Wukqco8BjBGmAamJPack50dqHDEVC2OZRQMxt0esK+pvOQhoL8PLPP0Bp7KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591860; c=relaxed/simple;
	bh=ItZT5GNunHVnueIdaFQjAOk/BPjP1n6HkFAdihTWgYU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ab01KqKGanGq7pDnZvbHS/2f+6OqYbzIETRDFwbJhfb6gWPRyliyqan8pqmmEqBkPCPeio3GCJxGhcr4/9DEUrUfuTEBbotaBCY+ZUiaDyYhyli+GSAM2YQBwya33ULCdQjqMGzj+WCjpcurgtd8YgwesqkVJGFokik4wxQczs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ot2TgaTS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ot2TgaTS"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482dd6ee390so1912761f8f.3
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 00:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591848; x=1789196648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kFzQQFmCjPVcuR+l7FGQ0u8MffPmow8qd7a6fWjai5g=;
        b=ot2TgaTSFyf0JGzHOS0qVEAf6ZxzDDZ9GbwaoviLSwiAMvTFLOKcRxlwvGcTuqHzw5
         EkRs1xP7nf03aZMrJAMt2A4vqFH6X5rfGTK0/Vyri5Ijk2c4UffB1TcG58IRkXtYgSV1
         Lqiczg4F7DVsT/bfD8Dx4iw+ZCRZ0G+oAO5ESiQxUiSEN3HFL52rQVd2QFAYy01WVJvc
         AuwmYB7H4ehU2TRk4SWu99reuV00ExXtZkNHcXcIzps/tOjkWE+FX3P8hYqnEYJ1/MCI
         dpBI0NJG8Rj8bLcFMvzVpenCY3Q55LPB62VZMu36usLLEDEOOWtHzGUhvARquerAn5BG
         Sbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591848; x=1789196648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kFzQQFmCjPVcuR+l7FGQ0u8MffPmow8qd7a6fWjai5g=;
        b=GbAvB9dHfdf3s0SRYBdDnnW4gxqr7gBjLKx9S1QIOszZD705SR7JVlvxA++3zRhVBX
         CSWaD+PfJywL1Lhg6HIKDtFUfQ8Crr2dxBQAHlPJLMASMR2GYZiRHLJLyTNUw2QyMuwJ
         xk4MM/4wMyYJkTm5jgYPgJuslsRWPnXE7xyBssiCJDUlbDP9ZsaPS9/ZpNYl8JfTADbO
         QMMiLnQ2EKW1yk1dd+EoQOL2USjymMu0YIxBoCV3LhKNYSVsK1mIHusL82tgjJLsbqE4
         l/dVbrLSc9jjrC8NOCDYuhNJngHae2UjpxQPQkVPXSsBfY06PFepGBDIs+GJKRwSJF/2
         /p7Q==
X-Forwarded-Encrypted: i=1; AKwUvByyQyXSm49borwQVCUaGDJfWCkIUywp6pvZJyDIhygMlZelCqazPePtbagsTA25avDQhEZ/aGEAAVk=@vger.kernel.org
X-Gm-Message-State: AFuF++mNd1ZM4RC51ActqkZX8uYs3ZyQdDY7O+Kg+xeWWJOpiktZDRBg
	N5tIBJ4x+bmdhuFTXHWiNqwPckjrSVPU09bIuexhhs6VNvdVyWmfR8hH
X-Gm-Gg: AYBFou1OGjzQC46t6PEFz/glmgJ7riA0WD/R1viPDeav3pHpC+xbiCOhctROPYmk9/C
	E1H7zDDp5HaNUKNTvr4h0oThsXhu/67r/ij7d/5L0hJoN3+XJ+ET9tCPPv9UOGgnWKpSCYDSzmr
	rONJAzxTIo0eGvFvK1vICPAhRm4AARjZe4hJ5U56s/ZZn78tVdneyhbCys8+4n4HGk5LrQoy1Zh
	MZudKimEnD85X76qJMkEEpL2eOQ1HxDFbU5x7xUyz5TusWEBzYAgh+kQasKVe83Mnrr5/IUEocT
	04Lz0sBMEVdB1EFkkiuykG1AUlUsIYMvQ2981NI7Dit7T7YtmwJFtbHY0rMnGyvALjABiFErL0F
	IG/xtgKbYFR5wQmww9/SXxBrsfKPHOxC42vLesdL0uDKzQoce20fzAh1ikjnG6c1akLVCcyCxoG
	LrtU1fAqymGZNlVJKHzNnV95PU3wV5EpF88PAiBHDcOpEKGBnddVEaFrWFe/L9yAEUHsKXBdBqh
	HgCEnoraIVwfGg69Ie1+YQJArZU1wc2ROQvzB8TfKcvjLpCcroBtsiL6+U3BSpeo1lYfa245m+p
	oSXMYftCtPNBtwS/nQQnjRqBKNpDXDdOGW/rg/yXgLsfzmXn564k6GRSM13+Sxpt5Xn4zygxgAN
	y0J4MvuE=
X-Received: by 2002:a5d:5f55:0:b0:481:503b:b663 with SMTP id ffacd0b85a97d-48587091856mr13328658f8f.18.1788591847580;
        Sat, 05 Sep 2026 00:04:07 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:07 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
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
	linux-ide@vger.kernel.org
Subject: [PATCH 7/9] docs: kernel-parameters: Drop the omap_mux= entry
Date: Sat,  5 Sep 2026 09:03:45 +0200
Message-Id: <20260905070347.25902-8-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905070347.25902-1-kmehltretter@gmail.com>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

omap_mux= went away with commit e9f5f1e45608 ("ARM: OMAP2+: Remove
legacy mux code"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: e9f5f1e45608 ("ARM: OMAP2+: Remove legacy mux code")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d44728a45506..48dd273eaf6c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4765,11 +4765,6 @@ Kernel parameters
 			waiting for the ACK, so if this is set too high
 			interrupts *may* be lost!
 
-	omap_mux=	[OMAP] Override bootloader pin multiplexing.
-			Format: <mux_mode0.mode_name=value>...
-			For example, to override I2C bus2:
-			omap_mux=i2c2_scl.i2c2_scl=0x100,i2c2_sda.i2c2_sda=0x100
-
 	onenand.bdry=	[HW,MTD] Flex-OneNAND Boundary Configuration
 
 			Format: [die0_boundary][,die0_lock][,die1_boundary][,die1_lock]
-- 
2.53.0

