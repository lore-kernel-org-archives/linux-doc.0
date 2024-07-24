Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD9916B722
	for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 18:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721846194; cv=none; b=oIzURN5bcMuuXZBaRxZicBLR4kmBw+mp2gtG0amf3/XjqTEepJ7/i51vnTZX5Xk0oKyhWTU6Epm3qWfo255ohKSNpsArvBq0AAxcaTp+x4ok+z54OoPQyKUZSb1QICxvIstZ1XpjvpOGtfmDIHMjPMy9RqeOm7a8OYxvM+eC8Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721846194; c=relaxed/simple;
	bh=dohPRbV7vy0l44QBGn2HbiRJqVCF1yGFMLgfxVtngQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lXQ6ZhwULPs4UUGmmmSRQzxpAsShVI/ESXddU9WEkXP5z0rWD2JGxp7GiboEqySJLeMxi3bFzApSySm0nO/fhsYIrreuI9HsM/Q57jp+M7nIzzsWan91yanmmtbBfYoCG6983YPXs/1xWqXYzzKPyfiUxestemkZ+1oh7kKpgZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=sDj8P1J+; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="sDj8P1J+"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fc52394c92so896925ad.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 11:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721846192; x=1722450992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T446nGf9VV23fAkbt86c2AUWhCfShpS9fTRumPDCq6I=;
        b=sDj8P1J+GzCH584Pw10F8SZeo5OE1FnicTyVIMbST2sINr94Y4A+y8u+w/ToipRz8z
         QigKaBnVO66Bbuva2N9adbWV4K9HzDxCC/fh8FH8xKtGuopMlBjkrcvUvFKsAokTfU4B
         I6wF5bnhA+Y4YlBB5m7FMX68Re14KzBDiEPdfsvAteHzwpeUGK23pcihr6nNDFNKJ+f9
         d6DHrsAXucBRSyYgVOzOsnNwVNvjQBX+8PntlAsUjx6R5nOyfIgFIK8jHAw1AUOowUCT
         uoIV8dq5uobrTImOJSx9fCkkqPcVt2OICYuM4jC5RV1AxscF/aMjldIwbwizsBx86cuo
         zNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721846192; x=1722450992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T446nGf9VV23fAkbt86c2AUWhCfShpS9fTRumPDCq6I=;
        b=MW1j2xUPzSzwgJguN3pOomkKH85yvsD9nflisxzWSbKj1T2bBdqji00PmmvugQBceV
         nzm+SLrkhOzkYkzySumRtK2PdcGglnh7sjjkWzs4JlJNVywoYe7OR6PZtEQ09ngNcgh2
         4J22zPz+8FDWX8WBhUtDMBmy27wKXUtwOfb++AhS5y+vmtyuWzaPGa6WCgUDDp/IdxGz
         Il5K8qFqKlWLtoKTF59fCsIbSBf0azZZ5tUHLK/U5pmF061lZN7O0sJdbNm0jbe9pWtC
         i0BEw4ribAC5k2yXGKpqBvtopcunDRNg4+RMFE5MOY6xA3VS6F3ugX2w2f2/sYzB3QKt
         FY6g==
X-Forwarded-Encrypted: i=1; AJvYcCWccV21LHzab9et1NNKQCTKqm88EMIEjX7O+92WUD5SqX9GEEFT+XJsCK8H7NNDiOWqCGKdIMMEG4O/leH9nvERTYvIPpdoMb0L
X-Gm-Message-State: AOJu0Yzy1q6nqbm24QHIKcEMubF4wFRF6Ox8Mwm3hBmCEYc1XR1e0sxu
	QaKrcNa2wwoOfDiLWh7zj/SsgtaG6mPUluERPqOtUzThznNC/P2HUJ0zfPz0HPk=
X-Google-Smtp-Source: AGHT+IEVw0YyWnr/ziifVhnrBto5RhBD0kOQUk7xLSjSQ1xEqKIpwjmfsGUcpP1EYEE4fhGC6iOuIw==
X-Received: by 2002:a17:90b:4b51:b0:2c9:a151:44fb with SMTP id 98e67ed59e1d1-2cf237d73c2mr449140a91.22.1721846192001;
        Wed, 24 Jul 2024 11:36:32 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73a189esm1997830a91.2.2024.07.24.11.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 11:36:31 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v6 4/8] RISC-V: Scalar unaligned access emulated on hotplug CPUs
Date: Wed, 24 Jul 2024 14:36:01 -0400
Message-ID: <20240724183605.4038597-5-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240724183605.4038597-1-jesse@rivosinc.com>
References: <20240724183605.4038597-1-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check_unaligned_access_emulated() function should have been called
during CPU hotplug to ensure that if all CPUs had emulated unaligned
accesses, the new CPU also does.

This patch adds the call to check_unaligned_access_emulated() in
the hotplug path.

Fixes: 55e0bf49a0d0 ("RISC-V: Probe misaligned access speed in parallel")
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Cc: stable@vger.kernel.org
---
V5 -> V6:
 - New patch
---
 arch/riscv/kernel/unaligned_access_speed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index a9a6bcb02acf..b67db1fc3740 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -191,6 +191,7 @@ static int riscv_online_cpu(unsigned int cpu)
 	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_UNKNOWN)
 		goto exit;
 
+	check_unaligned_access_emulated(NULL);
 	buf = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
 	if (!buf) {
 		pr_warn("Allocation failure, not measuring misaligned performance\n");
-- 
2.45.2

