Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DDE6A33C
	for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 14:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715957602; cv=none; b=OPA79CY4srZaTuh+R4Glm2gRCn6f3AdSm7omfBWQS3ABCy1KqXOOY9aVSffjEK61VTnWoX5/4eHPkpMAPJ7qMLJN/aT8/NdY0rpsTyHrYIvudXnvWnYi7nA8E+O/zdFfeQjJ8Nm1fVZKrOOvTTK0Y5u3cixA+ss7em30gunTFPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715957602; c=relaxed/simple;
	bh=fjweRB4T5U9ioBqhvUX+N0QScQOQt49OiYdErFsiD4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UxKP81PxF6E9xW696uCW21S8j6qJAkzQf1vxajrnOZxjgG7mNT7BZR+ZmNXzfyhomwRVQGFZy3/SZYADQUZ3rt/pXlt43e2eYAneZ3mw7OVuxSufJn3qLu7nn5kyb/FtpNEQ4YXdTSRJVnhF6ES5R2QLwnVrHNSmI/7SmrMYMHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=GWlqz+5u; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="GWlqz+5u"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e56372d5e2so390721fa.2
        for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 07:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715957598; x=1716562398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYWkj0uQleaCMPiVc0IX1xdL2m6WhFkCEPxGzctu0Mc=;
        b=GWlqz+5uEBGd/ns2EOHHIrIk3xjDlmU+7+3eJ6RqkZL4dJFh8ibDeWi6Le43quLq8t
         3eZ7W9oEzQCWISdvqUHEwZbPAdQOe/RDB2r8ZXQcJtnRLyf3APRboubHGmdO5bjiM+si
         KEVdOF/pQE6yQvnrammqtElppxhs7Mt6fJBiKhdr0BCW+BHEsH5irVYtpBp6g7VVpCLi
         TL1A+2HLaes7eVqBaxVXk9J5b0iyP2zJiQbBM2Ucnd1fCrflfpbSHA3F0l9BBGnROjmh
         mGyzhXnjKF7msVwRMhQrNviBGoP0C3DbReBnNBrahGhu1cvb1tQfRhIAz8qywGs/4FGM
         EuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715957598; x=1716562398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BYWkj0uQleaCMPiVc0IX1xdL2m6WhFkCEPxGzctu0Mc=;
        b=L7GlRDWhwOGTQR1NOXnM8DkUFsEFQ3YRtglOb7wjaZzAuT7m+/mRoSExdIm6PLnLLU
         ibdzi50nNZY0Ikh8LkCy+DPntjnJMS5z+52EXuoMn/F7vGJCNmgAAGHVcBJvci2CnAFw
         hzwlDPS7XEcztjrXc+SSrnzikppoFLFSEBMO7w/xIuwTcH2PtHa+MzSciHHe4ii8WgnZ
         8tS2Qb+F5SqZmCve0Ub2elpj8K9d5bExxqDJHwP3l7c5UL9z0MQ0hLxUXprBB+onySix
         LRMlOhATOO6hqd3B0IXrGmmHsnaUBagTvxl1bulaWwYVNBrD0YMw4QEZLoeRHXx20gCU
         rZxw==
X-Forwarded-Encrypted: i=1; AJvYcCVfe+4nVioZsYyFtqFiR7MAfA2rvDK1OUSnlifMChTdJTkSxknUBCPfuHRzDdyu6CwdeT8HvqyFaFMzYGrYxiFDjL6gDcD+/5MN
X-Gm-Message-State: AOJu0YxxIcezlCZXz0Ok2Q+cme+5AKAv8/nHUm8RsTN80WmaOlmEuWgT
	Ah52gHdW4r6v5mG5Lds4ImhCeAb1BMfRwuEiALyKIWqvMHfaKf9x6nXThYf6WuQ=
X-Google-Smtp-Source: AGHT+IFFIQ8bCYBTkej73vjqEl/30GkvcNdlZ/nAYriy2LKRNANi0QgdpIuaZdQ1x21X/bcvyrz8/Q==
X-Received: by 2002:a2e:9094:0:b0:2df:4bad:cb7f with SMTP id 38308e7fff4ca-2e51fd4b333mr138901491fa.2.1715957598226;
        Fri, 17 May 2024 07:53:18 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:46f0:3724:aa77:c1f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm301723695e9.28.2024.05.17.07.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:53:17 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v5 02/16] riscv: add ISA extension parsing for Zimop
Date: Fri, 17 May 2024 16:52:42 +0200
Message-ID: <20240517145302.971019-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517145302.971019-1-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add parsing for Zimop ISA extension which was ratified in commit
58220614a5f of the riscv-isa-manual.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 1f2d2599c655..b1896dade74c 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -80,6 +80,7 @@
 #define RISCV_ISA_EXT_ZFA		71
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
+#define RISCV_ISA_EXT_ZIMOP		74
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 2993318b8ea2..41f8ae22e7a0 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -241,6 +241,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zihintntl, RISCV_ISA_EXT_ZIHINTNTL),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
+	__RISCV_ISA_EXT_DATA(zimop, RISCV_ISA_EXT_ZIMOP),
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
 	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
 	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
-- 
2.43.0

