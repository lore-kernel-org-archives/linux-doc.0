Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE93269D0A
	for <linux-doc@vger.kernel.org>; Fri, 18 Apr 2025 05:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744954477; cv=none; b=a5ub6Kzqgvbd85WxXbLAMtHwXVa5kqqbmNLleGYdEDpzuzdPtDKI9rCBN63unsVPnPGRLUMBXCJueP+f/SFAmaAD5AIAbo6aL2tximgrXoABz3JKCfvp+361YBCiv4ZO3LCwXO5UDd8sGNAoHE6EgBre9j9r3oOa/BZRxhEIknc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744954477; c=relaxed/simple;
	bh=76YvIuqiHwshKlnxsI+ssczIVIKtV6Kxq2bsjqhgSno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cnK2+VnnDJht/OrSC4VmgQ3ulDS9avc3lV8XuhQzhgqaQ0O5SlGq7F7ZmPxupgzNeTbyLLmGO96/CXner2rSbJisVQM2pYq7kxA/6nXSHOmYuaONeaOP5/6wpWoktyMZTXfj0bKtM09SHlKP7kFjVq9q52o6TZtFGhKmngBUFlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=PLugXLhC; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="PLugXLhC"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2295d78b433so19323735ad.2
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 22:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954474; x=1745559274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uebw5yKXQY4T2EOZNFFsPOSoaV3mkjJcAwfE1uNSZZE=;
        b=PLugXLhCWqcv5WFKUUII22tdScfCHFZ8aZ8tgL0bIO2dlDEvw1pVoFNbdH6fpDAYqe
         Pu4Re0uQLwG4GCk/YYfX3pJs7MmVFlIyuSY31j61KSbs2lEUHlXuQt7AwjHXGMnehI1L
         5B7ccyGkxgX/ytNWAN1v/UZI6vgemrJIUwbjy22O1pVvhMveGejp4rTEpn19jDxg2cL9
         1ZKJrSO1ozXLMMVAiE8gFFyWwlF0YhkFbHbQ2tABtMr/d9IXoyd/5/dyX4V/ewWX9UBk
         7nyILb7VoZLd3GhfZAkhTIG6NzUpuGCXYmQ1noRBUyUno92oUzyjQLCRy4sA8RYgRp/j
         jJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954474; x=1745559274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uebw5yKXQY4T2EOZNFFsPOSoaV3mkjJcAwfE1uNSZZE=;
        b=xG0Nlgwvcr9RScJtgsL1qWcOfgO65si8nz4xqFdHAYknObF0NjhEDfFf6bq0rRgorn
         7WFA3aFWZh33v/mOZNiccxKUYxwKLyBOp4+ZA2DDKrXHzF3E9CkaNz7X21RxfEc9arbM
         OErwzTSq+wIEGepB3rV/VNgrvd2nuys/m+Q62fXkZcKXXAvkGNhaurvtRntqO6plK4op
         z2R8CDEtrjNlmmrc9YT+lt5WJQ5U+64/zuoE1zxIfRKmqXrfjqC6l0RHVufjws6by9gg
         JVuke0v5jagj6Ffuje3W/lrFnRbbVebHzu4dycSh7clHUVrAIbRYgL6h+hVWBaeonQt1
         s7Vg==
X-Gm-Message-State: AOJu0Yzj96ho8p4SLLjHbkXpqZqtqgE626TF3ry3/5Ag+HYRikL5YAvg
	HoPD+D+Jvtt0Q7F+a/mldJtt2gV12t16Aq4gj842J1fsronxNPXnSQT6NwZFE0s=
X-Gm-Gg: ASbGncvPcnC4S+KAzirrjJktA0FqUmZR5zvlNeGYEIx0Mj9LA0yj88Lz91y3li/HdUK
	q0fXrhgvPmINYP9P7qcrn3o3yZ35zzoSsl4TvkU09kOxTUmeQcGtoaH/7lNHSs6P4Ej5ORTFEHc
	YoJxdRk3e5u1Rv1EurDUfyac4ie0RYYPS6/F80Md1V+6MMSqHRnrYoJcN7bnG7pG1+VsPBCcfKs
	JJNmUfkGXArd03YZ7CV+6felUVdYlJ8HVnmAbf+PKPct0JkkiqLg5JgICsOCWhrSZnKMbxbsEJq
	+AiTwvo0bv49A3qH0lZrW/CoS8zAklS6lHCitFsjEDuijgXQvwY7oBp2LMyO6xogPC8CuE0ImzE
	m
X-Google-Smtp-Source: AGHT+IG1ezRHzVyZBpVq3R5kPJr8LKzkRPN7mMERAoel5mgKUSBrWvtrR0Lu6kfGSGmyL5o3WU+iOw==
X-Received: by 2002:a17:902:dac9:b0:224:a74:28c2 with SMTP id d9443c01a7336-22c535aa4femr23189265ad.29.1744954474048;
        Thu, 17 Apr 2025 22:34:34 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:33 -0700 (PDT)
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
Subject: [PATCH 08/12] riscv: hwprobe: Add SiFive xsfvfnrclipxfqf vendor extension
Date: Fri, 18 Apr 2025 13:32:35 +0800
Message-Id: <20250418053239.4351-9-cyan.yang@sifive.com>
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

Add hwprobe for SiFive "xsfvfnrclipxfqf" vendor extension.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 arch/riscv/include/uapi/asm/vendor/sifive.h          | 1 +
 arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/vendor/sifive.h b/arch/riscv/include/uapi/asm/vendor/sifive.h
index f25d8cf110d1..b772d4631284 100644
--- a/arch/riscv/include/uapi/asm/vendor/sifive.h
+++ b/arch/riscv/include/uapi/asm/vendor/sifive.h
@@ -2,3 +2,4 @@
 
 #define	RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCDOD		(1 << 0)
 #define	RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ		(1 << 1)
+#define	RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF		(1 << 2)
diff --git a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
index 461ce0f305ce..2b9505079a9f 100644
--- a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
+++ b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
@@ -16,5 +16,6 @@ void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const struct cp
 				   riscv_isa_vendor_ext_list_sifive.per_hart_isa_bitmap, {
 		VENDOR_EXT_KEY(XSFVQMACCDOD);
 		VENDOR_EXT_KEY(XSFVQMACCQOQ);
+		VENDOR_EXT_KEY(XSFVFNRCLIPXFQF);
 	});
 }
-- 
2.39.5 (Apple Git-154)

