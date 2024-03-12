Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA051419B0
	for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 19:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710272878; cv=none; b=lxsTIblTgIBSixOxdvW54J78Nq6R0xG+hdiH0N2E+w4lr2oKhDX/HiFEe9tZTTvik8nXbGSg5SOboA6M+0bFyKx1PGURLfmn07CUsJNAAttLnm7BVeIkPZCXCY9/Yse5nnLLZCxh8lu/PzKsmuM1Uo6O7zkUAb68sHW0kYIQfeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710272878; c=relaxed/simple;
	bh=U1yCIqRq0duvpJX2nz5FFSagYRqS2vPnAY5Af8ygvZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cgoaDmLcOhhzXWThoEYmEWOS2U7pySeIf5ONQtW1EJOGvY0pBS/UgOR+xPHADvcCWQAB7KoTCNq1/tVYBJjDt84/SfqvBWDdiuKOXWmGDslehbrZiLDDo7hDkw80EYBbHg+dKGOYUCiA9yzzPCZR5kPmYM9+xG71zmHevBIOxV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=XBlu3+39; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="XBlu3+39"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5a0e5f083f1so198267eaf.1
        for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 12:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710272874; x=1710877674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JOqRUTnz4dMY1mDsAaQqT8RlSz6vNVMJhwSPPEU0/Tk=;
        b=XBlu3+39DS35WQKvpj1l1k9QknOGZUQRwfMYYFXgJjjnGdIw4UioCcFjGfq3RtOHfw
         SMOd1B165Xxq10WCu/lLNqp0o1jv8eqcOcTuLx3Ze/u5b6epq1OrjR3Ax4h+JkDWM8Ub
         mA329ajlsEElbTBwabifjORjGbMA/5ypYwgLRBxmWQr8T4AUM6FPDZuyLT7xtNzojfbD
         duJtDz/hxl9RfVONEw1+Vv3Tlw01yf+fUOswsSgw+TCVQwaSUbaLpNqBDE75wr5SGF5y
         GNVy4drxIgFOEDF4ZzzXN38PGJKjnhw9npIjvxJKtmpv9AHIerw23wKJP51J+DteflAJ
         TrXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710272874; x=1710877674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JOqRUTnz4dMY1mDsAaQqT8RlSz6vNVMJhwSPPEU0/Tk=;
        b=KBcIUde4oRirrUIXErHXi5jOQzfl07YF/wZ+LHWD5ofMiXXqdTJB1wFc3EkT2pxJId
         4KuphHAyTYsnkrokDmbWDi37F3GuJ4FJJidOeN7n3pXmiKSwaSyseG4J0J7Yd8W9L3Q9
         geySZPPDj/QEMiBsZQi2hvnYRSV8yUvOf6EBGF0hK56Xa131hhcCNm03TfZM5yyZU4Th
         K0blDP1fKCmCDxZSqrwnNoJob1X81sshRbAo70mcUnDz/TwHXjXTH71p4gbpG5Vp2Cbj
         9bzDXprScmSreFuiew9RdEK6tM9o1B7E6ZqNdGIh6jl+JejfpL3/LVNvuf4G+f/ZkpHe
         hD3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8h8PcZuxd+7GFT9KpQUSojeztsxgizf6QDbsA3H9dNynnPmpHVQjSLCf81GdLSBrC0yU/JlovzqXJyIT94RUHP3AX2W2ByZNt
X-Gm-Message-State: AOJu0Ywi4zVEIN0eQhwRN0/aikBV3GX4IuS2vqgegxq77D1LQWKEeboJ
	xF2Dc4eMBceMGZdVIQevTb5QUszIxjAPMg7WK+ibrxGXcP1AHwrZvFr2HgHpnEA=
X-Google-Smtp-Source: AGHT+IGI3bdfpp+X8J+ZAKrqf6mS+YBT6i2j3SsCGQcUF6D9lLzGReHwzZfu7T6A9BAy8M6S+dJeAg==
X-Received: by 2002:a05:6358:3228:b0:17e:6924:e4ef with SMTP id a40-20020a056358322800b0017e6924e4efmr4693399rwe.24.1710272874205;
        Tue, 12 Mar 2024 12:47:54 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z69-20020a633348000000b005dc884e9f5bsm6433495pgz.38.2024.03.12.12.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 12:47:53 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 12 Mar 2024 12:47:51 -0700
Subject: [PATCH v12 1/4] riscv: Remove unnecessary irqflags processor.h
 include
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240312-fencei-v12-1-0f340f004ce7@rivosinc.com>
References: <20240312-fencei-v12-0-0f340f004ce7@rivosinc.com>
In-Reply-To: <20240312-fencei-v12-0-0f340f004ce7@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710272871; l=696;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=U1yCIqRq0duvpJX2nz5FFSagYRqS2vPnAY5Af8ygvZo=;
 b=B4BSJn3Ds/uhAQxDonyv5DKERy7Fsrbt2TvkM0fPKhogZvT+pJ7QmCDUxVLS6ckX7qedOXG0u
 KalC8LH+1ZCD46M/5bI5dIEnZ3XJ5XlRQEEBBBsLpauEY6z5ACcZhlV
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

This include is not used. Remove it to avoid a circular dependency in
the next patch in the series.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 arch/riscv/include/asm/irqflags.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm/irqflags.h
index 08d4d6a5b7e9..6fd8cbfcfcc7 100644
--- a/arch/riscv/include/asm/irqflags.h
+++ b/arch/riscv/include/asm/irqflags.h
@@ -7,7 +7,6 @@
 #ifndef _ASM_RISCV_IRQFLAGS_H
 #define _ASM_RISCV_IRQFLAGS_H
 
-#include <asm/processor.h>
 #include <asm/csr.h>
 
 /* read interrupt enabled status */

-- 
2.43.2

