Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D49B293740
	for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 08:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297437; cv=none; b=RRSgnFq613jk7gJZgty96kFyVipvCegtoPy7crr4pm7bk9P/NjaLIdJDUZCg9Srnv3SmDTTLUVsDSdxh6nHdWymVlZAILaUJWdjCciqX/xpgCzwZYwLGE5S1B5NcVdFwNBPbolum+mrazn7I/zdBJO4LYBgVEttegUwU6a9GQM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297437; c=relaxed/simple;
	bh=uz1riMVMX6ESvcly3DK7ZVeRESfNcHcQ1KO1rEuMiRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ugDTlS7xmAnOzGrvZQzO9gg4kCU90xhG6sy0tzGv2GASbSs9hQV8q2jhyGzlwJRVD1J1jI0KSMTyLaIux/IHjBIJSmFxexT9UZfuKujiiRERoa1hIkDzzJwxzKeDoZrzjK2+w6qYl9xyX2r9YmZ/5gFg2INIVgJ2EMuACoFsj4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Yk6WHYJT; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Yk6WHYJT"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-442d146a1aaso5861095e9.1
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 01:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297433; x=1747902233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rW3Gt5ot6i3Z0vibD5tiRCC8lZra7MrDIFxKpe4L2VI=;
        b=Yk6WHYJT4QdCmQSEWOroBrq/gu2itGDi2XdFnjsBzYiaAd5vxtI74pNgsjV5RyvOWm
         MNg8j2rZCgcmPtaXNrFX58zkli73L0D6C2s7mbqnAm2Nj7KS2W2TJ1/ioIDGb/5fgOCX
         FTqtkc7KPN1umDaN5WsKhUzKGuxlsO1j8Bk9B6231AVbtEP12bSazPKKAXcy4A1yiVKc
         OEtRaZ7eNskiMMWJqT22sLlXYJNOeGvPHWjuG1Vjpvh/rrdKpvJ/Ehut4uvCdXmzNThh
         5KI3DhYsYJWGcxyrAPAb/7WWLg8BGVe5J5CDxKJG1BcBdFjcvNxiQ4tGsL+2LQ5nTJ4z
         nNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297433; x=1747902233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rW3Gt5ot6i3Z0vibD5tiRCC8lZra7MrDIFxKpe4L2VI=;
        b=vSBm5vTOuCrxRd2AohxE2cSUqfFyO9B+1hFaUM3bed9Psr7yHyVNkEuP055K2N0ZXf
         zAnyvoY+lp6DIvaxYIJdA0raJKWbxnWB4vThuqYWRK+umZOP4nnuwKCzQhCw35bjpEbV
         ZazqBa/jXFqumz6QYA57L4e4q3Q3A5BxOLjeK8b+KoIdHbo1geqUULIqztI700vVUClO
         m4vF71FJTiOS4ybPJkhF7Pbvdie9JYAweT79WRC/PK5vR2ROoaX2UH80OJbmcTr6W3lY
         9rIcWzzwxHjUSn/kzkIiH4yfbOmIBuR+n6RJslZCB4ko47leTdEAhY6esEligaUT4uGO
         AeMg==
X-Forwarded-Encrypted: i=1; AJvYcCVCXJKqvq1VIl9oxrG3ExNqHq6RTlT8wVQWGk6wnm4NGCAvDe1INtLUob0LpcV+DJvtzbzgwF52w9o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlA60PwYUSA8Pr+OMt9crvn24D0Usnb7C3rHda0rvfJu0paOlp
	eIx//dXszEJwqI+9djN0F146aD85VHNL1lKgh288vZ8mf7hBBUJ1QRZ5HocvC6w=
X-Gm-Gg: ASbGnct6aUOpGV2XHpaDWFrGogt9jUC/0V0USU0rGIdC1yce8iXUTY+gGeMWygBcFik
	NskctVnxM9vNKpzxBBLTqbHE90dCkVtj+OkBb02IaPEvT/MR6MJSCg6RrnXqAbwdDLZs6jpAOu0
	K7HT6gGvVE+IRuzX81O2UXVovQVLmFP5+uA/OTBRSzDJaDtZB0RgZVD2V+Ovam+iYbjQTQ7YKC0
	FCMySqffmBs3hOH6NWgRQK9yXR++7CsR2s/9uclPgKZtgCzGcdU6FNTiP8/ZrMadJdjPodS0MQ0
	U3MqcyTRlhgKJwDJbJKYWFNhDF9/iUWwHEySoe8lqGUhwAaZZME=
X-Google-Smtp-Source: AGHT+IEkMTLzUmbcaQoV7fBGhKB8oDf174vYHHp/il10qE0/kSBDkuCpwfLuKVtfldQPVM2OqN3Neg==
X-Received: by 2002:a05:600c:a07:b0:43c:e481:3353 with SMTP id 5b1f17b1804b1-442f96eca92mr14271065e9.17.1747297433494;
        Thu, 15 May 2025 01:23:53 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:52 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v7 08/14] riscv: misaligned: use correct CONFIG_ ifdef for misaligned_access_speed
Date: Thu, 15 May 2025 10:22:09 +0200
Message-ID: <20250515082217.433227-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
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
index 34b4a4e9dfca..e551ba17f557 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -369,7 +369,7 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
 
 	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
 
-#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
+#ifdef CONFIG_RISCV_SCALAR_MISALIGNED
 	*this_cpu_ptr(&misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED;
 #endif
 
-- 
2.49.0

