Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B1045976
	for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2024 04:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712895116; cv=none; b=GMUxzjN8sfiC1nQPH6VQS0+IP/qsLw7J+g0iYEj/6JWzB+01vXZ3LhqBssI7k+QeYWjnosPiqz0naOjsY3Ul5Jn74cf6LFC7qQiGvc7gJKlPZ7oT3KX+O1UmYjGQEY44ab1c6jgLNqXkihmubZKbcLqFXo0eD3nsD1StQCrUu8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712895116; c=relaxed/simple;
	bh=b+24lxxAnvlUN0+328A+gcU/U3wnp/aT5n2aF7/kAXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JDco1RTBmQc0EVQ/wofiYal41pETUa+WRPWeSziVVwmBqfWDrSzKJeHPfZ7Y/r8FstVhPf51Z20Ya/MbB468kQkEfwA6VI5KkUEFKa46m7l8igQE6+NzxXHFV6/y6f2vWqwXNIKv3KtwboB9vMo7QztdF8gbNIGGGFeKFGrjdmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=yVdVmuDV; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="yVdVmuDV"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6ea260f51b8so372128a34.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Apr 2024 21:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895115; x=1713499915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwc/PeNyJDl6GgnW4cuopcphm/oVDetOGOo/hxv7XcM=;
        b=yVdVmuDVw1q6L+6/7bnHAzAep9bIrOnE3IKsdhVq5tfL4HpZw8abIyi/aExv8eDA7E
         bbw1PjIFxl2eD2h/AywQaWBYDWHybMp11SIV93fvGHBwQIFsx6TnenbzWhyccYeZLYp6
         E/SllS9qyxCti6mD6xDc88exch3FK0hpHIDmtInF9Yxuy8NOAKN33IJa3Lu6Wr9X0Vrt
         jDPl+xbK3Uz22lCUFSPAj8b4chvxLKL48fhoGnpA7iEZzdX2B/WrqgPLWbnWwv/sMaQm
         BTvo+iYzkiXQulG/+5h9iQfi792rE6q8uOWn8QwDxFHfDG++z11s/ZTYygFvvBzK09Nx
         DPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895115; x=1713499915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwc/PeNyJDl6GgnW4cuopcphm/oVDetOGOo/hxv7XcM=;
        b=ZhXEwYy0XY/cCZOevYG8qsFCsipbC+i/vFV6S29vBNpP1yrna6pGV+3inj1sGvLC8L
         ZEqZFDbIwYCrrsDBbsDF50suuCKiu2beQywvWQxzUbvS2/NCYxAGzr88z9E0SASk2jjv
         WNY5XlWbGy1ZydXj5NSCj93aMQLU1q3Dj4zGGFmOIyah3n6oE51Z+zbEu+RYEqUAMU6K
         zEeSW4QoxQd4k81Qn2KSCx70cmArt6Nz4vSDJhZTkCWx1vKsfltRr9RwI4U8TBZn8X86
         5KtSNrSSS0e4D0AJCrehfuvtSstPF6ZoOGTdYoYG12ziLks1lIVr9kOariPX5miqoOfb
         HDnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUudBWv4Fy58Xjbs8PGucNZN4LL0KUqq4/Jszr4IxY/4Fr3bADgXT49jjO7JQMU67iqOpJf03X/WiFxhV89jUY/NNotAU5pI+if
X-Gm-Message-State: AOJu0YwWoF6SEl8EciqG+rrczgr+BnTWo7vSVgD3U6JnW4hF/gaKrIxL
	toPtr7uWapQ3TRP4+2oQYHhoCL6bMVEOIsJlekpmq0bjM9g08l6M8voGI9MV7Is=
X-Google-Smtp-Source: AGHT+IFOYsbLF0F+gkJeOyJgzaCsQeEF3L5USkF2a5gefrMyQNupps7ab0ysCKPYkK28Wn8+LqBa1w==
X-Received: by 2002:a05:6808:1b12:b0:3c5:f8b7:caca with SMTP id bx18-20020a0568081b1200b003c5f8b7cacamr1951974oib.0.1712895114722;
        Thu, 11 Apr 2024 21:11:54 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:11:53 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:18 -0700
Subject: [PATCH 12/19] riscv: Create xtheadvector file
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-12-4af9815ec746@rivosinc.com>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=1663;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=b+24lxxAnvlUN0+328A+gcU/U3wnp/aT5n2aF7/kAXA=;
 b=tBUd1KU9cHUGPbHmulFHg/OgKEnR6bzENCIMFD8J4yhd09ZA941LBjBGdCqnbgqxhCqWkN+bL
 8o8eZ4Dh6iFALQU1B4pRcjyHGJQ2j6rg94+Lgm/1CBT+77zQ+CdfjUP
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

These definitions didn't fit anywhere nicely, so create a new file to
house various xtheadvector instruction encodings.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/xtheadvector.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/include/asm/xtheadvector.h b/arch/riscv/include/asm/xtheadvector.h
new file mode 100644
index 000000000000..348263ea164c
--- /dev/null
+++ b/arch/riscv/include/asm/xtheadvector.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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

-- 
2.44.0

