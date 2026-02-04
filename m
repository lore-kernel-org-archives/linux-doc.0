Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA0831814F
	for <linux-doc@vger.kernel.org>; Wed,  4 Feb 2026 21:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770238937; cv=none; b=fd1AziGQCp1L5Q2nt/JVu9K8+FwGbYZAMkXjypVMzlU4MStOkjMKN92YO4zWfPnKIiqIUjKMDzrQ2LA4TMfFH5QtUNJ6NeWIVXdlXSGY4leN3P3VNeBTB2KSDyIt8EOY5154h0vlVOS5wadjufI/HU6Iz1vXr+c/lKeyv+dHm0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770238937; c=relaxed/simple;
	bh=zPbKAQTMQ73N6CPXYc6wtR928I0xhlj5pkj0Sbxt8Ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=POmMHpei8nZBOUediWJ0H0OlbFrp/1qoYuphxnLb8DDl9Gvnwje15TVQeQZ4taJBgzUYWu4tWemmLiY0kaCwk6zFEcN1M3lAuRsYqNpH/Tf/dgsrbZeTeHJJgAGBW7BiQd/b6/uTCW8YgmV2phyxP2NKZVjklIQiFGm2jyzABPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1rk0LgS; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1rk0LgS"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82418b0178cso153770b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Feb 2026 13:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770238936; x=1770843736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoWX04fiEAreCl3Yk7mZ6oJ0U44zUIihxFXMVIwTyVY=;
        b=Y1rk0LgSm68SZI9x3k73+hs4YhGXyjoJ877KXcLLAWn1+rDRWnoyVkXUV6a/FVDFNK
         sznjWWuxXzarC/luWAnnCpAuDGpwWdJ/lnzNfd/GSRXzRkGGowpT4sxb3lSY6Js7syde
         kdbGG83XsO+YVWLR/WjWmmiUec8p7+3rTk4QlWml4EH5iqBDAFoJcIQ7BV0/onulW8iS
         NKrqqIClAeHDWWok46xCKHY6OMAW69y04vLQ16t55l7K1BwnhLlkNH51uASxIeuTlKYz
         +HcRArX8uiaswxAOXvqtXNYNrEvJrWl7pTdnBEhd33tuXkOwUSYHPx2vL/QmqG/M/ppA
         NDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770238936; x=1770843736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NoWX04fiEAreCl3Yk7mZ6oJ0U44zUIihxFXMVIwTyVY=;
        b=Ewxp6QSPN+AcyYVzyo+96KaWfrqoagUoCXR0YG4jh4eVkhhbm3TNNuLjbFbZdncgF+
         9ZQ6OpIYR7eeu2xFjT9wUAm13dH5dAeB+EsHJEdOBF6HqBREuUY6fgdseSWIDGgsgxY+
         S6dPmhMG26LyNigtFku6K3tjkW1hqiFxe1ZDN8K0+tmx3ArHljJQ+G/ttZIaJIFVq7AG
         DqzpdLCs36jyshOhFijkwQWmtyY23QEHeV3Am0Z559LMEXve5syJ9yBy7JJP74jZpaIp
         Zw+1BtJBcuZAFjXT5ah1WXwuE1hoK4eA6wkv8TtAJNwRcFTGG675zl6BbDkhP1gWye/w
         tMRA==
X-Forwarded-Encrypted: i=1; AJvYcCUA4MXG+L1EB3zFGkDRn5n/bEt1712uZtZLN4nYP0amvx+mbMkPjDw1u4bjnFFYo2HO/rtkl0ILvo4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6zkbob0/GV+MG5ShxBkpWjhV7ZKrQl16J5KO6r0t77bQV8S5q
	0H1gTI9CfTHwti4fGb1UYfOtQIpkDeXPlUrlgCyB98CDoDoeCrboCkeo
X-Gm-Gg: AZuq6aJazHHPkPY+o1zUDu2F/CwSsYSTWZbmhajwcHvGCF1SIAWmn5+VkyHY9dz3rJC
	0ffeN/SIhm1rYppjMsu0YHE8NCrZp94Xe0gkPwh23sQJ/oy83zdSK/mADdifxvfdgz2wIVLR6qW
	htqgQaWYMlNC596krWmM/L5Nbavlv2q4ITiZnL8Z6gc5VBnRqU1R/0NfDV4lQjnCFrKNNMOjdMW
	kJ+Qpzu/VGa0wa+nYgWmdlt88BqIf03Bc0gwvIW0WOogn0CT0eJlHdXLuE1mlwLhc1B5xdYODpr
	d0mmig4iKPWVchmuiCw+47rdd3P5hyTO/sSdITfI6m5YRSw+XHDR761f7GQXu/V32ZDJ+ZmrSul
	JeiloRWSt5W5FaE3EelqlB/YYXJZSmNBSYSueDv0kQ1mZiPDHZosFeFiFWT+olk2BeGbTz0NuMQ
	zaqAaCq6la2G557Ofdp4HvPNBX3w6LsQivMOO5wX12LIz3/5ANDlSMl8eZY1zuOHMF
X-Received: by 2002:a05:6a00:3c84:b0:7e8:4587:e8ca with SMTP id d2e1a72fcca58-8241c77d543mr4135495b3a.61.1770238936205;
        Wed, 04 Feb 2026 13:02:16 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d1bd466sm3277977b3a.20.2026.02.04.13.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 13:02:15 -0800 (PST)
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
Subject: [PATCH V2 1/3] powerpc/jump_label: adjust inline asm to be consistent
Date: Thu,  5 Feb 2026 02:31:23 +0530
Message-ID: <20260204210125.613350-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204210125.613350-1-mkchauras@gmail.com>
References: <20260204210125.613350-1-mkchauras@gmail.com>
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

