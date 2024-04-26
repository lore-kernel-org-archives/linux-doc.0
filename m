Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4036B38DE9
	for <linux-doc@vger.kernel.org>; Fri, 26 Apr 2024 21:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714167438; cv=none; b=DsAnsuFxk/FDrvlBP3D8TfO5LtHPLgtpq6Asfy1dg+Ia6e2+IXrHDoNjxGgWZfc5ezuflc6vQlRVji+tfZx4RO5lnZxQfpRdo0NVwTFJuDJ0+8PEThiOAPUGyECETYoaxPXt1uiAPCR8OqYSzz9NM2ZbSNjzBAcxqX6OX+L5XGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714167438; c=relaxed/simple;
	bh=/S5mXvNckx5pf6RsnXH2juTR+JzZCbCosBXwMflqUFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E83X3gzJ5s0zUG7yvJQa4l3+qKRawCUCD6aVRo8aPyZmmv2hyBeillCLvxxjzOnyn19xnWOwATsDUWZyAUtTb5wJrqCbHTsvYl7to8Db+hh00UFUPaIsVpNPIoUqSy1iuIvHkG6ymvUm1NpW+ChDC++tpHpFE1ONYsQ6RvgubEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Q447xDDH; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Q447xDDH"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5e42b4bbfa4so1692984a12.1
        for <linux-doc@vger.kernel.org>; Fri, 26 Apr 2024 14:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714167437; x=1714772237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7WZZ9B05w7yOdiDdmOf8xUgYc+IvuHvU5nr8Ugv9mw=;
        b=Q447xDDHvaTivoe/nLtlZmY13oAlmMVu+NtTp1xnz0mll7pbPoqFyEhVctVWaODSBz
         iUVfZljky/dq+gOTsiSW/DwtOsKK4rnWoKF317yEZa++65647iLfbwdSFC2CiPhYceOv
         +0U7SFr3L22gFmFzFIJ8MpHvUYwGGOjtNHRXq+PLYJ8uM11eEz/9F8h52iDLfSHwPmej
         ldaMze+n1BNDXY2VAVZlzpYZrmNyMRnAGImv2QAL8Ga+DoRfNDvCzqVAluuvzFMnHvYX
         yuZv91rdYM2Sm1x7+kRqWBRbL4H2k6HSVGbU2AQRmxE98daek2+wE21ZsN14nBgr6jDH
         +hHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714167437; x=1714772237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7WZZ9B05w7yOdiDdmOf8xUgYc+IvuHvU5nr8Ugv9mw=;
        b=r9tZx+5RoaRBIfwrys4Om5J3bdGwoR1szj1ixnS1MhxfX1RlLYeB35H/iD8DGzYBx5
         ym5R5l8ccFJyXhO1i5ANH1sdEFw5A9nG3BpZlqEuwoMTo1zJEEKs4f70yhh1E3jD+Izt
         gjnJzVgcfw4JE02scj4jfvPp7H4cKekdimad/6m4jH3QzIfdyECHrK2bbG2rOjXPnIhS
         g1vadca+rOdk1ojluIjOrdCAFdzK/UN8kokUdfQ4zHrMve+DxborW3GINP8XLdFTVnB8
         CSnQAkG5e56KIFH1UIpnFkzVoNAlAcqWwT44UTm0/1ShiWf3n9XNEw5pIaQ6Kltv3QkI
         L7TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWS+E9S5kw1rW4enmGDe+tpQ1XWHz4J5UAqTCuJnm6mLyGEzoJdUuS7p9fPS/8gpvX1FANpuxEpUb1KVuHJhXe1MD5Tnt8jrgv/
X-Gm-Message-State: AOJu0Yxrjah/7Tr6j/MRrO/GKgIohLPK8x6Z4DezUwYenUPKPzm0+BA+
	H384L2R7OIcaifAChOo0m8JhLLHVOYSg3pzBbXbz6VrV1LepHUM0svi9/re/V0o=
X-Google-Smtp-Source: AGHT+IEmTz6F3urwdNc3upHPp7xuNjToyMXKR0+MXW/PS19so8SBqwqQD842Cobd1kOR7Dc18se9dw==
X-Received: by 2002:a17:903:1208:b0:1e3:dfdc:6972 with SMTP id l8-20020a170903120800b001e3dfdc6972mr5045246plh.9.1714167436618;
        Fri, 26 Apr 2024 14:37:16 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id k4-20020a170902760400b001e2936705b4sm15935701pll.243.2024.04.26.14.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:37:14 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 26 Apr 2024 14:37:06 -0700
Subject: [PATCH v4 11/16] riscv: Add xtheadvector instruction definitions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-dev-charlie-support_thead_vector_6_9-v4-11-5cf53b5bc492@rivosinc.com>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-5cf53b5bc492@rivosinc.com>
In-Reply-To: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-5cf53b5bc492@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714167425; l=1914;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=/S5mXvNckx5pf6RsnXH2juTR+JzZCbCosBXwMflqUFg=;
 b=PCrymv44Z3fiRwZ4pYJZPOoFnaXXtTTpJLu/OUgNMcdouUs0msGnlr9zseM1KUD6drfrqa5Xy
 APyv+dooJWrBYOFJl5QFRlu8s4tC+mzcad1gaHapng5GB3Q7qMS3fwV
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

xtheadvector uses different encodings than standard vector for
vsetvli and vector loads/stores. Write the instruction formats to be
used in assembly code.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/vendor_extensions/thead.h | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/vendor_extensions/thead.h b/arch/riscv/include/asm/vendor_extensions/thead.h
index 92eec729888d..6e3c85351f82 100644
--- a/arch/riscv/include/asm/vendor_extensions/thead.h
+++ b/arch/riscv/include/asm/vendor_extensions/thead.h
@@ -16,4 +16,30 @@
 
 extern const struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_thead;
 
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

