Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B3711733
	for <linux-doc@vger.kernel.org>; Sun, 21 Apr 2024 01:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713661499; cv=none; b=mdzHFISdy8CtiPJmNsOPB/tTha32tNcWcF2Pr7wAiIHUVMz3WFUQJEZteFVI2BzLmeyL1o8pbCCc3yFApbDjCfXJ7u/jWXEL3Qu1G3HcPnsA1km31t07ECwNINCxSAfFdF5YN2QAswQ4Db/OW5zISR8LS3fQMU20kHKv8wTZb08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713661499; c=relaxed/simple;
	bh=QiQI1i7vjXBhs46HZcfDGYtUbq5szs9hkhXvkNVDIxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r73nicMmfVHuQ0MEgtSuG7wz/QN3A4KIS8YCKTCEaDJmX/PyALWoDjYLMwmeHzwt+qdDcyyUDB9AJrN0YIHyUbDSasAW89AJQ+dJJG9/AfDm97Pb/P0hGxn6+Q4JOWtp2E1EKixiEnV/jqLZC2YBkuO8QPggjgoEuHdstcFpRd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=oGccmBvY; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="oGccmBvY"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6ed2170d89fso2819102b3a.1
        for <linux-doc@vger.kernel.org>; Sat, 20 Apr 2024 18:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713661497; x=1714266297; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yu9Am0unYXzuMc0qIjJPUdYEG2xZXFr099jsPQEasY0=;
        b=oGccmBvYajcLj/QmiK9SQgst1zVxPYLUJAQsQNkRlcZZJIul8UICE///c/FFFzQHT+
         3iX1sKSgime1oqwvYNoiayEj06ljrr0hP3nQvdWog2cypsKo0qD2SB4MBMnwnHerIP8S
         yenzo5pq+JBByPikyl0a8inSPAhxQjV0zPAK7yVQFHKOaeOsLyIIOuu1dxVSbkxZAKoI
         mp2iIM/+E0P49MF238ZKrXDnKSNnF9RBrdh1RSHMn8TmHZxOBnHd97McGoZ5d635ifbh
         PxJqybJtaIVV4llLUjuTmeDP0ZG5EL9bV6esvhA0SNLSlJ/aIJxOTEx2EpIg/e1pAUHB
         1VoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713661497; x=1714266297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yu9Am0unYXzuMc0qIjJPUdYEG2xZXFr099jsPQEasY0=;
        b=VlTSByjUKMh5dZNE9zE7mkhlu1rSZFxOjNZ74Hm4L18Q/l8WcE32ECc619J9bdenUj
         lyBLrzg2bKhlzh915Qht5MGR0sCVe1nX8udZtGjfV5/XGgk1yDyZWHxaiFKHQGPFxsjU
         9aGsB9vwn8Wk0Q+psitQ7JrDrl8PvCZOTWzUdIAuai4bqGEZuKGTDU7KhJhjFM1K40Bk
         Rmhou10JzMxNz2EpeTIY+VD2+IsnlpFX2pNE/j3vajal+10s8X2NTVGRu5JCarDEw0qZ
         lESyL3dc39DRzNSQJO4GX5mJGq5/Pq3vWzZacZl7TqRzVYGKN+ea21sPwbgsMHmk3++v
         NuiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu5UF35nfKZQs1+55OlhGJSoUJIdTTsmpG3zwE8uDpLv5pSGkLVuSk1FGD5dENgFXWMumf8pK3XYQ7tqNhVjPcJXK+S1/LTstx
X-Gm-Message-State: AOJu0YySS+Yg0cLDjypIcwsc2Zljx0N9u+xYNQJCmh2kynrJk31AvHPZ
	ZDI319zKt1+3TzAAV9WWGH1GnuaiOhdFAA/lbvEKP6ig2WCXuNPze7tsLF4bvlE=
X-Google-Smtp-Source: AGHT+IFWaA66MVhFHzVqeH6ER04Jg35UlWbtwP1v2a6tYCwe6/lLPPzjlT26aXgRHK+BXdqOBFuWwQ==
X-Received: by 2002:a05:6a21:7884:b0:1ac:efd3:4d87 with SMTP id bf4-20020a056a21788400b001acefd34d87mr3420884pzc.19.1713661497028;
        Sat, 20 Apr 2024 18:04:57 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d6-20020a63d646000000b005dc8702f0a9sm5249627pgj.1.2024.04.20.18.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 18:04:56 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sat, 20 Apr 2024 18:04:38 -0700
Subject: [PATCH v3 06/17] riscv: Fix extension subset checking
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240420-dev-charlie-support_thead_vector_6_9-v3-6-67cff4271d1d@rivosinc.com>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
In-Reply-To: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713661481; l=1065;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=QiQI1i7vjXBhs46HZcfDGYtUbq5szs9hkhXvkNVDIxw=;
 b=+3zc6q0i2BsAtbDQT7K3i0HV2YRODdQ7IkaZd+LvMW/ig/YqGy1avCBI4l0spwFxEKlLUSKKu
 xWM1me9URmJCN4CloLYVBR+5P4yAUklVAjXSfYEk8uxaiWkJDMFr8fd
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

This loop is supposed to check if ext->subset_ext_ids[j] is valid, rather
than if ext->subset_ext_ids[i] is valid, before setting the extension
id ext->subset_ext_ids[j] in isainfo->isa.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Fixes: 0d8295ed975b ("riscv: add ISA extension parsing for scalar crypto")
---
 arch/riscv/kernel/cpufeature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 48874aac4871..b537731cadef 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -609,7 +609,7 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 
 			if (ext->subset_ext_size) {
 				for (int j = 0; j < ext->subset_ext_size; j++) {
-					if (riscv_isa_extension_check(ext->subset_ext_ids[i]))
+					if (riscv_isa_extension_check(ext->subset_ext_ids[j]))
 						set_bit(ext->subset_ext_ids[j], isainfo->isa);
 				}
 			}

-- 
2.44.0

