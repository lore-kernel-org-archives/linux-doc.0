Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26B314290D
	for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 19:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710272881; cv=none; b=keSaJqijPieqLcvcgPmuCO0+6oacJbZ5XbJtVPO987auSky8PJRfG9CGTEbtxm3k5umpwk1Fi9Ft2jN08/aBsJU1fKgTFwK8Hil0jZEuqMEBWBYZ4Sypt6kHX0HGz238KSQ7Mhd1MgSUPkinp+jFsW6Isvy1gzpFdFZ6DXtogP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710272881; c=relaxed/simple;
	bh=BFOeXqJe9VyECGMuWiCNLoTZwBpuu0T2u1Mq+P/cqDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RdmffKgz/i4cKypxg1LnSK9sXHFNCLHI6wSwr3g9r4uY3fWJP3LZdOB6NnIjfVPSjle7/L96TxOv8bKr+M4E08ZFbeq+DrHP51h1HGkyy2J3hIjilMoCfPJL5Sghp+7q78p0fuvP+Fz/KRqnyDhboiFYCn5+pNTzlPa4ItTQm7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=3H5ZUf6R; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="3H5ZUf6R"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5a22d940ff4so462292eaf.1
        for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 12:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710272879; x=1710877679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4XSa/PSXORT4uTdUR+bw2OZtjIlaWQWlwg5OyZv4ig=;
        b=3H5ZUf6RU1lQQGj/bvMwxqw2skT0BM2V1JAvhbJWo3pFIADpfHK69fFU3QwTjE//IH
         RuTZZp/foAv6eTPyrIiWUJ4lrOAEBPHqNQzGdlMiwykUNBmlhKZ3KA3dJK/ZmcWdJ2W6
         YcOFyt638PyoLlYPXWybdKbK0kwz5Hp5jJy8G8n9/kTwxNArZwGAZDDq4EJ+zmqt4jKj
         odx7M6PcT/c/a2NOhu1ZFYYAIzhYQEyeCv0g34GmkI35rjkERxxsZqEH5yWPAV2rASRr
         bEqAhKy2PGOux2RCXvKQQnpDHqiaeIygOlcOV4Ht2bayTsdH1c2JhrsQ/pRL/yYE4Gmz
         3rJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710272879; x=1710877679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4XSa/PSXORT4uTdUR+bw2OZtjIlaWQWlwg5OyZv4ig=;
        b=ue3czANrlfXTShz66YMq8cL71Aum7YtshJ10qYMIpJfHXSApxlE3ukvZo6idkskj1g
         7QzFrE4F9BTE3RuvbYRbH6gzZcVzx9TbpkzrPfswhL0jvmylAxiSj3kIX5pcILJqNUr7
         W1E7bs/zM/2jS2bk83BjraDtTSTsIsSbC40CAuSEoykW//O4/0fkmqYPpxDIhnlX6tMs
         JsV7iXwjtE0Q6ad4QX9L7f8c20VQT3xyVHPkkfI57pk0lMvh46U67LpekKF5u4jRru7C
         XPj0TsshkTciBKJLql+ECf2o6AjsfliPdJ0hB5kx73fTjOhODZUWK/08TzZjl6d9cUlZ
         DkCg==
X-Forwarded-Encrypted: i=1; AJvYcCXuQUd/6rFlLY7/M7StZBchWQ6lF6scMRnSXnEmt+K3diwYFQlO4Ob8ft9gdAtTtAlZDM5NL2dLJ0Lz6kEHas0JjnqGjPxoL0/W
X-Gm-Message-State: AOJu0YwZaayytdj+1OFuED3/PwsuMj0Fmw/F/j1C4WOlgSUaE47uwTC0
	M3Hd5WUNaJ/AQ0VEbSMIzbzS4FhIRXLdDwM/27V4ml9ZbHUXdW68lWS3NMAVhlo=
X-Google-Smtp-Source: AGHT+IE+Yl3rd4VRKQ0Xgn0vLA0/IXGphbXEbzUjbknciDm6FUQ1nMtO8B6Nv0KNcv+QR9Td6lCSWw==
X-Received: by 2002:a05:6359:5f9f:b0:17b:88c2:5c13 with SMTP id lh31-20020a0563595f9f00b0017b88c25c13mr12958442rwc.7.1710272878964;
        Tue, 12 Mar 2024 12:47:58 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z69-20020a633348000000b005dc884e9f5bsm6433495pgz.38.2024.03.12.12.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 12:47:58 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 12 Mar 2024 12:47:54 -0700
Subject: [PATCH v12 4/4] cpumask: Add assign cpu
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240312-fencei-v12-4-0f340f004ce7@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710272871; l=1746;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=BFOeXqJe9VyECGMuWiCNLoTZwBpuu0T2u1Mq+P/cqDo=;
 b=dUaXZnD9VQ8vsLYsKXOkCevPuNYqjQqs4wBvroTCyGKXR0MwtTqi+kVmNS6cpmRfvj+9eBpTV
 UJ9TU9gIUSeDYCpY+ggkBt8sv4yB1OqY2YjqtfD0d/3rv858ooSwNYg
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Standardize an assign_cpu function for cpumasks.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/mm/cacheflush.c |  2 +-
 include/linux/cpumask.h    | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 329b95529580..2e16ed19e957 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -234,7 +234,7 @@ int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long scope)
 			stale_cpu = cpumask_test_cpu(smp_processor_id(), mask);
 
 			cpumask_setall(mask);
-			assign_bit(cpumask_check(smp_processor_id()), cpumask_bits(mask), stale_cpu);
+			cpumask_assign_cpu(smp_processor_id(), mask, stale_cpu);
 			break;
 		default:
 			return -EINVAL;
diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index cfb545841a2c..1b85e09c4ba5 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -492,6 +492,22 @@ static __always_inline void __cpumask_clear_cpu(int cpu, struct cpumask *dstp)
 	__clear_bit(cpumask_check(cpu), cpumask_bits(dstp));
 }
 
+/**
+ * cpumask_assign_cpu - assign a cpu in a cpumask
+ * @cpu: cpu number (< nr_cpu_ids)
+ * @dstp: the cpumask pointer
+ * @bool: the value to assign
+ */
+static __always_inline void cpumask_assign_cpu(int cpu, struct cpumask *dstp, bool value)
+{
+	assign_bit(cpumask_check(cpu), cpumask_bits(dstp), value);
+}
+
+static __always_inline void __cpumask_assign_cpu(int cpu, struct cpumask *dstp, bool value)
+{
+	__assign_bit(cpumask_check(cpu), cpumask_bits(dstp), value);
+}
+
 /**
  * cpumask_test_cpu - test for a cpu in a cpumask
  * @cpu: cpu number (< nr_cpu_ids)

-- 
2.43.2

