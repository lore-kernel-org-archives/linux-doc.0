Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59283284B27
	for <linux-doc@vger.kernel.org>; Thu, 31 Jul 2025 23:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754003983; cv=none; b=MWr4CtLy4zDBYsoOFkyqdeUmpnVElfDWsbym1QrzWDCtbONUEO85v2nNko9Yj04gBn1v+4QkYuufUNMw0/wkhUuVDOY6DmxfO85ds5E5Uw+owyS+54R/+C9SsggrGsLnozkw7bFz76LzrocHZFFKIxGyOmljZEXbAmzvaD9itZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754003983; c=relaxed/simple;
	bh=1FCtprg+5iy5TwUAdOVeniUOl54kIVW1HbeIvQ2AWDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eExJIFQN5Vk3EcQw4/ZNBMJao0Bqyu4aN/yd95nceqonekrZ2UdSpHs8s/0afFzqdMDCBDhWCc7MGOLnQXO3OUX3hLBRetE6PP9PorKxOerJI6Gr8lELwj6i+XqIIbINhi/UkFzc1aMj+PVetysgjUT8YZaJyBrpPU4rLk+2qLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=rzeHB25B; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="rzeHB25B"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76bc5e68e26so1748853b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 31 Jul 2025 16:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1754003979; x=1754608779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ez7fajQ4lWgiIPATC51FeBxCIECW6n3uAlkHVBFvak8=;
        b=rzeHB25BkP8OtL88dznDNbD9BTMSKv8OS7sBjQ0Wjci8efkXrBnnhupRC++7/qFYDf
         ZdO0Y6RajlzZVjGqYHx+J0D9233OeTp0mZLdrrtl4+NyR6QG6vHY6d56gs34RdZoN3Qb
         yGsf78ALnN/kN3rhzzzXDK3fUGvWZlnZAM0vhAfzpFA5a4kAEH3zLnQfd6PvpbDpGd7f
         uEFk7fvbISptW8fxN0SgPdkz+iJp6RlZztGvPf8DNgHU9UmpmQvBmw1rSvH+XmJRfHQx
         HUOI0fG3KPsF5hcAfQ96pTa+EM0+L58/kjk+WZE4oggGwtXpG+8Rj3Wl7YG5WhvJMlcQ
         4MFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754003979; x=1754608779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ez7fajQ4lWgiIPATC51FeBxCIECW6n3uAlkHVBFvak8=;
        b=wJGxYhykgu7JbmfZewBKD3nBwGcq6FYnbJVxgBXsPcfI1m0ewWQpdp+9iKR/WplymW
         ZaBNfiPXpE0DbLDs22ZNVScKzNtxDmzLp/89YZQvUwFBMaSOJcE7nRJwLteDiS6Z+Kom
         vT7o6EJCEu/ToDANcWoQ4x34HQzJgcbIGh1ymzJwyHn5MxhtRQF9iaT3c5iuNcJGvx3y
         lFB1hH3Icz++6Bl1jvdeY3fmVBwMvcV6gBG1myM3I+TRhTLM7dNy2Qu2cyzDjy0Z4lMh
         bXBDiHYoEtuunyq10SIIp77vQj/KA2OtX14r08YfTbyRCruAo5/JpnIbA3PXFAD1x5dc
         mX3A==
X-Forwarded-Encrypted: i=1; AJvYcCXsBpMp9gkK/1ix7i+sax4dsnvsEIp8ugo+LIkWtSW3UWi+NU3/47ePH4DDw8r5b2VJtl5zMahZI1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwlMoJ8Z1ZjB/cPLN5SnceGTWn30ScxMW1uZKEL2bk2EJ0Qs9Q
	HQ0rC8oJssI/mylhOs1kLdbmRNo4j8rrhQbHx/339seoqwyxrXgZ1MKa0pyeO5Dr+pM=
X-Gm-Gg: ASbGncvpmfNbYTgAjM80FgBBLeaZUC5uHi6yArsCote5r0Ax+F9WY3NVU1tdbfxC1w6
	qmXuWOG4IIOI9yJG0tWnY+6qkD8y8S6LXOxyIB279kXRYcqBIxenlFEK6hnVqyp6sTjZh+hHLqQ
	umlonWT+/S//+FvNJZziyofVD9GR+HiPYrAqvDNb7IKGJ/hZoypIM86bbPON9+q2H9DlLFSHvQa
	MbTZDtSBm6t+kqn1icTDE0SPSHJ5Sh7qdoLJtWFTK0lXHI0o1EcXlwQJNQAI//JPUr5kZeq1+Y8
	o51h0brn6qDpc+3DMWU32tiZIMzjKjzGF2LXdiIqbFsIZNXmGq32LkqHW8tnap+OktxNaW+FOHU
	uwRb417ynNy0o9/JF/xARRpiXYMB91dg5
X-Google-Smtp-Source: AGHT+IF2xo1ZfVMwTGmqa0w+CJyQOLIX1YGoKzAdOOg0c/bt0OowoMzz4A7p4t8/qA7S3n5MiZF/3Q==
X-Received: by 2002:a17:90b:2b46:b0:31e:d643:6cb9 with SMTP id 98e67ed59e1d1-31f5dd7f18dmr11303515a91.1.1754003979507;
        Thu, 31 Jul 2025 16:19:39 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da8fcfsm5773085a91.7.2025.07.31.16.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 16:19:39 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 31 Jul 2025 16:19:17 -0700
Subject: [PATCH v19 07/27] riscv/mm: manufacture shadow stack pte
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-v5_user_cfi_series-v19-7-09b468d7beab@rivosinc.com>
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
In-Reply-To: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

This patch implements creating shadow stack pte (on riscv). Creating
shadow stack PTE on riscv means that clearing RWX and then setting W=1.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index c0d7e67c67ff..792cb9792e8f 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -431,6 +431,11 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -776,6 +781,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
 }
 
+static inline pmd_t pmd_mkwrite_shstk(pmd_t pte)
+{
+	return __pmd((pmd_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 static inline pmd_t pmd_wrprotect(pmd_t pmd)
 {
 	return pte_pmd(pte_wrprotect(pmd_pte(pmd)));

-- 
2.43.0

