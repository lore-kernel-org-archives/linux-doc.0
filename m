Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588BD5DF1C
	for <linux-doc@vger.kernel.org>; Tue, 16 Apr 2024 04:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713240740; cv=none; b=Q9QF4qtuiQ4fQMDTZIxD6gmpHXQwsxs7cZ+4AD/QA7TZpFP/vSnqcqApZwLrLucbSzM6otSop/JxrQRqwzDynxjeP2i6803k8TVOC0fRcFrymI4zt49XDOerr77vIvHS/wlUrkNqeYX3yv8lvU13bK4E7FCNTu4YekKPw/gcQFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713240740; c=relaxed/simple;
	bh=wcB/ebDhkfkPBVDQxoUt3AjUlhzpSXzz59SF5DkeLyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g8CjRZbUT+svWu5Eh+LH+6MdY9gLI4xn/bCAXjD+72GtAkNzynoB9wy9Mc9LUG/rGpMbdQ9W5f2M+3veO65zaeg/o32Jqf1sA2vWHQCxp2HpTfWgOpCtiIFNeWyau9VWyGPHgd4hheelfr3JxTtdTsoe1nIm6ibVB979eJdjOxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=cDeT3Qj3; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="cDeT3Qj3"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-22edcfcd187so1827698fac.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Apr 2024 21:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713240737; x=1713845537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=cDeT3Qj3bLx4GNuLOw0ISv28Gn/Fwp611oxVPxfXbuzKX85sYeKKPy+UV2YZN1aORO
         vLbASYQTnJ2o7RvAYZbBTRSLiQjN8N6TFgxRihZtK0w8hg5BthG8d4eBSxPcST9iQGUY
         U2o6JbIqKX836rV1WKRO3H8XPzZTE3fVQpLLSnfT0RC2QgtYxHFiA8e1M0mmxkuZ55pL
         g3XZAZbDpYcx2m8Ert82AvpPVnzp43eDporioWQIYTObP0Jw2nPQK3VRImCVWHFGONpS
         BtPTlKz60PWIvg0mimj3eE1VgAKI/prV99ZsOkKOC9iIjqghxwzLs+AT98OrUddBqRjb
         tbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713240737; x=1713845537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=PpwXUw5plmMuqn7YOknG+LgE2x4AwValmIfm6gvlguM3gIiVxTm4XISaKkhN5kG9Uv
         HB1vC++lhxo/Ugjqjydn57FZdTLdlqUR2uStk8usyfSI9pQU5WfeEoz/esvp4UjcEVhG
         eeJ3mplkEiLtoDoAO9/qxf47Wb3UO6BYRnkjWtvqZXatdOFF1MRgZTeRQ54TW+UE/ztV
         9mG/ERxyGXQiZjYtbBHn5Uf2jn3kpx0PIjcakBU0DFJ/84i7F8v1T9C3wpZ/JY572wmo
         GWm64lR027WhAJefSJUFVfF5dQm6ucQphDXeaMdCcrHw4lmqUxf5gvPIeATXXTtXd2Gm
         EzYg==
X-Forwarded-Encrypted: i=1; AJvYcCW15SeQTT+JsewH5Byu3Pl/rhcfbVYRxXgukrGUMT5qFd2bzOZl6Sx5ByJtlJ7Out3xATMA2lOfnEFPawmi0V64+2V+lTNUGkRn
X-Gm-Message-State: AOJu0Yzst51mDpcKyErAdnmYP1rsnyWv427KEGeOX2hEYMZXz4vXwb+Z
	+Q8XoLJbE31HfzmgUwbZl8kcmiAuErYwHuw5t3qrzpjCAl9xYFKQOc7PaJyOX/Y=
X-Google-Smtp-Source: AGHT+IHkqiMkVjxP3CYqN1RvGEvTVB4gtmkT8yxeTu0gT+YMQ6rgsqh73ctLt3AZ3AdSqqJmE2B/vA==
X-Received: by 2002:a05:6870:b293:b0:22d:f859:2225 with SMTP id c19-20020a056870b29300b0022df8592225mr15026805oao.6.1713240737601;
        Mon, 15 Apr 2024 21:12:17 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z184-20020a6265c1000000b006ed4c430acesm8383149pfb.40.2024.04.15.21.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:12:16 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 15 Apr 2024 21:12:07 -0700
Subject: [PATCH v2 10/17] RISC-V: define the elements of the VCSR vector
 CSR
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-dev-charlie-support_thead_vector_6_9-v2-10-c7d68c603268@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713240719; l=954;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=C7F1c584ODJM4qF9TPT5kMoM8fDlOPYyEMw6010Mea8=;
 b=gL5a3gZt7YmAzdC8JCIo8MXcZ7fbdc6iO361KpgkRlf5taEU4xnmrghYwi1t5py6BJP8PyQO9
 P2I8p9MxL5KDfEXe96mXU4uz3Aeg9WWgIVAt+oJLRgmHkwkJ4xayrK0
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
 arch/riscv/include/asm/csr.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 2468c55933cd..13bc99c995d1 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -215,6 +215,11 @@
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
 
+/* VCSR flags */
+#define VCSR_VXRM_MASK			3
+#define VCSR_VXRM_SHIFT			1
+#define VCSR_VXSAT_MASK			1
+
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00
 #define CSR_TIME		0xc01

-- 
2.44.0

