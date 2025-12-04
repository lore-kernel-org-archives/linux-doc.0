Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDDA34A79F
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 20:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764878643; cv=none; b=hOD5d6tMtmxHxQeOySY860Pa6PjpRjdJE5KbpQqbeTl44ZtrAL01UTFBfvJ+xv1v4T0ETdEM7KdbMTGI3dZiXPh9axOyu0bDHIcNPHyVoE171Bu6aj5wh6ytNZdeTGzZeH228Wk+BO3dnIueyFWrS4YKQh8Sd1uYPix3h0h1lzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764878643; c=relaxed/simple;
	bh=BfqrkDAmEYT+r742gKB+SlFctae91M/veuPAGWY6Q04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i9SgYcCKm/QDIOKu94g6ipU0uBoSe7iPzPtReAwl/Ty8Iyedmk8pel4arRGOFcS2jUH6SlFbJ0PBbt0rYPJ9Eqx5/8u/e1CxCQwTdUjF14I0dCo148uFo0G2dM4EQwfUL2bc887M7f/LMdJ0ZdmL7JCmb7aEFDipHyXwbG3n/vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=QVhJPuRJ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="QVhJPuRJ"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so1186622b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 04 Dec 2025 12:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764878641; x=1765483441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZzDCu7IaTRxcq9mEPcCPJw7K7qmz1vUabcyA8OBdm1w=;
        b=QVhJPuRJw4ru6itiJ7mirR256wQL1Nwf7ZzEv8ynm53sTdG2LDVUYJbIlylkvuSge9
         l9tWrPUyJZWxDrK2ghm2+lYHwOa6458aXIp6osVS+Z8rfI337uL8Y7hOpdFB8p0WKok7
         WD8EfOKVFpzbSecFSaBvB2Ru5gktu0IEyvd3XD2+0N1RWcslOP9EeIi1tvKUmdk4LarK
         DolC7Mu0+csv0sy9RBYeZ3JxRd6TEHKa4up5wRFtzHfGvbb8NdiqNdomsl5xe86tpnmP
         PyLGuQZTy/KzUIADrY0koWLjZQNOaqnC1ZKr1Z/ew1csuzcJa7FiYsd2FtJuibz1i+ol
         uJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764878641; x=1765483441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZzDCu7IaTRxcq9mEPcCPJw7K7qmz1vUabcyA8OBdm1w=;
        b=UdZrU0mJZzeutH+kCZuwlB78BIj07EkAduUwuq7geR3bIexJ/iJns/9DbakPTM+OjG
         f63eLRNt3Idi0O50Cl6RNTWDdDGFZ0DfDcGllnrAfERwlxiWzMyJ9AeDZrinqnJ+XP//
         /NwYq8PR2X0cBuhcGoNf1blhQXOooOPnqWTiT2Ta5/W2EG5A7QPtA7x+pkj5wGrBV4+U
         jQeHZyvhnzdwB89kcwplo0/n8a6NEFOyk2QhYdjRjAxwWfvyX82z1a10gJdo9bfX8yDO
         /Jb4wYBwMGvu3LKFTy5/7foygPA3rjNPwdkQNUVtd67MChUb5RTGOousFUKLo7AUxyqd
         0bKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2+R88FLpoBpjQolOtKAuVt7Ph8Ec3To2AntkMXuTSB17qE4tLtADDFAGLeyxlqTEwVCdfsPNHtvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBMfjOosE/jecjSfx3yYc3bBR1SMoygW1/vKXFjI9jnKJnq9Ax
	JXdB1WoLY7JwjZMYo9IaP9d0pYuwZjgzxpDGEs3Ru+xqPrxBYYXQXaXnfP4TWDguONU=
X-Gm-Gg: ASbGncvXEEbS3vriOWSmoik52Ayrp8bI7eN/BtyEnVpQaYgvjfBgEvuQLDIFB9A/Szr
	6uosRptiWUyRE1ysspAwqKBq946ubnVJVdJ7xArhBPCpV/RJ9sYnBKNwScaOmP6Moi8pGTd11WC
	6AQiEdYtINYHCEyYO5CXTJGnyI5wiQKrflH2dCx1Xjli3vfKnEiLKn5yJOfIk3m7xiCLxo+6ZVB
	dy9hit5eyOQCHsGuhP+gJYHznyuEiqU0iJBX2u/lKr77WtIDcGe85PGTcGvYu/9D8QADjOO3z2D
	X4TiqjxWWZfYMD+NrqLa+dsFQQQC9BmD6Pq4vySWChQqYzA0ErWkbzFv5u2hNh1eKZY0emSRcsj
	11/CdcYp0Qv96ZZBCWu+xdzV6h5qtUZ6uEMq84TLa1Hp1/dSZIcG86YLe0+jpbdQwKWO25YMZVY
	odsgweIyvE0mrH6+T/tf5A
X-Google-Smtp-Source: AGHT+IFS3/LyaA7r+iO4CE8PdPOdVvp7/Ont/dyD58FlxgFclLSqiPQIEE7yhvikN0vHy7ae7J+lfQ==
X-Received: by 2002:a05:7022:925:b0:119:e56b:98ac with SMTP id a92af1059eb24-11df646417cmr2797504c88.19.1764878640495;
        Thu, 04 Dec 2025 12:04:00 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2eefsm10417454c88.6.2025.12.04.12.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 12:03:59 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 04 Dec 2025 12:03:50 -0800
Subject: [PATCH v24 01/28] mm: VM_SHADOW_STACK definition for riscv
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-v5_user_cfi_series-v24-1-ada7a3ba14dc@rivosinc.com>
References: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
In-Reply-To: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
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
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
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
 Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764878635; l=941;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=BfqrkDAmEYT+r742gKB+SlFctae91M/veuPAGWY6Q04=;
 b=rLyoDrCEHiggT9VGWh+AV59ny1tITwEdtsn6xQ7T68CawzBV32k8ccRrfNpmgg6pBQ3jSqH1t
 By7DryeDPH3CNPKMe3XDDQ4h9GMvBJsJm+XUidd42pvbJxj7L7UGjUE
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=

VM_HIGH_ARCH_5 is used for riscv

Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: David Hildenbrand <david@redhat.com>
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index d16b33bacc32..2032d3f195f1 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -380,6 +380,13 @@ extern unsigned int kobjsize(const void *objp);
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
2.45.0

