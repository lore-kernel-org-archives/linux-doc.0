Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C5317CA1F
	for <linux-doc@vger.kernel.org>; Sun,  3 Nov 2024 15:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730646194; cv=none; b=NtZGldLDMJ5BF/9ea7ukvu3hoeG9NiL4zZO8AnCSqHbSlM2Ty8Cjh1ZqxjAEcL31cGU01fzQmhVWpvFbXPp3zLEkVDFmXYdKCjsvHzwXqNulz0dwFStiHJThyXYCduGk0bYdvgfZhNeJbNejK6CoCJBiDffzlPAo6CfU5+ra2KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730646194; c=relaxed/simple;
	bh=xeHnByhcs5nCaAI8R1ijkMCW2JIwlS4zwscmM/llep4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nnhkMI3E/WVLSleA5aJq8+3/4oq2rBJHGJdnA/9ht234iSQiCk6wPM1ouJ+yqMvjdrkTJeJcwmcBDnWRfMn5C5KHPaK8AHaxD9C1ZNxdSiFUuYrN1yy3uF/EycJR+9HgMr5boBIhx24boVziqK9VQY+bjbrXPDS86rtOBiSPgEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=fLXQNess; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="fLXQNess"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so29820315e9.1
        for <linux-doc@vger.kernel.org>; Sun, 03 Nov 2024 07:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730646190; x=1731250990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51tYDRwP1WvxpzmCthvL0bau6hmUz8qjqFRqrLI9cd4=;
        b=fLXQNessp7bw7zyHRTo7WBFUD2v78z//Wh0lh865XQudosktnxWmbuqumUH7GLtYi/
         PSuPAfrsw8srPjG7MK2V1xTLyT7tMhVnpIPK1ez2rDprDbcYycAPics22yh37pbhIS6F
         2PF1XsLVtsChtyq15/QI3SNPmubWAOK7OvR7awNc/qJmdJRP5471CrvTMQw0HuYD8BhM
         XHakXShR0aW5sUpSls7hUHB0aYu1hbPEmHqu0CB+OzAPTpRZXsGhB+GLh1sk+vshjBB8
         AksswBCQ0mnss+VowigWLTIuJKNcIvJnGflg/uoJhIukkMBNdThlEhhDRrWobHD/YWGE
         U5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730646190; x=1731250990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51tYDRwP1WvxpzmCthvL0bau6hmUz8qjqFRqrLI9cd4=;
        b=k/bigq4jL+QdajqZP6gI9B4zKV6NTSwgqIKC5B8nrt7MllD6+oe6meYfZsTjcTzgLw
         3AKboZV7w6XwNNFp9tQOf76l7pfMwUmE3iiX0PC7MYyQ7e7+ElwxIYOfOTHq6QkECGyX
         m20i5cE6lwE7OE5yp/zC2xVto34kaOs5Mxs50eQuSv5zXCPmqeJiqWknWZPlB0EyhDn2
         RFYOf1FTtDOPF+XP1inmxKj5NR6JiGU4a5VPoWdvdJklw/g5D9Ea+G91V7m5Y2gBBNuw
         bq4EMkc2YA1GvccoOR8lh4FVproDAXcqoBg/PZ7yatWn1maWyQIwBireWs/jCyemt2x2
         Ctxg==
X-Forwarded-Encrypted: i=1; AJvYcCUKjBon2dvyW/rv2uRUjR9foeeLGw5pzL5lDn/HZghxVljOw7/Zs2uzR4PGSoNFMLnuZCbZEReMLqo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1zJsAdii+PBkmHIRsNVKgcLDZZ++x5qnj4rKzAcGOUFjY4LKD
	NfPQ/dG1/+7ES/4g7m0YVx1DAcByjmFqkxqDOYmdZXNVumG8dLFHIOec0eYKwOM=
X-Google-Smtp-Source: AGHT+IFqldFYKHqBiRaB6ae6bURZkYwVuzbn5bQ+e+Hym9E5heEep9SJOfB/eoXxuGPgZenIG/xzCA==
X-Received: by 2002:a05:600c:1c9e:b0:431:5632:448b with SMTP id 5b1f17b1804b1-4327b80d3c5mr115258455e9.25.1730646190486;
        Sun, 03 Nov 2024 07:03:10 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e5cbsm10816042f8f.80.2024.11.03.07.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 07:03:10 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v6 11/13] riscv: Add ISA extension parsing for Ziccrse
Date: Sun,  3 Nov 2024 15:51:51 +0100
Message-Id: <20241103145153.105097-12-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241103145153.105097-1-alexghiti@rivosinc.com>
References: <20241103145153.105097-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support to parse the Ziccrse string in the riscv,isa string.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 74bcb0e2bd1f..0aa3c3f5e682 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -94,6 +94,7 @@
 #define RISCV_ISA_EXT_ZAWRS		85
 #define RISCV_ISA_EXT_SVVPTC		86
 #define RISCV_ISA_EXT_ZABHA		87
+#define RISCV_ISA_EXT_ZICCRSE		88
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 5e743d8d34f5..5f453a039ec9 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -314,6 +314,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 					  riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts,
 					  riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
 	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
 	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
-- 
2.39.2

