Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D49C147C87
	for <linux-doc@vger.kernel.org>; Fri, 19 Jul 2024 16:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721405957; cv=none; b=OsK9XYtx2JVmHbsC+rw8TTb5VWXGpOLGLyGn/6Zd4O7lGOC5UpySMEa4pCiDvI+pXcePETTxVWVaM3sCA9SzpHg4pUzTMdmvKS7zu6QDIbnxrPXmRjKqI1wf9cVy4zg9HoFZrrFlGy4OcbnX0lbTNP+fO7uoPrcxgZA3stiUQE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721405957; c=relaxed/simple;
	bh=wrX0uryyy89vYlAinvVr2O6QBZz257uuEBuSnzas59I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fjj1eVTn3GcIDJ9wsgmomdTUlwePYyI24aEzydicQDYK479errziQnTmpnrQIyMOvk9Lv/RqCVafXR8vGUZsvTcJCCvzjuT/Bx7OrC0Ch0t6I1sRjmkgZendL724VJ2LpghN5TZc+sEIxqr/Eo3FF34I/PXGTVDexU80zlVMvTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=jGUrhfcN; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="jGUrhfcN"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fbc09ef46aso18914555ad.3
        for <linux-doc@vger.kernel.org>; Fri, 19 Jul 2024 09:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721405955; x=1722010755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=425S2jEpk/4yk63j4Ow9jwZmOCFjeEcHZbKGmEqnWN8=;
        b=jGUrhfcNgJNeTsosqKdvQ8BOOMm/ub7U72e43K3mRBcoPRqxmxKGeoDm+whPmLMc75
         QKGFr3C0VzNIHoESMotIAZSq6eaC/sk7IJ3naB5Qgo0e9/jkdIFtPhvBCWewGy6aK/hs
         Cu8Vf38k8Z9dDWXZHM6k+h7AILDCyP0aE/5CjELlFeTM4R0dwR6kifos2vW8EeD+rGj+
         st7y6UX3PgIogDcaWsXtS2yckX54XUycNwedtCVXk2G+RFc6HA9kBxvXh9WkwQQcmQFo
         Bwywz/qOkU0O7nVCOtbuHrAnITWGctMOk12DYNVIMDYtMPcVIfvfoxvMEoFlTUyKL2vJ
         qjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405955; x=1722010755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=425S2jEpk/4yk63j4Ow9jwZmOCFjeEcHZbKGmEqnWN8=;
        b=NUQoNbnvAG6F3qK852rkdzQhj2VNDezHUi2CMD7p98O4uPGVndUzQ5wSdHjmC/ljjL
         qNAzSWkMgcPplX6t2QZRNFLbtN4GuIO+17QneU5g3Cj+jyyt/pO6P2t2RYiIKbyxJZNj
         njDo+tdNk+I+wviHz5x6X21U2yptLmFuirIKCeazIsqBWwzWVDPnOpf0Cxwz4KhsUR3T
         3nc9GUweCL6dJqzM+zalhgj70dy/uMv9toJzpFBNS9v+NH3DdNEreRfpXD3iOaKRh9gO
         1KOPChNcLAm63EVMzV1NuLHFTifJ0+/qOfnX76V9RYHCKp0JvdW8fEUXd9cKa8TKGofZ
         HR0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUVT4Hc5kt8swCDWFb/Ncoy6LijeRak9UCA1hQoBW1MZCJt7DU+qWS0orxEus186m69sx1gWVYBPOXhoBO0JiTkr88W4pPwwXh
X-Gm-Message-State: AOJu0YxD5NEreH64quE15YoEQvcq1eQYzvfvpw5kAHOoZcazEdRwdhVr
	yFGa80DMZwbzsM3X/MPk7Q9shxsIL25cLbbbmoVPAvAJGmb4bs1tVbdu87ApQx4=
X-Google-Smtp-Source: AGHT+IHd7APHDJpS35FeR6ima+9K+gVcF/yw8osLtSNDHRBv0ckC3G5hlBewBT39FPTJMJNG74+ooQ==
X-Received: by 2002:a17:902:d489:b0:1fc:287a:cbb6 with SMTP id d9443c01a7336-1fd745bb20emr3172445ad.23.1721405954729;
        Fri, 19 Jul 2024 09:19:14 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f490dcbsm6461435ad.297.2024.07.19.09.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:19:13 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 19 Jul 2024 09:19:01 -0700
Subject: [PATCH v5 06/13] RISC-V: define the elements of the VCSR vector
 CSR
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-xtheadvector-v5-6-4b485fc7d55f@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721405940; l=930;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=0jkC45FH0LUvSVfvCEJuCBZ027fqPbAipPAnc4zFoN4=;
 b=kJKsEpX+fUX2Wt/n4c9KZOx/LoIvpni+uGwAmrg5zbcQiIgJQZ0LwLXDxk0v5epNZ16kgtSmF
 oT/F1Zju1FNBC6eHRkfuhUidUEAzjP+Fqr1KM7TrqvwE68kkRQ/SZc/
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

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
index 25966995da04..3eeb07d73065 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -300,6 +300,10 @@
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
2.44.0

