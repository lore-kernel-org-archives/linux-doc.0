Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA591F2BBB
	for <linux-doc@vger.kernel.org>; Wed,  4 Jun 2025 17:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749057379; cv=none; b=KrdqhExndHDg6rxT7RHaA5W6wgPuaHhhG3MX2kS4jEO5SayRkudKjUrli4yQOZ/Iy5ANg1esjPE0KZc4hK2YSM5A705yJSiBtRAK44JlxsN00qDXA3/VBH/n6erqVRZvbHNYcYO//CqCOsLSqvIF8hlAFJWzSva6sUBaYepTXpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749057379; c=relaxed/simple;
	bh=uG4QPZVjl5gDK86VnIwXxVnXWRkca87HCRZHSL9+/F4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gsRBHWdseqqu7u4GMZIBsvF1bLmggiwV5ltiW52p5L8JsTOue/nQaOA/MYbzIdFDv4g0+cHzJisJb+irqVbqxMQrjG7JKkDbvyhbhG+GcEp0WSW9OvtEw0cgciWhM7mXsAId4mn1Px/AqROOHxnrMaoboOizEJfFEpt27Oie/Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=O/zuGXmY; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="O/zuGXmY"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so92737a91.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Jun 2025 10:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749057376; x=1749662176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7X54j1g90psIDWU5pz15Bdf5E+ehG4+aRIqU9eaNKxE=;
        b=O/zuGXmYL86lTvTOiAnuQF4/gKf0p+Y98HAYr+0xwH199VVC9yyaV2lE62tA+R6Cs8
         bqIwEQJOSE0tg5+W5dWjGqjCkrDgvnRQ/DKHs0zGLlLiSH8gKCTUHEBqY0NFWnWzMMWu
         k11Axp1YFpNsduAZ1/AuTKklZqwhWkOmuVmqaFfOUOnd9fN5NPrDk1EbXglzuecFxr5O
         ZRyuCj9/g5kjhApp9SjHa/B8sb3tZP5SSZt5ZCtf5n4BvOAebZeDzr1rOCStqoj2EsXL
         UjkcT3DAYadd2YUkwU6X2wBKYg2OfJfaR3OlwRQGugSo2BSQqYEuL1J54bzi49xkAFP2
         eerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057376; x=1749662176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7X54j1g90psIDWU5pz15Bdf5E+ehG4+aRIqU9eaNKxE=;
        b=remDWFIbf865cPBgqRQO3ieezRbuorsb47KQ8IY/ETNUlNFvgg6a3boRSRM8S7DXXo
         AXBGb7V5cnCWepBrPbLi+G8NS4NlV6whjiDkuYf/cdLDb7eGzu5weannmdNMUMA9Q4FV
         ch//iDiM/MqQhY04DIK33//xLVaJOjI0D6yh0xxv/OprQf0hy3ij+ojKiO6owu3RL0/f
         71MQUHYjQSJNNVn5PzTQhWYhOEFLbImgEOn9JKXREvhVaPGCiZZuriPHpBhAOXshkNq8
         CWkgz3tQnjoRC9XoLetYqD/3GjLZzyS2Cstf/yL5ywXQHY9HwnUAkK83G0tky8PGyrHn
         H06A==
X-Forwarded-Encrypted: i=1; AJvYcCWg5/L6zKIXQY4/P5vuTqJgXiUfo7qcxrOIr8s1mTm+PXzMuBl8nLplOgXmmqZSIrP9GhKI9RtNuL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfTHcMlCvDy8Mb8hAer73Ugul8Xi/0TWBlDDEeh+MinhuCJYJb
	ZDIeY3/pUmHQefzCPBJu1W0+XkM1CGmWq2ZKkadS8wTDqpwjsCTT4d+Shd04Y/Y4JSw=
X-Gm-Gg: ASbGncuUe7J4W85x4DnReCWU6cun27AkUb26ePyGB0dFd3YB1HmuAdZYhyI1K8iaJvg
	/aygPXn8MElxtKYtWzYnjnhuaW5k4sFbDOGLZCn/YrYxHqu8VuQ05b+2XlP8p9gO7jCQEjRztf5
	pc1MeXAJd4D1BEAcVk4PGVnSUu7kPY7JshS9Ycd5dMjZOS+6VKgQN4kHgL97hWMZlV94sBpCK8R
	WYIMdtsM2VOkl2ewSvk5DHsuT0G1udallBQvGtA8/YBU3FHdqhzC1NrzeHhHMps4q53Vqj2KUJu
	76Rco0M+WkF9gAzfgpP3kEo8qdvzuH6Eara4IvkzT6uBlbqSZ3pGSPXgaHJziMvwjCgOnHJQ
X-Google-Smtp-Source: AGHT+IHxPqIk1owtxlyp5LegtYf4MjOLT64nMI3kVgiGthtvO0lFym3JvM1rzmQWvRKFQF65n5vIwg==
X-Received: by 2002:a17:90b:28c7:b0:312:e731:5a6b with SMTP id 98e67ed59e1d1-3130cdfb38dmr4440357a91.32.1749057376016;
        Wed, 04 Jun 2025 10:16:16 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e9c9fsm9178972a91.30.2025.06.04.10.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:16:15 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 04 Jun 2025 10:15:25 -0700
Subject: [PATCH v17 01/27] mm: VM_SHADOW_STACK definition for riscv
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-v5_user_cfi_series-v17-1-4565c2cf869f@rivosinc.com>
References: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
In-Reply-To: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, David Hildenbrand <david@redhat.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

VM_HIGH_ARCH_5 is used for riscv

Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: David Hildenbrand <david@redhat.com>
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

