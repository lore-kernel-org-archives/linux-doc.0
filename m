Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EB041A92
	for <linux-doc@vger.kernel.org>; Thu, 25 Jul 2024 04:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721881014; cv=none; b=UNrtlGkzSZDv77VuJRUG0W2VsKy8GaI1SxxoieeOHEtp6dwMaQ2rtN1WHRgVwCpp69vyOcNbZIxI3wvVB36IJ3RX7s7drYBsl0Vv+7YxlZbYttVze8fK6cGNUNZAqQRkmYPlrKCZVCwToINmh6njTc6gMrBB8ZEXm7/rAfr0HnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721881014; c=relaxed/simple;
	bh=L3aaRS2j1B7ly0GhgM86XDS3MRCOslmFg/ArzwGxzO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qyU/HkZ2dBJoDpcbmprnFShmP7QPwDE2/x0Sx5VPZb9aYWFFM8BQnDkfJnSj8cp5u9Bvg2Km6/AQnu8DU8X5+kHrMAdb/HVgyHWrxpTRjTLjKYrxC8gvVQdrBXUUtxx9gtoW8ZOIgyVO+X83IrZpKkX6uYd7p5eGA81HXbsX9yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=F2FxPcdA; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="F2FxPcdA"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fc4fcbb131so4202345ad.3
        for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 21:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721881012; x=1722485812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhITSSlteAMwmsPUv9TpJ8KEJQbK1ok0BXYvmwnIXKY=;
        b=F2FxPcdA1gM7QjayDrL9hcQ2DG5cGep2Bf4FbKi51hjLWAH9MKhqKn0T3iWOMztzW+
         kxx/bhubNS4E9RSJ1Mer7Jsx84+pwsIhVsGwyrPAa8pWJodGvCscVzXgKYyteA/X0abc
         r1/2yYzWMkM06/+pz0ovKvMAhMBX8RVyk57qrjiBcRaHEbEDQd5435mqpyltT9gKyvBb
         1urGQ69jnSM5v1T8az1cEmkthmp4HSeRLVpQVQMGnxcxk6o0/NeF/6KZDvd19HtNkAvO
         rc39FmVVfWvNqgOg8/H4b6d7zRG9vQkrtUzS5+En8DL2YgrPgkf5dV73bQjFTBsGcP/Z
         EVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721881012; x=1722485812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhITSSlteAMwmsPUv9TpJ8KEJQbK1ok0BXYvmwnIXKY=;
        b=hxfJEO+fjbNRJiXlStlBmF6yiRFE9t92b1oTujpUi2JLxQSW/qxqPuEK2k4+GMLbSb
         lqXoaQ0AfJ8k8CkX+Ke+Hcaxpcw410+eB8X/RIU4UmtyjPURHwu3xbrweY1OqCEi7rU6
         7qvMsA2xJlYGSkozzCPjDZZpWnuehIMumUMJ1pRJ4lsvUmapQ+K9SxvVPnFx5TB/OUok
         iV17zmD3Vi93+JP19Esfosn5F5yXpKEUUjvRYAvsiJDY9L4t5m1yrYaTgnDEC4WAQoXj
         oM9780FIXJX3by7e4FF15d0vEntFAJpmpGP3cfoarfxTRKQuUb0z4ok0e05QBknSrLRM
         gD+w==
X-Forwarded-Encrypted: i=1; AJvYcCVYnlPxYUG6VIolp9ChU03kJm8OX7wswqs3cRQEoRhDN7xZ+MzLAG7gDQEzQfHBXI9pnW4BRTq32DHnUBScJ1oUowjWAtOFbbrv
X-Gm-Message-State: AOJu0Yy8PpPQmBWHUa9Bv9ClVLTzCWWi+/jz/oxdAqP2GqMY7xu9XKgX
	CWVeUXWEnF4XeWHkygufMznQIcpuZkiu6snBGJ2FDZ4cmsorVGli1PwXaPxKdUM=
X-Google-Smtp-Source: AGHT+IGj26mQhFBBxRuze7M5j21MWHUmj/ANBGUwLqcIOXRBKaz5XsFYjTYWSdee3PR4vzaTi58yPQ==
X-Received: by 2002:a17:902:d50d:b0:1fd:a1d2:c03b with SMTP id d9443c01a7336-1fed9393fadmr9160195ad.59.1721881012117;
        Wed, 24 Jul 2024 21:16:52 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f2b80bsm3781825ad.205.2024.07.24.21.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 21:16:51 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Jul 2024 21:16:25 -0700
Subject: [PATCH v8 08/13] riscv: Add xtheadvector instruction definitions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240724-xtheadvector-v8-8-cf043168e137@rivosinc.com>
References: <20240724-xtheadvector-v8-0-cf043168e137@rivosinc.com>
In-Reply-To: <20240724-xtheadvector-v8-0-cf043168e137@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721880993; l=1957;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=L3aaRS2j1B7ly0GhgM86XDS3MRCOslmFg/ArzwGxzO0=;
 b=3w6Inm8iO4KPjHOv2h75OUPqUg1bl42bk+JmZA/zIjwc+Fx4JtS0VETElIWTpMgzY/aotZkuA
 2a4U6i8P91QA4OL53j6fTgQRlEi+6udHKjZne8b0V0IgG7i5ceAPSUo
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

