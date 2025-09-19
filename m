Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ADD2DCC1C
	for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 07:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758267493; cv=none; b=ZTqqgXWryQGM6jm2GrqgNKe89YJ0ETY2JNpheBN82eOk4C2aioJpKgv7+DVnaxRx36rpAQALru27xBJ7W9ZxjhsUcvx/P9d5JWUASAEzlNuBgpYHfIc9o+fLJZ6UX+iap/dNnxemWLF9N4A6yrkx4vFUQLfa7UtF9w52GYLdWxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758267493; c=relaxed/simple;
	bh=HFpqts/W53QUbSMz1faFreS+L9DMcn6zulFxd1eY3xM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fvVEumsViMZOH4+ciGWBS+9t5boGWtqmXdMVdCUqMWaezBrnXyShWFB+8elf8OtFea57NOyDqW/y1BbftefUtZ8ouM4HLXgdBCx8fOVlY7/SNuvWnMcwc5MtY/yjfRNpA5lEFgVR8xJFdXdIopesv4sd7dK40EM6lZsJgrNOr1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=UPjGae4Z; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="UPjGae4Z"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-26685d63201so17530445ad.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 00:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758267491; x=1758872291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+193yncmANzEfIfweyuJi14B+CiP/3dMuVzUWsZjMz4=;
        b=UPjGae4ZNXpH5NhZsomSS9q9OESyMyIIIqPfVzhELyCSISEdBFIMXab4IhtmkfTbqi
         Ec2YykK4JQ9XFCUWAHTmniiHddYAulqndT40f0Yw1HON4V5IqjAugDxrC98/+mVEPVTv
         +ltvoPGsbxXS+F5fnRA1A/YkwM5bgk9XDWa/yZLJJ4D5S67Cyko4yFAR8dZfwaeREI5v
         bBxT1mPML9OmC04K/6nbfgvCvSVC4w5zT/bTzLrFkrBrUjXM18/T7GYg/MKLArDYx0ZI
         vgbOyti0b5dIuPC9D2sHinJ8SykuNLGOd4CoGu9S1igPIo6hLsYBXCFuS/ejhZKWfXR0
         97zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267491; x=1758872291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+193yncmANzEfIfweyuJi14B+CiP/3dMuVzUWsZjMz4=;
        b=hE5niG2ht4HeWVTQS9EOkEM+rKc0CvWOcrBUz3JxWXI8wd1ZJaSNQkbLFDzHOf1ZtX
         ZeBDk0z8sqKcYiT5XaXXwEkW7+aZGihmvW5AK6y4YubmVkjCUrpsr5YamNyF+GghTOxF
         vKkt2409H2sZ0zqg+qaZRcU9xgESXVr48/6qni0sWSGHSeg5pwjnKD451wMxiUQGpqj6
         y6ANbezohNXBqMyZyxv5o/Ky5uKM0dzEBELJzqYD/2CROAIpzZblHxr9TLizQrvTIxDj
         87oIMjKljlNihptPhLbRbzJXC88I/byBRSGVRl+uZiHesqGRXP0RoXNlyRpL/5SX0E/8
         HsOw==
X-Forwarded-Encrypted: i=1; AJvYcCU7zQNKYQ20rEkoPPn9Y3awkzYFIm7jBu5b+rnrII6NIjn8Jqe7nz4HvbIPfLCDAt40UhGcegIS6MA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdvcqgjaUMKMBdo7ZVLPjMnDyQFFHYQKN/vhpcuWGrfrzfaT4P
	/CvgkIooPe/dBSB5ekY1GZKMOMMvFZ5jfn9Bu8bd54yUfcuC1x6jhpXmLIAHOdYBtzc=
X-Gm-Gg: ASbGncvZMT790eSsCEWaltR0N55xE1kYFRg+/egStPatvq+pYLskb5hI4UyHm/R0KQp
	iFVqwtKwDA088yqEE4sxXZSJSK0AKAuWNFzQauy3vpQuuQvV3UBbxo66FCYfd/2pTOAx6IOHT6R
	tNqyjInB1+hIPrIPFsJjZfilURgdUuyx4djVVADxWRtbCmGgMiAU35ieaZHeTZOs+OciEl+0Whp
	cy1iQgXQ3M6zqYx/yneAQycYuO7ITK5FCO5ZRGg4jdj6yGulvRqLztlTgAS/F4ZWAy0sX/WT1bU
	Wt94Mq11EtmF+auJ+hz0WdA2af+aIq7lP3Av2mP7Uwmj3TCLCYaMtcdL8O9POv4oC0T6ySJpiLP
	EpT7nNPCdlLJ9fgcVN++B0gW7vtAQKjZm+yFDqwEj01btl2+0Q5qK5o/UQ7j0Cn4yIzjaDhiYeO
	HZiGLpmiLiFvSBX57TabA1PEAKRKD9fyYRtA5vG/JhRQ==
X-Google-Smtp-Source: AGHT+IHSeUWZ1h2FvilomFO6LKlK35LvsEHQvldORE6E3obR4YCYcFLQha/I1fqdofri+zuG0ncN0g==
X-Received: by 2002:a17:902:cccc:b0:24d:a3a0:5230 with SMTP id d9443c01a7336-269ba54c1c4mr31455485ad.58.1758267490633;
        Fri, 19 Sep 2025 00:38:10 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b550fd7ebc7sm2679096a12.19.2025.09.19.00.38.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 00:38:10 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v3 4/8] riscv: Introduce Zalasr instructions
Date: Fri, 19 Sep 2025 15:37:10 +0800
Message-ID: <20250919073714.83063-5-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250919073714.83063-1-luxu.kernel@bytedance.com>
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce l{b|h|w|d}.{aq|aqrl} and s{b|h|w|d}.{rl|aqrl} instruction
encodings.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/insn-def.h | 79 +++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index d5adbaec1d010..3fec7e66ce50f 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -179,6 +179,7 @@
 #define RV___RS1(v)		__RV_REG(v)
 #define RV___RS2(v)		__RV_REG(v)
 
+#define RV_OPCODE_AMO		RV_OPCODE(47)
 #define RV_OPCODE_MISC_MEM	RV_OPCODE(15)
 #define RV_OPCODE_OP_IMM	RV_OPCODE(19)
 #define RV_OPCODE_SYSTEM	RV_OPCODE(115)
@@ -208,6 +209,84 @@
 	__ASM_STR(.error "hlv.d requires 64-bit support")
 #endif
 
+#define LB_AQ(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(0), FUNC7(26),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define LB_AQRL(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(0), FUNC7(27),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define LH_AQ(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(1), FUNC7(26),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define LH_AQRL(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(1), FUNC7(27),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define LW_AQ(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(2), FUNC7(26),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define LW_AQRL(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(2), FUNC7(27),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define SB_RL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(0), FUNC7(29),			\
+	       __RD(0), RS1(addr), RS2(src))
+
+#define SB_AQRL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(0), FUNC7(31),			\
+	       __RD(0), RS1(addr), RS2(src))
+
+#define SH_RL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(1), FUNC7(29),			\
+	       __RD(0), RS1(addr), RS2(src))
+
+#define SH_AQRL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(1), FUNC7(31),			\
+	       __RD(0), RS1(addr), RS2(src))
+
+#define SW_RL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(2), FUNC7(29),			\
+	       __RD(0), RS1(addr), RS2(src))
+
+#define SW_AQRL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(2), FUNC7(31),			\
+	       __RD(0), RS1(addr), RS2(src))
+
+#ifdef CONFIG_64BIT
+#define LD_AQ(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(3), FUNC7(26),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define LD_AQRL(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(3), FUNC7(27),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define SD_RL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(3), FUNC7(29),			\
+	       __RD(0), RS1(addr), RS2(src))
+
+#define SD_AQRL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(3), FUNC7(31),			\
+	       __RD(0), RS1(addr), RS2(src))
+#else
+#define LD_AQ(dest, addr)					\
+	__ASM_STR(.error "ld.aq requires 64-bit support")
+
+#define LD_AQRL(dest, addr)					\
+	__ASM_STR(.error "ld.aqrl requires 64-bit support")
+
+#define SD_RL(dest, addr)					\
+	__ASM_STR(.error "sd.rl requires 64-bit support")
+
+#define SD_AQRL(dest, addr)					\
+	__ASM_STR(.error "sd.aqrl requires 64-bit support")
+#endif
+
 #define SINVAL_VMA(vaddr, asid)					\
 	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(11),		\
 	       __RD(0), RS1(vaddr), RS2(asid))
-- 
2.20.1

