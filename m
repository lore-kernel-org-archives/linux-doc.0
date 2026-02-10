Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789202D8364
	for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 09:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714043; cv=none; b=gywkjbH/5SjTaTKbBFCXgUM4cqADYaikVPBxcWhpdEnGxL72ZQK+618FjElqqq6Hfp03RBrPvh7qEsBeOSYaSR/gkek57YoSvYQspKBhIoRrwGdrZIOdZtN0zic88YZQopuqkcfwUv302Kfk4qMQPFHGdPrGYPlMS2iz0aNlReI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714043; c=relaxed/simple;
	bh=63ZYZ44YU4LogYL8Tr91C4w7OlzNcXn3CNTZsrHwj9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MV9Uf3IBtXC3HNot88oCAzcKj4jk7bOFoc8Z1CC2UZqiNHn6BwmfuCU9AQ2uLnTiV3FtZy+9F2akUai7Qi42mhbTHWUv4FpY9Y5ueJ03dz3TYAbKVQR12VATLTxVf461K1zr5UPjLFmPawiH02Zc3lvCV8PLfZZeBA3DKq5QKHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfFlAmnR; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfFlAmnR"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a91215c158so4553995ad.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 01:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770714042; x=1771318842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWQDA/EkiuOrnzzQZpTgk67yZSDsyGvnGU0WBzxGHSc=;
        b=lfFlAmnR/s8cXWH70WWWBIv7Yr5PDv7+4LheQNd9vfRU574jZZFa4OoiKpbmrm/Vrm
         veFrVBjLIjr2Q8DAFZJK5JzeL+f0LmTnJC5OXOkDhrMF9s8BIui5xNjRUwOx91uHWmCM
         v/nF0xg3O0SNnFnIcxaDQjmFcQCPz6UcukENX7LCRm0pWyFmFgZkqQCB/KzYaQYXZLq0
         urmlXQs48vP95i/RkSDCa05tWtY7FrPETZu2aLLfiCYBRAurmsYMlXGS46uwFob54111
         P7pnRWnWH1Ldhzbe/FwbdsQwfhMd59xBEGqnq6ig4Il4kBADMFM773J5n3g71Zw1hxKD
         Lxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770714042; x=1771318842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GWQDA/EkiuOrnzzQZpTgk67yZSDsyGvnGU0WBzxGHSc=;
        b=WFTaXHGtmhwFYlS5Dpg7eah3/s/GgF6TasCHu5bdU5/IyHggUghVBEKiKlPGa6AGop
         FLHnEOJ7EGNVsvkZXBUZ2RFrWkCm2o1fZ6U/7WsNqQKdphIdoPZ3yoTT1xXJ//lMT5Og
         Tys43lkfYYocjjj6um3bumIHsEt4fUNOvM4xrJAcXSP73ZfSwI+8ahao7F8nuQ5bv2WJ
         MjqKP+d1RpKyV82OIzpdSTaKDNV98lp8Jd4YvIvgP12JwEc4gE7lRtwPPVZH59fFqLs3
         qikoiCbJiMMb+Xwge65QK9ts6jTI2rD8op+M3sH0EKKeImxJ9zxNoSGEXKwJMxLyP6s4
         0tGA==
X-Forwarded-Encrypted: i=1; AJvYcCWVA1TQ5muIspw27PyBxm//VnZfUqm9eq36TyHDgIXXQC5WqVkJillwbVBxj17naoF6HvaIq9HCZTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxVCNMUUmNHk2gdMy88+dFcKpBXCRUPJQxdsIQatOIImcmX2Zz
	Kbu8ec9HOGbyJayzsd/beNoIZrd8FZNb08z/0lkYvkRutqoSjYEiX6YFCIB2uQ==
X-Gm-Gg: AZuq6aK4AultpGTpxlFr+PL9MUSDEaSNwYd5bAL1dxcLmzij8J0sjKTwwk+XrLamoT/
	zxKxtG2CacYpEqEWbsWVAhIPK2AgHkqpEs8GdLQbU8jlrUdhyJCCMY1LSQcpBkYzaTLoX6aRzOI
	pkmNQiObODAufbFoICWtLLpdufz4A+npIrJJMbKWr043loqADIuZHUeB6gzTNM8N8rqvmZXBkyC
	E3j2OMFPkNm056aGB9U8WAAtQrKr6D2vz68EFMDZ1hs5yqk44ALVORBT6/0KmlThneKBI+nK1Kw
	Vlw4Xmr5WbflFBtyrAIAYGKdAzz9kW/EByoRi9xXlzH6urim9EiAKDA3yS91VQL3l6Sn8MjG51n
	tDELM+qszrS00wxPFmHRGG1SswlIjAcffCggvqrIMVTIHWloJgxotaoCpVIVbXMq2dLfVbBNmgv
	BZctwImZTbJaLnzyX6EnE2BsTrGn3gRJW+4C7wjm8Q+YXjYHXrpHTY+FRm2hmLpC7p0MslwCs=
X-Received: by 2002:a17:902:ea0f:b0:2a9:450b:104 with SMTP id d9443c01a7336-2a951969dedmr128874815ad.55.1770714041597;
        Tue, 10 Feb 2026 01:00:41 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c7a342sm129536605ad.26.2026.02.10.01.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:00:41 -0800 (PST)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: linkmauve@linkmauve.fr,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	corbet@lwn.net,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V6 1/3] powerpc/jump_label: adjust inline asm to be consistent
Date: Tue, 10 Feb 2026 14:30:20 +0530
Message-ID: <20260210090023.2587534-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210090023.2587534-1-mkchauras@gmail.com>
References: <20260210090023.2587534-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added support for a new macro ARCH_STATIC_BRANCH_ASM in powerpc
to avoid duplication of inline asm between C and Rust. This is
inline with commit aecaf181651c '("jump_label: adjust inline asm to be consistent")'

Co-developed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include/asm/jump_label.h
index d4eaba459a0e..a6b211502bfe 100644
--- a/arch/powerpc/include/asm/jump_label.h
+++ b/arch/powerpc/include/asm/jump_label.h
@@ -15,14 +15,20 @@
 #define JUMP_ENTRY_TYPE		stringify_in_c(FTR_ENTRY_LONG)
 #define JUMP_LABEL_NOP_SIZE	4
 
+#define JUMP_TABLE_ENTRY(key, label)			\
+	".pushsection __jump_table,  \"aw\"	\n\t"	\
+	".long 1b - ., " label " - .		\n\t"	\
+	JUMP_ENTRY_TYPE key " - .		\n\t"	\
+	".popsection 				\n\t"
+
+#define ARCH_STATIC_BRANCH_ASM(key, label)		\
+	"1:	nop				\n\t"	\
+	JUMP_TABLE_ENTRY(key,label)
+
 static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
 {
-	asm goto("1:\n\t"
-		 "nop # arch_static_branch\n\t"
-		 ".pushsection __jump_table,  \"aw\"\n\t"
-		 ".long 1b - ., %l[l_yes] - .\n\t"
-		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
-		 ".popsection \n\t"
+	asm goto(
+		 ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
 		 : :  "i" (&((char *)key)[branch]) : : l_yes);
 
 	return false;
@@ -34,10 +40,7 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key, bool
 {
 	asm goto("1:\n\t"
 		 "b %l[l_yes] # arch_static_branch_jump\n\t"
-		 ".pushsection __jump_table,  \"aw\"\n\t"
-		 ".long 1b - ., %l[l_yes] - .\n\t"
-		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
-		 ".popsection \n\t"
+		 JUMP_TABLE_ENTRY("%c0", "%l[l_yes]")
 		 : :  "i" (&((char *)key)[branch]) : : l_yes);
 
 	return false;
-- 
2.53.0

