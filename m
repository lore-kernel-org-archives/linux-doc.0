Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227FB1F12F3
	for <linux-doc@vger.kernel.org>; Thu, 14 Nov 2024 02:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731550903; cv=none; b=rqdNeu4H6Knk6zyVX7rEN+b1W/Hq3Vw2hiEtSqMCaRMRBiHH/Yi+lGVbaL/kP2SuG2pa2WqCNaCM/pGznd/SaVdgiIgIqO5c9SmJ0cpeg7lZJKVc2jlgDkrJI+fgpCN5HCgLVqeqfUsJFRoezxNHASiYud94qXPGVmWAyNaBH90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731550903; c=relaxed/simple;
	bh=IMTX7wFhmekwgv/999KdfyiiLXG/oySqov1HnDb4bQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ewxFyXAZiI8ENHWOzvkFDpmqq0ma/1KmnPEUtWpcTrmjzwHD5mQj8hNCIs+u2cmjxZF5rQ0Hr57b9wE3ywgL7QrtHch0MvGOzsFPytYHQ/GHZCgnAP3oRGXyedEhnnUrgrmt41TSO+bmJi+QxwmBpyvvy6oBHcjrwGkMww8gus4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=IQBhE2dP; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="IQBhE2dP"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7205b6f51f3so52511b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 13 Nov 2024 18:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731550901; x=1732155701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQpI8oGqjRXIuyayOmjB5gj8CivKUFDc1b3b4GOPe04=;
        b=IQBhE2dPnsDYaL6MfESaCWTAwmIAjuZanHnxoGvjJndrwaCMavJTRTUahEfsr+swv5
         vxmeVXUBMKTtsOMLuDe45J2UJyou3H6PxlFx6+HoaVyKWkUuEvaD5R/8mQHf1hlh8sXZ
         rplBa72vzedm48naxm5y2MuXWFwMVio5C8odWt0/VWQ1w70ZL5PvQiCsbzsygIgM+TSe
         l/GELHxdJX2qZyc458V9E4QAtnaSElQjBIkP7+FkPeYZ0ers2tDGvbxnNVIL+cLeLxkj
         76VmrAjOBpj+Z1xTXSSpaGcpYbvs2Cf0wSnOnwIxP9LvXRrkWoF72UAoigt92kmyCCWQ
         8FIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731550901; x=1732155701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQpI8oGqjRXIuyayOmjB5gj8CivKUFDc1b3b4GOPe04=;
        b=GJXdZXjgj6qBNCvHC4FSs9TK/oML+d0JTwRULg113lQlnuiFbHsZx5YK5TzUc7jhtb
         tnbalnLyGBHjc0s3j4MN10iX9er3bdzHOw0ZjMGSwDcX59AFMs+matgVts5V9GH34Kkt
         Uu9wsN1VrPDJr3nOBUrnCRJZdgASzK3JmcY4thDpSnhljp9lebv5xdCRisK2tsD1rtgl
         e4nfcp4WnuVkl7pUgWc7R1nsQKrkCtgSezcIFvTHZM9QinJ/ZMOMIcCOvWrdtB10uJbO
         ZxDndXJM6N4OTHndJA9aiHcYwqcpFMwjbdmUHTld4U5Et2a6MZFYNQ8q7oFpHYP9ZBGE
         NZkg==
X-Forwarded-Encrypted: i=1; AJvYcCVbqjAabIvkPJnnssot76/0e+LK3bRNiOkkxb28gQso13rr7iUKEZIJa/LR4pybw489DcWmEFAP27U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOF/0NPqd3kFNTGT9DsXHOieBMc8HjvZo2f5izmsfcAHwjSlWF
	B5C832pL1PjEAIkqHLZydd1RDMDihPj4tv4KvcuG2ra3zazjDSs0E8Tc1mHR6dw=
X-Google-Smtp-Source: AGHT+IEM2CwPcQXZI9Svh2lf00ZEMQVXQk/g3+Zk7IWvLJ5CiFC3TFdqne+Wd+DhOUNFtdaQbE3POw==
X-Received: by 2002:a05:6a21:3295:b0:1db:e96f:4472 with SMTP id adf61e73a8af0-1dc834ee4dbmr976723637.31.1731550901476;
        Wed, 13 Nov 2024 18:21:41 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7c499c9sm406875ad.68.2024.11.13.18.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 18:21:40 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 13 Nov 2024 18:21:12 -0800
Subject: [PATCH v11 06/14] RISC-V: define the elements of the VCSR vector
 CSR
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-xtheadvector-v11-6-236c22791ef9@rivosinc.com>
References: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
In-Reply-To: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
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
 Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Yangyu Chen <cyy@cyyself.name>, Andy Chiu <andybnac@gmail.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=930; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=GYVIK5RN7sAF5cs9O4ZRqugq2IlOeAFQOiBXIJ04b3Q=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ7pp3AJzT7WHn63qdp6dndHrs0En8vb97OtuXCqsvdP6r
 0j+7vHoKGVhEONgkBVTZOG51sDceke/7Kho2QSYOaxMIEMYuDgFYCINbQz/o2480XpS7OUifLCp
 VKZ23ebvYhodtS/i8rfx5NjZXwj9wfC/yEt7fm4vbxqzwDOdW5wqW05yuUfemLBRw2F22zvNB1s
 4AA==
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

From: Heiko Stuebner <heiko@sntech.de>

The VCSR CSR contains two elements VXRM[2:1] and VXSAT[0].

Define constants for those to access the elements in a readable way.

Acked-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index fe5d4eb9adea..db1d26dfaef9 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -314,6 +314,10 @@
 #define CSR_STIMECMP		0x14D
 #define CSR_STIMECMPH		0x15D
 
+#define VCSR_VXRM_MASK			3
+#define VCSR_VXRM_SHIFT			1
+#define VCSR_VXSAT_MASK			1
+
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT		0x150
 #define CSR_SIREG		0x151

-- 
2.34.1

