Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A8E2868B5
	for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 05:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770701896; cv=none; b=ITrsy831FGBkCoXWd6PzlexJ24Ib5seW2BGyVj40Ss/ehfmW2Z8U39lYs98YN0LSxBjAu0CHSBgabDaXBpAyNIQiN6s1VZs8Ch6aF5cTjnutxt9S1zjWaA1qsOTD9Bd5ik5gOtqOLu+lNlVAVqK+iCJ6zUzgK2Q6Dcz1M4nQmkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770701896; c=relaxed/simple;
	bh=63ZYZ44YU4LogYL8Tr91C4w7OlzNcXn3CNTZsrHwj9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SCOOFJ2rU+cF/Gh/oAxg0bwQSkfFuv4EZ86V/cMxlPJ2+b7MOCCXzZYfGoNYNLencjAVFmnVnTjMBO0mIIPW0/iIuUUGsfmDPrESjV265ghXy4rOMaho7uOl2I3o4KVK/VsAMzhdUwmaxvsmkGUKOI5IArB3pDWrV/iwg55OZ94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdDdM3sT; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdDdM3sT"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8231061d234so353002b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 21:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770701895; x=1771306695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWQDA/EkiuOrnzzQZpTgk67yZSDsyGvnGU0WBzxGHSc=;
        b=KdDdM3sTXZE90m0ae+6F8OiU5wyUsOpNvljHSTLIx5nJ65b1U2dIpEBjLxHh+3+e+E
         GChk4m0YulxGnBcmknx4EBZ0xtZgack5Xge6hDJ6OyrfoSFxEPMDxizS5NVeX1ry5OWz
         F++3tYIL9asF70Oe3Nyvo1a7+9InlF5KKvuQnSrk3Zyps/bPejmf5Z9R6ncS0/nQpj5d
         v1E0ol9hFtqZYGfl92bggpAgwA8GEGwmThz8NClGtC1hxd0oKYXbY8I4xT6uaOgBqIND
         ugHOqIOR9gakZr45i0lTaziTtN77+Mbu8DnJFkh3+5jdXvMeXzyU5STY5zSwrHlZxDC0
         paLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770701895; x=1771306695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GWQDA/EkiuOrnzzQZpTgk67yZSDsyGvnGU0WBzxGHSc=;
        b=gqa7ny15IN+sbYLOu/fgiVDjabqGiwq22gXymJqObsx49kLK4pLhpTMgp6ElxDynCi
         AxQSc2iztgmMzMSlbbIObrDt4yIpaZCYJw7gKmfQG/BI/qQ6Bgzktqg9k6CD7AGoLRvH
         KQ95+h2G46DKiRAUvzBtaLxTedG84RYDGXKq+1fs3+X55lkZomuP7fKMNRcP6s2RsyUO
         EiSxkcQ6LkevpcvCsAIVZrWTnmII/2F29HIu50Wiw7NeSGRRZNZ5rIaukcwslvxu9FS3
         XPE0InLLwFaeCVLFcqgYJLTkBE/EM4IO344La57RBD5fV5FCPeiIGxnsIKM9d3ER4GZW
         nHsA==
X-Forwarded-Encrypted: i=1; AJvYcCVOdR5JeyJhh4YWkk1RhBIB6vX5bGn1k9xFsnRwAA3IRBpDokiSg21Ko6HYd5wu8o5Qo4Glf45NWAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXbW1vwmJMsfjmLS/4tKeyihXhII2r8vR4MPFGsdtdtHyLd8jV
	DDxNUnA5TLgMRa3WIRZNFM2G9xYclJGN9lxz40AGc0gkRP5jqOUOgGm4
X-Gm-Gg: AZuq6aKVX8maO1Mv1uZ1MdK+YXA/JXfr1MwEEUohgb/U9YF+8SGvooHpZS0PQUywESi
	/vj6mSnrBJSr0pH/7bGu6F3o40InfqxI0UzEfsic3YxyWp4B1bXssHn7bEBIS2wGZImwqBdwEHE
	I5iXw1SsfZP1KsG/se1tpeYD+Gyir0TSNzNzOEzjP2WR7uVDbdQwNQDZMHyDaqBpNc/ZRG3mAYs
	1sRpLZ5XIGGiIL4D3H95yQ/gSOBauY5vJ3hHzmoneKdvdm8CJAf8DL6jj3eQeCfMXIr1gLmAFF1
	NIk1StmgcDz/fG6G9S7LEn5qsUok392NK3wl+UcB1c6qako83ltn2fBmvSwzMCr5hSKWcmwd/ah
	c8kMu4Y0cH0X0dniVOB9CxWpRXu7gP8imULZ7xdi3+bazfqpLCrwuym89qYeE9+P6JQ6aOXT1Xk
	/FvFC9bCN3L+e6+4tQzKFK8pBa+lVjNJOE2u8trj6EDtLKtxaswHMsSggzEfpTKWUrqEW1ako=
X-Received: by 2002:a05:6a00:414e:b0:81e:8e66:38d9 with SMTP id d2e1a72fcca58-82441632ce9mr12934398b3a.17.1770701894709;
        Mon, 09 Feb 2026 21:38:14 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8245b62d773sm7529056b3a.36.2026.02.09.21.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:38:14 -0800 (PST)
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
Subject: [PATCH V5 1/3] powerpc/jump_label: adjust inline asm to be consistent
Date: Tue, 10 Feb 2026 11:07:54 +0530
Message-ID: <20260210053756.2088302-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210053756.2088302-1-mkchauras@gmail.com>
References: <20260210053756.2088302-1-mkchauras@gmail.com>
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

