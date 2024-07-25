Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36695FEE6
	for <linux-doc@vger.kernel.org>; Thu, 25 Jul 2024 04:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721881012; cv=none; b=S1SBsgw7vmjB4Xm3MpknTwq4ii9JlEoElC4uscicrBCmAiE+QgHByO8Nn5vJ3d2VRTdiDTcz+EqMg27UYoB0Ig5vbWoHk/tem8swtk4kxrENJ+AzmZ/nk9ju5nyzseEPAsB5ywElf8lmlGj1pjvzoXCrAmxRV8dYYE9wDTsoAOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721881012; c=relaxed/simple;
	bh=/awdvkpT37Pcv9l+R6WHhK0Ytr8TrWH5wurC23dujZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vq4Ayz9S9ELKMBu1y2j3/5G+AFBvR4ahSmbco2xeXjTl3PlN0pUR3FW6ZwJCCspgWx4tpopK/2qIVeCaxF3REiEu6lwjC9cPK9DO3ubQRdbJBMN1y5rP6gGiPOkR5bjzzhC+qWDUB5MaZrWID1BOO0ezO6/apkFM/1zysp5SSFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=MYU/h2NY; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="MYU/h2NY"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fa9ecfb321so3341225ad.0
        for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 21:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721881010; x=1722485810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7liFIbqG3XLVQtLXjuEuZ9H5FIup228+UAuRj2s502A=;
        b=MYU/h2NYxqbc3KLfgv5MLl8cXZHD/eOCpw5TEsVWH7tUO4Mu48K0Emc+yxxtMsWgk1
         d27vptFSUbgH12vcvwPChwsqhX0o8Z+I1Z1EtSvmN3z1EiVt0Q9y8GDINkoapd+fAwxV
         nk9w+0DFhyzUJbacs1qfDC5bKlzRDDFBdIp14zrH4XLXH9YCmsuQwsYriYEArODK6LHT
         pysbMqW1LuaYWNMnidiCSFkr3nSOFEdSmSScBg3zTU6114GA5UoyiAwDIPcN8RgX2loB
         InLkHJWns9X6uRCaozjsEsRFKfb8Jatmi10DUgAFsuHbzMbNq+4i5itQFBVlUx+CgJVz
         JAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721881010; x=1722485810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7liFIbqG3XLVQtLXjuEuZ9H5FIup228+UAuRj2s502A=;
        b=sTP223WuW4e4MLqurRfBKsuJMuwHi6rzZJdy0BzPjR8O4nue0uBbWMqyStpjGPIVhR
         Tu8TxLEiRnFp6inPS+tSRaNbq8UMlqQHk403fTmuuydQ5OmzhyPoSvsULta9L56nPGZW
         mxXleWQK3VjSw+Y4LzK9nHoS7JzqTvjJ1ZOmPyWHfRGoAyzDaYlc5pFGwyASgrbwIQBp
         QHVNXzVcZ1e3oXQg0B336/dqnHSOQk638DiZFE38EgKYHNVO2Eg+YR/HOrxcrbkAQFK6
         aXnk4udYmmljMAPpUmgBxHxjdvRAUv4/bWaOn9soSPDu7msCQXrsUyRgIi8cfZ4NM4Ak
         4CGg==
X-Forwarded-Encrypted: i=1; AJvYcCWpR6wEEDLdqNPo21S0qh5uzA4pHAS6gkO+y1Y3urokui7zAKQOvHjxjpYPKxS9JxjWVFUx4zn/jwc+Q3DyEEnWqSHJBC+ZQY16
X-Gm-Message-State: AOJu0YwW6YxMIYwxuLmRsMWWRh5/Avkq/RitCJ0NGAYVZiU6bznC7Q4v
	cXXzcitlrydi+TKpRZSI67A6A2Gl0mReD3evtYbm7PkTx4ctB2qs0TkLPAXPFRg=
X-Google-Smtp-Source: AGHT+IG9p5ieQtAxVwtwRrKMsQ3tH0oS7hdi8tXU1NiTxKTEptmOQ6kEQXaoXkVzZB80bKpXwXAfnQ==
X-Received: by 2002:a17:902:c407:b0:1fa:fc6a:858a with SMTP id d9443c01a7336-1fed384285emr18528395ad.15.1721881009991;
        Wed, 24 Jul 2024 21:16:49 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f2b80bsm3781825ad.205.2024.07.24.21.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 21:16:49 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Jul 2024 21:16:24 -0700
Subject: [PATCH v8 07/13] riscv: csr: Add CSR encodings for
 CSR_VXRM/CSR_VXSAT
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240724-xtheadvector-v8-7-cf043168e137@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721880993; l=1045;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=/awdvkpT37Pcv9l+R6WHhK0Ytr8TrWH5wurC23dujZY=;
 b=mF9QzvOtJ0E+YvogarHlMEGaWmhoxEtzqz8fpE1XE4GA1FOcmeiBqgyml12mHdPeg4HK29G9Q
 k3wj39Bgwa2AfUMTGV1y098m1KBZgSQ0bod6LyBScyOjBMjAsLalkez
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

