Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2477D3002B9
	for <linux-doc@vger.kernel.org>; Fri, 21 Nov 2025 19:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763753734; cv=none; b=VueXmL2TwRIs9Eit9PrDtSukTK5Y9A7rX4UknezzHfPrpQ42KPQuEF+bNOgjdPZy65lvP/b5m1izL2M7aTbVvlqitAVKrYigUoAtk2r2sR1fpcZhLcCUUw9aL7J8ltq2fMcWZzUI3ChKrM+K1/GhGKrLnIyoZQFr6OM+ARU7KGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763753734; c=relaxed/simple;
	bh=ssd7trdwb//a6L+Sw+uaGiYPGmeNiBfsFciGwGcYoA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KV1ox+tw69excDVTkAX2Sky3qgHRGfofSkm0V1vL5HSMelcmc5jiY1P7KxAmmZdIfMmqMkXdWHcxryVt+GHmXaKVaKMst1yYh3VljzAMaL3a28MqpSn7TVcb7CP/jDzUpG4s4h+fg9nweNNfvGj743aiNkqJzFQn84V5HfUQrME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+IcW/BP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+IcW/BP"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso23020505e9.3
        for <linux-doc@vger.kernel.org>; Fri, 21 Nov 2025 11:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763753730; x=1764358530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UpgOvXCNlXgopds0RDI/6vX/kTvFLO9tMaU8rBilFFA=;
        b=M+IcW/BPfzLS1c1LGDZjRIwa64c59WAaFJpRWc84ntkvLHGbCHLUtQjZodxf0iqhuA
         GOQc1Yf8RvEQDPb1riThTX7h3Uny1sVFwF6PWK6F0+M3uEBuGIvMCNm8LVhhq9Jzh90E
         pC35kQCa1NoTPSwH0Khi9w/88KrQ4lsjM78GdqJswc8ui2W/XK73V/lmhGopRAHl84sI
         mZA4ytZJiGC1XV8K9TuzjNKD0fTpyv7cky+iZOrR3x6GS8LrsTCVSUZrgbuZuHy7+yGn
         WHcbieL3gXb1u1E9Un6Eb/TYuHauokFT+39Ax9TCu1MP/ctadvE7+PZ3TZJkKKwHRA6g
         ReaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763753730; x=1764358530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpgOvXCNlXgopds0RDI/6vX/kTvFLO9tMaU8rBilFFA=;
        b=v8kXfOH5cEQ39r80pC9AlXfyfsR2dyUcL/3Z56bPVcOmtWLugXmZMJoJRCchz+w+lO
         5O1vAD+cZxLH32vCsqPpGPVOryOyx8q0EWHbysFaF8KnBq/tJ4VXA4an0FK1OzTyMFgM
         iVcBDlzhTHSEKokPFBcv6vJBFAohUsxk+cyoAfIaqby1D733DTeEEQVKY1hUSOcwa4ce
         51SnO8gF6mVFAhiVqmVTJ46bCGoRsfVZRDKLT36FwyaLKm/bR6FBVsMIiCHSnRAsFao9
         5CoyoMC3zc08OLo9fSBW9FORF+MbL6SzFH5RjtDEl0Sv0qD/hgSLLM0UnX1iKApKwf3W
         4GPA==
X-Forwarded-Encrypted: i=1; AJvYcCU3JF3PnAlo5NfPG05s4BL+7VrbXNa2DND7E9vRDDka0Lht/vLVP+OGkG0Ih84lPPIUmZ4fVuS3GZs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB81/cYtD2rcMybAV91t/tJX7Ulrks8iiA/a53dp8pkbsatq4n
	s7Aemco4iPD5ko1a84QfxoDTA2uciZcspiPKGhmzbYChkQrAtk1kGBaE
X-Gm-Gg: ASbGncvudlIa41VVzQ4Wtb7ylnSIkTmXxo90GWXUVSOFa/esVvpzpv7v83hoRXtk/eD
	sxD/MxW155BDkvk6iKC8Bv2PCbF/vg/b/oPRbQdykAAtVpEKIDwTi2160FBdC8ZsFm1HBsJXlbm
	XI4UwP4/loKh4WgZf02nlT2iev2u1/cLAIOAIIaS0pQuKfLLP706Xo+23NTGaG7pC7nm0HNAKjU
	WNx49k4sfc0tufw5/qt4xiQApQpahFW1Xl24S6c46BHRWqeLZbsX5jcYPjOaOdE33bnrh5kCTxe
	Bmdf82U1FA+s6Qei5os/rtWeHDGG1IneFQy2fLepRN6lE+dZNHkmquy3yzU5W7VSd6eIStxIwe5
	3wvYp5MTjkXvAP4x2s23QIGHzm3Mrhs0mW5AmyNubJJ36gWddAC9PRAnMOCoeTBKD2QxHBG+S1G
	cjw5Xh
X-Google-Smtp-Source: AGHT+IGHmJQ/SUK/Uv0tWBBylSXC+SBhd5okhyM0xJCUkSd/MynCjS9RE29tfg6Rpn0kSFhSmIpQiA==
X-Received: by 2002:a05:600c:4443:b0:475:da1a:5418 with SMTP id 5b1f17b1804b1-477c017484bmr38877365e9.1.1763753729949;
        Fri, 21 Nov 2025 11:35:29 -0800 (PST)
Received: from curiosity ([80.211.22.60])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477bf3af0e1sm55186045e9.10.2025.11.21.11.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 11:35:29 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Charlie Jenkins <charlie@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH] riscv: hwprobe: expose vector register length in bytes
Date: Fri, 21 Nov 2025 22:35:10 +0300
Message-ID: <20251121193524.1813200-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The vector register length can be obtained from the read-only CSR vlenb.
However reading this CSR may be undesirable in some cases. XTheadVector
extension is one example: existing implementations may not provide this
register. On such platforms, vlenb is specified as device-tree property.
Reading vlenb also initializes the application’s vector context, even
though the application may decide not to use the vector extension based
on the reported length.

Meanwhile the kernel already determines vlenb at boot, either from the
CSR or from the device tree. So add RISCV_HWPROBE_KEY_VECTOR_REG_LENGTH
to expose the vector register length already known to the kernel.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 3 +++
 arch/riscv/include/asm/hwprobe.h      | 2 +-
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 6 ++++++
 4 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 06c5280b728a..14437fe79276 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -379,3 +379,6 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicbop block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VECTOR_REG_LENGTH`: An unsigned int which
+  represents the vector registers length in bytes.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 8c572a464719..b10311c9a44c 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 15
+#define RISCV_HWPROBE_MAX_KEY 16
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 1edea2331b8b..bd6cd97c81f9 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -110,6 +110,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0	13
 #define RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0	14
 #define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE	15
+#define RISCV_HWPROBE_KEY_VECTOR_REG_LENGTH	16
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 0f701ace3bb9..3007432fbdf1 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -328,6 +328,12 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		hwprobe_isa_vendor_ext_mips_0(pair, cpus);
 		break;
 
+	case RISCV_HWPROBE_KEY_VECTOR_REG_LENGTH:
+		pair->value = 0;
+		if (has_vector() || has_xtheadvector())
+			pair->value = riscv_v_vsize / 32;
+		break;
+
 	/*
 	 * For forward compatibility, unknown keys don't fail the whole
 	 * call, but get their element key set to -1 and value set to 0
-- 
2.51.2

