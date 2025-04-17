Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30122459FC
	for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 12:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744892677; cv=none; b=rAk2ZfVuGK4ehDrHAiR+HCNvJwJ4Eqoz9vuI3Z8oSK3WUy+cunBBJvERvaD4Pw3Lk06V2Cc3I2vcrJP3yLlTarfC4g5IHwZphkoAk1ENe0nxoT7MmN24LYo6m2AO9w8jJ5SajsnPEZurQ3pWDl517+Y47yb2qE7kCHwfNiglDok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744892677; c=relaxed/simple;
	bh=qJu1m4hx4nbu+oDFlDHA2hR7AvuynQAz0skV827DhvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RK8li1Q8t3mI4xHjJsFkHdbjWsNC7xDjtEYPu4KVBfwysgWVPsgw7FTvcCQPUQgiaqMDEQy/1KnP12vxoIgXWZsi6hV0t8OynU4Go/sTIqqbnllB7nrldKaibEL/IXZ6lUD176j6icLV+R84lEf/bzeBZxuUfQA8kgnt3XiYI3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Gvcv5E0q; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Gvcv5E0q"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2295d78b433so7451035ad.2
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 05:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892675; x=1745497475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkvRtqiwpGFu2F2LneoosRxgLPIUe40LOw9HI4KIxXc=;
        b=Gvcv5E0q7WqcEvNo6Eg5joSeG01Iyyd0lKPavaMmhHr3u+PWN0xV4mFwfqRmSAB30o
         qUA/7LCPqp9+QlScp8y/95J/eJVwK0D9OOeSI+nioht74bY6oFljLxmg5DfM30v+BIgc
         HMtT4jD8vCrKvRau9K9pGlwr4rM0LIkBcAnnTeei9YX/fLZVzAFVztfaej6wQrqlhMLr
         sNlD+LX94iVvxutP4h3nLBAFrgSwiCLj3JTa7dOt2qVfnjEjR+aIuwugOicZriRCSGac
         plf9mnYgKJMqhWn5eQHTdulbIo8C/gL8d9/wX8ZCjUPcHzDFbq/GCc2rGkQL+YL0hhEC
         iTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892675; x=1745497475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkvRtqiwpGFu2F2LneoosRxgLPIUe40LOw9HI4KIxXc=;
        b=CAQ8B8YAJtNdT0LXtir1SrVSv81lKCtfrLAMrATguONdByScIMEW1/Ru8dNCtxRDc2
         twmftiFWpuAcmRMSdOnR6Rf8NnB2ayn2tbd0llxya540WknNlcLA9sCtzU2txZh3umSa
         e6inTNeIKQ7sMHhSR74SKOs37r0il0qfqxcmMtV3TjwJIqrnSp7BKNZSpN5rrp1h7+nP
         tZRX0/BwzNG+tuhgOsXjLq1lhHlB9Q20tO55k3/5Nr6TkHuzSaYGVXJnT+xZ4H9HcRZv
         o+hyKejdZ6m79uGU9fgmMU7RaIb9Cb7HMkrrqjwBmmhNRhR1671yoQmvzo+Z1E0moyNu
         iaIw==
X-Forwarded-Encrypted: i=1; AJvYcCVLyM3zliNf7a0p+sDeVLK4BIcvhdGjW7t97wu9pmAhCr4uvsj4SwZQac6YUKG1LUMaGja0PUdBcXs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGRug+iZoF2QV/2dlyvoLmnP3m3ZIYSS6DlSTndDEifT6hy/em
	K7DY7ZdiUMfsiRhpqb5q2L5Wy9NFeIl/1c0r54Obp13QZ9a1794ClzYC5whd5mQ=
X-Gm-Gg: ASbGncvDhBwLds2mccmSBKNtvVNYrSoeKKEKET1q8lby8rgjNFPmc5BIrTV+MDdHfOi
	qQrd24tH07rZX+1sa+pzXoyrWLn1Rg1h6no/TsogPGSy9fVAUOXkYwYzSF/q338kqeWbtajVUh1
	UcX+4KsQ7vnMNczLPA2Ytpl+cclTZKX6F4uE/tiSydZ2w5ZXVd+Lz1zRHePkhBUiEUs6QS15F/n
	ElmCCwtQ90nSrXHBDXcq2+KlTUe8afyqjg1cYVG+rL/w0Z4jbTS5s5Wl8XB95F9LAHaM25H5wg3
	FTIT5MhXTeVn0VJxg7dMOW32giHvsIagJrA70zv4tw==
X-Google-Smtp-Source: AGHT+IFwoPNkZRHRLCRUuOqGDF2uiHAGyCvd3q8quDmBUyk1f/F/4WvIpLrbGYXfNhaC6uEF0f4feg==
X-Received: by 2002:a17:903:2447:b0:227:eb61:34b8 with SMTP id d9443c01a7336-22c35916f13mr99932925ad.25.1744892675059;
        Thu, 17 Apr 2025 05:24:35 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:24:34 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 04/13] riscv: sbi: add SBI FWFT extension calls
Date: Thu, 17 Apr 2025 14:19:51 +0200
Message-ID: <20250417122337.547969-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add FWFT extension calls. This will be ratified in SBI V3.0 hence, it is
provided as a separate commit that can be left out if needed.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/sbi.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 379981c2bb21..7b062189b184 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -299,6 +299,8 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
 	return 0;
 }
 
+static bool sbi_fwft_supported;
+
 /**
  * sbi_fwft_set() - Set a feature on the local hart
  * @feature: The feature ID to be set
@@ -309,7 +311,15 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
  */
 int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags)
 {
-	return -EOPNOTSUPP;
+	struct sbiret ret;
+
+	if (!sbi_fwft_supported)
+		return -EOPNOTSUPP;
+
+	ret = sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_SET,
+			feature, value, flags, 0, 0, 0);
+
+	return sbi_err_map_linux_errno(ret.error);
 }
 
 struct fwft_set_req {
@@ -348,6 +358,9 @@ int sbi_fwft_local_set_cpumask(const cpumask_t *mask, u32 feature,
 		.error = ATOMIC_INIT(0),
 	};
 
+	if (!sbi_fwft_supported)
+		return -EOPNOTSUPP;
+
 	if (feature & SBI_FWFT_GLOBAL_FEATURE_BIT)
 		return -EINVAL;
 
@@ -679,6 +692,11 @@ void __init sbi_init(void)
 			pr_info("SBI DBCN extension detected\n");
 			sbi_debug_console_available = true;
 		}
+		if ((sbi_spec_version >= sbi_mk_version(3, 0)) &&
+		    (sbi_probe_extension(SBI_EXT_FWFT) > 0)) {
+			pr_info("SBI FWFT extension detected\n");
+			sbi_fwft_supported = true;
+		}
 	} else {
 		__sbi_set_timer = __sbi_set_timer_v01;
 		__sbi_send_ipi	= __sbi_send_ipi_v01;
-- 
2.49.0

