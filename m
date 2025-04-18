Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB7C268FED
	for <linux-doc@vger.kernel.org>; Fri, 18 Apr 2025 05:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744954482; cv=none; b=hHtnXQp7GPc2PKEZBjzFazmyndke2SOL53+cvraFZpaCuJG/sw7jNwyodXdaqbj2rlXTB4X/pwn58fEoCxwckqauLLyy1OfG2gOr8sXgVnWIaWbsLrh4xIpyct0niiXXP+wx6ZuUY6izvJVSSXlrBTJjl3A6GzzKgqWTTPa4fXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744954482; c=relaxed/simple;
	bh=0tp3DYKfV6TqzzMeGOt7zRglW3WoNctrJHskr09ur0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XE47wkmHCsv5xS9x8n5S8036flPgM1VHZ2OwHB0g3zI7avsiY4IcLK5iSZbkJn6zVcRERm7RiS10Mo4jzLBlxXSDPD1Ln836jTxTMoCGWTx9+OB030luNDALBzqOWVAvb1qC+65ClWzA8DLmiXURP0wlG6DKJhej4AteVsPVgJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=TTCkN2+q; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="TTCkN2+q"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736bfa487c3so1389162b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 22:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954480; x=1745559280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3B9Pw4FCv6SInWNpKovsdWyAhm6Z0HhbS+dPaBZ5QxM=;
        b=TTCkN2+qhT7x1W+mPkOAGeGGkyZN2KOLta1ynP1PcJEIp/NCpfUATIYkvPf1u1fAYs
         DclWXgikXTl0riWpASNBH4UUrBsm2y5iAbwbNavHRY7VTNT6dvk1jMHRy7D/8E9uNRdR
         0UcwUX3W9MdrfZMBBNLYvB3ZTH/qRONEdTKuwT7O2jtvP8Vz/2pw2EOedyimTEz3MeDK
         mlEPRV5EHkppnPnDhdgt2KjHAYLMgmO9trIHT2FzLXqu+1o++iSNS9ItTsYM738jFRtT
         cPtT/z/D1Z/QdtILfhIemaeReQkLC5ttpnjLcV4U+ko8/mSQUFaVJDF3Uj2PCcKJjeBp
         g/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954480; x=1745559280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3B9Pw4FCv6SInWNpKovsdWyAhm6Z0HhbS+dPaBZ5QxM=;
        b=qcHyPeru60xylcKawv6bbQY2Y+TveHxu+ktlh1NVozGDTmxCQHwWn+Y4tn/MqPGLNJ
         7LCjCdx7eQDsOJyv+EModnbnyeTQAKh83luyzfgWv05ncvmHiYxpYa2PhCg1FaQskYt1
         5fJc3LSRu5sHNWriUY99MoxhJ6Hd4JRKTfSqCj6nZTJr+CLsR/nLHqXQBCYhbCK8lUER
         SUJ4zulTTBudc7kmFSHYNp4hM8nzLkIFDzqH8YJ74Q1+b1aPQhvvwUWI0ZNmV36k2tzm
         vaR3KGXNUI468wIjMvGRxIWJy2WQd3itmO3PXnVHQFol/Mx/XCdbwISRZREyKMEZ2/TY
         0Zuw==
X-Gm-Message-State: AOJu0Yzs8lFUNr+/v6B6KpFaJTw4UzHj6u7n7GuXTtrfm9sE5btq61me
	jUNizXihnjrc/peRLhj2EUhDSbjz7scrIU+DkWATQD39yDUNYaDRHGudQDcksOI=
X-Gm-Gg: ASbGncuHsiY80zPFQkTtKfm4gPCb1UobGtvsMZxIKrZ0SeeR/XZc5macDlmJNiZ+Z8Q
	YON+julP6o88UMtFdVbhdQRe2gJHU3gVOtg75fEkqhKkGP+0WYQdV8csmCvmYTJwKJFF+XBF0tl
	p6LCjiNeKlp0WXdR6w0OsqvTX006PA1N8YaUKJbn+QNYBpkSlUnykvmq6PzzIPEibvXgpZ6dwfO
	Aq6gCs3uH0B6bMh3ZN53pIYV8IoxEnlSjLHvOOqDftRDspN8Pr6hKlaylgAbL5dIu2e66UTyP0v
	3R1VWrjBJWdh65V39XMHhD9F3jToMBz6nvQuQkhMWTaMOMffuSTHCKFlZN5PgSvrx8IWIqUmgx9
	1
X-Google-Smtp-Source: AGHT+IEuEbIHe/qe/mKunQ55/N9j2n9eXoEPrfFel1LpRV6cO2jrZzwdtlvPw0EFjDejmF7X3JD9pQ==
X-Received: by 2002:a05:6a00:114d:b0:736:3c2f:acdd with SMTP id d2e1a72fcca58-73dc14c80b5mr1878741b3a.14.1744954479883;
        Thu, 17 Apr 2025 22:34:39 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:39 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH 10/12] riscv: Add SiFive xsfvfwmaccqqq vendor extension
Date: Fri, 18 Apr 2025 13:32:37 +0800
Message-Id: <20250418053239.4351-11-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SiFive vendor extension "xsfvfwmaccqqq" support to the kernel.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 arch/riscv/include/asm/vendor_extensions/sifive.h | 1 +
 arch/riscv/kernel/vendor_extensions/sifive.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/vendor_extensions/sifive.h b/arch/riscv/include/asm/vendor_extensions/sifive.h
index 2d05e3e73170..ac00e500361c 100644
--- a/arch/riscv/include/asm/vendor_extensions/sifive.h
+++ b/arch/riscv/include/asm/vendor_extensions/sifive.h
@@ -9,6 +9,7 @@
 #define RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD		0
 #define RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ		1
 #define RISCV_ISA_VENDOR_EXT_XSFVFNRCLIPXFQF		2
+#define RISCV_ISA_VENDOR_EXT_XSFVFWMACCQQQ		3
 
 extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_sifive;
 
diff --git a/arch/riscv/kernel/vendor_extensions/sifive.c b/arch/riscv/kernel/vendor_extensions/sifive.c
index 077315e5b2d7..1411337dc1e6 100644
--- a/arch/riscv/kernel/vendor_extensions/sifive.c
+++ b/arch/riscv/kernel/vendor_extensions/sifive.c
@@ -10,6 +10,7 @@
 /* All SiFive vendor extensions supported in Linux */
 const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
 	__RISCV_ISA_EXT_DATA(xsfvfnrclipxfqf, RISCV_ISA_VENDOR_EXT_XSFVFNRCLIPXFQF),
+	__RISCV_ISA_EXT_DATA(xsfvfwmaccqqq, RISCV_ISA_VENDOR_EXT_XSFVFWMACCQQQ),
 	__RISCV_ISA_EXT_DATA(xsfvqmaccdod, RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD),
 	__RISCV_ISA_EXT_DATA(xsfvqmaccqoq, RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ),
 };
-- 
2.39.5 (Apple Git-154)

