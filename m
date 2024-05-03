Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC59D13C9A8
	for <linux-doc@vger.kernel.org>; Fri,  3 May 2024 04:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714711639; cv=none; b=jF239/5i9WJAnTrKQJdBk403KhM+h62x1X6XGc3InWiG2ryDdGfdcaimBH///pKI6yTDDSAYsVUaJXWPXtQ+w9S30Zufa0qSkT9ZIASC1y5Gz3m1xDWlstKXotX4WVjIV1SljP0QM7Rdh7llyzJDjdiZ/RyQcCMSalEzuZ13vE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714711639; c=relaxed/simple;
	bh=VVos6nAzmHOy7EOA1ppaqJ4Dx+U57WxCTD6XuCvS0Gs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JZS7ZkFt6ToIEmj1vC0jXGudAEO3k72yjY9MpXxmV3esnSf4jr/A5IRnFrSTrahaVzXtlx013hW7zwNr9ETU8oe9itSgocc8oD6sm4nctWImLro46GVPqiYpzaCu5S5idDJjHFPalLwglfk3SpBBu8Y8q//Jt5sgjTY+pmmIaR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=osLlR5bj; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="osLlR5bj"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e9ffd3f96eso72684095ad.3
        for <linux-doc@vger.kernel.org>; Thu, 02 May 2024 21:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711636; x=1715316436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3SjbYRlfVLcKXzSMNjYRrKo8hPdxAu3bA3GNGrI0mQ=;
        b=osLlR5bjV8se4xC41aJcjcabDbsnc1Dt8k1cKHqSrJvzXZpRYSHu7FE0Wr1Gl5Ud1K
         9XJLm64ZfCWeKdsSjTT6Z/uqeEqPo214gVy/b/oSBeQQaZ1SvuG+I2Gure9TY/NDCzc4
         1yrnxsnZFKzDJsuRPPyRi3/yRctkNJHmYRcOFHFcPcpro1O6WXi4X6wdFCi1nKrLpsWn
         +2kRHhAuUsm1wOndhj6IYbqbtwk7tOdEpmdxGf5/d4wc3tcDGYNo0DVUg5J+FZpZbZIZ
         TNu5BJUNFb6m2LSkv/e7Vj3NSkLJNKbLEQv9TUQPDIF81wXCEiY8d/P/vLOwnI1RMQd6
         SKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711636; x=1715316436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3SjbYRlfVLcKXzSMNjYRrKo8hPdxAu3bA3GNGrI0mQ=;
        b=Gqr+38kCLxNZn+io14STaKRcKZBiefeyN3emWc/insveDzo51kT94YBF4qR5H8K7NX
         B44dIs/4qeVRxymJFKI1HhIALh/lDXU2SBejJZ6zKativYXZniZ6RHCBq1zN3FuT3WHP
         R09p8qkvgftzq+BHEGi8Kw2lU+2lc9ux26eUKqxs3sn8hSUUnwjz7Wy30kuzp54NTmyB
         VqjIUgtHdq0KD3c2pMIU7bIMM9TX+wGLZ+KormhJrF5hRukFqnWwHnVDop+OegEjXV4U
         MduUNUUd6UPg4V+jDXKP4w6TWVRefocfIRKtxl6SYKn2RNwbNQGVrW9SbrBExkE8m3X0
         Pkuw==
X-Forwarded-Encrypted: i=1; AJvYcCUtzS60BS5xqGdAhfynTkx+mkj/u3mE/aIHPS8OeIIjKbJtKeRQAkRNLAf7bfusCRyAxbuDUg6mDZrXUh7FqiT6XzqI9PdWyZTW
X-Gm-Message-State: AOJu0Yxm9tXceiZ11/KHGNelHRtfwm2R80YqumiqMIUWSpNSLjrdVX/1
	uZtsSBxI7A1AdcEqgMAvzqLRUAcKF7Ufr0eCszNLlClF6O26JPlDTvSWMnMJ5Kw=
X-Google-Smtp-Source: AGHT+IGM/dp68WsaICJolpFnJ7rVWv8zpuJnZkNE7iR04J0tEr/yBdhTSU5oueJaXbYqQhfKWlcWFA==
X-Received: by 2002:a17:902:d484:b0:1e7:d482:9e09 with SMTP id c4-20020a170902d48400b001e7d4829e09mr2156048plg.7.1714711636126;
        Thu, 02 May 2024 21:47:16 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b001e2bb03893dsm2240411plh.198.2024.05.02.21.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:47:15 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 02 May 2024 21:46:50 -0700
Subject: [PATCH v5 15/17] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240502-dev-charlie-support_thead_vector_6_9-v5-15-d1b5c013a966@rivosinc.com>
References: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
In-Reply-To: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711602; l=1205;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=VVos6nAzmHOy7EOA1ppaqJ4Dx+U57WxCTD6XuCvS0Gs=;
 b=6na65VRDMTnnCy/+6CqiPA9pKtnlM1Q98D2vcAEWM2LB61+5gCXnut4ekMn7J31diUbqo7FHE
 zcnD9r7WgrtBVI5ezwnTpIeMoEFwFXIDsE30Dn+rGlOO0XYaU2+kgye
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Document support for thead vendor extensions using the key
RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 and xtheadvector extension using
the key RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index b2bcc9eed9aa..b2bb305140aa 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -210,3 +210,13 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0`: A bitmask containing the
+  thead vendor extensions that are compatible with the
+  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * T-HEAD
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR`: The xtheadvector vendor
+        extension is supported in the T-Head ISA extensions spec starting from
+	commit a18c801634 ("Add T-Head VECTOR vendor extension. ").

-- 
2.44.0

