Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC8B289812
	for <linux-doc@vger.kernel.org>; Fri, 16 May 2025 03:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747364764; cv=none; b=Y337JhVd2KUU7nz8OoIWrHz8pC6LwaNUH/pA+NBHaqHDRXr4eAsJe8bUaNPzaM/KX1i2+aUTGwJuJu6ZmsiTtc2O0+nOE1g5KPmSLUOytSKvP9VWKlGjhLkuPcAizfp+eOS1Znwb2OcNh47rSCm2RN8aQSFHarroWcQfZkKmzK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747364764; c=relaxed/simple;
	bh=76YvIuqiHwshKlnxsI+ssczIVIKtV6Kxq2bsjqhgSno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a9/8Q6kUrULh0+e9Kmw8ggQfAd0lL22tUMxZpY0wpHh9mFdKnqEGbLZEdnkPVpfv4EicbhucF5mB0IFYTCRPB+jc5NtOfC6EFvosuo46cLyFxjda43KQAFy/+SHU63Ws5NMMx/GpZOT6ETXXXqUUnRIUz/Z6oFIvETCgMGP6f+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=bA5YLbDA; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="bA5YLbDA"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-231c86bffc1so12250745ad.0
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 20:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364760; x=1747969560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uebw5yKXQY4T2EOZNFFsPOSoaV3mkjJcAwfE1uNSZZE=;
        b=bA5YLbDAMNzDYzsK1QKWjsR5nj7rsTyjdz6eYDdjM/TqjaKetxDokpac8QCt4EyuQ3
         st0wmmMBD+U8Kiro5wZDy22Zn7GbDLpwhbzGl/muFooDkio78wrkjtlG2Y4BymhJK4Rb
         5diPSz8w9NY3Qn4F+WwPIN/lYnOuBUZWqM8P8bQRqJ15PIDO7sXKFW7W3z3XL0gkmUGD
         EzOVeelHP4Hsn+HV+scqCN2OyVmBskNTM289I2P4pVvuhCnkqa3B0cK183PbW2RA8p+z
         gF9UnFbTTv2+5N6ON0EwZtmk/EbUm+jcGMLzEoMNRXgcAqK658FnEDeCff6FBaHMhcwX
         9MZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364760; x=1747969560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uebw5yKXQY4T2EOZNFFsPOSoaV3mkjJcAwfE1uNSZZE=;
        b=s+VNlyW4zC1xe8OjXBvnIih+D157nJ/p9Ekd8QpVvzM8RJXqwT8Zqs9a6jXtL7n+DK
         yn9ZAd9F1AF9mhthfrgYB4FsrMHboUDEHeWMa7JDEputqyVVTUxvGB2lQBwESB44F1E/
         fojS6Sq/Afjxt8tN0+c+Ip9SQUK5WsDy902KQy7uIKEFUI0BdsqNNuUpMIh+vET9MOTM
         g9LYSFXiQbKlG3y9dvgnsj8KiXS8kaJGVuFS5UKuJRFFNQ/WDd49Go+WWpoZdS5gbfTB
         g/PBhZLBceBUOdjzJUdRGTQWiPchSVFTUWMgMqLH6ZWsQwGfujLxlgpROuzOznX5GtUM
         6tKw==
X-Gm-Message-State: AOJu0YxoLdNAMbikEnQync0aEJOcINXWw7PKLppQAcDpCNideOxq1XrZ
	+NEvRF+McE8yislLBQTTjg7/9ncZGYmo715AWAw7x9z/lmJHpIBgy10q1qyhbOpYaW4=
X-Gm-Gg: ASbGncsrJ3cx/6h0CSMKZGz4i0K+++41ilmvSSvdvTl7h1QXiDJLWPMj00JMvEu73TT
	uZLJKEJy917erNaZLZkd6lnFmfsX31ZctB1EchLcs/wk3C1KZFvd40Kg+j4EfMnOdoDAeh8sPL9
	jC15DnrI+tWuj+MA5pTeXOLce8TdRfkBeAQDL7j94pGWBf3vi+mQsDru1TbeTUdISsJzJu3g5Bh
	YXkFwdqLtXSwbA+oAd3qWKjzno/LjasrWq66C/f3qhIVMCla/oyNhtU+TGapKntGw5DQrakR4Q6
	o+U18CcN2VulTEC9zwWwJexE8eBei7/6mEmk64oi2RrhxOj+28b4l7TmmNBUlUzoj3swOaO3sEF
	H8WdJjt1xBijK3mhm0h04pQ==
X-Google-Smtp-Source: AGHT+IGHOS+9p/lRlrvuxjoBtFxHTXOF9CcsyvcnXM3ZuSvglZ87knFmunIlRLlJfsORHSmTFtTD4g==
X-Received: by 2002:a17:902:fc46:b0:223:5379:5e4e with SMTP id d9443c01a7336-231de351434mr13109245ad.10.1747364760422;
        Thu, 15 May 2025 20:06:00 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.05.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:05:59 -0700 (PDT)
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
Subject: [PATCH v2 08/12] riscv: hwprobe: Add SiFive xsfvfnrclipxfqf vendor extension
Date: Fri, 16 May 2025 11:03:06 +0800
Message-Id: <20250516030310.16950-9-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
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

