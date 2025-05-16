Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5769628A411
	for <linux-doc@vger.kernel.org>; Fri, 16 May 2025 03:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747364774; cv=none; b=Nj4+H6bNh376PecSRErMlk+gHiroO5Q+qD/C52Vx/AZ+8P/NWLBfaaY5RlUo1iJDkmHidRgp0TjXalf9xklw+5Sf1R+8wVfpWDWxxKuQzhvt17wcGeuQoVqpxMMN2DYsWLej07UbzGVtcK2xYfTmxTa5sCTWiT/MHlceYCoW1E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747364774; c=relaxed/simple;
	bh=6AgqMNboe7B8nPvHCdPBbiCcZOlfMl0j+JQ0fzt3kCA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qGvRXd+QVEINKK085WAOit6vqkNtj/A+z+RY9fFNBmb9IbWlhApcsj2UFZKbAl8Kiw9bmEPpwWtnIfgUGoEL8f+v8UTLzEj2pTcDDwivRM2Q8zja/QIeO2jvqmb9c5EQRU+XnUCydhfnbKZuFwJlB5Nv4KrbC01uIkvV9wVdK/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=kdLzOVWa; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="kdLzOVWa"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af908bb32fdso1334670a12.1
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 20:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364772; x=1747969572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHR6GhsJ93bX5ZzvrljhM09iosbdwKgwllH+L65tMJE=;
        b=kdLzOVWa4lmFScmzu8JE/CI37NGHUAL8PVucyWf+pzf9XoNeHqlKL7AOjaJ7fAWRcl
         hyorLWnFAJzk+yW4eiKjfgsknmQZ0iOahwD1JcJQyWGt5WuT1iTG8s1WcyvvR1Y+8KNo
         xPognUujFu5UVqwp/AyTIF7DMkpRumQd1gOJ5NRJrcPHJCWifNHtuGkJSOhGNHI5Ni5Y
         kfNJEcqUna00pQR0Ga1DzHr4g/9OBLvow2Tr1Oa9reNUmyEYy6+NnFg1og5Foyl5NK3Y
         Ek5HVV4cx8MFVpUSmiZwtOX5IjHvffkdFBkmVhCQ+TM3jbmmMvsvpoIUjV9Vka7XyXsG
         +ddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364772; x=1747969572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHR6GhsJ93bX5ZzvrljhM09iosbdwKgwllH+L65tMJE=;
        b=mlPp3EVeQt0hXD3VpDQHeyNNcjBnCYaP8JJtDIEno0oGR9DWiAfpiYaxw4qYjoZnjX
         zROpVfPKFL0dzjVq6OtalUKfZxXhtvd28u+sCBRxXZJ2FmRphWNV//28sg89iTq7E31d
         +C8a75GU/O69LH7gzQfHZT0Ma8ZN30NBELjLF50wJsfsRCFn9Zfy6bWa6az0KertEOYs
         idr8QviK3En4v27yfTg+723mBOb/ThSSTCVSApfF0wdXHTJPk9pIYCzIJMBzAvl6oafn
         bGYlE4VgZhtA1Cz5y5weXA0FzyoB7h8TlmRkghN7v0BkT9zE02VVI/7v3NM7tC25PymF
         tiDw==
X-Gm-Message-State: AOJu0YyAhTASG1mTntU/vhjHF+GYnagGzNyH4qu2Tbc0mEqRFS0DaPye
	azjboqmuylYXzgcfOhpIXZUSxBb7EOxygcdxpyxcGjZj4pEGcWiSPykrwil6Rt8yBcQ=
X-Gm-Gg: ASbGnct6PP5lsh8z1WTj1ter8Xtu+8WBE6O63dMzTdEjCfZmMhV+xfy4oEy0INXoCB5
	ZE1jMcTd8w7mrwiFHsQP8x74I0N9L1SPOVptb9PC3w+lp8bQMlF8DvXwr1KfRIb48HB5B+oE9zZ
	GMWikxY+Fd0SIYTo6WfB9eEoC2Bi6mEeNkigbuL2xJZLO5nAFpJ8fnYN1nOWEQBII3rRnAkcw3D
	Hu2Msy0qsFRMUaJPO5ERq0SPPRFfr1vAMnLNM715oG0+gFJ1qlp4G7idV8jpOLMfSPSxFbHHywG
	6TDKH6kOXMEx1aWwPDbprCGCfg6ooBnb/pmwJ7Q5J6R+dMuQC7BfC0vyDCG280K1fJR2jHY7sbE
	kssjdU4hOZ+0=
X-Google-Smtp-Source: AGHT+IGrzLhyAYfRZnDxkA+4hDDWDsptQiEhouC6msgaCuEbtNMMMwi7Lg79hIno1E+iRF7n6KqiwA==
X-Received: by 2002:a17:902:da91:b0:215:a303:24e9 with SMTP id d9443c01a7336-231d4ae1de4mr19300975ad.3.1747364772565;
        Thu, 15 May 2025 20:06:12 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.06.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:06:11 -0700 (PDT)
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
Subject: [PATCH v2 12/12] riscv: hwprobe: Add SiFive xsfvfwmaccqqq vendor extension
Date: Fri, 16 May 2025 11:03:10 +0800
Message-Id: <20250516030310.16950-13-cyan.yang@sifive.com>
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

Add hwprobe for SiFive "xsfvfwmaccqqq" vendor extension.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 arch/riscv/include/uapi/asm/vendor/sifive.h          | 1 +
 arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/vendor/sifive.h b/arch/riscv/include/uapi/asm/vendor/sifive.h
index b772d4631284..9f3278a4b298 100644
--- a/arch/riscv/include/uapi/asm/vendor/sifive.h
+++ b/arch/riscv/include/uapi/asm/vendor/sifive.h
@@ -3,3 +3,4 @@
 #define	RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCDOD		(1 << 0)
 #define	RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ		(1 << 1)
 #define	RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF		(1 << 2)
+#define	RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ		(1 << 3)
diff --git a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
index 2b9505079a9f..1f77f6309763 100644
--- a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
+++ b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
@@ -17,5 +17,6 @@ void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const struct cp
 		VENDOR_EXT_KEY(XSFVQMACCDOD);
 		VENDOR_EXT_KEY(XSFVQMACCQOQ);
 		VENDOR_EXT_KEY(XSFVFNRCLIPXFQF);
+		VENDOR_EXT_KEY(XSFVFWMACCQQQ);
 	});
 }
-- 
2.39.5 (Apple Git-154)

