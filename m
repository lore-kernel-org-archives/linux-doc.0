Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756FE1DFD3
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 08:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705481767; cv=none; b=ls7RCaD3frpen3Lm6i7Ovmuj+ufjQ12bX1zBiLAJpVuL+wfIex1vlEXNEbwxA9gHLf+8A/qZSi/8bwm5Q28EDvXFw+iWgnK7+nChqP9nvxQSpvtV2YuPBzftujXgZP/ds61NZulqSYtnTetT0W4MELCymGnyBI3xLSQLVS7SmTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705481767; c=relaxed/simple;
	bh=hLtypGQuZuzhxPFC45SkZR80pmIlD1p/km6knUfZ+4Q=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=XN/R3xxMcPt0vDx52T/HxXm4tvsXw2u+SPyNbao2xcg9stmPsYVsAZDI+I+Ay3sz/xC2E5MQdkzIzdccmfxj/jZ13MFV6bcR1eKugB+C6XMesXI2ChN98khUDlL95SBPb0gDK2iInJ3S4WcI1NrX3m7QAi8cWs0Op4U16yCvF/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=AmGMTCZv; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="AmGMTCZv"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6ddef319fabso4956703a34.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 00:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705481765; x=1706086565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDcQ2wMEqISQ3O2/7HCyONaRVJxi+XzC8dor4RFlGaI=;
        b=AmGMTCZv5s1TmwlqAgR21v36ksetPQ2voMo2eVCaqZr0HfOc2KVqRDG2qaQB4KP5yZ
         9djKGUKsMiD5pDnhHd8ZN77VwjO86Q4zWaz1gTaP7+teS4+MhgxyQlnRJLEfRl/cif8H
         YCbgthgft5dRPTdjj8VJ15dQ6Wd+6bgQ0QWxtgPozuoKCLuOWYAAV2r3HfD9IWWE2QwZ
         GMEDpK53k0BEQ8Xs+GxHYOXeBUzeBB1wAKUuw2rt7Lae2/OwfTYWtt1kr5r/2gWXiC/d
         V+w/iI1+D1Nkcj2PPTMDese6QnBH4+qboFNHHIGRgG8hXfyesCchMTHfe/GkZ0ZqLNrj
         XX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481765; x=1706086565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDcQ2wMEqISQ3O2/7HCyONaRVJxi+XzC8dor4RFlGaI=;
        b=ud7GfrCL0XM+k5Ds3Ph1uXF1/jvxD1minrYsx0rdhyxdrcANBmF/P5z3KqQE4OpPcc
         8tKIVXNq1KZfV/l5BaKFzC3Sy0B6JtzoeYTnls0pf74YnHy4bDKm0WaCj5SIofFX5VIV
         G9XlaweTGtynSyjVDb897yPW4nyerCuifb4tVdZD0f5XsOHtVGB3XdJCwsHj4U0oA/+H
         yNEqKcPMooa/6fAAM+XiT7c4as7v9Ntsrwgo8FxQCUwDeSloFP3gggMZMrqq3DCBWvhf
         TH9p+vjSIumYVAY7BPm8oAIxIzu6yjn9V6A6BkB0Idx1HeQ0elcbkoQeFst01E1X/EGV
         oVYQ==
X-Gm-Message-State: AOJu0YxYFvhnVQ3T7sLNfqS7KG4TGzBi6xFMZ4IFSGQ/2wVddsmGlzyj
	WUrOYoG6ct1Fy6BZ/zlYBZvv+P8g7V1Keg==
X-Google-Smtp-Source: AGHT+IFRYpmA9gFAAzLoQZR7B2zc+Ac7EmYytIabcXYyy1NAihYINsXjuwvbwSCNrwHr7XONHRrD+A==
X-Received: by 2002:a05:6871:2881:b0:204:1fb4:2896 with SMTP id bq1-20020a056871288100b002041fb42896mr9207821oac.116.1705481765531;
        Wed, 17 Jan 2024 00:56:05 -0800 (PST)
Received: from C02G87K0MD6R.bytedance.net ([203.208.167.154])
        by smtp.gmail.com with ESMTPSA id cb19-20020a056a02071300b005cdbebd61d8sm10006224pgb.9.2024.01.17.00.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 00:56:05 -0800 (PST)
From: Hao Jia <jiahao.os@bytedance.com>
To: mark.rutland@arm.com,
	rmk+kernel@armlinux.org.uk,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	will@kernel.org,
	willy@infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 12/19] arm64: text replication: update cnp support
Date: Wed, 17 Jan 2024 16:53:50 +0800
Message-Id: <20240117085357.31693-13-jiahao.os@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240117085357.31693-1-jiahao.os@bytedance.com>
References: <20240117085357.31693-1-jiahao.os@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

Add changes for CNP (Common Not Private) support of kernel text
replication. Although text replication has only been tested on
dual-socket Ampere A1 systems, provided the different NUMA nodes
are not part of the same inner shareable domain, CNP should not
be a problem.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/mmu_context.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index 466797dcb5fc..4f78f4db5df4 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -187,7 +187,7 @@ static inline void __nocfi __cpu_replace_ttbr1(pgd_t *pgdp, pgd_t *idmap, bool c
 
 static inline void cpu_enable_swapper_cnp(void)
 {
-	__cpu_replace_ttbr1(lm_alias(swapper_pg_dir), idmap_pg_dir, true);
+	__cpu_replace_ttbr1_phys(swapper_pg_dir_node_phys(), idmap_pg_dir, true);
 }
 
 static inline void cpu_replace_ttbr1(pgd_t *pgdp, pgd_t *idmap)
-- 
2.20.1

