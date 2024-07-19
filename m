Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933D984D3E
	for <linux-doc@vger.kernel.org>; Fri, 19 Jul 2024 16:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721405961; cv=none; b=YsuS3gFo4f7xFiwf5lT4Rdku5AtNcCSrH26pJuck487A65q4mCr0WkDezgsWeSCMWpGy7DbSw9IDTFtbSb/hRi7+et3pSja5hkNvoGmWfj1KomV/u5hZ4lNlxG1nCbWME8NbuhsBC5KGYgOSvErx9WWIkP0YysaOHcxNdqHoqrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721405961; c=relaxed/simple;
	bh=L3aaRS2j1B7ly0GhgM86XDS3MRCOslmFg/ArzwGxzO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jcW9fiOokjEiUKOqR84T7zY0cSSlA3zF7IdqUKQpB+gBwzt0HFEMCdBkZnlG5wnQV7rB2YeMFEuNOLLZdlnHz1i+JtXDvfbdvlF4onuW5osQwJUjXykLz6K5jhmW0besTM1t4/y0z00qCDkAZdh/lrCPvEUBqhGbDatyFW7ks8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=f0WRZEmm; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="f0WRZEmm"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fc6ee64512so12396525ad.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Jul 2024 09:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721405959; x=1722010759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhITSSlteAMwmsPUv9TpJ8KEJQbK1ok0BXYvmwnIXKY=;
        b=f0WRZEmmpKyKfVfw8zDPi83S5b/LXxmxe75VhFJ3yyk9tTbC0AUSFZeqPcmosgTX6T
         nlkUKiEg3qorjJhe8rDGGLv/nxh4ttkfARBS9PvoEWaaOgOYOHDdJNpqJdg7pmLIXUyB
         nqLtm4TGNlfQTDQAU2rTXs3Q1MyI7XZEPH8jb5cdbX1v/3Z4kfBgFfkfx+ijA9At5xj9
         L3cj96KahogMuiR4NtNz/cvmsXe9OCbGzGes9s/sjNVBwHR4x/ImwKoh53qWFFenfe/b
         viz2WcX5wkmBgiCTquq0XC9UG1Zt4CbWTRx86sfYy+8MVrNwnU3uNN56153/eoyPiX6p
         f1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405959; x=1722010759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhITSSlteAMwmsPUv9TpJ8KEJQbK1ok0BXYvmwnIXKY=;
        b=EKaYt3NaJYAfAEWBQ0KSI6MtX7WUn6WbrYKeeb5wrYkWFP7vx9381f3zS2VSFt4yPL
         GRu9Mh3Y5/0jxRD1vnqhmFY6Pfv1SlOtSIEHqPjCMU3+tJeOAsvYjPb8BdBNX+qfXwdG
         9Nu7ex9A3QKmtHkiL7oEJvyirgNmG2PzA5nDhHot700vXYav1C6sUrHr+CO1IMKPv9NG
         a8HlyBcuaskBN9LztsMMZJhd3Ki9zK4o9I6a2QsucN6BGwP0rOmwHL8v7OERpP6pXLOM
         OhV1JNgdjkOfWCLHCqdF0IGyEuwhymW0jfwAmb1J58FkikWr5JNoi9aOB34du7GbXY3c
         P+WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN+NqUOejz1B6DizXAhXUPHPkG4daYKrpZ+IDFNF212t8F7aU+x2MI/AJVhobtHSFRp73la7fKwS8zcYEnAN2RBdYl7SDmDerR
X-Gm-Message-State: AOJu0Yx6q5+5kFlYU2KCIUruN9AsNjLm20PYcRTk4LMTucAPxoOG32y2
	h05xSVv/TZttvsgVvm/IC9+ZfjPPeoMNmTAltLS73UtMqn8CKlqJvZ4B2QMIYnk=
X-Google-Smtp-Source: AGHT+IHQAe6O+cJbWh30lRbS6fU+uPb7cUyHdN7YYYoHVFpFhiHM0/KCIscA223+WHZBsMAZXm0o0Q==
X-Received: by 2002:a17:903:32cf:b0:1fb:19d1:707 with SMTP id d9443c01a7336-1fd745735edmr3496045ad.11.1721405958836;
        Fri, 19 Jul 2024 09:19:18 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f490dcbsm6461435ad.297.2024.07.19.09.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:19:18 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 19 Jul 2024 09:19:03 -0700
Subject: [PATCH v5 08/13] riscv: Add xtheadvector instruction definitions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-xtheadvector-v5-8-4b485fc7d55f@rivosinc.com>
References: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
In-Reply-To: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
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
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721405940; l=1957;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=L3aaRS2j1B7ly0GhgM86XDS3MRCOslmFg/ArzwGxzO0=;
 b=46volz7D510nYpV8b8G8sEL+MfKDxkahX1p7p6VUtGEmp9hohd4dHxtouCXjKTmXgbf9vIiF1
 wq3zInJRmH+A/hFLdwwNWrSgDojxtU74mzqmsjOmzA+vh2qEoz9yX3B
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

