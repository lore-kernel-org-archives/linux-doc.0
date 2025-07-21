Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9D42D5A13
	for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 12:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753102454; cv=none; b=THKe6Qwxn0RCWIsTlVqdTTLnUPQxv76caglNHCnmDd4AavMwUo7uN6h8ll5VvttYPsJ9GmW064vE10V6AgaJXpjpmDkOl5wgnItFaDs/5/eflifh+ssV6kfafzzjqnZ+McBgxdLnAecsWgTrKFKtYOYHx9JMsAIkZaBp4YZA0d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753102454; c=relaxed/simple;
	bh=isf38v+uTebHr/0KouGZLHu/zXcyClycP3zhjgiVfZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sb9r9EU7rUEapS7dm5Bldi3zjXABx5p/j/F1J7uz+mievSWRHLu3K5CoUfypdk5OcrhGLL7mrMiHE4p6CfpOfQIiab5Mha7h7NDTuzTr5/b8uYERM/fjBwiC/FpJk2v+u6u9YHDFB8/oxQkRqroug+MqmRnzPyH0Bi81Nn9A6Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pavz5nLi; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pavz5nLi"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d3f72391so43601525e9.3
        for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 05:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753102451; x=1753707251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpkxTGRvQkor5ThWfPSfZfarMFvM1/zI/E944bIEcHE=;
        b=Pavz5nLi/m89wXI/5sV/yjT8EkPY3VE2+k6BAW7xgzmKA1F+6CdGe5/DmswysgX2Fb
         D+pj6s1k7OeGItrLqqvRNiUmMUY9uaVr4dcHB2xb71A0UIOZAO5aYxeqBF4SHtN2Hs4I
         8DfUs1XHL7og2RAZxRaBZMMK5gN4Iat4AaJTmBPXBWafhNJCLkDbPBlH7MF+dnJS6Ryc
         Y0d+k8s1/IjDUSxquFm+ckydM0Xkl43T42yCfG7Rgk0MnsJQsQacVRzxs2pvrFmLF6xF
         d/J/Am5pghV+4AvVFk3C+VcMkrxNbIsefU1kRV7LhfWW7CJuLKMAgszRc5WZCenPCPGW
         DsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753102451; x=1753707251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpkxTGRvQkor5ThWfPSfZfarMFvM1/zI/E944bIEcHE=;
        b=totJ3O7v2PBPnhr3TwA4nkXknYSc648tLzSt3+6j75jazlu88ksKiPcFs2TLKFPi9W
         6U8GOHV9YF4emCSW0fMUrT4YB424AirMv7J1UpPHTEDBDLOATIGJfU5T9nii05Ia0DOw
         rWW9t8TWtaEXwfjyccu2OwrEDiJ9mxfL5KHDzYbgtwCj6DSI8mj9/7ZhUwSmSizYWVpS
         D8lO/BHU0U1pV1E7+PVizvRxe+ITLJIYX25+nim4gvurKhMrMUlfj8gQb5HAO3+/vaRX
         kRUX0R7Un8lKCU6liY1xOo2rLS+Xa9QCsZNSl9R2K/hAQiY9NW3Bqa07hwBixEts/4Ws
         5+lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhbFg7oJsNnCJVGiL92T6Kd6EFP/uQYKgoMsFkypAQRJ29O2RMeaWClT56208gzUCwUkpazOY3sAc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+YQluMagS2uUZiPPERC7Ze79UW3BVigEGE0khCUEK4o+TcZFW
	ynYtAmE9CdYA0x0grDdSF/9sUl0pDlyYtp/ctfNRCNuHT3yHm6RMrkS+0iDB2U+NHmCS0EoVEGb
	f5hfjIpI=
X-Gm-Gg: ASbGncvm4tBS2CgMmIageKYFHR5Aa0fBMlvwfn5PpFOalZHl4pQ0bTFlnaEPsh7P33b
	KyHluDkxntPTZ3fSGmsGWxIYf1o20rymsJbKx6IHu+l3J0ctVfXFEp5mAQSmpGZe+vAQg9qASB+
	UdLTmCLHxDcAhdZ9e8w/Ea+f2YkgImBor6fwXgcuTXaHqbTid5YfLVAavdiVWrlQ7/JsGD/yZZW
	Nn4/yEI0tJYWfr4p6Bm+izC9VYXAwEUS1s8ezqHGhZRHoh/5wxoKkRJMNq/IQvApEy+pFul8Kk3
	JTdRV5m4dxnK9e379YG2oCKROOkTnb1d4SbpdeV3FpC16L46j/lTix6CO9icXJREcMzlca56FjA
	tztZURjqbrFBWdHC0V/l3TF1kjSq7B2CGHIaUSJyCPQ==
X-Google-Smtp-Source: AGHT+IEJhlbX9r690UiEzzeJ/Kdt8gvdkx0yoLLcBqhw5wdAqCeDmj5h8tFS/4SfvpSlDeFZRRIY/w==
X-Received: by 2002:a05:600c:a009:b0:456:13d8:d141 with SMTP id 5b1f17b1804b1-456389d8690mr124492795e9.27.1753102451282;
        Mon, 21 Jul 2025 05:54:11 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b75de26sm98995225e9.33.2025.07.21.05.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 05:54:10 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 13:53:32 +0100
Subject: [PATCH v4 01/12] arm64: sysreg: Add new PMSFCR_EL1 fields and
 PMSDSFR_EL1 register
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v4-1-0a527410f8fd@linaro.org>
References: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
In-Reply-To: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
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
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, Leo Yan <leo.yan@arm.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Add new fields and register that are introduced for the features
FEAT_SPE_EFT (extended filtering) and FEAT_SPE_FDS (data source
filtering).

Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/sysreg | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8a8cf6874298..2e897d8a4040 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2859,11 +2859,20 @@ Field	0	RND
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

