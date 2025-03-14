Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D92193073
	for <linux-doc@vger.kernel.org>; Fri, 14 Mar 2025 21:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741988372; cv=none; b=nnpZH1rN30gqH2nFUETStAMhmwoLFUSleh2XB1b6+RGOUrrKIsiqbOW3+Ht3GxtK5nG2r6aTVOdtG6FXvyiyv13VVMQI1fL+CIXVv04Ke5+ekYn7FdGbaQAXadiCPuQJUgmmCoer5IZwWm0W2qlwy+h8lQ6Udi0w2JGHo4UNlfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741988372; c=relaxed/simple;
	bh=pbZsnVycfvlXR/jueZaepHgseReSQSx1x2o5rAzi9lQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=utBV6PLhb7GzsrTbuNPBGVE4kNItygCo8+5bij3kSjAtUfOF38k7HCtzwaAcQUTGrDvg5EGjSeMPFNx/+UKD1EsiAgctVq1OY0q3nyRrDw5VutLVqGDad3TBaSl/OZfT7ZEYRrpS1LxjVYVrCTuuqYen8Z4MbYB7zbBKOY50FJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=m7KCyXD5; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="m7KCyXD5"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-224191d92e4so52579005ad.3
        for <linux-doc@vger.kernel.org>; Fri, 14 Mar 2025 14:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988370; x=1742593170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDDw4jYk8ElhORayLnctVQ+77ceNByh8dqs8gmZ197w=;
        b=m7KCyXD5LnQkJc1z4hTDR+h/VGiM9ZJOvppzKGG89mi2z7hF997+HAp2iVNQvdG8gU
         Zv0IMTWNSNbV0PFimBwSB/VWO65+Py8SABFRH+hwGCAIkXUX189K/w+Jch8F4De4htFB
         L/ml8N0GPEI/0Tg63UW1AuemeMYmMbhk8RIbUkJ0lAIgphrfHA4y8agSB9cOZrdUQ0tm
         Cgst9vZr21qxvzsgRUiZYXVoL7i3iPwHOFk8ZX43QDBy/nsJVfoUvCFgBN72DuivKhp+
         d9q1u9Mu13Es5RX/iMYEoygtZTeQp8jF20lwvdgrnnsECasfo1mih6z4BLag2Ml7Kd8S
         jVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988370; x=1742593170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDDw4jYk8ElhORayLnctVQ+77ceNByh8dqs8gmZ197w=;
        b=Ue+d65AV7AZCWUxpe9fZ8xESWgdVGsNSDkspm+38evtigzI6kILPKoovLoF0Cql0P0
         44rMqmWNnBex49kk0QifpdIYbOKAwjfAxpoH7Cz955F+S5PZ5FffcJxwgx4VmapvhZ+o
         vABC4c0EcMtpP0HaNWMx7aIXfJt3t96rIwTsSf4QQfoJrpGnvFG/8R3f2gXa9uENK+EM
         7eAfSnAO5kKujPAkbLGL9zsV6uwieT8cJbZXfeDeuiXonmU+Qz0Mjy1qBQBrJO9hFMKy
         K7z9UA6qDWPg15bqUg0HVITxd5yOAE1QweZu1FWXI//UoSHF+gmPuK9jWrMdcHsYziMg
         tFWA==
X-Forwarded-Encrypted: i=1; AJvYcCWUEYErlZ+rW/+I/oomWzjGVA4cS2/QUT1nXdSnKpOBcen8UVJQorvj+00iVD8Aui3dsjQrj6hn1xM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZUWurm8xbdYv5nLH7fljZ1sCzGUycSBBGfL4WzGTbZT5g5x7m
	dlfGsW7h+rCkzJqsUsqHu5yBiidGQkrvk0pdVeqy41trH61YmQZ6WuEp87QUjWM=
X-Gm-Gg: ASbGncuy6D4n3Vwuy2E0CwJRj5e8nl0Hl5nOeeCpPyDs1ypHFOXmuUkfym1+SCyAX5b
	7g7ozaItFG76avC0muJcNp8dwZKYgsQhWISsPuPud3jc4tDG/jFmt0tzGfcdGbModJNfWJTNmOw
	o+eknWG0Ixnl9++cHJ1xeZllm07Xgfka8PTj9XVyjvoqtYRcStxbPwJBJKlaXBj2fnJblmrmD5g
	LjkfrKQD9Y3uoyPRtm76UDWpd53ajyk/Rlui7WozkEXYVWNgG+VLQSaPQEoRE5suUkQ4XFm/kXb
	oixi00WSOqXUom3Byh37KGCgPF8KLPcX+B/EV++NTUm5NznjUZLPCt2wmJoaGFKp+A==
X-Google-Smtp-Source: AGHT+IFpg7z+OE/2A1gqmKjw7jqoEU+X8gr8RuneE9Exr7j30nKzCtL2OnQx5eLIT+ktDst/E1FOnA==
X-Received: by 2002:a17:902:db04:b0:224:8bd:a482 with SMTP id d9443c01a7336-225e0aa7e06mr46126855ad.25.1741988369862;
        Fri, 14 Mar 2025 14:39:29 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:39:29 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:20 -0700
Subject: [PATCH v12 01/28] mm: VM_SHADOW_STACK definition for riscv
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-v5_user_cfi_series-v12-1-e51202b53138@rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0

VM_HIGH_ARCH_5 is used for riscv

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7b1068ddcbb7..1ef231cbc8fe 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -378,6 +378,13 @@ extern unsigned int kobjsize(const void *objp);
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
2.34.1

