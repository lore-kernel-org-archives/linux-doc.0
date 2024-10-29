Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CDE20EA52
	for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2024 23:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730245479; cv=none; b=jWK/8yYVr6Tse1J07BClYEOVw46r3Zhqod+xFrUW/2LOEhsXXeQ+Zqq+iPPvpBDvlfydPtmyYK4MY480D1+d9UAz63AM/TbqNU74NuLHEtW68stG9EfIo+fsM1UY4NGbwcWe8A6c9WNfznBMW8IjjyRDL2fN0ZzcIuUMBdAsF2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730245479; c=relaxed/simple;
	bh=HQNkCOskyxWunDqPoHRrTHWNyIWMiCrJgIi6JHr3jWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZVKiK5x7C4/UrGp5wz3bw4ENluhEqfcvxlhDu/iZI11oM09aYgpJe81XXvdZQ/Hxm3PT5+QBn2AE/XCw3YH+1XhGcD0Vk7Rle5I+VuqWq+9ZVrgtunIOyOuXNARyYO+sRdlehAqENQ7CbfJAgxmTynNbJO5t+kSXPkwHmrw9OI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=jMufsDqb; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="jMufsDqb"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7ea76a12c32so4653386a12.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2024 16:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245476; x=1730850276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vc3xum6aGJsQxt7BwGXU6tv/D45yqqkNrU/wViua7no=;
        b=jMufsDqbyJlWlgXDQjtL3o+pXuDcPSUdlCAivuYifyIBIwUBdDyL0f4wVAq7MGK+bY
         9Wsn2IjJQGcEhNWatUPR04Ce0mcbTXS0o5advSPY4C+6CStLaSRE0QVd3+qBZSmijhoh
         a9QtrOxP6Mm0LLgwlbpGof72pc4sobYqsXIQ6lusSbABVSn9Tgw5uaqlrvKNERHWD9GC
         fIdClqRrP5/w4UEgyo71PML1kglwMXCvStEFn5HI9QrG788Y/DaOZ+Nct6yNhA94Fv8Y
         b5IznvofGeh0ruKgq7S5NdFsZFepVOhoB4m4q+hu8Iai+R5bSbjI/Vknb5qrfIbDxFaT
         xaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245476; x=1730850276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vc3xum6aGJsQxt7BwGXU6tv/D45yqqkNrU/wViua7no=;
        b=IE3/uZTVgZndi+6nFKeGy22LqiynmW7htamhWeAbRfhKBvxmIlLJu1YImYnLzlZhHf
         ngvagqsTJrO7yDr99yg8Rr9ruPKnsVplFv/Ma8LBU00hXIo02rmT2sUgSnYBvD6usCBx
         b1InN/yhkLkllJn/GbI2+Z0B4IeZq4Q8nJco05DOt8qt1oGg1eIpkXbhA3/8tLMEvNdT
         PrDyZwx7PD8hQsLFFqEYHM7Nqi6sHgfq1rSVW8MErN+NFtPMbRzYv7NQ3aL9fHQrxY+G
         4jDaE0UdTVMS/7I+y2cRAkrXMCr8XuDu6LSIh5fnYt5wYve9+H6boSW98Jmp+yqdHuwZ
         EJxg==
X-Forwarded-Encrypted: i=1; AJvYcCWyxWYVCqjS3PAL1Fq3Z5fqWQHTSUlKvBP0Dojxch2Z1DhkaSe1Oy8USHiLyGj2iZoHQkq0H9Za8rA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza9mkQeo/sOjbdD72quUQZ8D/Aqv9QnJhZN6N1eanFmQRIrKEJ
	H9xfpwQone1gbGW08qBy1n9o8H/47p9vQlx395bLUIFVIPmVrR2Jw+1fvFWbbAE=
X-Google-Smtp-Source: AGHT+IGvhAl0GoTCR6wpiYv9Nay6FcDGtnYTBZHKhrK9M6c3oN51TKIQjb4l2hAH4eTwfkMYzc6GGA==
X-Received: by 2002:a05:6a21:1190:b0:1d9:215c:c63a with SMTP id adf61e73a8af0-1d9a850aaf7mr18291142637.47.1730245476543;
        Tue, 29 Oct 2024 16:44:36 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:44:36 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:08 -0700
Subject: [PATCH v7 08/32] riscv: zicfiss / zicfilp extension csr and bit
 definitions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-v5_user_cfi_series-v7-8-2727ce9936cb@rivosinc.com>
References: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
In-Reply-To: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
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

zicfiss and zicfilp extension gets enabled via b3 and b2 in *envcfg CSR.
menvcfg controls enabling for S/HS mode. henvcfg control enabling for VS
while senvcfg controls enabling for U/VU mode.

zicfilp extension extends *status CSR to hold `expected landing pad` bit.
A trap or interrupt can occur between an indirect jmp/call and target
instr. `expected landing pad` bit from CPU is recorded into xstatus CSR so
that when supervisor performs xret, `expected landing pad` state of CPU can
be restored.

zicfiss adds one new CSR
- CSR_SSP: CSR_SSP contains current shadow stack pointer.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 25966995da04..af7ed9bedaee 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -18,6 +18,15 @@
 #define SR_MPP		_AC(0x00001800, UL) /* Previously Machine */
 #define SR_SUM		_AC(0x00040000, UL) /* Supervisor User Memory Access */
 
+/* zicfilp landing pad status bit */
+#define SR_SPELP	_AC(0x00800000, UL)
+#define SR_MPELP	_AC(0x020000000000, UL)
+#ifdef CONFIG_RISCV_M_MODE
+#define SR_ELP		SR_MPELP
+#else
+#define SR_ELP		SR_SPELP
+#endif
+
 #define SR_FS		_AC(0x00006000, UL) /* Floating-point Status */
 #define SR_FS_OFF	_AC(0x00000000, UL)
 #define SR_FS_INITIAL	_AC(0x00002000, UL)
@@ -197,6 +206,8 @@
 #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
+#define ENVCFG_LPE			(_AC(1, UL) << 2)
+#define ENVCFG_SSE			(_AC(1, UL) << 3)
 #define ENVCFG_CBIE_SHIFT		4
 #define ENVCFG_CBIE			(_AC(0x3, UL) << ENVCFG_CBIE_SHIFT)
 #define ENVCFG_CBIE_ILL			_AC(0x0, UL)
@@ -215,6 +226,11 @@
 #define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
+/*
+ * zicfiss user mode csr
+ * CSR_SSP holds current shadow stack pointer.
+ */
+#define CSR_SSP                 0x011
 
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00

-- 
2.34.1

