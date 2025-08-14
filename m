Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4915A2EA483
	for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 09:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755163562; cv=none; b=e02K9Sq/l0dQE5TmqZjMDA6S266IC08cToSldrDjRFyArBzPhmRtq45AdBsmWTtnoWA5pgMh6arXOawXdbEulgbSRdHYtv+7Bz2O5F+Bz5NSjE/HzVgl+pVlXANHRMBPTfHLbRiPSXilqrBlskVoWVRui1fB5VMP1ySZ7pH+1ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755163562; c=relaxed/simple;
	bh=51vdVVrDG2YLBYS3Pf8NCD6LBuxxPOs+8V116Ol8P34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FpQI3HiCfs6Jke35jisJ9dtAnJRJRca8/HLmsz54Ve7LjeaJAKIerEV3zVgC6niTPHft1i31vchMXhVN2ZyyQoFGjk8FMSlSm51d114Nz03huCqUaQhdLFNsi6vSVVfkutbPOndK9ymRR+boEHDrLW5KNcw1u7QEyVlnbx0cqog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dVE1kZ4D; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dVE1kZ4D"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so3400455e9.2
        for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 02:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755163559; x=1755768359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CE9jiANI0cz/l/cDSr25IEHnZ3OQaeUcRCYLlwFZaDU=;
        b=dVE1kZ4DMWvjobvT1UbW3o+gMQ71xDrIorQujvcxwL+bteea2tnhFv2zL1jsuSw7dA
         d22C3relist1PqWR8OdDQ0B3PS8qL5fifNTbjsmNyiBNtbdSKdYUEygKwnwfXgTqQhog
         mgrHyRMq8L2J2xdlUeFIlZQOW760vJliGPNvNnwIP2J9+TtMRfot9vje0YufpRBO9ilb
         dsh8vDl0e6EQsGlMWyG7Kb5FdZBQ4u6UZQdVZNQCBTtrDVc0Dc6dO1cAnjzRvlG9tNLI
         s72tNplwzYN01Upc8pWpmZcLx9kDNMPA1CnQWYcAVVa7R7ekUkYTIEF38LyN09tLG27y
         z1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163559; x=1755768359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CE9jiANI0cz/l/cDSr25IEHnZ3OQaeUcRCYLlwFZaDU=;
        b=IHHy7g1T41YeNjK+j+Vk4gAMr2E4zKgqbz8uK5zoaA1ASf8kCZWgjsqcwZ15ZiYTmG
         +S/F+8K4g54hn4E2S3W4XdK3sn6TVeycr0viOeItSxgmA7FNeEiC8NbeIXqf8Fo4LFr8
         Hmc5wVbtmfVZURJ0PUQnMTNj2ex9J4dUWSiq4EK6/eyl7yRkiOr/H0k7/LS8bW881emp
         nkNP6LHpQujBCkiDD5jGaRv1z0EM0ymvwau/z0yeBuVC8j4Gw7p62D+IqH5Ir7XZEBw1
         6B1hwTIgx+laGnGOz1Mp5th/rstpoGB4Matl25b8V1uaVU5unDLnWTEHuwmTbAKCklRe
         5uOw==
X-Forwarded-Encrypted: i=1; AJvYcCXujceST6PK66qgaOEJ2Xk65jGff5bmKGQuzP+Mu+Qutrz6wk/XO70i8gKcVsZ8xN4Llv+BPWrMVE0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNXI3YbatwQwCEAqR+icCrMYcYcGYY2fsHETUAsh0n3ZxvYvlj
	eScAO3cRmlK5e0VJPZlGj5m9KSagb7IbeDsoxQWKtbkCIt88xar75TMwnEPtopu82xfoQiiuy6H
	CnkU9
X-Gm-Gg: ASbGncu2f83Hq85gfp60IcIiUMLgn6Bl90u/jZ103EiYaKh3+6joIwVXTtqyu42wXpY
	YXxP9NuikzyE1felY26sh310rOAJDXSg84OroEJI0bQrw55IkL1tuX9tY0LAy1XroG65AH2J2HS
	yZAlPV0XLKwguQm/Xeku19ovF5t8NOoLd664lxBg9UzTTDa+u+xod/tgfMj/QU2YaGge8tr9n6a
	XqJK/t+ARRtoWO9LEGrZaT3zrE3/fL7lvD8SRvk3OjzjPenP/zTTRPeidC9xRjUcVXpE+M0pPnT
	gLjJ6IpUPEibaUc3rZSotibjzCpclEtMaXxebq77XM5LX5ioi99+vwkQXIqV2ipZwVcToxpydOR
	pRt9LYlYn/4x4j0XckVjjeEA3B0ePK2k=
X-Google-Smtp-Source: AGHT+IH3aH4s+NYnAVYfqbXpSrP1ix9p1QHXe6mSxBCrVv3jDGybUKX6JctDT3xmTAkJSTP0/FwOIA==
X-Received: by 2002:a05:600c:450e:b0:456:496:2100 with SMTP id 5b1f17b1804b1-45a1b6753a2mr19666565e9.31.1755163558609;
        Thu, 14 Aug 2025 02:25:58 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c76e9basm14536775e9.21.2025.08.14.02.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:25:58 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 10:25:23 +0100
Subject: [PATCH v7 01/12] arm64: sysreg: Add new PMSFCR_EL1 fields and
 PMSDSFR_EL1 register
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-perf-feat_spe_eft-v7-1-6a743f7fa259@linaro.org>
References: <20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org>
In-Reply-To: <20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Add new fields and register that are introduced for the features
FEAT_SPE_EFT (extended filtering) and FEAT_SPE_FDS (data source
filtering).

Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/sysreg | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 696ab1f32a67..b743fc8ffe5d 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2994,11 +2994,20 @@ Field	0	RND
 EndSysreg
 
 Sysreg	PMSFCR_EL1	3	0	9	9	4
-Res0	63:19
+Res0	63:53
+Field	52	SIMDm
+Field	51	FPm
+Field	50	STm
+Field	49	LDm
+Field	48	Bm
+Res0	47:21
+Field	20	SIMD
+Field	19	FP
 Field	18	ST
 Field	17	LD
 Field	16	B
-Res0	15:4
+Res0	15:5
+Field	4	FDS
 Field	3	FnE
 Field	2	FL
 Field	1	FT

-- 
2.34.1

