Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8003C484
	for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 08:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708504276; cv=none; b=hqCfNWHUo9Zu8Bs4BEikz/L/bk55eTetsS7RlzqXT2m1R5flnmwaoJOIMnmAGu467AuRD16X+E7qS53NW6pNgs0Fq1YXfNzQQJHzaDeeE8NXvunFkT5VGgKK8h9Jj2JyY3sp2qp0ICoimg0YpGkznY1gVhcGkwQcs0/zXq8jCqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708504276; c=relaxed/simple;
	bh=vqbvLAUaPJ4WgRR+teh0/Ah4uMsjuy4TXqtUh9j5+sE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jf7ijbPeIyFIXjiIz9Dn/C+O4V51KeuPIRnLQS+UwQPEJc8FrqV6vhPNvcriQHC84EmOHyUOZe6Twcoi/o2icuxygjgBeQ2sto0io/GIGG3Z8gbw8rVUFESD2LnNyqE57EkdYI6NC5GVOp1V290VRApGww/uKe33+BJnLBFBCCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=UhuKLhBG; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="UhuKLhBG"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33d72e6eebdso327031f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 00:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708504272; x=1709109072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3DfmgtPB5KtCEWqqxteO1F8ctpQ9OvQULDo2fgyZ5GM=;
        b=UhuKLhBGQ/Rjv05yaNvR/EWKJMdH1Nkxmlfib/Ra8xN1twy6AVAleTXbmpfS53Au9u
         YMP9aK7I+Bgd4APrC+wdSgkpDtyEJbbe7+C9byJO+BLLa07VnCTfWgcYhFOmpjtYIemC
         fJfeMB6JY5xhSO5IW47UTmBB5huqKeBA3aLhMZZp+JcJrLNfid0DJNvJBJmPVICo2xsK
         T2i7pKBFAm5fPIoEDYChqST6pih7iho+L1U+HHtmjT25vbGGMKNPikws+oQgpX2CbIO2
         foHLlvJrk+FpTLW8yTRZtZTZvdSxqAO8QDWRgXFF194IbydtBLqKFj9+HoUPKY8Z+4ZZ
         LsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708504272; x=1709109072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DfmgtPB5KtCEWqqxteO1F8ctpQ9OvQULDo2fgyZ5GM=;
        b=kFDS1cqNbTHmbAagAtXhf/156CQ4sPVciR4enIZEAumF/gf2YXNJytvX5UGJsP/kXU
         KqXKu2j+xXhJqLC8JyjH36Lt3ALUoVSQFtWZN7NJDVx7iT5j4USk8COkPllplNHxlP9R
         eIJwpWXOAcJH6fLnikW9Nb3LUI4gVdYkiPRcYI4EQhTE8cpWns58g0a212WxhQKO4461
         kmoKv6xC6kaMIdcP+fQO7Kzo52wU6urTU6u5iTgmHqf56vTjsqJA4QTql5UGSn3IWEUx
         QxQZMiK6Yajrammd/LATSofe1PO5WvCjUoyeQIbvs4nU2EThqOybVP7xZG0N62mgoKJh
         16Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXKn/S3LOFdCIfysBEDXe1wbQAyOJiOd182Xb9CqHJ5ajCimlon/CxCRugS6SINfwPCRuqKIiNA72WzbG4VHA45jRFAPp4tsp8R
X-Gm-Message-State: AOJu0Yw1iEyjtrlJ/FmY6D8WJWRL/88J4V/L45pLuIkyGjCT8VIhEVSM
	f1/QBqcMJECKCytip2tU5wFFyyQJIs6dq0yfhPtdx9seqQ7o7cF4ZFcoMOErC2A=
X-Google-Smtp-Source: AGHT+IFpQ25mW9HjQjzpg+0Xj68AfJWrOkwGecdVCbJfBfuwd15xExxElqbvXDzVs+szTRDW8c+wFw==
X-Received: by 2002:a05:600c:1ca8:b0:412:52a2:bd4e with SMTP id k40-20020a05600c1ca800b0041252a2bd4emr9522943wms.3.1708504272039;
        Wed, 21 Feb 2024 00:31:12 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:e1be:e214:b8ab:dbb2])
        by smtp.gmail.com with ESMTPSA id q4-20020adfab04000000b0033cf637eea2sm16210705wrc.29.2024.02.21.00.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 00:31:11 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Robbin Ehn <rehn@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2] riscv: hwprobe: export Zihintpause ISA extension
Date: Wed, 21 Feb 2024 09:31:06 +0100
Message-ID: <20240221083108.1235311-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Export the Zihintpause ISA extension through hwprobe which allows using
"pause" instructions. Some userspace applications (OpenJDK for
instance) uses this to handle some locking back-off.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
v2:
 - Fix typo "commit commit"
 - Add Atish Reviewed-by:
 - Link to v1: https://lore.kernel.org/lkml/20240219154905.528301-1-cleger@rivosinc.com/
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index b2bcc9eed9aa..204cd4433af5 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -188,6 +188,10 @@ The following keys are defined:
        manual starting from commit 95cf1f9 ("Add changes requested by Ved
        during signoff")
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZIHINTPAUSE`: The Zihintpause extension is
+       supported as defined in the RISC-V ISA manual starting from commit
+       d8ab5c78c207 ("Zihintpause is ratified").
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9f2a8e3ff204..31c570cbd1c5 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -59,6 +59,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
 #define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
 #define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
+#define		RISCV_HWPROBE_EXT_ZIHINTPAUSE	(1ULL << 36)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index a7c56b41efd2..1008d25880e1 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -111,6 +111,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZTSO);
 		EXT_KEY(ZACAS);
 		EXT_KEY(ZICOND);
+		EXT_KEY(ZIHINTPAUSE);
 
 		if (has_vector()) {
 			EXT_KEY(ZVBB);
-- 
2.43.0

