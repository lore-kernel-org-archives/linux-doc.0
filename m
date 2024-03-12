Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5BF50A88
	for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 23:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710287630; cv=none; b=cGVEPpmpnTpQGzaMDPFynf6DVYrNY+vrkg7GnvDJwpuZ4IWTpfjsnWhwTWM660tL7NduUfdP2++ccuYX/AjX2NBtztreZfB2AP2eyv8PPE1997sfuBMTYm6rT6TpIfmIlOSCIdqWYJROlcNfbkMUYgoWhY7NrtlFfX2PZ6dfvro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710287630; c=relaxed/simple;
	bh=6GJ6p7yMdN+ouzHCZ+tS6sWbsz3sQSlgY1DwzMvWuUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YmQZg6B0YGEjMBXpPTDrHtaQytvlmLb5Scb1S+kmhW3ywTEtREXYTz65TioeNDDAy62h6QvWI5H34QFMcYELhXvf+6iU2wP19B3+K08ob1UOrOteXqoMxkH8WXP1hfMY64R2hg1hiL4z0M0YJPdoKEOXFl+PFjXJRhRvdHwNY9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=kpcjM1NY; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="kpcjM1NY"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1dd8dd198d0so23612675ad.3
        for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 16:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710287628; x=1710892428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WqC9EYNMp24I0Ah4fci0KUqmT8EqoN79+NZmIklXBM=;
        b=kpcjM1NYWJfzoyhcm33MAO1RHEFYP9BGkke/bgGTwNbKOGRr0gXG4KrNh1RM9yFkGp
         nVnHcePmY7aywF7UscF7cuLJtBWWuZK13HRyGbBzLEXr4icJa4rVaED7CfJJxGfeSPEL
         13V89pVcVuyQHn3sQI8KKA7UqVfMp2H7lGoGDRR+TOIIcT9uPY2mWMCn2nqAZgGz2gfK
         udNSrujjE5yacYYquALQ1ubntfZKsIJAZ8Cnk/CUE8fXqxeEDpYrYxScyigUwrDwUTI1
         9VV2ADveMauBMBjnomQF7GrLFFGDuztBlYwQyPagbjDLkw3mpqputMRVD3mRBLL/8ZxP
         dNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710287628; x=1710892428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7WqC9EYNMp24I0Ah4fci0KUqmT8EqoN79+NZmIklXBM=;
        b=QoaGcXcTkCUpsjmVG9CT2VG0LCLZnE9KkBjtGl3n7o4AHecyFYKJ2Z22fFDzXLmnrh
         QU6X4FXF62Qn2svXcTZPkyje91f13XE5q/MMf2C873JAfpx98+KAYQOPWCHp9NTbooX0
         vsctx5GicL5w/feBLdTGryknHMSP6DTFeEoRaT8nOeHEy+z66WCWKzB3g3Lvj1adL7Cq
         pLn1Aix4OQJCTaVrpbXmEx2qbePja7PrnEVyuI5a1xJF21d9l24QWCby6WCO1hVC9jSQ
         HS3NXv5yltJoB3e7Rj68zPslZDJ/kWfsf9PXrCaSUp2MYI6UpQQ8MaJn+CX5qXNiexMv
         0lhw==
X-Forwarded-Encrypted: i=1; AJvYcCWtW9OHvQsWtjZrdutby4a2g36NiiIjePaC1/fTECYjVyrlhdNlHdbUJ2mcdhkNqxhIR++QvNY4iLaAHsgHUrYZ/pwNt0sP0FXf
X-Gm-Message-State: AOJu0Yw6RW2iNw07yfDLwlxwsrHn5Xz93Kdpg53TlnjiaIClDy1MYh3o
	6yhy6ic5yfDBg4xe8liHp3rN+gYrzjn5JXILmHV0ueNEl7+4J53n1NGbAzfS+PQ=
X-Google-Smtp-Source: AGHT+IFRA+vdCvsszXe61z0lN9iAK9Z/ra0D6gklHZ2jxM8IZjGafc+k8Vt3GmhS14d8pl67aEwWWg==
X-Received: by 2002:a17:902:ea0e:b0:1dc:ce6e:bf06 with SMTP id s14-20020a170902ea0e00b001dcce6ebf06mr13980467plg.0.1710287628171;
        Tue, 12 Mar 2024 16:53:48 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id h9-20020a170902f7c900b001dcad9cbf8bsm7282844plw.239.2024.03.12.16.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 16:53:47 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 12 Mar 2024 16:53:43 -0700
Subject: [PATCH v13 4/4] cpumask: Add assign cpu
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240312-fencei-v13-4-4b6bdc2bbf32@rivosinc.com>
References: <20240312-fencei-v13-0-4b6bdc2bbf32@rivosinc.com>
In-Reply-To: <20240312-fencei-v13-0-4b6bdc2bbf32@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710287621; l=1674;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=6GJ6p7yMdN+ouzHCZ+tS6sWbsz3sQSlgY1DwzMvWuUA=;
 b=VgSJhrp/XA7/5Nj4l4UWBqCdsrn4rRXnIv9+QzM7vEeIgZHPzHCs2KUaHtvu93Hal0LPGPw1M
 73ATSwpKcf4AF3ewBvQne6ZnvAPUXPu0x9vXxZvQMNWILesdQgSr+Or
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Standardize an assign_cpu function for cpumasks.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/mm/cacheflush.c |  2 +-
 include/linux/cpumask.h    | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 9b74861000ae..0927df96c0e9 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -169,7 +169,7 @@ static void set_icache_stale_mask(void)
 	stale_cpu = cpumask_test_cpu(smp_processor_id(), mask);
 
 	cpumask_setall(mask);
-	assign_bit(cpumask_check(smp_processor_id()), cpumask_bits(mask), stale_cpu);
+	cpumask_assign_cpu(smp_processor_id(), mask, stale_cpu);
 }
 
 /**
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

