Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0F763C
	for <linux-doc@vger.kernel.org>; Sat, 29 Jun 2024 00:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719620776; cv=none; b=lqUEXpkYVoIXRY9pluMNkJ2gtIdLYfSFtGYzVDSPRcM0jPqdT2ieB3gYEKzTSG39vFZwpm4osNbQoGPaH4j045XcYSj0FcMx0QkZDofcon3zazlcJSF01m+/a349umjuPveX+UDXKcidzfl7rLCD7pSGgxake5VgOCqcEdBYZmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719620776; c=relaxed/simple;
	bh=juYnk63GENV7/dzTgZy7CMBF5S/a+nYHrdMU1skYSO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N3dYOWs2n+MEhv9znqR+L/2EqKra6DcXg7O8awwDmZfxdAEu0DmaaqwA5anxPvktI3G/vkRmMiEbxmnzF7JH0HjKvCN9nG0/G4sx6tJ/eICWuKtZ/T9xtx5CRoITXrJEiO3zRmaZ2xa09GskmdrMeY8o5Pd0W+3zfBoIbMBfBXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=DLOktC1K; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="DLOktC1K"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70698bcd19eso888778b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 28 Jun 2024 17:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719620773; x=1720225573; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aSdyuK/9EHV/U4rOZJpo8LtJsTBOsCCeCRMcU68Fw1s=;
        b=DLOktC1Kk5rXSl9aX9V6g7F+dUuf/wE7fSBH8HKq0PZ64f0bw23Y6ry8w0AMu1bO+S
         caOFjV74Z0jRx7wRQtLOVC1JbZ72dlh2oiEw5dUYFqmBWwwW2JewmsJjKKrAEaDHP8AP
         3DENQ24g4PNslS0cQ+GahqUcY9nMm4YG5V4QUGSGPmt1+Mookf60FCeeULPDWSSsFh5j
         87uZNbDAfWv1sWAljoI5bDpFkkQUae9jO8E0LlVzEXeipBF9iFBtotoIGoSgbwEuFD0x
         i6Mm+u/6O6Uh47ASbfKXSRdJ5+uxklkDXoGLNP1iu1wzoDXChfUS8XESGWt8kemZ+oi1
         zewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719620773; x=1720225573;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSdyuK/9EHV/U4rOZJpo8LtJsTBOsCCeCRMcU68Fw1s=;
        b=gTP7SbCJWkaseKmVlpMQ8YByFYLVxgI72PVJi3vxfSSRzPh6fLqL4e3Jkl/HJwY/Zo
         fx2phyDmUz5MDN13T7avVZza1qezDENMgRGsvjjL4lVE3RJexsehju7vkro1g3XXmCPD
         xpTxhACaQ8HdFOjZBcpmObDQMWqd8vh7qa7x+/KEyVtpXBPhEAfw6kZz6R9BWcwxAWgC
         v9z0A/zZ97/jIeALdm4l/R1k6pprOIP2IMk0L/Fmq8T8Z6yKvkEBbAZBNbLI3eMfqOsx
         40gSr5PJ+s3nwcCN0yRtEH4Embkq5x18n6Hj1NWYMIIjYIfMwEuzq0VdHW7XJhwQeySl
         5ppg==
X-Forwarded-Encrypted: i=1; AJvYcCWgxKKLZfV7mDZd/fHOr3dQOBU5wxS04faTOhDBu17O+1Uu8E/vLw95zdO5yZxP3DtK9Gr22P1Bf4uOOEC+eyYekZiiXa7nSGCW
X-Gm-Message-State: AOJu0YzM/HjbnwZbQB0RIZcEnyoDrlNB+6Bj6Oq4G79YAUoclefnyY7t
	tf2Mig4LqQDhoBRYdcucV2kMz8/UaAjbc0Rr1GSRU5qTOk9q6Q3xePgvnKNsKLU=
X-Google-Smtp-Source: AGHT+IEUKko/k4/6xXNCFY+KFjLpcjGNhy52rvbM05wygFCT1kSEw2lhuzMfsadc4asggUJvSJSz+w==
X-Received: by 2002:a05:6a00:1acc:b0:705:d8c9:f5e4 with SMTP id d2e1a72fcca58-7067454ad53mr22852485b3a.6.1719620772631;
        Fri, 28 Jun 2024 17:26:12 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708044b1112sm2212053b3a.182.2024.06.28.17.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 17:26:11 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 28 Jun 2024 17:25:49 -0700
Subject: [PATCH] documentation: Fix riscv cmodx example
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-fix_cmodx_example-v1-1-e6c6523bc163@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAIxUf2YC/x2MWwqAIBAAryL7nWD2sq4SEVZbLeQDhRCiuyd9D
 szMAxEDYYSBPRDwpkjOZigLBuup7YGctswghaxFKxXfKc2rcVuaMWnjL+SdVqJS1SIa1UPufMA
 s/c9xet8PCIo2h2MAAAA=
To: Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Atish Patra <atishp@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719620770; l=1521;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=juYnk63GENV7/dzTgZy7CMBF5S/a+nYHrdMU1skYSO8=;
 b=99DCJWrEWmIJO23ODkaplB9EBbYalo8Zt/oDmYSmDCSdolAEaR2BUam3bXH8vdjkcvuCGOaXE
 nr6YjNkomtxAROeT1JFwg5zs5LTjxLxWlHNskwi5AmiSm7mtp+oNv2m
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

ON/OFF in the keys was swapped between the first and second argument of
the prctl. The prctl key is always PR_RISCV_SET_ICACHE_FLUSH_CTX, and
the second argument can be PR_RISCV_CTX_SW_FENCEI_ON or
PR_RISCV_CTX_SW_FENCEI_OFF.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: 6a08e4709c58 ("documentation: Document PR_RISCV_SET_ICACHE_FLUSH_CTX prctl")
---
 Documentation/arch/riscv/cmodx.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/riscv/cmodx.rst b/Documentation/arch/riscv/cmodx.rst
index 1c0ca06b6c97..8c48bcff3df9 100644
--- a/Documentation/arch/riscv/cmodx.rst
+++ b/Documentation/arch/riscv/cmodx.rst
@@ -62,10 +62,10 @@ cmodx.c::
 		printf("Value before cmodx: %d\n", value);
 
 		// Call prctl before first fence.i is called inside modify_instruction
-		prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX_ON, PR_RISCV_CTX_SW_FENCEI, PR_RISCV_SCOPE_PER_PROCESS);
+		prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX, PR_RISCV_CTX_SW_FENCEI_ON, PR_RISCV_SCOPE_PER_PROCESS);
 		modify_instruction();
 		// Call prctl after final fence.i is called in process
-		prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX_OFF, PR_RISCV_CTX_SW_FENCEI, PR_RISCV_SCOPE_PER_PROCESS);
+		prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX, PR_RISCV_CTX_SW_FENCEI_OFF, PR_RISCV_SCOPE_PER_PROCESS);
 
 		value = get_value();
 		printf("Value after cmodx: %d\n", value);

---
base-commit: f2661062f16b2de5d7b6a5c42a9a5c96326b8454
change-id: 20240628-fix_cmodx_example-7a80383b0589
-- 
- Charlie

