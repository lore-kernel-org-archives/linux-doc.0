Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D652FD7C3
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 18:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770314694; cv=none; b=f7/I+5l7iRG5iH/Zkj8XmVurSWBntgkMXH7MLDAxqjn+Mj7KiExYhu/ZRch1z4bd2e7gNxY/UGflXq3qmVCxUp7paVVILwZ/swm2AKmFnDEfQi9k+h4z5qrIaAdwuFtEFR7eHLlrHAnzElNxmU8qbZFc1z7NGB+O/oMCaikm7d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770314694; c=relaxed/simple;
	bh=auA7ow6vRo3/mVj/+v3NlkMjEZplqHvgFyrLMmGvZo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b7Ryxvo5K8JvBu9alokqA9l9NHd7cZp+/Wen+E32+lwGpbgzCbGDtluOgKcJ0QG1h621NozBEftCuyFrDDHuZoIXn6FLE41fZAEUEoILPpKZ1WGvwmD+vKjWgXVRBTGod9vlMNK9vp4f3n2IO5u2SGC15QbsNTt/Z5W0Rgt+tsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTil94aN; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTil94aN"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c6c45a843f7so290598a12.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 10:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770314694; x=1770919494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4uYAbV7Sxvgyz5kvjGT8mGHdFWc9k2NP+2RxVBw+YA=;
        b=fTil94aNYobUSQ1lpoe6Qfr65vGNIfbbs7STrctVUrOJ6VqGkFa4iVgY2VH6ETGxLN
         uxtYa9cHjFn/ntcTYheisF1PXqpgSmgfrbK7B4tK+Vss2PgrlP+UrClHtXH8BZfmSkZc
         Xfl+c84CKsQcKDero3LnHYoVQUUnSlVxg1srNhTg9krlczRKfqICe8Gvd/ZDnBRM0X6Q
         ZpJwv9NcX7THb4rDJjTWRIaT7OCrhvyDVV/OC4AsNTpQxE55zqAiFjFbWBE9ZTZfPdkz
         tIzZJ/ZSK0q+1/+C+PQll5dKpmG08FkBPJ+8uBRxf4xCWkkTm/KVjw7ixfGw3AXYhogN
         qbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770314694; x=1770919494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s4uYAbV7Sxvgyz5kvjGT8mGHdFWc9k2NP+2RxVBw+YA=;
        b=jkXtWtdujUaHmBJ47bcRnu6wgPP3XCuu0hGlvVEyD6YcIuBSHBJehO1c5JaWqrDtTe
         vHsRRjHqB/U/hNJIm/ou7dhwmbTqlDP1zjguwyC8OD1UnMYzXUIQoX0+z7144VAaCXeb
         pFpYPLOenAZO3qg1oibMMFwWxMjAT8z5lNqpMfSdJJRgG3uzHNeAD3soxRU1IAvtFdwK
         f5QAOF1yWHLFAunttQC6SbRvGzz2RnHX5p2iEL4E2mTFzBkNEQJI2RChta6ROc1cnvpw
         gER7tKWTA9XWz50eDH2yo5Srqx6zFhbPMCNUNFilW37Mu7Bn3tnQOyuHE2bWX7UwVxfz
         LHgA==
X-Forwarded-Encrypted: i=1; AJvYcCUjZam3YY9ySgekvt8GhufhvhUMVBzlk2lP27F0uluS4H+FbYhn6xd8ZC7RJVNAR8LS0u/KXZUOyH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMNgPqmBAAfH2ClWRdR8G9oWhIcCOR0atTURF0mxItNmH0tt6D
	DQo7duaUoTvXGVVFwdPzPF8wadFACuGe/yk7w7DV5kdBrUpeq/k9pR37
X-Gm-Gg: AZuq6aI1yNG5KM71ouRpxa9nU/KdBASH0/I149Em0th5kaadvQzqyE0AdRcbJBKeZhg
	VAKbVKNZmeO3oFaXWBxV6oXCWbmF66K9llG/QLOIVagxNN5/rxlt6TvUUwQwCXYqMJwxoDF93Dy
	Lbvr+69S8NxFur2tBnGqAJzc/a03el/RK+OZZsh6nZNMeTVWfRu5xKUqMA6kCHKUiqcHcQMf8dc
	cbkI+1Rlx51/Ed4Jn8PUMcgydSa6kL4HdZ1armlCNZ+tUiCOFCi1UsI7VJB1DbsZEuUDXTxyR93
	YVjN8Co0oFwFcTSapjqU8n7Ktq5rj2y9WvKRgy2jM2dYJoqpeTnr7DFzF9ztMRRF/p+YpGQfJ2L
	GRexKETP3hGypI7FRzbCbjWYgGZ0wXx7DA6pHbAhih9BSfcNKpo/acE59w9sLyowvqTKdvO/lpe
	2MXG0z5Pq0xBMw35cpDEMqJ4f+w9xICBCw2titcQl1HqX91367FdKwR1yVWT30lQ==
X-Received: by 2002:a17:90b:1cc4:b0:340:bde5:c9e3 with SMTP id 98e67ed59e1d1-354871b1efdmr6858029a91.23.1770314693772;
        Thu, 05 Feb 2026 10:04:53 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.167.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb5436c5sm99812a12.15.2026.02.05.10.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 10:04:53 -0800 (PST)
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
Subject: [PATCH V3 1/3] powerpc/jump_label: adjust inline asm to be consistent
Date: Thu,  5 Feb 2026 23:34:27 +0530
Message-ID: <20260205180429.3280657-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205180429.3280657-1-mkchauras@gmail.com>
References: <20260205180429.3280657-1-mkchauras@gmail.com>
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
2.52.0

