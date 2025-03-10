Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C6C22DFA5
	for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 15:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741619619; cv=none; b=XTZXdXyiNreZUYS/alxCAlrlFwss2hybcEMn4Ndr7mQ5DLXoIR1QD6/pSr1JMO6KIUVg1pW3edGh63FK51x/3yxPibzO5x1IdcJLb0r4F8mhMu8DBcx9ugC8RLOHzWU37mdJWx+CK5K2/1FkpWYmt6aOe7OMQ0Puaz0wYAA+3to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741619619; c=relaxed/simple;
	bh=G0bMb29ZpgJV0/CkJZpzg+0z8//qkfB6ATS+lahL2BQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CR25K85w3N2mozImUMIkQbFqIA1KQ5PIMr946ZPfvzDTCXbZCAaLP/gEF5P9HpdDiOGtGI+sLPZTamlQ8u4BCGFDyBvxpI8Euc4n46wAENth/JKKhLYATiJqIudCau/CR7nrAnXybplbRztA5SkvRkQlGSRJJ7yqridwI7WVTdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=fi99kbZp; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="fi99kbZp"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22334203781so96324005ad.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 08:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619617; x=1742224417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Radg/O1kYDcS8p0IZNGBH2Vna601zEl7dWErY3x7IKQ=;
        b=fi99kbZpHioLtGi82zxDgaCnhZ0CNWGyWwVuW/RajEZPlNGRK4ot6wphvsUusWBGFj
         iTnzUjn2YnQ5AzoepGwOY/BMI1eE/ihbWpPemAhi8g3tK8PCW7/V480KhZmvtAqXyRJW
         QDxhEoV4nMX8DtZq8+8/O3ErEDtDkKf+IbHy2V8SZ83NGd8tOesgL9o7YVJY+vhZSLq+
         YN9exj9JHUDH0I5PKAUQ69yPktuR+CuGVMTL227KLso44YD9git4DYZMdrL1lOPXiiTT
         hd4Z6y6OKDamDUF3Kdry+2LA16OF9C2/pBXDAW2Mch3d4k4ZkbNNsXLLh2tSkj5Nwn5B
         S80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619617; x=1742224417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Radg/O1kYDcS8p0IZNGBH2Vna601zEl7dWErY3x7IKQ=;
        b=Z65mrwoOxGloPTVuN4oq4aFEx6QrjdWXfhqnvpZf9b6FU1ECOVGsZythkprtdGi2Gd
         jezvtzB8sreOvOJmoO/uY60/aykfjv7g4zY0c/KCRaor/uAg6c5UoD/Y1tUxxQrY6B4U
         zZdgphHMnovPZ0JuyfUSfNbjmwAjuRFIc+KcROLBHKxLgNyzzjlKO6Uy9bIqtR6U4PIQ
         H967JERQgmIWr0+5vcaybF0CJ4peUXpMMX2wEVvn+TSyrwE1FL+MUUPKU+Ux5ckRYcMM
         0nQoSIPatkB3tEy3y7P1sgfam2ul9hXs4k3AeJXAJ7sSxlFryUYunTHEzwCACb+zQ7/t
         4TuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/wvn/5A+Jj4XDTgpL30gZdTWX+YmnMoZlfxW/1Rk6s0QlSt4V3Y5idqk7Shgy6vtwa7YRVKImCdM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt+hkpYmqDHjNyIWppFBFLcDqsnVm+oEwPyXRhFCiTB2ctZXXt
	WtJno5yItfjWdqGI48sq+RTdjXAyy3Ix+HrbchngJsJtkWygpFCLbsWXmsGlfOo=
X-Gm-Gg: ASbGnctmKvNuv4szRO5HLGqc4MZfh9Nd08NSrc9sjDCItrbmTkdeGA2apsjwhH/vxhU
	qlmCmv0jqcuLm6Zwkwv5mGzk6pkF0agVkZ+p84ZLCdGCe/rvOXrGCxn2c78xAdiEall3alj4ew8
	FxxuOqYKNHxcLM6pwJQw2ZSKoPKdj4UCcglZM+Cb55oS0cw3TN+NnBEksdkbQp0/uDXE9KjsxtG
	X9Tg073IxGt6l+2ud47bPgj3UteFc/hZ4lSAco4N/6LpYkg+XrUMRnoiJ49KAan31uWVmjOLRJW
	WXnMWumAl5Z5CT5wIlLQo192w6cjm3Vy2vkrWRUfGo868w==
X-Google-Smtp-Source: AGHT+IFYtJx1zpZXoyRZ/KHJTP5G1HNeErNj7hP1Uj5JhhNtVjlp1IKO2nyoOwTegiQflbbotJG7Sw==
X-Received: by 2002:a17:903:2308:b0:215:58be:334e with SMTP id d9443c01a7336-224628603d2mr147459315ad.10.1741619617154;
        Mon, 10 Mar 2025 08:13:37 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:13:36 -0700 (PDT)
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
Subject: [PATCH v3 06/17] riscv: misaligned: use correct CONFIG_ ifdef for misaligned_access_speed
Date: Mon, 10 Mar 2025 16:12:13 +0100
Message-ID: <20250310151229.2365992-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
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
index ffac424faa88..7fe25adf2539 100644
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

