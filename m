Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBD92C08B1
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 16:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759508838; cv=none; b=U7Go3ypLb2RcggN+ZKMig5Z1CJMjMuswgAQn8ZU7ExoKEA0CJmu0oDldlgQkiT2Ls73KvNq4i4+/4US2JAswp9Qas98wUAIyYelaqaCBe+/F0uBA7P6Mxx3HyM2But5ZUNAjy32MHz+W80wKGiKyatNzoU+FNqsq12ViW3xXD9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759508838; c=relaxed/simple;
	bh=A0seJZUqD56+LqaPGls9QqXRtY97r8c7RYbr7Ueh1kU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XZ675X9Mk2vm3KOMwfl2DLyH8MZAQf7EJnhWdUU9je8UIvgZwFEy+oPwHd9BxmXXKIbXPey3k69dxFY3W9oRWONIEB8ywv0XKVEHmWgfq1S0FcQ2mQXcNWnc7nFDNVkK9CuGwFWjf07lUQ0UZI3PUFX7qnBpBMD/gaLggqc36CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDBdF+Bm; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDBdF+Bm"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b58445361e8so3140769a12.0
        for <linux-doc@vger.kernel.org>; Fri, 03 Oct 2025 09:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759508836; x=1760113636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CU1ubv9QFqhwCX/UJW2MkuGJ8oe42GWkgn/905N8tto=;
        b=VDBdF+BmhpAWPAZJ7jIgcxdRnOIxwHmpfmWYxD5+iQvrBm2BiLg9I16IMfwec0URsN
         5fvlJjUsNOogjj42AyW424lW6OiQc5YbgRpXPqXE1LQ/roYtF5yvqoUfrxOJkbXpHFaN
         YhVHj1rmDCJPUGaV3I7rrQsC4CUTrd1U7IOaMFQX4+n148Mwkg8onieDgp0VuuHw8Msm
         kkN90NoyoFi+I2WsZeb2qnS0QsL/YeCGbaeCb4YyxjqnmRp1ax3kuFDb5D5UXQYYBw+S
         OFqBQY0jB4aV+il3OLzUeeWZ4+auX8gO4ImBmR81hJzvrBbA09x6udDKAUavDHTvi3ul
         EH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759508836; x=1760113636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CU1ubv9QFqhwCX/UJW2MkuGJ8oe42GWkgn/905N8tto=;
        b=AZJcScHJQ3go6CaQq7yiu/K+CCIDcktGmEfg5i37eiHOwaXrmtuRydyk2IRPEcfo25
         XQfJXjGGwrSSO+5BDo1F+pbgfBJIQ5goXW7uGmebK4BNBCUXroArHU0AHUPNJR0EKs2K
         nyuDOKcTGDJCs8RvRtPgCjcJ/mCNBVEtundzu3+rkKNXpcXDKeEfUa0ME25MDz7vTset
         uy2ugxjraOpjUVp7BO+gUnuo/Pk/lVjS/TUg70lGb9Fop2N74Bu9oWut4PwP0mXXwUwY
         AHyliPsuD2gTy6Ure+R10dFZqj3iiIEWwT4Qv9eJWqQcEw+9gEuxrBXTBYiBI4AhErPK
         3uXg==
X-Forwarded-Encrypted: i=1; AJvYcCWKJD/RdlwOu2odkQ8kRrrhpNkPb/MB4k2OTFiAPy2L05mNHKLFKQEE1J7qJYQ/mcq88NfBc8BB3M0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3+TkJbDVaG6gExuRieANsit3nluajggVKFJhrFulMFzC4tAYG
	xz2x272zPRhjH/FHA0mvOWmzcKzvIirHvOMbWsXqMAusHDYMHfotJ8+t
X-Gm-Gg: ASbGncsuhWWZPemgRsYUOzlRhZW6VoiQR/T+IalZsY8SXmFNw2Hl13UozA1mmlQ+9cK
	KHKvMC5FsCHe2O/2mnCuujRe+QmW3GTuhBRa8dceHDErOtT1hoU9lG6VVZX8AL/qvKUUn3PLHn8
	1uz3kCK/VLPsAEx8SBx7OgZnIy2oxBoxxua0GRUfVLEQRWnLc2n0wyc2Z9NETp5yExupl3IcLx0
	hRih/UQTVIkrBa3RTL9Hq27RII34gydgUMvBMiI9zXNDRvV2qd5EJCSQPeXkX0Mru4fsILIarcz
	Z7cQ9WWEEMGEwihSZEjQX12o4n5mXa554ozqcx7Jz0OBknhvK0QrUPQVVdmatKw2NxjDHVCaUbU
	n+VaXbCZLl9SclY6zHwN02IMNdPb1liTggF6D2Cf6OQV5iOWj3eZ6C9rDJAuqfH2zBopm9obf+z
	XU4N7XX1a0OnY=
X-Google-Smtp-Source: AGHT+IE6rDopDalQuanfI6ZfiLOsAMLpprtvoctAcjUSyZ5ja4KsaqHXynMClqHNTWE1f02Amnq3hQ==
X-Received: by 2002:a17:903:1249:b0:265:e815:fcdf with SMTP id d9443c01a7336-28e8d0a1a55mr93324495ad.17.1759508836311;
        Fri, 03 Oct 2025 09:27:16 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6ff0dddsm8416787a91.18.2025.10.03.09.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 09:27:15 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: 2023002089@link.tyut.edu.cn,
	corbet@lwn.net,
	rafael.j.wysocki@intel.com,
	superm1@kernel.org,
	viresh.kumar@linaro.org,
	qyousef@layalina.io,
	zhanjie9@hisilicon.com
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: [PATCH 1/2] docs/zh_CN: Fix malformed table
Date: Fri,  3 Oct 2025 21:56:10 +0530
Message-ID: <20251003162626.6737-2-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003162626.6737-1-krishnagopi487@gmail.com>
References: <20251003162626.6737-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Running "make htmldocs" generates the following build error
in zh_CN/cpu-freq/cpu-drivers.rst:

Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst:109: ERROR: Malformed table.

Fix the table formatting to resolve the error.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst b/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
index 8238f4c6e4f5..2d5e84d8e58d 100644
--- a/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
+++ b/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
@@ -112,7 +112,7 @@ CPUfreq核心层注册一个cpufreq_driver结构体。
 |                                   |                                      |
 +-----------------------------------+--------------------------------------+
 |policy->cpuinfo.transition_latency | CPU在两个频率之间切换所需的时间，以  |
-|                                   | 纳秒为单位                    |
+|                                   | 纳秒为单位                           |
 |                                   |                                      |
 +-----------------------------------+--------------------------------------+
 |policy->cur                        | 该CPU当前的工作频率(如适用)          |
-- 
2.43.0

