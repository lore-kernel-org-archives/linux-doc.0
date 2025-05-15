Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E63C28A714
	for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 08:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297430; cv=none; b=HOU799MgDjM/Pm/vEPQGOepv/y5A1e7/4TDw8Q34zQy4cP1ZTJ5OTA8vEHcRLnSbM+5sFEyR5qXxzTAqNxsYmwXlT34xTjxShgE+RjYIBjKFoskQfRhVHwBCJ11zqJJRBrYkTb4kWlK5rBfOTH6jNWaAis9yqvMDeDLPiXUkIAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297430; c=relaxed/simple;
	bh=oe9YzhrIkRFjcEpmOMMHuXd74hPefU7Jr+/Rq21d1Ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YxisUc3p5KG+SBqhwUyodbtRp7n7bch9Iuo++ZFQQEN2Iar5YXjNTGtxXgaE/nILENDCCjHkIVjojy/4t5mO9nzLoa4fI5oFYkxITPKLwnwujdKv6jgN90wzCwyAhI05ZXe5D8yeEg5uzjUZRe6EA+AU9r/EZz3pm1nb4bw4zAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=L4DzZy5P; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="L4DzZy5P"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so4636625e9.1
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 01:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297426; x=1747902226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVRcVKoxl0DwUNG2KUS/gJuyrRdppt9iuLXI01MGzME=;
        b=L4DzZy5P3aJ/GC7hRBJ1TP4uF6OYa3kLCeBAw/zW9Fud20wIND5tl9CKvsQUPgffMG
         Y3Rihi//bqlyR+VS5poYmvhcOyJkrq0giKQWhoXRHkfPPEmGwQcW+H4Dfk9WdvOKgFeC
         mN2wk9r2oZVJTd+zUk2KESl3DiBimxZX4mFC6esD+p5I1OTtv+hYCn1Nmj3ndamfo8mT
         uAYMjn9oD/YxOcBvf3gsCy2NCpFGrLfbP1T9lznaEjiDGtwysiGJ+KBa5nrKRygLv50m
         3YehJhYnkW4oU/O6yO/FMtLZwMGRHR0+Lvc+IOb9dXBKXybBeEpnwYMHEDWzcspJhCbd
         Mh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297426; x=1747902226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVRcVKoxl0DwUNG2KUS/gJuyrRdppt9iuLXI01MGzME=;
        b=qgPTIsoqGXxC9PGgYwAHklNOe9021Cn/AJHi7KDlsH6uONTB8i0NoH55X3rUID3BX6
         rhBhay2LIzYZsLyl3lSzsQVQRU3ynLxsmxTJUIEvMQMYQRQ6E81eBw0mnw+fkmXCccH3
         T3qEeVYpjC2X1G+IuorS4mI77v5qEzCLfulT21rL1Bbfo5BPkZI4vXzrBwKyM5TxCSd1
         pi4SOCB8RwsEnjNn0qTtlxpa5OJmsR5Z4mU5CQUbSm0nzT0x7CjCZjvVhRyqXNhCnw9k
         7zbj8xYeQKUcxUgCHYCGF6VqNoEtOsoQtFuVMVxgXjAwsBuHC2RFO05VT5bAZgli7+Bb
         8krw==
X-Forwarded-Encrypted: i=1; AJvYcCVok7IGABsaDLzoo2LZmFmrKTK2Bs3S8Wu520T7yz6OBXqXz5DoKXH3IlwKqLdHeTxDm8w3AOFHar0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiuG9pFZSYbWi+yafKITJJmSsyz/R+V7XJVVjRQ6rsj6ZNQ433
	vsHE1BQhxEGPQdqsBlMP6E1xxrIkV1tTtPB+h4yQFBduG1RNfmEno/TNp3Jl+xA/KRo=
X-Gm-Gg: ASbGnctMLu+N2UU4dx5cRSN8kGLGKQr2+SdwrVmLG0/OMDRx4FssPYzvQODCbDxq6oi
	LrxKqa1WOtGb6sLAvlxcGJKlqfNg6VZ0zEG2Ar5rKH/r3uF3SNN/H5uoztsQGcuh3NIAJgU1o0T
	HyY/WHVrQsmv1OmoIUS5GmsqcCbMmCt0n3E87LXfIoob6R0UyV43Ev25757EmzjF7j9DnSL68gv
	JVPRul6mS/dezKiX5lXchmvQunZWzCcGcRP2SidW64MMSYqDmwOirJhQL/x0QkmO8vmyoYReCXA
	x7THBSbWOjZa06otO6GK4QJ9/1DFhTibwGpID3W7A3CkpLkqJ+1kNWoeScJ/ig==
X-Google-Smtp-Source: AGHT+IEf/m3FG8FRM27DD2c+gtkesEWRNvfkiivPTHatSmLHF+9dpAc024hgwxzmnfOdGRF2n1iTFw==
X-Received: by 2002:a05:600c:46c9:b0:442:f8f6:48e5 with SMTP id 5b1f17b1804b1-442f8f6494fmr16827155e9.8.1747297425789;
        Thu, 15 May 2025 01:23:45 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:45 -0700 (PDT)
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
	Deepak Gupta <debug@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v7 02/14] riscv: sbi: remove useless parenthesis
Date: Thu, 15 May 2025 10:22:03 +0200
Message-ID: <20250515082217.433227-3-cleger@rivosinc.com>
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

A few parenthesis in check for SBI version/extension were useless,
remove them.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/sbi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 1989b8cade1b..1d44c35305a9 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -609,7 +609,7 @@ void __init sbi_init(void)
 		} else {
 			__sbi_rfence	= __sbi_rfence_v01;
 		}
-		if ((sbi_spec_version >= sbi_mk_version(0, 3)) &&
+		if (sbi_spec_version >= sbi_mk_version(0, 3) &&
 		    sbi_probe_extension(SBI_EXT_SRST)) {
 			pr_info("SBI SRST extension detected\n");
 			pm_power_off = sbi_srst_power_off;
@@ -617,8 +617,8 @@ void __init sbi_init(void)
 			sbi_srst_reboot_nb.priority = 192;
 			register_restart_handler(&sbi_srst_reboot_nb);
 		}
-		if ((sbi_spec_version >= sbi_mk_version(2, 0)) &&
-		    (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
+		if (sbi_spec_version >= sbi_mk_version(2, 0) &&
+		    sbi_probe_extension(SBI_EXT_DBCN) > 0) {
 			pr_info("SBI DBCN extension detected\n");
 			sbi_debug_console_available = true;
 		}
-- 
2.49.0

