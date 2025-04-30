Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEA02139C8
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 00:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745972192; cv=none; b=NNH4OhsGx++vptUbkO0wR+xUAdAaqdcqEAMrSregrGaeFdjQLuf3xXi8mhgDvw+OuJNid/RRfXy4RJsICPfMD1zm+5VQRy63CaKMaP+DpCn0X1weW8aDsTABnEOWlp9u4YyHL8hPGJD6gb46DDJN2W8qFf5cTuKLfXGiJn2PFVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745972192; c=relaxed/simple;
	bh=07JIHRwK+fbY/KS3WXdAQFowggDed4ZKoyBK3fLGucQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mPXqKxjmCrU3RZfam5xRzMQmVqA6TbT+9XS3CvlyCzYl5BPPR8ogLsB9NWQhirehC8IlCz+trdGNgNTL6za89ZXsfugnnMkf7+HkpZ6ruoTZD8iZT1ma6TsnC+yhgqQqIF7t7xLXQByUu65GZPHqqb99b2w1xPG5iq6jIUKHLCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Nzv7/mko; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Nzv7/mko"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22d95f0dda4so96378195ad.2
        for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 17:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972189; x=1746576989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkVK3bviqHN/t8JmfUhzYvFjjtQu0YyYqPmZLVGI/TA=;
        b=Nzv7/mkobhS1qwl3caSpbMi+f0htEk0T/vf7Qe1W5wYEr1P/pip/onTpADOa77EWPL
         VC5yH3qrd1yerG80gpoTNpBqBzsH/YKyr9yHicinym+UF5AFlA6btYIFcdbe01ZGQix+
         ur4iGwktyjesd2cnorq6wyIqROMMxpePJ2m2iRxx0h+IKFy7xzT6Q+pjxaqsS9kzfjl0
         CVNF0FtZtkP9ELctLcok37XoHeUgnpXyzSOMd7xGf21NX5v/MrHpwAEIWQWTXaRrD+ln
         XdX8GKmTUrslyWATKwGCsPw/EJqmlqpDP1ID9Fp5dqsXEG6b30GfgNlTohfxIHvz7Ja/
         yMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972189; x=1746576989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SkVK3bviqHN/t8JmfUhzYvFjjtQu0YyYqPmZLVGI/TA=;
        b=auNnmqJFrix7XBpraLcncwsKo9x2fB72qUua6B79mEq89SYLR9ULx5fg6F8lU3BdfL
         YbUADnz0gvFWoYzlKE7xNxa7wHC/0d2hU0/GoZgyVdH51uKSDJ529V4Tn5qQigS3F52Q
         G6iSGa4+DKME4l1ltIujm+n1NHFcUpozxdpqXPs1to8lvwMTzP7ZK7XxXcMYAZmLdOkF
         X33M0kLtKLl8xxvRo+kHRE7AQqYTx+GxdmzyH54l3cUEGchchUr7O8u6ufKSPPk7pcjf
         1Xm/Bh+RNZVnOtAV8um80uyoHGQP7aPjvbRf3RTMOAxM6JsmB/716o3HzhR+oAsCBgDi
         X6LQ==
X-Forwarded-Encrypted: i=1; AJvYcCV99Qcht14OfoIQWcezCSiLQA5/yVxEYlCfGvxrfQp3sKVakx4OJ6GRly4CvzreXj7miD4/mlsIyIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiI1bkiMUT2Juy2FMXoYWTootcHFvKKaAHp4vlQQaBYJrTVeYo
	7eIUfCtw101lfFjzQdKPNLQ88qg571JGAcWQUthjUZLlOZHxFnSixKMPJuk0yxI=
X-Gm-Gg: ASbGncvO9ZzMzBy4N9s5v0+RHQYAhFpAqudE3JvzzIkzAgqSvyrgi8yO/fUUfouw32a
	BXaZXg/8Ux9XApfeLjPw7l3h8ffwbMleOsjeIGifQSag0XrcTRos1yBARUZUx3uzbW/A+ATFGRu
	FTGjI99weavLTlQ8WLNJqjui81Eht3Xz19JvUiLa7hfCYzJfux2hnC6+uEX+0F2XolxeTj6M7C3
	ulHWI963/h28p5SKi8L6WLhCvdy/42WJUcc0OVGfPHVGA7Nf8uMOrP5M3i6QscMRpD2tW1MUnGa
	NrsT0WiAl9Tot+Mdd9L4rwoK+s4xBxYhs0XizoSveU0YC36YWck=
X-Google-Smtp-Source: AGHT+IEaCOo3UdLjB/YDRvV5wqIWEkwy6tQXnBD9FT8T9fOLPTePyGUVcVc/ygroOS4hwPE4lcSyLA==
X-Received: by 2002:a17:903:1983:b0:216:644f:bc0e with SMTP id d9443c01a7336-22df35192a3mr22839375ad.24.1745972189106;
        Tue, 29 Apr 2025 17:16:29 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d770d6sm109386035ad.17.2025.04.29.17.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:16:28 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Apr 2025 17:16:18 -0700
Subject: [PATCH v14 01/27] mm: VM_SHADOW_STACK definition for riscv
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-v5_user_cfi_series-v14-1-5239410d012a@rivosinc.com>
References: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
In-Reply-To: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
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

