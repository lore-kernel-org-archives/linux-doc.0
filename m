Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E899F28F937
	for <linux-doc@vger.kernel.org>; Thu, 24 Apr 2025 17:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745516099; cv=none; b=jQ42FrbmO7nGnJB2qkFCeH1ziQWijDs5/WRPp8uwwq4eoV9T1r6J7N77sNGLij66ZabhA3Kzf6eCf0+Q0EVWDEZyOt8pFmqeVSbKiUTr3JLqB7rt1qT0qYk+hbYfo+9uoBYqhlynk9ZzFw8lExX8mRCyon5jpOEhbUY7oX9fULs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745516099; c=relaxed/simple;
	bh=i5EIv8p28s9SzqwrmxjoQqEJ1yfHwtC674KTF1pprHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f31m3hAeRDmON9lBkVErLSPFuHCA4dVJOBcuRPJlu8ZFVnVVwsJVnebYx16O5akcI5WLjyY53UX//YqwbTEws2g0bGrsxFS6gyZPQxR3zllWrYAiy6F5Lgnso5X9pFZ50Pv/iOC09PpHE8Ohebx0ZjdmeCHsAiMjDZNyflgBt+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=1VZgrW3i; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="1VZgrW3i"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-223f4c06e9fso12707065ad.1
        for <linux-doc@vger.kernel.org>; Thu, 24 Apr 2025 10:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745516097; x=1746120897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9V9rr9KXScjB209CCQhOyL2xY7TO+2YEqW9Zt14WVs=;
        b=1VZgrW3ieCTJyupdtrSzNRChjSrTt4vxjboJO3oYPeJCPtFhgXTsz0TdL/sckxV5Cw
         RAoNKuRJjYYlodoeNheGzH959ekAGgr4OS0V4z0DOvR4kUXK25OwlLy71LHSL5tJbFsS
         8NT9wO+qyG/DpBM7Q+qwHKQhjSlKm+BUrxcqhRyte1b+6WmBBw/ohVnOmVlM28vdrVI3
         W3lY377hDMPfCUUrU8YEzEFLPh+iETYA6DEednsSwelK8nO27b2xFxq5ddW3t/Dzo9z8
         90PSicaUF1TZ8EgBeQ8Dt4B7fXd1CyIrc1HcUsLIM+eXII5k7UfeRbmqeEee3k46kZks
         btvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516097; x=1746120897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9V9rr9KXScjB209CCQhOyL2xY7TO+2YEqW9Zt14WVs=;
        b=UIyVxFPXTu8hvvIpWOkOD6bDHzS8kaAJDpNb55/4uFHoEHM0Kx+ll47/zi+r2mLGkI
         QMYx7KB/DfMu8+S3Uf7eoD43nxolvHSGRoK6fGjRrbBKkp0VD8IALvwlPSCQazr83374
         e0L1Rq8OBKOcFNLZ9qYzJaGok4Fc+hjBvrRWsY3vLGgIGz47244dlJvv6FN34W9ZG1NM
         CFNgaAOrmTsN6azqTXaGamj3lKBpwARUWZ2n2/1x0MiYF3RwtFcKFw5MyO3tOpsq4f5m
         Ar/CvFj5ALjARkVH6MQ6G03zEgLPsFqo6LU6Xhui5IxvSU4OosDC6uBHhyj2bkuIhk7o
         7KzA==
X-Forwarded-Encrypted: i=1; AJvYcCXirmHixIdLjDVBC2k5cFMp/BM5bC4QgcONAhBQsJN8dJ+pKOfRpuoUQAB395PMTUuoPO6EZe6gkqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtGnMQvZ5LpEJ2Hr7cgUckQMuWmUCDwLaI4OMc9+UleWX53Qdo
	QqXk9bgZjCq2OsIYmtFRBDRyXjAooaLpMUjUyPpVWWL+3QkX3I9IAeyhJRkmRBc=
X-Gm-Gg: ASbGncsLJRMlmDFwkEJr+TPmuFuoepG13CxVEgVRE8LWO3gSm3bz2PJB6acgTrq8aDX
	eIcvP9uW9+hA0n2BHq+NHQE7Kkd1s4Xrot589Ys/cl1406YGRM2cFVoDj/5tj/UkKd68+RH/S7z
	aZZ+bSeu+zq7l0xXDKZk39VKROPpPEV26pTCt2YzgU8ocAk6BsuzYyktMnr/TF3FlyPn29uORON
	6ZmIe50FthBvM3FxjDSKJqVei7lVpq5OxIgq61ZkiuJq6PS0ugAU8MipcvdkKwLL0Qi1lTjdKPN
	txMFAgMXTZfnhejOx3r3g5q70ODET06aZ2lO4vE5KbEDHbjMf84K
X-Google-Smtp-Source: AGHT+IGAQrQw/KilPGjWcs2DXTqeGJNePUSlT3bxzRIay4dKTLJvYkpcmDxPXRgdgSxGOsYJ0V1TjQ==
X-Received: by 2002:a17:903:14b:b0:223:607c:1d99 with SMTP id d9443c01a7336-22db46a3332mr45750265ad.0.1745516097242;
        Thu, 24 Apr 2025 10:34:57 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c4esm16270255ad.173.2025.04.24.10.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:34:56 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v6 09/14] riscv: misaligned: move emulated access uniformity check in a function
Date: Thu, 24 Apr 2025 19:31:56 +0200
Message-ID: <20250424173204.1948385-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424173204.1948385-1-cleger@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Split the code that check for the uniformity of misaligned accesses
performance on all cpus from check_unaligned_access_emulated_all_cpus()
to its own function which will be used for delegation check. No
functional changes intended.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/traps_misaligned.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index e02e9b4b0fc5..410b2e0e0765 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -666,10 +666,20 @@ static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
 	return 0;
 }
 
-bool __init check_unaligned_access_emulated_all_cpus(void)
+static bool all_cpus_unaligned_scalar_access_emulated(void)
 {
 	int cpu;
 
+	for_each_online_cpu(cpu)
+		if (per_cpu(misaligned_access_speed, cpu) !=
+		    RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
+			return false;
+
+	return true;
+}
+
+bool __init check_unaligned_access_emulated_all_cpus(void)
+{
 	/*
 	 * We can only support PR_UNALIGN controls if all CPUs have misaligned
 	 * accesses emulated since tasks requesting such control can run on any
@@ -677,10 +687,8 @@ bool __init check_unaligned_access_emulated_all_cpus(void)
 	 */
 	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
 
-	for_each_online_cpu(cpu)
-		if (per_cpu(misaligned_access_speed, cpu)
-		    != RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
-			return false;
+	if (!all_cpus_unaligned_scalar_access_emulated())
+		return false;
 
 	unaligned_ctl = true;
 	return true;
-- 
2.49.0

