Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301592741D1
	for <linux-doc@vger.kernel.org>; Fri,  8 Aug 2025 11:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754652229; cv=none; b=kfakzhp/4C1dpAuMNUKbmfqNjM53tGt9nqfXewAcCudL/JwpRO02j44Dz9ONrmpMMbucRSYIRQBe9bynQ9xf/HToNL06N7MsY7V/+AVLjjJupBYZ0BpXeuxd7BHv+HNEE0vf94rSO/tO5AYmzFe7zDRR/SDt1Iqus0bAUQJ+dY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754652229; c=relaxed/simple;
	bh=51vdVVrDG2YLBYS3Pf8NCD6LBuxxPOs+8V116Ol8P34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FcDx+EYeV3tl0OQ7NaELsbYQ0xrS9fF4ZvZDRMneiZqHu9qW//ICt7ryKKLj4/OHgclA6YeTSG7s9TTQL3N2m10C5pFOZqC7yE+TIZMRwkrBqGrOqMlES0I5QADfslnoSwnHBvk6l6yEhKWtB/sNRta9hPQWDxfMGRG7mEznRKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=omJWWZUz; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="omJWWZUz"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b7910123a0so1778448f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 08 Aug 2025 04:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754652225; x=1755257025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CE9jiANI0cz/l/cDSr25IEHnZ3OQaeUcRCYLlwFZaDU=;
        b=omJWWZUzdcFut4gg0WYJ+7sTVTNsy45LpZZYfw9yGhUcPO02RcfstVFxNLL7WnUuxM
         TsZAk2a6ck0VKlFRqp2N00Dipo9HlnD7hqve8iZpZ3uFJRkwpEZW1gUP0THmSoMIqINv
         q5Exza0HwePNCIjnoBfvZSfy3hDMfNpcvCvfulzLkiVT9mnNs9AukNg67RFcm2yc5tNS
         F5ZunCkDvQO0eL3dEYkBDee04z+cWvDyZWV9W7CAPO72P+3SpiollnpCoc4akehWQkXH
         xrpyHF+BzP+ZUPHSm+Q5PvX2ag1GkIOZ/+WypxXwu0drJz9xYLYj8vVZr8vhWJUZP4y+
         r7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652225; x=1755257025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CE9jiANI0cz/l/cDSr25IEHnZ3OQaeUcRCYLlwFZaDU=;
        b=b00z7d9iW2zHK+uaq2Quv0OXXG2BZ4CRphcXYsZ2pxSzvERKZTanEBIwU6tVOSV30P
         +HTCqqcXbEOw0t4SfEx96zO6GkGy32GHL1aFDmE4MGk7VnW9OhiULjYxII+HeXCC13zD
         Ni6nFJcmBHtA3bStw4gO91bi7K0KeHDlR8zoef1Nx14Grilt3t1LgPkiXyoeqHPZexsb
         GSkCQoHYHMEhc1maDQz0z920WdnpEyGnaNtlahK2A0WLzpSu80wSlYtvivftZAboZxT+
         Bvoi7/6Pk18MVXGDCk9TMR9Dq0th6IIXW63llM5oX89TdUGf0d9po+qM6NWDIvURdPMg
         +KbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9kMR6u4l9/+b7utPknyTch9Fvol8lCsiMIv95ytgwkZpDpxVAIoKtnyMM+HJVuUVE4N0TtWcXZfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YydJGTPdfa/UAaVMn9+TqKTQldJ7itO0fg5xH0aGFkEBgUIXuHD
	YTYUEijP6qUW7qc5FhGv5Az/f6neDOMKkxSy9VqHnRKhP2p2mqYDLeFKA0UwiYBOfFA=
X-Gm-Gg: ASbGncuZfXuwtfFQrRU0ZZupcJcODi++9Yu8cfggi2cvP9zQZuOvcHexlbja142E2xt
	GpxjfruUwgX8Yt5AsWRUpHNaMPhxeBKcww5iSOvCEEm/XzTBR7T0bwrpeSmHxT3MabtGvc1SLKv
	N803qv16fm/A0l2VWmljVjz8kMrcbQpOPgUpoSIZiXsaiaNhFNhIW9LcNTux6RZMn9MF63YkIVz
	Oo5jFh4JD1xN5UFvnZ2mQwo8k7G+0F8n0yeyXpHUqVJJ6YEH7sqcEFKi9E6jC1yb/MoS14O21+z
	fWpOOAyA2k25A03OLen57eAbMkXO5LKkraYusSyibVkWMog9Wk7pjhMYjWRnp0Uo3ZYHRMeXFNp
	/PowrmiOcy3Wt/hQ0K5jwREGMFfPLy/s=
X-Google-Smtp-Source: AGHT+IFB5Rhb7EHeEiI/ams6KhI9UuNHFiZtaUNiO/aRfCno9CNSrWB+oIrGqone/4N7uev3L98hjA==
X-Received: by 2002:a05:6000:2083:b0:3b8:d493:31f4 with SMTP id ffacd0b85a97d-3b900b83c8bmr1969857f8f.48.1754652225356;
        Fri, 08 Aug 2025 04:23:45 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45923c34af8sm233482635e9.24.2025.08.08.04.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 04:23:44 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 08 Aug 2025 12:22:58 +0100
Subject: [PATCH v6 01/12] arm64: sysreg: Add new PMSFCR_EL1 fields and
 PMSDSFR_EL1 register
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-james-perf-feat_spe_eft-v6-1-6daf498578c8@linaro.org>
References: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
In-Reply-To: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
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

