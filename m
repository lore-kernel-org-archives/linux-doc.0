Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9180F1ACED5
	for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 17:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742231298; cv=none; b=uv01DWuLHDYutE+/jWJ6f7klCxdprmnFBJftT4jVNJzhahmxtbi5aoNW8SsKshPaLb/iey7Ila3czgEPZWdA63mpVV1jl/aJyF+Hjd17Y1YwOvyL6tCRVRy6g6hftPuzjOF6t96xkd6X95+9bCac7YBHUSdSpdUSiECIox0kdo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742231298; c=relaxed/simple;
	bh=PGO9LR6+AbkkV+AvdmztnqTXaQaryBDcmq2YW6awKdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BXCtKuPrDZugZ7VQmVrAaLJIsEK7xzY0mvWkY0eGBg6WXxYBnWpMYCLCUbjzsUHK4yapny7wizb5xQU0bU/s1h0i8OkRwMDjx8ZrtYA8H8mGzcNGQp9I6tlVrXYVOgnwNSyiuTKrbAmjvqiTOiwI4zdW7lcOuheMZ//imdYxuww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=eiUoWQEJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="eiUoWQEJ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so24702545e9.3
        for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 10:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231295; x=1742836095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kTF+ccGFA3pCz5oiuUa/A8mZMPFTX0HIKuC7hxXfUI=;
        b=eiUoWQEJoM3/ZBL2/o27ia03zD1qjd0wldAO3SsbmVozrOH7FfIpntGc7lJkB00XSE
         dqtiXVIrYQ+QrKGVGo9bUWCXSABHMjh7M/zewxO3fk/W86V2KcUQKez4esncLD7wm6H9
         /W0W5Vd5xr0ToDDIk4b+PdrtycaXehKCtEOy73vPsJuJnE21Z9ndz+1unEjrNNaPc2Am
         HjoYmIWrCrnC2kp33csVdQEFrtnNH+37bDAuInps/LvQEJMkN8CSbUycXP0Pc+86V2R/
         +SOwHYybYeYVpLGkhtNGXWB+UEVlVMMYI+dg5YL9AWt7GaAdeIAQSTdGdzwrgOfjyog3
         oz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231295; x=1742836095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0kTF+ccGFA3pCz5oiuUa/A8mZMPFTX0HIKuC7hxXfUI=;
        b=dDUIX4IxyQ2k0cC81N/1s3kdlL9B3vT+IVylw7LK8/ghzRqj+Smv6hkvSJuvhwliOz
         2nBwcnwBwGBQQworx1q2I5yucRq/1KjXkfJunkPIe1+/dzQ3dT1R0wyLxb4OwaW1y4Md
         ykWFd57T+Q1rhHB5IAVAourQ3gcCCDhoEet4SW5dLhrYKVmA0tgMsp6/WXhfPp+7AHBq
         JlOuS+eXM2BFVZVo2/Rnk5gkFUnxbUdKk3av9XpCUQ7y5nyjoL/YdS2B9eSI+fmNa2Bi
         BlFAGfn+bPeraLyhjPBqFMWss+60bvJOnD24ePbkSb7+7qn5skKHcOxcZcX1K/vLr8BP
         tbLw==
X-Forwarded-Encrypted: i=1; AJvYcCUtmt+xIDSU5eY92BkhHqJ402sGfNZE+y6oRbxINiu7OaXmusYG0JFcU0TYpurpw8AyF+K0XsorUfY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdtw6YWYNq40FXZ5ELewZYzPOxJa2B6RqA0LVjIHLkxT8v1vyH
	jasReXh70ytXZSUSYvQYI++YlCAfXsvm3nXw6S4/8UjS+/Ldnp/XpUT+rfEzRQU=
X-Gm-Gg: ASbGncvMyHYGg305ARSbS2s7C3Tz8wW7Skw4xuC+cyQWhfjXmagPCw05iaQHHSf+5wY
	QImKWH5GzumxQK0iU1NW0XnGcl+QkyRH/GUDopBsSkgO+KH84zIzRixp1HkF7Ljhqc2dEYD3tNS
	BEz1gtnPb/h3rEqfhsr8HkLJ6IhTqNZ/w1l9Ikq5oIwTv9YaFjehtodBZUd0CiPM+QSfu9S/dqX
	GIuyrXl4RML3gfSvwpmTTVNz2ityqn2u/dfYXk80IjX5XgE9ykAAwoR+FgvixjPo+N/s3b4yVEv
	Kyo2crHNje7zq+EVjdEFsMAzJRB/whobru1me37ZAzhc3g==
X-Google-Smtp-Source: AGHT+IH4sjX9gto0lgEtyEEfUnQHUD379+GVWmuhA4p7t8yk18Gi55URplLVQo2Ek/+dIEHXcxDHKA==
X-Received: by 2002:a05:600c:314b:b0:43c:fbbf:7bf1 with SMTP id 5b1f17b1804b1-43d1ecd894fmr147448025e9.30.1742231294732;
        Mon, 17 Mar 2025 10:08:14 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:14 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 07/18] riscv: misaligned: use correct CONFIG_ ifdef for misaligned_access_speed
Date: Mon, 17 Mar 2025 18:06:13 +0100
Message-ID: <20250317170625.1142870-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/traps_misaligned.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 4584f2e1d39d..8175b3449b73 100644
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

