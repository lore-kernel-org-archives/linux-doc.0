Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B3E1FF601
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 12:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741089623; cv=none; b=mRD1wdaFPo/e5AarQ/hCUfon2YN8RmWFrGm7Wj/4U+1Ak33xzKDEuIXxGv62ttX23/YBgUy+SDFJFWGpSfocrxOsT8i5sD9/ekU3LQ+ILjzE4ZhrTzvPHIp56zkCVWgBDRt31GZxWIjuGxRiK6qIlEL/u7A//IMDyvAvvh1VRfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741089623; c=relaxed/simple;
	bh=bKMa8fqW6fjvU7IC3trRLzO9pEfTAhYdgpAHUxI/OBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p4SkGJO+YFUeff8kCk2nm/FvFuPqmqDtXs6Wr2GWNHsCU776FNrCT63x+T00aGba32SsKOm4Nqo+gv4KvC0ozCLwe8+678PAUv++UKRvpBa3xWuGfTAzkrSGWPBCBwd3FY7Ox5NgZK3Ghm0wwBYgOmYXWkLF7WiK9+mgf+unMvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Qwji6+5/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Qwji6+5/"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43bc31227ecso12912945e9.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Mar 2025 04:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741089618; x=1741694418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoVXTPIMs1CQCffXwitKYw9GB5bSc15mRPYc+pFsBJQ=;
        b=Qwji6+5/VTF28jPBNsvck4WH3bCdkBox/CpQySMUy7f1cBbLWvx1jM/ZrmFqbRptvg
         Zhu5mDNts4HG8s3mpw0Zxm+RbuIzJ89+0cf16mzFHjljvH1mW0FpF28j/I2iWgjRfKW1
         ldhGibk7eZRbyzJRE+Xj9G/9gZp5EgpuHPYQpdHwWpJv2KLDAW+xgAo/joq+6viz0/4D
         ihXMRIR4K4vaj0HYQPgQQKGK7TXOSa2e2OqGG6kzd5gl3xCkoshbbDFYNlE+2jG6xZXr
         sctRpjnTDNJhI/UEAxJT2boTewuQaowVIz19Oq/K3kN/3xT14XMlXe8+e4JMTr/7n+A0
         P0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741089618; x=1741694418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoVXTPIMs1CQCffXwitKYw9GB5bSc15mRPYc+pFsBJQ=;
        b=gwCe16mFdX8jKA9QMCgv7qDKIP1w08g/rXP8jHu1y9gjtGgQEykhQSnTy5pCZaa0wZ
         Myj9ihoVVqxIWVYnr/Acq1AOpbltOvJ1z39tJYoUuk0xvQvo7BPU1OgF9fZ38CyH/du1
         De5UU0v/xg4xgT5mr9vF/EzRKulj4s796nTMq6WH/9DfyNPOAAkWSvq4Wl18d4ArrVnA
         YBtyo2tC47cyDY6/4WDpNuu84rfkQ+wnzQD4Go+r57yNlIq8sMh7EnYfJCoZQOwinYlg
         Y939RGNVFuyDOh7HR/2PQEjcYHfGqLNPa5NmN6s0bIi9TKdNc9Eew1Z+f7Uk+VWetfEt
         1oAw==
X-Forwarded-Encrypted: i=1; AJvYcCV490xLhYBqjyTewVx1jBc4mUTizaur80rmJdbLo8yqH09M39pLcd/OgLFDUHMpiP+SF5hOzV69nE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHzsZ6aB3TzabiD83FqkOPBKxiaSveWNUSXrBm2kIGDfl6v2eJ
	5Nn5jirefhjzTl0oaRI/f38QOypqoKq4bv2xmBQfXZIPCOwLcdmkNoiBHWUj6ts=
X-Gm-Gg: ASbGncuubgDx2lY6pW+cyyBHifvVsqqUADZiWfw0U9nGMmf5NVXYcK3MvuV7MJf++Vn
	cRcy6IuKabu4ra67h175rEspm/vY7PLSe40gWU2cvj8uKN7V98yxw7oD8T+0oEHZWAu908KrClG
	Hm/0+Z/kI0c7D+Rc3im7iEcoymjkEjlCSt8VtN4nfGQY4+Qq3IUDlE6eDth/NchszP7OxaqJM3K
	tHPPJf9Y74nGqMdWxfK7kA6Gxhnw657dC5TqlPjDBdTszIo1A3EbTjP6kqsFr+RLDZR6Yp7fOm6
	3hcyFIPzDqSAItG0Q0j+rkYTM4v6Tynx
X-Google-Smtp-Source: AGHT+IGSlj+jarr0JPc4Azcvd/gVJrRnnAK8bPpcD6KvNf1uMYM/W8wrPief42jLDcp+dxdCRnmVUw==
X-Received: by 2002:a05:600c:19cd:b0:439:8346:505f with SMTP id 5b1f17b1804b1-43ba6747836mr129232375e9.20.1741089618179;
        Tue, 04 Mar 2025 04:00:18 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::688c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485e13fsm17295914f8f.100.2025.03.04.04.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:00:17 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>,
	corbet@lwn.net,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 2/8] riscv: Fix riscv_online_cpu_vec
Date: Tue,  4 Mar 2025 13:00:17 +0100
Message-ID: <20250304120014.143628-12-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304120014.143628-10-ajones@ventanamicro.com>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We shouldn't probe when we already know vector is unsupported and
we should probe when we see we don't yet know whether it's supported.
Furthermore, we should ensure we've set the access type to
unsupported when we don't have vector at all.

Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index b7a8ff7ba6df..161964cf2abc 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -367,10 +367,12 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
 
 static int riscv_online_cpu_vec(unsigned int cpu)
 {
-	if (!has_vector())
+	if (!has_vector()) {
+		per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
 		return 0;
+	}
 
-	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED)
+	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
 		return 0;
 
 	check_vector_unaligned_access_emulated(NULL);
-- 
2.48.1

