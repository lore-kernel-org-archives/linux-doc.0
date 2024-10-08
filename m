Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62D82256C8
	for <linux-doc@vger.kernel.org>; Tue,  8 Oct 2024 22:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728427142; cv=none; b=CjZOy3S+fFVZ5MzsmMF0Ou87zA+SQ9UYUgCOGnrbsuSnYbkxLv1GBrv3vZ4y/HRiMlC464OqVfA9qNBQd4mqLTFkijUWmNUMJQMFKblyHkdZ86mAuq/5gFSCwMZTfYgTR9EOzqS2irs0kPRpqgpP+f7xrZFAfub0TST0WXADwM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728427142; c=relaxed/simple;
	bh=z3F5GZUNNZRZ61rUGXBlYYR6QqrnCnK9ZskBaiISZhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iVsan2HZyyf6rwNbd9LjFZPNaZtXGv52MPIg/Lfm1NNBLvzLHOViEwIXWZmy5B1OZZ3d3Fr5+gtlPZakcroDhF4TClLPAejwUJmKae1Fvx0m5Q0RtIT6Up4XBOHXv1XGcCmIym1wYU7vrFG7XJcw4dcDkhEwEVnMqge9aejtlTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=03vTABuL; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="03vTABuL"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e1a715c72so554928b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Oct 2024 15:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728427140; x=1729031940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IjvUiWFDgNIgR9D1bPvnv0vD2BBeNN4jEZqEwYO5LXU=;
        b=03vTABuLWyQKQ++ve+lGmODli/k4yaI4eq0ANLS4F5LaMa6JHc9IhHxiA1MaY1T5Iq
         HLYrvwjXEpDvU9vGqFnnzOzESN1XO6L9WIpj3Tws27zXoMxgGlHL95DDOExmFi14xznH
         VA+v2NoXcqTBVWI7n4PixUlOVPp43XTCDd6M7ASSUcjBnU34k2uDYY0JgetGnuUGNWvy
         AfpHu/QR724ulaJjWYlNtrmD84G+85h1e2PZFcjAhpPYlQ7RNn+V6GIk2pBzT60CpRy5
         57X2Axd7mxWjVZugeAxisLDLCaQg9lJA+r/orpB8KjwDxWZ+i3WjVgbcYhpLZ08j7Wac
         8njA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728427140; x=1729031940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IjvUiWFDgNIgR9D1bPvnv0vD2BBeNN4jEZqEwYO5LXU=;
        b=qHbFhXGqE4FaiGk6bQjtpXNJtIHU+AClU/EmI9+1qyFlJTvGnOHBgmjhZDx6U7Na5H
         Ngkuqkh3+0ZiQ4iJ4wnPhw7mBRHbYh5jT6nRD30P+1zNz7UEsqn91J4bdSTV028TVIp6
         8GlHfsI2NA2z0AtfMPk3VBr7leFb3yUFnvrDHR8SFZ2V9Vklx+pgpRLXUD9BYULEd6V3
         k+rPo9kXvB/LHKPda0Sff+DBuLHjU9LNZcEkuuLNnwHqatqH3VmDEV171UTJ17PTfP81
         9uCyw4VFxjikaYkFOcem4K+tYFuTP1O4xH5p4sFdJxbBA/Jr9P0Ag46SrJj2HCmy+I1a
         Maig==
X-Forwarded-Encrypted: i=1; AJvYcCUcKui8p9k45W8bKX5QurZxcVJ2QwWe11wnKb/99yRzOJh2A6OW3knvJ1KJj58A6EUZfDwvcaLwcwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoinCMFsSZus39LK6lUiYZV75KzIHuSsPXcX62/fSydkDPchlq
	8kF1Jj0/pRr7y/ILOjpd55QivYvvQX2ClZFHPa85tGZXGh1yEnN3FwctKF80B9M=
X-Google-Smtp-Source: AGHT+IHmwPn5jM9quB16FyWf+V+eEat1fojl2g1P7nEi3JtER4PWJx1A+GiQhOrwkldgMrai14wFrA==
X-Received: by 2002:a05:6a00:1495:b0:71d:f510:b791 with SMTP id d2e1a72fcca58-71e1db7734amr622915b3a.12.1728427140255;
        Tue, 08 Oct 2024 15:39:00 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccc4b2sm6591270b3a.45.2024.10.08.15.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 15:38:59 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 08 Oct 2024 15:37:08 -0700
Subject: [PATCH v6 26/33] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-v5_user_cfi_series-v6-26-60d9fe073f37@rivosinc.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
In-Reply-To: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0

Adding enumeration of zicfilp and zicfiss extensions in hwprobe syscall.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 1e153cda57db..d5c5dec9ae6c 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -72,6 +72,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
 #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
 #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
+#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 49)
+#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 50)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index cea0ca2bf2a2..98f72ad7124f 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -107,6 +107,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCB);
 		EXT_KEY(ZCMOP);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICFILP);
+		EXT_KEY(ZICFISS);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);
 		EXT_KEY(ZIHINTPAUSE);

-- 
2.45.0

