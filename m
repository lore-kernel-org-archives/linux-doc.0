Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769761384B9
	for <linux-doc@vger.kernel.org>; Wed,  3 Jul 2024 05:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719986231; cv=none; b=jvH3Uolpw0wtMa5I+d72L291BvLp6aJOBz0Tk60W0WrsQclBNOZFOVB8NzeZ3EQ71EBqgcKKZPJ8INuI6VSyrQZPr49Gl51lloCihzdAmDM4RF52fuMiRlZ1oh6mhdA1HIKr8I64QBdSRlEWqkFip+EPOXra5X7PHP0/tWY5+zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719986231; c=relaxed/simple;
	bh=/awdvkpT37Pcv9l+R6WHhK0Ytr8TrWH5wurC23dujZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xe2VLof7TfWi2X4rsWDi+J2QbmdZLIJmgdKFMwTUP5opgiOyVPy8kTJFlXNdQvDCkzQHSc9krH+Y42u5md+rbHctW4GxQbE9rjBeJIIhLRJad2o4PWLhKbfBSnBZWLMqq4ZIno0sngPv2Wx4yEBtbszapXsJv5PQ5IXbHLNXjqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=jVygOFpB; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="jVygOFpB"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7065e2fe7d9so3840358b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Jul 2024 22:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719986230; x=1720591030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7liFIbqG3XLVQtLXjuEuZ9H5FIup228+UAuRj2s502A=;
        b=jVygOFpB+gliDeaNKlbNAPYEGXWbGLJF9pl2XisTcra3WT9h7Tvnemhci0OEGnxkzY
         j5ZrAFadb/LiyYZshlwyLIpl4Cm4IosH2OLQpHcqFeq2sVMytHE2Q1ZmYH8RPwYF/bwm
         DxWalMgF0APAQ1CiCZ7qKar+YEWjJOD0GFdDUonnqFsZkMRupceInBpcAVfA1oZ3ULeO
         u+OBNL31aZoqU8urB5oU8dMxi8LZRCNu+wmrne0dWeyrDd4Ld0O040PJANjWrePD1LcU
         7auycW+zxV+FfJXzRDux6GDjpVv6Y/cXwa9416L1ISBdlBRHyssfnFhMvf66n97ilx4G
         IXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719986230; x=1720591030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7liFIbqG3XLVQtLXjuEuZ9H5FIup228+UAuRj2s502A=;
        b=DSw2Xelc5BDNr2HPNNbrPsuPXrhDxl8/i/uH0pjPkZFKJnAWuII9Qzn4ikqIJn+pYo
         XPjnQU/PresCcpJTd+xDVb6hbh7aSa6iXvR3GpLEbdSnm6oj47y3s4XlGbK60mEegSMD
         ABEFy/0yW6ExQnK2DM6lfqAKeLe4AW6p+9btRGDP/HKLCh1ZsXyFTg7sc1zRj2ahTCVS
         OnYQXzsZrCWIidHLG/67aPOrRQB5VQtQRR8V0ntdR6xqAz0KXtC2bB7GJbc/SjX/6q21
         g7xQVeJnVKheCFoSp8N23+cp/89et4IW4Gv9jB4AjuLlLcFgU9YqjtS3p6eisWhrRd4z
         MgPA==
X-Forwarded-Encrypted: i=1; AJvYcCXs3+tEGr/EzvOTLd9beBK1hNmH9foGh5qAocyNTEF9WPGKha0W4BVZT0kpJOgD6fSQhf5pFD/LxTfpUKt9tyUtynPZ1gMa+O6s
X-Gm-Message-State: AOJu0Yzfg2dS+T17S4DEZxhZkbE22p7GBHfRV4FzOfpYJER8ehrs+wMq
	kjHzLCBKkos2oCrO6R75zTtbMsSu1OqwiypPocVl4j2ocko7knEZw+5+F+LQnEw=
X-Google-Smtp-Source: AGHT+IEEOvAClCf+D8jqc3HA5XX0lKWGJyAbGfLfUAzrMU05v/GLAX8L7Ddg2N6pGOzgcSszWGeIkQ==
X-Received: by 2002:a05:6a00:4b50:b0:706:74a6:b1b3 with SMTP id d2e1a72fcca58-70aaad3ad81mr13485637b3a.14.1719986229916;
        Tue, 02 Jul 2024 22:57:09 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70804a89fc9sm9514103b3a.212.2024.07.02.22.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 22:57:09 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 02 Jul 2024 22:56:27 -0700
Subject: [PATCH v4 07/13] riscv: csr: Add CSR encodings for
 CSR_VXRM/CSR_VXSAT
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240702-xtheadvector-v4-7-2bad6820db11@rivosinc.com>
References: <20240702-xtheadvector-v4-0-2bad6820db11@rivosinc.com>
In-Reply-To: <20240702-xtheadvector-v4-0-2bad6820db11@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719986213; l=1045;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=/awdvkpT37Pcv9l+R6WHhK0Ytr8TrWH5wurC23dujZY=;
 b=r0lQ2nGY3x0Mcx8SKT/4LzbmTA5HnSD2IgV5/PU35TdaU0JlDQ7BO5FbDx3YPdegM6BxY438G
 /CWwFwKT7DnBXqRidTdMn/WMnwbGCEyh1lXd50/bxzbQyx/nwcb1FZa
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The VXRM vector csr for xtheadvector has an encoding of 0xa and VXSAT
has an encoding of 0x9.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 3eeb07d73065..c0a60c4ed911 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -300,9 +300,14 @@
 #define CSR_STIMECMP		0x14D
 #define CSR_STIMECMPH		0x15D
 
-#define VCSR_VXRM_MASK			3
-#define VCSR_VXRM_SHIFT			1
-#define VCSR_VXSAT_MASK			1
+/* xtheadvector symbolic CSR names */
+#define CSR_VXSAT		0x9
+#define CSR_VXRM		0xa
+
+/* xtheadvector CSR masks */
+#define CSR_VXRM_MASK		3
+#define CSR_VXRM_SHIFT		1
+#define CSR_VXSAT_MASK		1
 
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT		0x150

-- 
2.44.0

