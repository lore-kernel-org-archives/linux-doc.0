Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F7B6F077
	for <linux-doc@vger.kernel.org>; Tue, 16 Apr 2024 04:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713240741; cv=none; b=Ugs2CA3XtaG9iSMTFq100cUtW9alKPAUY9Sn0rhBRt6i7YWGxTae3KU1Q6wUPP1ORUnX9OBuDQLx8E9CD+ZLfsLSdAJduA1pmTjs/v8W9nAGCC2rIRvv53nYVGFL57wzgBYc3JNbr0ARFPPym7Gy65SpQ5ENVHhQOH2bIrQzCf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713240741; c=relaxed/simple;
	bh=hSZDQKNr3tkZT93AWiF+tJx7RzaJfBNyv2pzte748aU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DQQ+iuDRNqbInF5dssGt0zaOM7MuphYJL8xOdQq6ACyEBCJcQ3wrY8PncLaFgJ55xn+ICuFuQos7B4DGwFXJf6KNZdSgWbZ6JoPyg8yFYCPnOJZx7qSNBof14TWf2vlJCgZdscc2PGzrrGA/hnYPRcYgfdNclTY2SzCVd/HDg44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=oe/3+NW0; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="oe/3+NW0"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6eb848b5a2eso782751a34.3
        for <linux-doc@vger.kernel.org>; Mon, 15 Apr 2024 21:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713240739; x=1713845539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2nk2JCBk+l9WgkXKFxu/w/itsXmN0i69JJANxOESAA=;
        b=oe/3+NW0uTo86+FipDPTcoD/kdlsMq2pab+7fBL2vW6GPVRDgvpvSNvf3Q08gOR/Zk
         1ZjnYvz53XkFEbMMKuIajZayyf5xmXga/D5fapMlufxMog4EH2VoYiVq8nTfNV1//YbT
         R4YBbAq+8VNXK3hAbOhaSYoFRHsJds6P6siSVOLbgbMKkpiFCF/Eraai3Of7cwo4tmZt
         /g0lKiB7u/nY3M1VFY4kjkRCK9LEN9Jceonl1ZMeKb825pYVBB3qeWFqXP6QUIQrznuR
         AypWbwCVCSk1OFGbFadNCLWazgrATO0oo7S5tr71YL9Iu6DgnlZI0+KYUeCAYseywVSj
         7lYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713240739; x=1713845539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2nk2JCBk+l9WgkXKFxu/w/itsXmN0i69JJANxOESAA=;
        b=xLFOzkt0oxeKTwILYSxIJDs37LDg3rp48LUCLCeY5vKn8vNPuGAV6s+N37A/J5MEAT
         BgmIrKyaf9FpkD9RnoJG47U8g2y+q3MDhVeTlQ72XtwGDpi5R9rDJqP+p/0KZvd4QVbO
         yIU9OVYvxOey6VK3zkQLOndciwvwGaC2lFUMs+qjkzXB2+CeGNnpwiGd1JOThglaBO5f
         tvM6O1Hvv1q3OdouGXnOQAJIhO3gRFynYF3lPVksNDBb4lDoSRMhvuxt6OIHiE51tC95
         fazrfjIg4qyGw3XCdOjJcTdMbDsfTtwLEftIIjtvG/Rwr85x41+Mioomcw6y+R2/0wzM
         xXSg==
X-Forwarded-Encrypted: i=1; AJvYcCWbH+9DdHTd+7eHMSEP2ZcmHnF6vaN3zL2a0hJaNL+b8OlHjerCNblSAJnkWOBJTZ2eGSmM4prmFTpEpNAFl1CHCN3bQCOWwER9
X-Gm-Message-State: AOJu0YxtaD/9LMGIvPR/ExMVrE8xUiXZfcLj1aiY+5rojMexUAEVAdVy
	S2vbI2bbnzGYVv7TyK3v/D5Odg/mlJEGpTxzjhm8cjjGZ7sy2gi0bWVAmk/uK/c=
X-Google-Smtp-Source: AGHT+IFNWU9CebDAHIM2aIAM6rLVSvNJ/hrQCBnmGjLqT75ItU9fq2F3GA/ekORi1awzAiDhiP22NQ==
X-Received: by 2002:a05:6871:1c8:b0:22e:c2f7:1116 with SMTP id q8-20020a05687101c800b0022ec2f71116mr13338643oad.13.1713240739236;
        Mon, 15 Apr 2024 21:12:19 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z184-20020a6265c1000000b006ed4c430acesm8383149pfb.40.2024.04.15.21.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:12:18 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 15 Apr 2024 21:12:08 -0700
Subject: [PATCH v2 11/17] riscv: csr: Add CSR encodings for
 VCSR_VXRM/VCSR_VXSAT
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-dev-charlie-support_thead_vector_6_9-v2-11-c7d68c603268@rivosinc.com>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713240719; l=706;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=hSZDQKNr3tkZT93AWiF+tJx7RzaJfBNyv2pzte748aU=;
 b=3n67e3FD9DqnFP7FKjCt1L6NZMd+vBdPmua297IaBixuIX0cg2gLuR2SpqAcKm34Fv/rCrkUV
 RSpsPRdvYKgDA6f5D8F2uvwawZAD4aRtLFgcjUvk86YSBvc93fYMyCZ
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The VXRM vector csr for xtheadvector has an encoding of 0xa and VXSAT
has an encoding of 0x9.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 13bc99c995d1..e5a35efd56e0 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -219,6 +219,8 @@
 #define VCSR_VXRM_MASK			3
 #define VCSR_VXRM_SHIFT			1
 #define VCSR_VXSAT_MASK			1
+#define VCSR_VXSAT			0x9
+#define VCSR_VXRM			0xa
 
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00

-- 
2.44.0

