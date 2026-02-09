Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C56368297
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 10:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770634515; cv=none; b=I6wgUIqftbjYM+JCUvqdxY/rpFHxvPU14XHLKMueSZMFID0Z+466bft2XQsP0xvm6utG7Qbuq7MMWj56YSnEqQRr2TefXS+6I3vLqR4LKZyAmmy1/4+5cU4S5EkPV8AN8nlg4D3fMfpg4zzax0yVLpcIMbHfDIU4FyP3unkmbek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770634515; c=relaxed/simple;
	bh=63ZYZ44YU4LogYL8Tr91C4w7OlzNcXn3CNTZsrHwj9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BMWW3PqIbfnSB+qmeJQrXhSwrmkVAnFDGFnx/GwEDdoPMyvd20QoG267fYGruBkt0jBBD0fkWo90vdaX+mBXaOfmeVcwWP/5plynxKyfWJZJlDRpwEZiV+hieJzAIcJ14fdYviSnUBYWPA/rm0qhD1E3FzkBfSMinM1D3ry8TLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akFW4LhZ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akFW4LhZ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82418b0178cso2356297b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 02:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770634514; x=1771239314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWQDA/EkiuOrnzzQZpTgk67yZSDsyGvnGU0WBzxGHSc=;
        b=akFW4LhZ34aWCZ94guGPCqCgiqrrQYm/Pv32JTMAqNB+0DogJ707hel0JXp/XXhtfN
         CTLCqB1Gm11zUI+W2FQGwxIDronxBw59GRb2ly3so2mdkYK5Kw30PWR5qaBD0QdbBTKD
         6imnv/zMm3sDL8s0k/+rlQ788NyO5Z4M+ZS5118aF6hk0Mow8NTpTql4j4f40VquFhjX
         JoRBqXr4qz9TXBJgFEdy1H1ZFS3hr0gNoxqI6L1jO3vY7onnvOWdlIhwAqL9jgeB5Niq
         WFZhYtzC+DNdEeCb6Lh8cwaWC3M5M0OyvI1i4k4WQHzs5LuYoa6DJkim5XO+94e9joTs
         2jXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770634514; x=1771239314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GWQDA/EkiuOrnzzQZpTgk67yZSDsyGvnGU0WBzxGHSc=;
        b=lXmsutEcim+nPfalZS/bfaH52tYDjNdt+yR8a+zjUeLT50tuQWtnqB2cF2U9zYB68n
         ZvDv0YLRjo1YLmDg/do0T7gwS4k9JXKrzTde+Ma+qVKDZ7yw1KBsBUa9og+KDt5iCHFT
         4LM4Eb32uf/tSQEI+Es0+X2hmJHWaehCR73PYzQBmAyJPtwOhVrC9SL1rL1fkCdnFSFQ
         5ufmBAAG2kXTv0hV0+7hPPELcf/LJok+WHTdby37e7XlivAlzUjwmvNg9Po0JbVE3kQA
         R1/JA6t7aQ4xaOXR/m7o3yNRVuAnebNWq/icpzSwOShF01K4fIWum7Dv5kJPHdXcd+QO
         9fUg==
X-Forwarded-Encrypted: i=1; AJvYcCW3i9zZ8G8FbePVVuTgLg2sffxBp5lPSgsFuMMviUa8M4TEGrHOyNrOxuA3yIX9XBHPlW4FF7UQDTA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc+XQXityNnbPkCJbZE67zFHv63zq8elMkDvhtS5dThht7EX5p
	ZXM7cFuVDupPLj+8Yg0fGEeLOeLi5ScJlvo8+akFPqlAwq5GN1lYiHCO
X-Gm-Gg: AZuq6aKrzhiD8cDO0JRCT6d6/Dg+J6XwcoF+zWlw+DHY4k7aBphuGZ+3j1MN/DLOWyf
	Zz99R3foRhMAqIxmSSwhoKZl5QWTq+dQHtSsyNGeVoMabKeljtg+RLz+wVdeJhMrc+qINWqT9B2
	zTvi/OX8cLROqJGls+aATZaleMZCuUQAbYiei4U/Ui0jsTtymYyusUOPr8bouMuWB1VUoIecABE
	Ahrq476piqSMv8ClmZ7tV10GSiqwqJKzepwd1ZOtEnNgYhgGZj4l586qwIEOeDa7B4Ye5TTwXRD
	g/fCRrXy0OC9HKLzCBL8BQNWiBFDx2NKXRIlTvZJqZfVxoFvQRGjf5dhVAUkQWEL1S1YW9QDahk
	Znym9/KQaA6FqW9kpvfiZzDr5KXIbicM2jmxhsm0DmaDcpkiEqeidvKpelCocB6VH/cen/aNJ/Z
	sP+AAM/es89lOHy6AGlqM3F+U47i6iIL8zIaXDxDP3PqSW4Il7DI43De4Qn80=
X-Received: by 2002:a05:6a00:2d9d:b0:81e:5d52:53b8 with SMTP id d2e1a72fcca58-8244172c5ddmr9473132b3a.50.1770634514410;
        Mon, 09 Feb 2026 02:55:14 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418b31c2sm10635974b3a.50.2026.02.09.02.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 02:55:14 -0800 (PST)
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
Subject: [PATCH V4 1/3] powerpc/jump_label: adjust inline asm to be consistent
Date: Mon,  9 Feb 2026 16:24:54 +0530
Message-ID: <20260209105456.1551677-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209105456.1551677-1-mkchauras@gmail.com>
References: <20260209105456.1551677-1-mkchauras@gmail.com>
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

