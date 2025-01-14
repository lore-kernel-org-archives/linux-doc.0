Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E41C23026F
	for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 02:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736821221; cv=none; b=nN3mN9/2B8+wAgOYsaJ6snzo1+IcdGalyvSsgM3D2bwL9j22auC/5zFZMnIWlbyPoTkQykXK08yOGQ1EzvoDpeE1NHQUoflzVChXuJWlvE35DmknL84xhsMisR7OyydFpnFdDCPF6aXnUuCPDDMjkrQuH3zoOJEv8nvYF3JJ7ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736821221; c=relaxed/simple;
	bh=G+K9MvSpAIpwDwMmunI0YSdJnqQJGTJZcC3ONEVxX60=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YdrO2aPnykfQsO7LvtIeJkXMbM3UMfWp4SCqA3HJ5yc4+YGTjg2l+xVzd/WStKQWZZ4afrWaGrdvRQEOP6x8D/PZFyaXeeHo2HP5c1y1KRGOzYP8Wyk9rQbjO6STJRbYEaUG7wrmItgJ1TFWrYFHXh+l3FO+FQJMHO4u00/uEE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=T7jugol4; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="T7jugol4"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ef714374c0so7455717a91.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 18:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736821219; x=1737426019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+lHU8O3OzxopxeMRFW7AZqN84liiT6mDTuuIRoGMNs=;
        b=T7jugol4+jHH7M61R0zk8IPHrvXHfAO96tz92v77b2NRhL9Cx3/fm4816wrfPNSTPs
         J7xv8v9cJA60cXwdlx+FEB0VI9HOK/WFB8iL0G3eHqLSxSrFkv2LiCN3ks60oBvsmrwB
         mSNNluRggm0c13zeWvaoED723+QtNG6tVshP6n19xwZ2qH101Z9jGjUU8L2AHaShSLTj
         boEELjt8TmwsE2haWON3Exr5gFI03E/M5XR6WEHgq7U4bbxFq1GsRI7U1UnLx+MR8JBt
         Nbwd6nv9Mf8XSRW5PjK7PM7B2dxGA02wu5/T7+wgvU0AIEA+Um9aoaetAmQ9f9SLwZbf
         x1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736821219; x=1737426019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+lHU8O3OzxopxeMRFW7AZqN84liiT6mDTuuIRoGMNs=;
        b=fCKw+K0mngz0bui7Pop7wBBV/nTE+zaRlZTgiIG1LWr3iLFxPORTUOdMrsdZ046RGL
         EfCzisGcDVZSe7O4ik7coTLZ5gVPdr4nawuqhUP+xgx8FtLbelXrNXKMfY/wN9RDnzsA
         Tr31X7sOEyv2944jJtBPI7TulHT5j2pDRv96TKLn0r/4CFtlCiXwoLIna1t8WFuSR5eV
         m2Oh/Ir/COZ5KtqlrpD0Dlfm6Zb4aYBsiJq3WK3zT3wGT9yG7fdfUfJQFD9qP7YR5UDl
         zTpQ71nOQK6UfnbtdX+iBdCwfjTsIeJvMv1uYOjOGcwf6YX22N4QNC0v5us+wjH7Pg6K
         7WiA==
X-Forwarded-Encrypted: i=1; AJvYcCW28AmKcPVnGORvT8IDgKIwd3gaJZVFtpUueVrMPlwc82BXHmrL0LhiDQNH66UahJvMBblL84y4Koo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ktCkTPoozf/AMtQKctg0wweoIuN9peNc1plAAgAMyx15BS/E
	IWRuMBDn31IQI0ivWQRLgjebOVsL/snDD/XzQj78fqRmh+r92FrSDk8+/h17Op4=
X-Gm-Gg: ASbGncsiwNejSpDqeVifj5q8qUUf1Tq5XNbd93a8aX9/SzU7SUiVxlGutpaxJDnq40J
	0g+OksZdlD8LxkXnb5v7wektwRIOgcCIcLzVxrLSeHiry1R8RTgj5Sn1p4Y4ugeND41olsY03UW
	su3VT2HVaEffI6rA5CVofy+zOLRUnO3tJe9a+9ObxOmY1XzH7dylPwQb2ghFurccbTcVLfE4wDO
	zs7XmuhRShwrbIA91A/XSnZ1omOMShQ1FI2QhaQ2DHZUlE9DivZA4/5inuDr/5LWIrVD2McAqs2
	qES24rxq2CpTSHM=
X-Google-Smtp-Source: AGHT+IEpY8vThDWOwMPEtXiB5G1hpEHBvYVE1WuJdpEosAMMRWGkN1c3leoGAuLEHJ1SaSfa2zx7OQ==
X-Received: by 2002:a17:90a:d448:b0:2ee:c30f:33c9 with SMTP id 98e67ed59e1d1-2f55838d0eamr27670389a91.14.1736821219527;
        Mon, 13 Jan 2025 18:20:19 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f217b38sm58948065ad.145.2025.01.13.18.20.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jan 2025 18:20:19 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	andybnac@gmail.com,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	conor.dooley@microchip.com,
	conor@kernel.org,
	corbet@lwn.net,
	cuiyunhui@bytedance.com,
	evan@rivosinc.com,
	jesse@rivosinc.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	shuah@kernel.org
Subject: [PATCH v4 1/3] RISC-V: Enable cbo.clean/flush in usermode
Date: Tue, 14 Jan 2025 10:19:34 +0800
Message-Id: <20250114021936.17234-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250114021936.17234-1-cuiyunhui@bytedance.com>
References: <20250114021936.17234-1-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling cbo.clean and cbo.flush in user mode makes it more
convenient to manage the cache state and achieve better performance.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/cpufeature.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c0916ed318c2..60d180b98f52 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -30,6 +30,7 @@
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
 static bool any_cpu_has_zicboz;
+static bool any_cpu_has_zicbom;
 
 unsigned long elf_hwcap __read_mostly;
 
@@ -87,6 +88,8 @@ static int riscv_ext_zicbom_validate(const struct riscv_isa_ext_data *data,
 		pr_err("Zicbom disabled as cbom-block-size present, but is not a power-of-2\n");
 		return -EINVAL;
 	}
+
+	any_cpu_has_zicbom = true;
 	return 0;
 }
 
@@ -944,6 +947,11 @@ void __init riscv_user_isa_enable(void)
 		current->thread.envcfg |= ENVCFG_CBZE;
 	else if (any_cpu_has_zicboz)
 		pr_warn("Zicboz disabled as it is unavailable on some harts\n");
+
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOM))
+		current->thread.envcfg |= ENVCFG_CBCFE;
+	else if (any_cpu_has_zicbom)
+		pr_warn("Zicbom disabled as it is unavailable on some harts\n");
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
-- 
2.39.2

