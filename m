Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6AB82D93
	for <linux-doc@vger.kernel.org>; Mon, 22 Jul 2024 21:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721685510; cv=none; b=idjKVQ6sHnfYWEKcZTAdvjszyPBzpVi0S4onAFViWYUyvP1oLbDT3GGlDwKDi1yEVheBZpJLhNOIoIz/tM1li4y4Q8WgWTw9tINlSqEziFEiQiPWj51Pro3VYxKJ2e9SLnNEZDGVVgRa8C++q9d+PxTEZJ8py47Adbg1Umir8L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721685510; c=relaxed/simple;
	bh=L3aaRS2j1B7ly0GhgM86XDS3MRCOslmFg/ArzwGxzO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ggKnbxJ6zJZME+gglsfiZSKy1jDzCIAlhnkpXcFvjswK7V0TU/NOg0auID1GMX2HA7vCZHpi4eY7G+r+yhOyf1kMAtMs6WKKfdzWQzIx6ku+tRozzFhnQm1WhcWZ0XkoetHyPveXeE30eQ8C4K5nmbiobKQKmSRtodRFrmJTcy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=eEsZdZ4K; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="eEsZdZ4K"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fc611a0f8cso27382505ad.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Jul 2024 14:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721685508; x=1722290308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhITSSlteAMwmsPUv9TpJ8KEJQbK1ok0BXYvmwnIXKY=;
        b=eEsZdZ4KsCrjj7TAwmZqCUcq1hBHXmklA19TlvGZBjmHWi0btvwebV1lodtdjreLZc
         Rpd3mCVkACt659ZBhziHVkfe7c1tfmvvgg1XfXiefX8EHcCNNF2L4J3JLNV4lau+G4xf
         G+nOFJ12xlqA9+h3OMIhxRxoGU9Bdk90gOOqPIViPGBedyrep09QH52gtWzzUfX7ypBi
         wsVHg6BzjhWsf58amQP7rewzQ4lLdiwrzBwCTg4seH5opJo5AdKoupVWl4/LAPKC2lO2
         +wbu6On3OgQATxjeLArJ6x99hqhx8FkNSjw/IjiVEyIkvHVWarqTg4FXKICoa27F2e9e
         LFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721685508; x=1722290308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhITSSlteAMwmsPUv9TpJ8KEJQbK1ok0BXYvmwnIXKY=;
        b=kqGJ9pSpYdGvW/e1y9sSriaFY1UX/vQTS1Cff/kn64ueGt2nlZEhBA8g/b+T+8Gjaz
         gYol2v/M41NYnQNSQGjZBJcvHczfMFJo4ll9Pt53Tb41XPtHEfF8etUF3FL9D7J5BaNi
         IFBKdpUJHt078T8NcQVNNQEACeWWwh8r5rzUWmym9k23MwmaNYQbn6g2BGK0u13B8yl3
         c0IuTEmFySjkQTNZPNPcjeN8mGrRQT44w0XH1evj6/QAf8sKUwk2MUdA6DPS05Ljj2h+
         p5t1Sy95rR9kF35WapvPTR29/TD8qC4AMknaUGYMmIkzFj2tpEejAoQojrhQvteSFbEC
         RDEA==
X-Forwarded-Encrypted: i=1; AJvYcCVIJc2/wk9i1fGRZ9dk8l3hPAlV0wyIAj93c4F+PvhmjkY7slqOHrWL176tb3aSt8UAPCesNjhOXlu9xA3RpqreGYYRn0SRhwfj
X-Gm-Message-State: AOJu0YxRgznAvk2RKu+5gOX/40aENx24GOwYT+x2pnH1DnWVoNSDIzSC
	S1c1nS4dqNsfBuOx0CP50xz7brWN1VxM/RHQnb9h/wpn8AYeUr9wBmd5rj9j73c=
X-Google-Smtp-Source: AGHT+IF2VUxYR/aRNToCR+5ZrcyCmNKV+sSs8BINBXokqocI6vx0Q1B7xy0Kb+PiYoFTmuhV9YSoTA==
X-Received: by 2002:a17:902:d510:b0:1fd:8eaf:eaa9 with SMTP id d9443c01a7336-1fd8eafeec5mr38070905ad.37.1721685508075;
        Mon, 22 Jul 2024 14:58:28 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f44f0d4sm59997775ad.219.2024.07.22.14.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:58:27 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 22 Jul 2024 14:58:12 -0700
Subject: [PATCH v6 08/13] riscv: Add xtheadvector instruction definitions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-xtheadvector-v6-8-c9af0130fa00@rivosinc.com>
References: <20240722-xtheadvector-v6-0-c9af0130fa00@rivosinc.com>
In-Reply-To: <20240722-xtheadvector-v6-0-c9af0130fa00@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721685488; l=1957;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=L3aaRS2j1B7ly0GhgM86XDS3MRCOslmFg/ArzwGxzO0=;
 b=hqIK70baIF2TRsMNhma0nqEfic3E1nBlRr8r5IBs5B1G/V09ObAWM/kiUDmJLqlbsJt62gSOm
 TBKkN9dv4EhDg1McKFXFHMYxPuqxf1K2g39tmBh7oLjWZiqSN3Lw1vA
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

xtheadvector uses different encodings than standard vector for
vsetvli and vector loads/stores. Write the instruction formats to be
used in assembly code.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/vendor_extensions/thead.h | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/vendor_extensions/thead.h b/arch/riscv/include/asm/vendor_extensions/thead.h
index 48421d1553ad..27a253a20ab8 100644
--- a/arch/riscv/include/asm/vendor_extensions/thead.h
+++ b/arch/riscv/include/asm/vendor_extensions/thead.h
@@ -13,4 +13,30 @@
 
 extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_thead;
 
+/* Extension specific helpers */
+
+/*
+ * Vector 0.7.1 as used for example on T-Head Xuantie cores, uses an older
+ * encoding for vsetvli (ta, ma vs. d1), so provide an instruction for
+ * vsetvli	t4, x0, e8, m8, d1
+ */
+#define THEAD_VSETVLI_T4X0E8M8D1	".long	0x00307ed7\n\t"
+#define THEAD_VSETVLI_X0X0E8M8D1	".long	0x00307057\n\t"
+
+/*
+ * While in theory, the vector-0.7.1 vsb.v and vlb.v result in the same
+ * encoding as the standard vse8.v and vle8.v, compilers seem to optimize
+ * the call resulting in a different encoding and then using a value for
+ * the "mop" field that is not part of vector-0.7.1
+ * So encode specific variants for vstate_save and _restore.
+ */
+#define THEAD_VSB_V_V0T0		".long	0x02028027\n\t"
+#define THEAD_VSB_V_V8T0		".long	0x02028427\n\t"
+#define THEAD_VSB_V_V16T0		".long	0x02028827\n\t"
+#define THEAD_VSB_V_V24T0		".long	0x02028c27\n\t"
+#define THEAD_VLB_V_V0T0		".long	0x012028007\n\t"
+#define THEAD_VLB_V_V8T0		".long	0x012028407\n\t"
+#define THEAD_VLB_V_V16T0		".long	0x012028807\n\t"
+#define THEAD_VLB_V_V24T0		".long	0x012028c07\n\t"
+
 #endif

-- 
2.44.0

