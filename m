Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17462144CF
	for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2024 23:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730245524; cv=none; b=e7iTA/sNvURXZMjUuJRnYLBdRixlWpfbeRoWWL8Z1TDAMyEUvl1ufloaS5DI3WBLuQqO9XRtOa7EE1Zg2cELWzYVl8YDlMhlX4gKtne07wZ9nNxFUuUbpY1zZAI717SHG8FzADIM+zkoRDNIyezmrbQ7vnz2c6wI+dFRSa+PDd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730245524; c=relaxed/simple;
	bh=uIj6D6eKxGy22T3W83W2H4Fei/chUVRqxoKSzM5k6/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hPoCmSiTho8incsv8rMzp+T/36sFt08/gf7mnZttZY7ydfNcoladu1CI5R2W2XYkC4YbDJrpvjgRqhpYuOn5Tjnhupr2Y4cTNjuy6tr2WtKatwi1jJu9NFxkW9Msh9gIfHtJwOpp5rN1zGP7Kzp36jcDcfU0ZPWiyzZZkJ1uk3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=tpACsMkN; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="tpACsMkN"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71e3fce4a60so4358364b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2024 16:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245521; x=1730850321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kn/sn+D1z+93mY85aikbkRt+t3FRvwF0B8Ok3zV+OA0=;
        b=tpACsMkNDdHDMljNEfzxdFWJukqwQPAK6dy9qtuDt+FvoNqjYJQDXJmiLSxFz9KKvp
         QLY6DX1IIcTg1cEKmVYhfMcnOrfAtEyOEoeYY9prN77TOfsLcwcX03tycZ71gR/Mz/A1
         Ie+IYvktVIsz5iTd3ax1eHk7gwW29LC+JlmrjS9r/rbajNiOwCyGKLvIwk/4Z6frMj3R
         U9kDn5gc2YBbhwXJh9zbTtTLZt6BdjwydgcgNWaNiITBbp0PNZLUp9qngN7r4XCudRfh
         PVUzNxPOOVGprPwDRI2TnvJJS7esOG0Ekph4ruIK/qEFAsAHQXiGQgIfHyGIWb2GUuA7
         eJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245521; x=1730850321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kn/sn+D1z+93mY85aikbkRt+t3FRvwF0B8Ok3zV+OA0=;
        b=XLT9vNiV495VTP2DgQqBN44AFCcbKniDvPyiAjuoA9j4yn2s0o3aD+h/HkaN8867ww
         O1RwhQl2VEh9dEKMX69P0C14155p23r3nRunI9/jpHTddxcaiTGo6LdF22HVosrdlGlh
         7McbwhsWpboxwrPouP8dD434WpExTJn0EWYhUnBZC8cr3fBHdjFyYtL2T5lXlRc4RmNm
         No4a5kOD7LgkYSkvlnRq1XTM/OZLNcqHdnB8JKMzDAar2scrkrYsONPk6DZ3I2U3q1r7
         DPbxJc3+awgfTOFEeLU51UnW6zrwdMg4MuuBkL+V5FQ/mqGc2lNt7NHbVcdVsdYt/13a
         MWsw==
X-Forwarded-Encrypted: i=1; AJvYcCUBnykAZ4hgRMzsZg+93LgyTRZRFG1YjpzP2kWTNlq8OtDpOLlOO2SJmomb/yWNE9419O3kQWLFiKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnBjnlVQ+sNyVWx623Hw2z1alBwDhi0lCtEJDhQYOYM998DG6Z
	99Zi4zF/UphUshHh2RnFhXzsdGF6A+TogP5HGNYqDCcLwMYXAjOLCSJqF88ZGm0=
X-Google-Smtp-Source: AGHT+IFSRRwDJwzMEik28WuiCu9TazkISCRtSEmteAY39kMNDbrF9hMfjaoxtBbs1QyHM1hw6YiZLw==
X-Received: by 2002:a05:6a21:e96:b0:1d2:eaca:4fa8 with SMTP id adf61e73a8af0-1d9a84d9df9mr21491704637.35.1730245520903;
        Tue, 29 Oct 2024 16:45:20 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:45:20 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:25 -0700
Subject: [PATCH v7 25/32] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-v5_user_cfi_series-v7-25-2727ce9936cb@rivosinc.com>
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
2.34.1

