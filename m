Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C747517108B
	for <linux-doc@vger.kernel.org>; Thu,  9 May 2024 16:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715272064; cv=none; b=feir93v8rEGzt4Jde8M7umDUVoln6uqpMinvfdf754zjBwuMb4Z5IGZktrrrShZL4oVoaQCqmg9I4D6jbAHil/V4G38kEKo71EBSqH7QYADSd8FpnBI7moRKon/Jmx0QzRhYERFBMJLsvMZzpS1kZbWlVzZysSnjmDe0dKJ32iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715272064; c=relaxed/simple;
	bh=knlwHNZwQmzD4oaulGiVep3QJpqnscPRswiG7/j0Dgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iSyIQsdPJdQrePFjXZwfFkvM4Jifw5m+EaqZTAuxkSeiS1qYfEj1HgKDvZ9byfxB5tv+28y8tFggQTEq9BdCNbvSzJcPbShgG3FdhYhWpDau9a2F/UrEjrE6oOsd9kOljd2E1bvsjXtRWwPHDzGCFJqU3srCyEi1z7DG5RFqhXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=TLNZYiA3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="TLNZYiA3"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1ee954e0aa6so7669585ad.3
        for <linux-doc@vger.kernel.org>; Thu, 09 May 2024 09:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715272061; x=1715876861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNkHbY9oNilft+2PQdFQmYDad5FfREv7NAdRkMrTsLg=;
        b=TLNZYiA3a0ybPAS0ODahejZjLGgR9pMJciNoI2O02C2K16sRcIIk/aPgJ3qFowyr+c
         nSBKcxiQ7KDEH83XLlhWmBCt51TfAkiDqiigZgUTK5serA1X+AoOd/hGAbYIUf3n/RvO
         Kn9uy8GDkWhBoubbWr0iHxUqUTnpyRMpo7ZEoS01hFIjsuiA8BzWKzvhKdFtYhPdB3Bc
         ZglhiNeYtC3jB6HpwOg0dIvIGCjCeipL5hwBF7Ifu50Scu7WdtqlZ3H0C2/ioXD7npUF
         THiqsTh1c997d3aWqs0THjB53JjKn5aCt+J9u1fbZd/qDYxrubvfxWoiiVZ1KEGjwqI6
         jyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715272061; x=1715876861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNkHbY9oNilft+2PQdFQmYDad5FfREv7NAdRkMrTsLg=;
        b=VN8foMH6GBTyj1kwgN+TuJLFjD/AiTXYCVI5WUF++tY/F2cwibnruKkLSlyiaCtAAj
         4tKxcNrBvIOB9zDmqO7wGxbcbyE5PkJdXqx4Eyyxd8wL9ZyhHtFmo5bk7amB2oS6hpC9
         ZqtM1dUxHSnSabZN+0ABQPjQ8uiUU/7lZ23qaC8HIKYVHNem9OtX8HyhdW/3MuvkVqI1
         40RF1VoLVMrgjKgkNoEDYshCWRdKkDz1Xy+DtH7b7XIQpM/VqeQVAsuOz5w0mVKA1zCY
         8cYqwdTGDPKYQB1OML7LFCTDv19P4i+p3izj3HjJhX7/rlLsjJYU4rJm+hF9Mlzw+v/f
         sWuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGjsZboMfxIxWUn7XeuLoXGqiuRNMBku4WerAa+6ngvxpND2yyAdCdyG6Kjm+KVCRkgH30g/FXng/BkEmlpWN5V17sevgKK1TF
X-Gm-Message-State: AOJu0Yzm5jQ7oYuASlTRs9sCZwTLdJFxxCLRTM4sIoTt/NqdWQku2RGA
	+mxpPv6n3NYOQbPIbFCLBFmKbUgj23z8AG/Io5UIMAlGXHNwE71Tk95wjH2sqGE=
X-Google-Smtp-Source: AGHT+IGUu1uPaO5nrqJvbHdXDLkvUWrWrbX5e2xStsjIzWenVBJGkFP5i2uTWH7PLE8vnnAsdqvMPA==
X-Received: by 2002:a17:903:110f:b0:1ea:b125:81a2 with SMTP id d9443c01a7336-1ef44161e50mr1676745ad.53.1715272061063;
        Thu, 09 May 2024 09:27:41 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13805asm16210285ad.264.2024.05.09.09.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 09:27:40 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 10 May 2024 00:26:55 +0800
Subject: [PATCH v5 5/8] riscv: cpufeature: add zve32[xf] and zve64[xfd] isa
 detection
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240510-zve-detection-v5-5-0711bdd26c12@sifive.com>
References: <20240510-zve-detection-v5-0-0711bdd26c12@sifive.com>
In-Reply-To: <20240510-zve-detection-v5-0-0711bdd26c12@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Chiu <andy.chiu@sifive.com>, Guo Ren <guoren@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Vincent Chen <vincent.chen@sifive.com>, 
 Greentime Hu <greentime.hu@sifive.com>, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13-dev-a684c

Multiple Vector subextensions are added. Also, the patch takes care of
the dependencies of Vector subextensions by macro expansions. So, if
some "embedded" platform only reports "zve64f" on the ISA string, the
parser is able to expand it to zve32x zve32f zve64x and zve64f.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
Changelog v5:
 - Remove ZVE32F_IMPLY_LIST as ZVE32F only implies ZVE32X (Conor)
 - Add a list for V as it the imply list for ZVE64D does not include
   ZVE64D.
Changelog v3:
 - renumber RISCV_ISA_EXT_ZVE* to rebase on top of 6.9
 - alphabetically sort added extensions (Clément)
Changelog v2:
 - remove the extension itself from its isa_exts[] list (Clément)
 - use riscv_zve64d_exts for v's extension list (Samuel)
---
 arch/riscv/include/asm/hwcap.h |  5 +++++
 arch/riscv/kernel/cpufeature.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e17d0078a651..f64d4e98e67c 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -81,6 +81,11 @@
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
 #define RISCV_ISA_EXT_XANDESPMU		74
+#define RISCV_ISA_EXT_ZVE32X		75
+#define RISCV_ISA_EXT_ZVE32F		76
+#define RISCV_ISA_EXT_ZVE64X		77
+#define RISCV_ISA_EXT_ZVE64F		78
+#define RISCV_ISA_EXT_ZVE64D		79
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 4bfc13209938..ad3e613ee30f 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -188,6 +188,40 @@ static const unsigned int riscv_zvbb_exts[] = {
 	RISCV_ISA_EXT_ZVKB
 };
 
+#define RISCV_ISA_EXT_ZVE64F_IMPLY_LIST	\
+	RISCV_ISA_EXT_ZVE64X,		\
+	RISCV_ISA_EXT_ZVE32F,		\
+	RISCV_ISA_EXT_ZVE32X
+
+#define RISCV_ISA_EXT_ZVE64D_IMPLY_LIST	\
+	RISCV_ISA_EXT_ZVE64F,		\
+	RISCV_ISA_EXT_ZVE64F_IMPLY_LIST
+
+#define RISCV_ISA_EXT_V_IMPLY_LIST	\
+	RISCV_ISA_EXT_ZVE64D,		\
+	RISCV_ISA_EXT_ZVE64D_IMPLY_LIST
+
+static const unsigned int riscv_zve32f_exts[] = {
+	RISCV_ISA_EXT_ZVE32X
+};
+
+static const unsigned int riscv_zve64f_exts[] = {
+	RISCV_ISA_EXT_ZVE64F_IMPLY_LIST
+};
+
+static const unsigned int riscv_zve64d_exts[] = {
+	RISCV_ISA_EXT_ZVE64D_IMPLY_LIST
+};
+
+static const unsigned int riscv_v_exts[] = {
+	RISCV_ISA_EXT_V_IMPLY_LIST
+};
+
+static const unsigned int riscv_zve64x_exts[] = {
+	RISCV_ISA_EXT_ZVE32X,
+	RISCV_ISA_EXT_ZVE64X
+};
+
 /*
  * While the [ms]envcfg CSRs were not defined until version 1.12 of the RISC-V
  * privileged ISA, the existence of the CSRs is implied by any extension which
@@ -245,7 +279,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
 	__RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
-	__RISCV_ISA_EXT_DATA(v, RISCV_ISA_EXT_v),
+	__RISCV_ISA_EXT_SUPERSET(v, RISCV_ISA_EXT_v, riscv_v_exts),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
 	__RISCV_ISA_EXT_SUPERSET(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_SUPERSET(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts),
@@ -280,6 +314,11 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(ztso, RISCV_ISA_EXT_ZTSO),
 	__RISCV_ISA_EXT_SUPERSET(zvbb, RISCV_ISA_EXT_ZVBB, riscv_zvbb_exts),
 	__RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
+	__RISCV_ISA_EXT_SUPERSET(zve32f, RISCV_ISA_EXT_ZVE32F, riscv_zve32f_exts),
+	__RISCV_ISA_EXT_DATA(zve32x, RISCV_ISA_EXT_ZVE32X),
+	__RISCV_ISA_EXT_SUPERSET(zve64d, RISCV_ISA_EXT_ZVE64D, riscv_zve64d_exts),
+	__RISCV_ISA_EXT_SUPERSET(zve64f, RISCV_ISA_EXT_ZVE64F, riscv_zve64f_exts),
+	__RISCV_ISA_EXT_SUPERSET(zve64x, RISCV_ISA_EXT_ZVE64X, riscv_zve64x_exts),
 	__RISCV_ISA_EXT_DATA(zvfh, RISCV_ISA_EXT_ZVFH),
 	__RISCV_ISA_EXT_DATA(zvfhmin, RISCV_ISA_EXT_ZVFHMIN),
 	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),

-- 
2.44.0.rc2

