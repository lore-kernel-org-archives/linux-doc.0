Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6A3341AA2
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 18:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760552045; cv=none; b=oE1aUYqXAqMrIHg0HKfd23VMdB/J5PH27CDsHbr/TvSHbjD6LTk90J0C1UHq6DGWet3W9oEog+e2sj4077N9PgiQrTDBSkxVZO7V3OBrI74a37/A6/a0QTTddt0WbYJG01HmqQVVR4Aov7y2K/I8mweVCRnHgIoLlRg0BkAOqDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760552045; c=relaxed/simple;
	bh=zG1PvbsubgVB7UstpLjRtN915FxsRLFbcnYegAn0YwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MMMVCN3RW2KtOie27mfQjtBmSOREQq1Cjg69grfZiVRiGSh/BiQV0jdW/GurIaiDmBNmBUSUEOQah6oMpX6uySXFVGDN4Zy1FLqg1laR4MwyLNjPB9ReiExOb3PNaNswSEmhMF4sQ+lot+2VAPUuVsVgD1bBb3huH5Hu9TTl47o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=MHEVBTF9; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="MHEVBTF9"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-28a5b8b12a1so63030385ad.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 11:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760552044; x=1761156844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9H2LPWU9+l2k2EeL07qQml9rdpRAXigNCc3vd68LC0=;
        b=MHEVBTF9STO/GNVSxCK0nA02PIU01qRQ4JK8OvrVRABocMgICDMts2BJ0lRLWuQuNl
         6eSNbOkm1WsurkfusnlyzxCE/C3rHEDyIlGumuzD0arNW+VRkvjbz5XM+4/VdV6M2OA4
         RmhWyDugLOpEwn9nfYOXj4VpXHd8RrAgyeTDyJTOwdt8h0V7jvbeJFCg+ZxWwuMfYMFd
         fG/v13wfHa0wcDo4FFiuzlMA6d3sgxBbhcXVFqnZFMFi71skuti5hcY17pugbykEtcvb
         76mcMcGjuOSi75o+bX9TPKEQNx6gJWVCx0aQb+hy7CG2dQSWQPvfQVKpds0RRR2lIfoe
         9fRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760552044; x=1761156844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9H2LPWU9+l2k2EeL07qQml9rdpRAXigNCc3vd68LC0=;
        b=Y6GL1oeFOaJU1oORKPx/ObOlGGRubVLZq2Oo26CCOkNt5WN8jttdgoR0YQ86JLZlho
         K8WNl5XgILaJXloRYxlSkId8fRbvCbw2vNoH4F4bNknsaxQmHqrjsgEJ7jZNE0U/Ywfx
         dHpJuhAG91lipQudD7PfCldx5slZ8kUbCqLc82uMTbeWhPgq7e3TPPfRmWXwyXw0OTLU
         qnHUqUNmDVLWaNupAt56xTGiDWdE9gtfCFBZoPoYmE4YDsWqPcjieQGf/LTiRg+zZKZQ
         6XlE1xikR1IR+ASTh8icvbeJA00/ajr+HA/kIC8bYbD6SAfyUsO6D20cctkBAkqwCioc
         JEgg==
X-Forwarded-Encrypted: i=1; AJvYcCVp/ok8OrMJRG4AeniEO6d/qUMGVHws0YPsGMgO8YQaPjEJhn/qVHIg/jM2JMcD4sbfOsns7JiVPqg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4nHd6AnmGBmRgiw4IxlGnv0aaV0urQqdk7edJ27QRWeFC8nlr
	4GBorxJVIMgMSWdEyMdh3sPXKpZ9qkx07j1fQ05+DemwQ7q0tm0vj40mBJomiauD9CA=
X-Gm-Gg: ASbGncul7I60F+6A8zZP38OGvi88UDanlj/ae/3PU2yIG2CtYep8n6F6MEMy+qZGBD9
	nv/H4jfZlLKEEAoDjGTw/v//GHPfInBhEZ1d8at9oR9lNFhQwrra/ztmnJo1RNxLCVaVDsUIzN3
	aAwvYyS4oQeEDUz8lmnlWy7qPc0HziWuVxh3dzLqUsnKPLyJ0naKXfz8kCLe32xBSbqc1Lsg5tE
	bdDxEXmZ17MaA2fJOuzodemeeZYAwv2LrurdaTZFRPSCASYpIn5cybC9xIXDVlT8IoMML5ewoB6
	1b+Q4ug5iTxCxCF3gd6UxwJ73cHIZYP9hg49Xdh3AfCzg1kApQ9uS26IRmXtDQXfN8YFJwpiMM5
	8wpHmKg6LAmWx5f61gL96RBsW1NjP0R2JxkWTn8ydlbxPkvowIZB9cwonwY6eTg==
X-Google-Smtp-Source: AGHT+IHetZQQxpaUW6Ligrelt0t3SG9P3lR8csbC0fN5hsFXEFcboGQK7fC7f7E0BUqjK+kKMsFmwA==
X-Received: by 2002:a17:902:e806:b0:261:6d61:f28d with SMTP id d9443c01a7336-290273ffe94mr346464585ad.50.1760552043546;
        Wed, 15 Oct 2025 11:14:03 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a72esm3126625ad.21.2025.10.15.11.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:14:03 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Oct 2025 11:13:41 -0700
Subject: [PATCH v21 09/28] riscv/mm: write protect and shadow stack
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-v5_user_cfi_series-v21-9-6a07856e90e7@rivosinc.com>
References: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
In-Reply-To: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
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

`fork` implements copy on write (COW) by making pages readonly in child
and parent both.

ptep_set_wrprotect and pte_wrprotect clears _PAGE_WRITE in PTE.
Assumption is that page is readable and on fault copy on write happens.

To implement COW on shadow stack pages, clearing up W bit makes them XWR =
000. This will result in wrong PTE setting which says no perms but V=1 and
PFN field pointing to final page. Instead desired behavior is to turn it
into a readable page, take an access (load/store) fault on sspush/sspop
(shadow stack) and then perform COW on such pages. This way regular reads
would still be allowed and not lead to COW maintaining current behavior
of COW on non-shadow stack but writeable memory.

On the other hand it doesn't interfere with existing COW for read-write
memory. Assumption is always that _PAGE_READ must have been set and thus
setting _PAGE_READ is harmless.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index b03e8f85221f..df4a04b64944 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -415,7 +415,7 @@ static inline int pte_special(pte_t pte)
 
 static inline pte_t pte_wrprotect(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
+	return __pte((pte_val(pte) & ~(_PAGE_WRITE)) | (_PAGE_READ));
 }
 
 /* static inline pte_t pte_mkread(pte_t pte) */
@@ -611,7 +611,15 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 static inline void ptep_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pte_t *ptep)
 {
-	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)ptep);
+	pte_t read_pte = READ_ONCE(*ptep);
+	/*
+	 * ptep_set_wrprotect can be called for shadow stack ranges too.
+	 * shadow stack memory is XWR = 010 and thus clearing _PAGE_WRITE will lead to
+	 * encoding 000b which is wrong encoding with V = 1. This should lead to page fault
+	 * but we dont want this wrong configuration to be set in page tables.
+	 */
+	atomic_long_set((atomic_long_t *)ptep,
+			((pte_val(read_pte) & ~(unsigned long)_PAGE_WRITE) | _PAGE_READ));
 }
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH

-- 
2.43.0

