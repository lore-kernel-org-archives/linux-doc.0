Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D340D1DC491
	for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 21:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724102783; cv=none; b=ALREN+jcIIWA6jstbI76FfJZAPASv2iaM6Iy6ORCDdPiU+jDFmyl/45uwKGr85HVf4MgHi6onf1a/3nLVkUZe1+HbEnTtoT9C/XyambyGDiYggW46X52kmQlCu49jx3dXJQMbC8ur0g/+iMBMFuT2VYwKeOMhGG8G6eBp6tOjLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724102783; c=relaxed/simple;
	bh=ZjjXLL2h3nQa1iF2xCbCAo6XadTLhKILJHfe3z4Z3jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mr6G24ZAZpyQ3lm9g/k7yCDHj+oe45dBp4usjCt5ldsu1tZHftx0ZSCdI3ZTDS91UX9FG2qxXw9aRj25fmgT16kpziBEj+4esuDOK84HgqhxNyJhXn/j+/e4+dH7YxDgdWEvXMoD/zRKRRsjPenhv3DF7Le9thFx23/nNvlWCvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=IUxwwOtR; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="IUxwwOtR"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3db1e4219f8so2675508b6e.3
        for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 14:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724102780; x=1724707580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TztiC5/1gr619POh5DAGrJTvEg+G+L5Qf1B2P2doR1Y=;
        b=IUxwwOtRzmcF3iixIJpOa529fyOMrhasr5/AgPVJZ4Cs0tE9Udo/n41qkVwm8bHw1g
         9E1zqPwxIWLv2rVHXNZslxTbBFn8kSUlWtUH+vGN4ZtZqx3WOW+0h2wIjUAKAVttyPMR
         YH1oGJdZ26jVRavMvWgd51fXxpqSxBSw+HNqAcgThqBLDc6OuLW1LAl/vavELi/Dqe9w
         uNJLxFQZbQNa4/akFClWmqdI0pXkprYUkLXqs6p7EDrhtuznIsOT2pi/pCIf+NkCVJvy
         hCeV3DNk5z1s07pwmHAfhJw5KYogJMuTmu5BwfkqP4G+hXn6UIJxwjhCrMZJ0OIDaC5L
         lcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724102780; x=1724707580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TztiC5/1gr619POh5DAGrJTvEg+G+L5Qf1B2P2doR1Y=;
        b=JHL2vcDATzHgMYR/3QQSI2KIjoivYHmgpUQ7VzsvBwabghYZVQVwVl0yCNVxE0xNkt
         ZeQsiKUfCBp3w2U3P+CNJ/PD/qHA9FSM1g3t50c95ei+t1P5nqZpVpSIlIdXjWup0tEj
         AWURXr4bBEQbq3PRRnxt0nDl726r2DoGBSqJNBwb3mW7k16/hXF/CdqO2VBKSR59Z3Lq
         M+UfXuvWau/Y9AdiM0IlaY+ESo9tfqaQ3tCRKLaT/XR3udIOgYO00efCKTD3AGmvVyQy
         ckFWNwk8rRPH8ggxl2aAhSRvH3l7Za1m46Hi10IVH293lYkbHuk3B8ZFY2eeAcfCQ/nA
         w4EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUByKYQU2LLbE6KFDamU0GWQgwAC5OZh7+lpPDl9Pn26e0Hjw0cPVuOvY4k1Mm4DAcSgkD8gIBVN2MtHsnTfaEbRtVA2anajtOg
X-Gm-Message-State: AOJu0Ywu1jk5HatPcytEw8jGr39Y/IiGBuDLVrAScSbhFimhTum4PDVc
	4axKT1mMPoQGqx1JHmppliBJtH4M7ScHGgsTS/8TILYQO77K7OIxNh+b/+FN7qY=
X-Google-Smtp-Source: AGHT+IF5Ka5oo/Vsh95TOhJMsuxd1ErCS0kjAYsG9ayHXx5iEO+Eih/UfW0kpteVOEYBtV7XpNogrQ==
X-Received: by 2002:a05:6808:2e88:b0:3db:3102:adc6 with SMTP id 5614622812f47-3dd3ae1ec10mr15635770b6e.41.1724102779911;
        Mon, 19 Aug 2024 14:26:19 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b61e7bd1sm7004694a12.53.2024.08.19.14.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 14:26:19 -0700 (PDT)
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
Subject: [PATCH v8 2/6] RISC-V: Scalar unaligned access emulated on hotplug CPUs
Date: Mon, 19 Aug 2024 17:26:01 -0400
Message-ID: <20240819212605.1837175-3-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240819212605.1837175-1-jesse@rivosinc.com>
References: <20240819212605.1837175-1-jesse@rivosinc.com>
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
Reviewed-by: Evan Green <evan@rivosinc.com>
Cc: stable@vger.kernel.org
---
V5 -> V6:
 - New patch
V6 -> V7:
 - No changes
V7 -> V8:
 - Rebase onto fixes
---
 arch/riscv/kernel/unaligned_access_speed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 160628a2116d..f3508cc54f91 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -191,6 +191,7 @@ static int riscv_online_cpu(unsigned int cpu)
 	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN)
 		goto exit;
 
+	check_unaligned_access_emulated(NULL);
 	buf = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
 	if (!buf) {
 		pr_warn("Allocation failure, not measuring misaligned performance\n");
-- 
2.45.2

