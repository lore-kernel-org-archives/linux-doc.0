Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF5D17D898
	for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2024 16:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722011863; cv=none; b=L1uXCj4Y1VySFFXwr0g4dZW0Wr/wJ05kyjG5Id5jKch020I6g2LFkdPWwmINIq6QAeMQJd2+++s6SqP2g6JY24D6DL+nD/NS90aqAHQb/Wuz6m6bA6ZnjiDEDIjhgIvavsijQ/ZbeMsVdtzd2phGeon6vVjh5bdBIEEeZA65PwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722011863; c=relaxed/simple;
	bh=F9TUuRxlIYugU1/usYl0Y6QWEsQM7GZcfyLclleEylQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hTg7QEiuTIvCFyMYxTnyiMBBWN1CdgiQ5L2O5QK2/m21Y+2O7wb1NgPX15iR8xDxSARdSBjiwQLnJvBnSyY4H28CzpnW5lL8m7gHF8XFYid/TVL/vVYPLJ7n5AsPUu2osWGFJeEKelXJu0DOytp/P4FwOYq7gL9IRv2iSXFlCVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Ylp7A1zn; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Ylp7A1zn"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fc491f9b55so8408775ad.3
        for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2024 09:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722011861; x=1722616661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0rt4u3JgYQdmYK/5XCmCvbMmsxncqWCmcN6vbrwaOA=;
        b=Ylp7A1zngH6RlgwwDxueNwnrfdZOJB1xgvITv5VuLskUrJyN4K9j+R+0Ksoqwgtj8c
         2qSuy6c+4Z+1fDnVE/X7JFDSvwdMH00s7R30QlgVjPf3CHdZmw/K1SP4YdSdPDO8aRj1
         7/dZ5g7x2hj0gvnmavHxBrASDnb2O019fjphHV1QYIBcLzdqkhaJyqr87AMshaLxnF0H
         clKjFCGV327LtsxvUFkeS7b7ZVrGvNFJlJz18ffFVrJ5PPcSFCWr3LxfXtRWlgkQXubs
         iedK5qkSRLhKIAZoPWQ8v9ZTLJqWDxAAWLdN22WCdjG6Hg6NTA2uT8qOAs6rqJjMut/2
         hWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722011861; x=1722616661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0rt4u3JgYQdmYK/5XCmCvbMmsxncqWCmcN6vbrwaOA=;
        b=j48kQnyh359sEYewYHQYFToJNKp+cLA7ZPilGHKJAICkg0s+fCLIxT6QxKFfJjb7BT
         9+LPhVBy14Ax0Xla6/ti8uU3/baHXfsc9HOCwgHafeW47arwysgcSdW9sGxEtZsst44V
         mqgrzJKH9+faWbFy4szmDkI9XMNf4w+huetVsbfaJ4FZ51yuaM2I5BlijQL03Jz0OMSk
         jOn9952yuw5gd32mlRt6RWTOFA/eVMLSYFzJLjOidyPKW9sL/CTimO07ofOskOWCCnbe
         EYoXoDv/Q/0v45B6Lz1j9wtB8yIcj9oVlAiqUc6PmtOtuYLHbdsFluj9uDNTzjT8s7nA
         uLQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe8qLtYFQDDG9+VkV36kxqLWZxuT2vhr8NYnwdwsevoTwDls2sBIOSUQNOQQTE680VvQC8lOhEYPMNN+AdGFsDkIFQq/6HxDk2
X-Gm-Message-State: AOJu0YzOQR5Fq5ffJaaj5FrfsSaZVXHw++D6WYUyQGQzpkWEIEZ68DBe
	uz9Bpqu6woMEcXcnBcPR8fBSAs3+3T0c12ujfRJ6pdh7Q9WOInqPozZYBEmWjN0=
X-Google-Smtp-Source: AGHT+IFt0Hx7tCHd8rmEPH3r9WQzWMpJRolI2HaFqal33DHnd4BM9lIVbdq7BXaVWa8aOT/1lsYEQA==
X-Received: by 2002:a17:90b:2552:b0:2c9:62be:292a with SMTP id 98e67ed59e1d1-2cf7e1fba30mr38548a91.21.1722011861534;
        Fri, 26 Jul 2024 09:37:41 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28c55a2dsm3676619a91.7.2024.07.26.09.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 09:37:41 -0700 (PDT)
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
Subject: [PATCH v7 4/8] RISC-V: Scalar unaligned access emulated on hotplug CPUs
Date: Fri, 26 Jul 2024 12:37:15 -0400
Message-ID: <20240726163719.1667923-5-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726163719.1667923-1-jesse@rivosinc.com>
References: <20240726163719.1667923-1-jesse@rivosinc.com>
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

