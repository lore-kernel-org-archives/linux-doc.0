Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68F92505A2
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 21:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739223373; cv=none; b=iA68igLGbWjrpyp04gq+C0wTGTabtlb6liKk/9t2PmhjWHhvVtH+ZiICSZMyKwH6K4+LweNFLKWVrbpe87MwlIXRAuF1IRcokKJeL9sYJ+C5uCN9q9SxZyqV11roUdPTeLao7aeWfFsiSSc7dozBEqC+l54hGUQprHLNfe0h9k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739223373; c=relaxed/simple;
	bh=xTCgvoJ3M6PEdl0c4FHPJfLCd4JS4VwrygYqNk3pK44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I8mCBEar1eEtmKpAaca0jvmhamC/2BJKStSvovcDpL0wIpiF8AozHybqCh7+FfcWykT9M/nHrvndF5TKOzsA4vY3q7Lvg2u1A/d3CiyVreuhOQRllwv9uLkN5oHF1yxG+jA/qDm6pi9fIHe7Qy7gFJ+Wc0fK94OXrg6FNNJHwMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Zv2LhLjy; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Zv2LhLjy"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38dd93a6f0aso1442366f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 13:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223369; x=1739828169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KnDLY3kffZnCGFmPEexJUKlO/NVt183lUvBn/SEPO0=;
        b=Zv2LhLjy5DAB037KYpl74pELKR5wTjg5ENN3HT1W+gGDXFx7OCfG7HPhKEf6XSXSPR
         Vfu2bnfs4qylZjpMWp5LOmcReuKpeZlliX1s/+He0EfXpPBCdYPR0VKv/7vlRO73Qtxw
         fUwtiklYFaT6npCYnUeAVubZEwg4ncJjHGfjPT1VcpE+v6kSfSpusxsINFiv47wOEP2v
         vA6VlnsHSw621d9Qy2icftkD843LTtslRnaVJ6bIAzbwOupblO9v5fuwJ44gntnqkqkh
         d8C5K23FshLqMfl/e+RfgCxBHGLtuO89EOcZE5jfsPYEw34TMnev5kH/7+wiCI9cDFHg
         scWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223369; x=1739828169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8KnDLY3kffZnCGFmPEexJUKlO/NVt183lUvBn/SEPO0=;
        b=kv0pzbBrhKJ2LMhLxLaRvRoW2TLdoqAWcGoGqRgifu8sttAgDKXRIEFgoNZpFp+7B3
         UF20YyzmUUUc6BMa0Z0xLRDLrqir3tsYGBtxbC98Xs5xfQDdIXVPAmbeq0rK6No5NtvI
         MWT7bXetv9IoVmT87jQAVDppbE+mSBtNCh5hKZuX1k2v3Yq5QKPRmh1SoNLtAOXtNBS8
         lCp99Ug4JX/cWmRaQNdZ3vuBLV2KmvFeA5PSFrqiUusZYp944qnJEggDLwXfbpphBwX8
         qApwnC4CIA9mnA++OW0l2iviWpa6qeyDMQUTN2HhA/Lcxw6htWKC0swunhEJ+WOpiZyu
         LaTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH1X8/ykSuyLod6uljIHxdsuDlMMHM0O/GpSsaqHZW/cUWDwpnjboy2HQG8awe5o0iC/46jkcZHLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEQt7uF750RStVml8sGPJrL7NzVtaj1ZekXEp61N8Sfhlz6jfg
	AoqVsFFnuS1GfIGXcqCRmPEACGjsTJVz35pIZWbNODiaNCrsJr5V4yAvINQ6DdY=
X-Gm-Gg: ASbGncsHUJWSDtQadtOHTqqRx2C/SLCRaYePAJ+08KDxfaPdYau6qhFHkFDzNuJBdoc
	zpc5Jt4c6HMy2DHNxM0V08xBSO0hZ6fDxI4sL8MD1Oc7L2DZAnTKXkI7YMEXlpe8CaqvWejuX7I
	epwYHfZAHf4acbFaxupH+yA/8bd/wdk45+HZ0iGHFjqRN7dDje2knYXij8jLyD5TtW0fpFT/I0F
	0Jk4s5dHKIi8LIav2NVCi6MORDR0IYtGSmeefROQQGM7bRXZFV6jOWg3RD0iJ/zu8U1UtiZHmB1
	aGDXOpYf2WWHzIV5
X-Google-Smtp-Source: AGHT+IEE/P9vsQR8DRZBtCxEbVJartmy037BYwcdFf30+Y++Re0XNH996Xl3DeOOL//RGxNKuAEJ9g==
X-Received: by 2002:a05:6000:1562:b0:38d:da11:df3c with SMTP id ffacd0b85a97d-38dda11e134mr7050032f8f.48.1739223368915;
        Mon, 10 Feb 2025 13:36:08 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:08 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 04/15] riscv: misaligned: use correct CONFIG_ ifdef for misaligned_access_speed
Date: Mon, 10 Feb 2025 22:35:37 +0100
Message-ID: <20250210213549.1867704-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

misaligned_access_speed is defined under CONFIG_RISCV_SCALAR_MISALIGNED
but was used under CONFIG_RISCV_PROBE_UNALIGNED_ACCESS. Fix that by
using the correct config option.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/traps_misaligned.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index eb9157e3af73..57ded7e74dd8 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -362,7 +362,7 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
 
 	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
 
-#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
+#ifdef CONFIG_RISCV_SCALAR_MISALIGNED
 	*this_cpu_ptr(&misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED;
 #endif
 
-- 
2.47.2

