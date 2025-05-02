Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0F921B9D1
	for <linux-doc@vger.kernel.org>; Fri,  2 May 2025 23:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746228648; cv=none; b=kQL0xJgULLd9Vb/DWQZboJUQBn1xi2/sHek3ufrJ6VKkavTnerEQPber8LrNCJSwttq2KP5ZtMgIkW2SnxZWnCLFtQAXxLnY9FjIeIdseGIschmeE2bO0fHVNVmTR66YRM48pCvxYK7c7w+xaWniw3/hVXnjHcEaF6XcJe5VsNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746228648; c=relaxed/simple;
	bh=07JIHRwK+fbY/KS3WXdAQFowggDed4ZKoyBK3fLGucQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ttwzioEDPE6gcu0PM1ntpqxCY2uS98XbEjiqphwOZW9H6xpQfkmH7gvr9RnEpP4e/V3oGQgJiytpvMRZ2YUceGw3oQhCySFcgX2OjChU7qgj3ZV3ks1X3OHS2YWOI3MPUG8OeBWWUfXHma9de9Zej06ouhOi8dUyfOLstmnRRg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=MyVNYd5M; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="MyVNYd5M"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2295d78b433so27508225ad.2
        for <linux-doc@vger.kernel.org>; Fri, 02 May 2025 16:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746228644; x=1746833444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkVK3bviqHN/t8JmfUhzYvFjjtQu0YyYqPmZLVGI/TA=;
        b=MyVNYd5MvdRqDqTLRdj3YkEXMkidA0l9HPQtEauag2kapZx5tf6GuYNy9+utUj4y3v
         0pwR1SzpPtn85ZKOGF65r4qwpKFtdt5cjZJmpVtVc4bzRcCYe65RQ0ukt9ZAqXuDS3Zc
         E8vubB0vS3bbeF+J48Ztcl+ybjOHHcxH/+PFnh81IWwrciPsHm5DG1f6x+6HzGyMsc/H
         ml5+GeELPBqYOK8mEYH6gtICLqQAiHF145slEAOhscn67BaIMynZMsDJvHjdbj+KMaLd
         KyQmkicx70+mJlZY6iq7EOzaaPyPID/tqqeymY2IIhvAsZV0d7e9TRZ3AG2+IFTkuljQ
         nGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746228644; x=1746833444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SkVK3bviqHN/t8JmfUhzYvFjjtQu0YyYqPmZLVGI/TA=;
        b=hqzLsbz4NL9NLArBwq/OXdguRVh1Ana1u3e11MsYGuCpviuXu2QJMQCFLYjntf5Oea
         o9s1vJQM1vdpjR1bB6Z3CfMZAwv4YHmKjACHRIis+VovWEHdtgltqYu+eIT4xLsC8jNZ
         V8+DFoQQjEw3JyMn9IZhzIzEWlPdqWihB0DWqoDA6nJdhvn4MD0B90uGzLhybN3PwBkI
         Yk1G+mM0VCeDrkvyNop61MfclgjgDPV66v4LPjnbmqML+X88E2WQuiR/V6ob+hrrH/iL
         dQuxJfxO+ImHoFoRPc74QWJI2sHbx40XX9+wGxyeZzNJOARs8g871OczoQ1g31rLO1mE
         Blaw==
X-Forwarded-Encrypted: i=1; AJvYcCWQy5Lxf+pOHHfof/NwjXE9wsMS2nl7kpzVlJUbZjOtt0M3gX/GpfTOzDO+7Ypby2mT6ANHjMPIMS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUUp53tjs849X2ScoEbTeM31PU7F9ibwAyRIAvsdqTtCXIOTTV
	nRUaEMlmEq0/RDLBrczWDnE4g2XrbTIrur78viKy1vt3QvuIJNi1h7xdfHr97QQ=
X-Gm-Gg: ASbGncvOAVoNt5UpuT2znUMC2ylS7W/gby0V7YrORmTBZQ+n6N+9El3aYumj0Sbr6ju
	1qHIrXpmpAvQ11ci2M7+ynGGyJJH8s7GHU5pIRXpufmD6/F6UEn1QZ/t6EYxuCBoiDTNwHT3tb3
	AsGNcLvOtGHAKSLOkaTZdZKXwcIK1PGGNHYjNfzO/bV/Z1TA5PB+7gu+orTvyQ9sm+al2ZOw98z
	jai6BdN72CO1HMmOMIBnvifcL3Ueq3tMcjtHShPDyWrgxF2SNqiipc9wP7I2zkiqkuoU1DkhYBD
	iFw/ioOBWJEtHKfJ1J5T+YRoOdBD9X2cs7gNxR8YT8EE+/MWTdjME541ir+O/w==
X-Google-Smtp-Source: AGHT+IFdh3sLk6r+rFjqSN7jGE51d34L2PuxOmUSOaSxSjRwNX1uihuOq8DvaZzdvN042MVDHYvDfg==
X-Received: by 2002:a17:903:248:b0:21f:6a36:7bf3 with SMTP id d9443c01a7336-22e1031aabbmr69526825ad.12.1746228643932;
        Fri, 02 May 2025 16:30:43 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ff2sm13367055ad.180.2025.05.02.16.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 16:30:43 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 02 May 2025 16:30:32 -0700
Subject: [PATCH v15 01/27] mm: VM_SHADOW_STACK definition for riscv
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-v5_user_cfi_series-v15-1-914966471885@rivosinc.com>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
In-Reply-To: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

VM_HIGH_ARCH_5 is used for riscv

Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index b7f13f087954..3487f28fa0bf 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -352,6 +352,13 @@ extern unsigned int kobjsize(const void *objp);
 # define VM_SHADOW_STACK	VM_HIGH_ARCH_6
 #endif
 
+#if defined(CONFIG_RISCV_USER_CFI)
+/*
+ * Following x86 and picking up the same bitpos.
+ */
+# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+#endif
+
 #ifndef VM_SHADOW_STACK
 # define VM_SHADOW_STACK	VM_NONE
 #endif

-- 
2.43.0

