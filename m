Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C1F3A1BA
	for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 15:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708357760; cv=none; b=dOhW85Mx2KDGIthXWsxNAjZYEWbV9POsyxeNWW9GGH0bUB7o21Jym7wsur1O9aezQlJTWaqhC8sz+ApWOP5fVZ1NtC/0X6opFS5VSWaIrXckyHO/HGo7gb7pGljBT6rdF6mfgypYnH+y+g4RYtS87lbidPqcF4XOq45mE9D2BVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708357760; c=relaxed/simple;
	bh=ZwHY7vGldHgliLrYajuSNrjl8dkhc+l00GhDGeXacpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nac2BKMZ9vONb6xYr/IWutkpbhkObYmjhbVOqL/7RJzyzQj24xd1Iu0eLmPNEzlfScVKpOCgkQNK+GTqmC08xTg8l/5GENtK6Sz3G13+yzRyJRNnsq4U2CiYrMnZNtWBKUIh/nxYV1MEXBe5PBpq4c7pTXVN6ZmAaHKym/By3YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=0huWCQg3; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="0huWCQg3"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e45c698090so146737b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 07:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708357758; x=1708962558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CDVX+aQQf3UCj4psWuuhlbCqwqS7vSYaBRqyqThSZrc=;
        b=0huWCQg3kTR6VujbrNMdjgFsmkAEGUl/PuM7kflv6vVa8kbAW9zOEvqi+MYryOs5ra
         YnvkS33R2oSVF0ri5Dbr0Vf5bbeudQc1IUhQW778oDHWoDiksaH7aPx9ynCkuA+aILGi
         4hnSN4zPilP0R+RNcYcBXsovAhWEGJi2hsnrEJYqBDiy4ZvlaUjWrwEHkVK8enFfObYc
         YZo8K4SoNQHuKeRt/9SYATh4/vv1bgUUr/BFmYuMp7jt9NenHpieu0ZcD+SSKGhzRevQ
         4x1qIgVPRvtqY+cvB0ISVMz7ibM1OZu4wwXlRsnIOYb5NmxxO7986+bGr+WZPK4mg28g
         rYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708357758; x=1708962558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDVX+aQQf3UCj4psWuuhlbCqwqS7vSYaBRqyqThSZrc=;
        b=vMKJfGqf7KaWQJLcANU2lwTkD5fMhKjeHl+KenhTst2mwe1BC7t32mTQW0n5YMWM5h
         5HxfBmZQxkmNoSJ2pt7UANpIyJKVCTadO9ArGZuT62yNAd+L3t5TL3qcVgwejXz1Ytvu
         DVZh9iQle+6EWsN7A1v5uavRTaarWo0wx5FkKMKDwVgh1KIbUgsPWZNCVPESrSjCVDgi
         BgPk36g5KJ97Prn8XjI2nPbqlMbFzs/51CNb+QlLVFDZ/K35YtD7kVFZYtcUhNZOZOa1
         C6o2h+cqxYFXk/n/ndORrYukAieDbwO5g6w0YYFz2wH1UN5UWy0fa1qqqDWCuEAMZzEZ
         f3cw==
X-Forwarded-Encrypted: i=1; AJvYcCVYc1ji2hs83uF1KY4kA9eEH0rMUATkdwD9jqSlXEglafZXABtwYJQDUI/BBFQ5vmqVSGpy6cZ++GBmg6oKABbvUUP9VAWVMk+f
X-Gm-Message-State: AOJu0Yzy7NkdhgTtuD+5VzoIvST3CePyqFbIosN6xOpkltJyXtX7VuXf
	okKv8/f/G80hwc4t+h0cfDop3OX1t01bbt4uTlaQGB3TfMIgOu4ta3Zkab9rIwY=
X-Google-Smtp-Source: AGHT+IEcyZCHhd6HIFFkqbFH2GwEOuyTsp9nTeseU6jdpsxfQQbNhEYUiWvejav6rxmgpRl71P7gWA==
X-Received: by 2002:a05:6a21:789d:b0:1a0:a6bb:d0d0 with SMTP id bf29-20020a056a21789d00b001a0a6bbd0d0mr3708851pzc.1.1708357758289;
        Mon, 19 Feb 2024 07:49:18 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:8501:8c81:d5c:f8d2])
        by smtp.gmail.com with ESMTPSA id lo10-20020a056a003d0a00b006e0f4a183c8sm4990773pfb.104.2024.02.19.07.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 07:49:17 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Robbin Ehn <rehn@rivosinc.com>
Subject: [PATCH] riscv: hwprobe: export Zihintpause ISA extension
Date: Mon, 19 Feb 2024 16:49:04 +0100
Message-ID: <20240219154905.528301-1-cleger@rivosinc.com>
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

---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index b2bcc9eed9aa..0012c8433613 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -188,6 +188,10 @@ The following keys are defined:
        manual starting from commit 95cf1f9 ("Add changes requested by Ved
        during signoff")
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZIHINTPAUSE`: The Zihintpause extension is
+       supported as defined in the RISC-V ISA manual starting from commit commit
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

