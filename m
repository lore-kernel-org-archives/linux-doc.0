Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCCAF9FE
	for <linux-doc@vger.kernel.org>; Sun, 18 Aug 2024 06:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723963622; cv=none; b=OLC/gCMI7TrpfMZqKC5TD/Fmd71cTezwzhhSxcnbPT94rbSg8UQ3kNaJvwRYoh4n4rw294nWWM9/4b/6ceMMwM50OGz/EFbF5OBoHKa3J5d7B8GUStkR6+GY1uKGGEu9kG5TN5glxIJS1Y7kdCbk7jOTsnaQ5Ht8jgGLzRK3jnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723963622; c=relaxed/simple;
	bh=65N1YDYmlpEvDTK31Deo5Fyg9F/mpaT1yLpXU+1oUBM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mpsf0h1rxQYznK4FSDSu34r19KN+Ls/LoYIFJU6lfwnj8PgBxwcXJdsyithfAfbMcrKQowMz14gnQVKEQvJi4OjN24eeLzeMWaohok94y064Gj5OAzyStr29FviECndW09Fm4t4hF9/8PDUKuZsGXsIaYWERZ/sUDKVD8DBx2qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=nes0/oKc; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="nes0/oKc"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37198a6da58so1424854f8f.0
        for <linux-doc@vger.kernel.org>; Sat, 17 Aug 2024 23:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723963619; x=1724568419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlqxfa1Dgyr/RCZKCOdmB4jO+WlSQVOulpijR1tIjck=;
        b=nes0/oKcOBBBsfpaVKOoE3KX0Ydi2gRP19gxbtxc03GUOF5MUdL94i+J2+A26H0fHK
         t7ESmr9UpHJrrJO2REL9xtdCKGfLd8BW2VzBolDQuf1uoR+/DbqqlccDtagvLtTzqz20
         Me/MIk9hE0pfGj8d61jPnQqJOMPrbkwq10g4dwBx2fwnsxSU3lpX0HWfbfwbnhmIe1ns
         kNv8+WbLwI4K2TIJK2RQBZbIjuJFfklA8ILGCaSuy0gxjZKhTOWooHbT28Ged9jhB30W
         8tlqWV/lrmI+ni/+gTFqhgRL0cFNs2bC0T0wKJD0HiS6n34jr7151Taw47yyiwp0M8Oy
         3VFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723963619; x=1724568419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlqxfa1Dgyr/RCZKCOdmB4jO+WlSQVOulpijR1tIjck=;
        b=Ue/jbZt3U096L1nyoK+AdWakJip/qoYGXE9FQ1fxgsn4hYYbXutdPuYL3Z8kytX4AG
         yRfV7wvMugi7zESN3W2Tw1uMNTKH+2zeBsc5CpjZZ6mplJe4F92Elim2/EoArDNk0Y/U
         iUC1pJTNBUMFJB/HhJE7/NGiipmyqXFrqESgJxZgbX2lwsWMW227Ys+UyOy6a7uMIkH3
         KRQt/gB3O1ZyO+DdjkDzT0Z7TAw9MN7SJFWc4SC9+HzF7QqRL9GeMqMJi4oVxanN3x/w
         yzuP821YqzNgb9uAfyvMx7/lrQmrmHGu7VBZQUKQ1UrBedHIkaXvDDHO8A25+dGxp12x
         gbpw==
X-Forwarded-Encrypted: i=1; AJvYcCUNCIxduAKfBLod0Z3zvWoaguKVpZvg4Nr0dr2KE8FYmF1mz45nuyNQzWGeewAEIu8rTqqfnU/pgKYAeHDZ3OqTtolzlU0DV83c
X-Gm-Message-State: AOJu0YxdYN4uid6mcYFtbfRZrT9llp8Nue/wH+DhcFlZRSs6B4Xb11yC
	CLJ8lbaeZafq3htUWnf80Kv3MZOnS84/i6oKEXBiq/oMMQzmWUy2Q8z8x9MgB20=
X-Google-Smtp-Source: AGHT+IFwS3MzzU8TURVJ4Ap0a8/3o7r3oh1yyMOzNik5dKrEar+UZ6Tut2SPaHafSLHiL9m2WkM9gg==
X-Received: by 2002:a5d:694a:0:b0:367:dc45:55ab with SMTP id ffacd0b85a97d-371944561f9mr6249467f8f.25.1723963618917;
        Sat, 17 Aug 2024 23:46:58 -0700 (PDT)
Received: from alex-rivos.guest.squarehotel.net ([130.93.157.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898b89bdsm7269358f8f.112.2024.08.17.23.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 23:46:58 -0700 (PDT)
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 11/13] riscv: Add ISA extension parsing for Ziccrse
Date: Sun, 18 Aug 2024 08:35:36 +0200
Message-Id: <20240818063538.6651-12-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240818063538.6651-1-alexghiti@rivosinc.com>
References: <20240818063538.6651-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support to parse the Ziccrse string in the riscv,isa string.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f5d53251c947..9e228b079a6d 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -93,6 +93,7 @@
 #define RISCV_ISA_EXT_ZCMOP		84
 #define RISCV_ISA_EXT_ZAWRS		85
 #define RISCV_ISA_EXT_ZABHA		86
+#define RISCV_ISA_EXT_ZICCRSE		87
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 67ebcc4c9424..ea9c255bbe3d 100644
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

