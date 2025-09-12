Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E071D3148B8
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 15:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689839; cv=none; b=Qme92zOq3xKhukdT1XEIrXB1lfB6WQXFGF2rJncPwe82uhoMbVqS7scvD66Ei128+4g2pbTYwRKuJ0elswgu22u08VHXbCqAddpY0Xt7V26tY1lXqAKz6PBTP1LN+gR/K5bkwpNlYXod20sHPPONasq3pD+K8cm4RO3E+tps96s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689839; c=relaxed/simple;
	bh=lBamo/mRxiUtCBdbmIZyVniV6pvujs45sCbA4KFEQzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WPNkBKwIkHZ3L9VHROFGpN7JOCNgnmoMQoJXSBfkN4yfLBD7tU3S7lvuvq8kaZDxo5cEvrMHkTgaDvMxRyj9Gllw2BLWw6ESiBsrT/hY3knDz2lgrQrMH4xMCGoorSaLnusU/keOZebIvnX23QahD8b4Zmp3US4WnEIpHt5JWCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=STg72BTf; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="STg72BTf"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-71d60504bf8so19144557b3.2
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 08:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689837; x=1758294637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ds8gslyRhEA90VqYYB6jUYRwIuKnqG3r9jdtCHu7D4=;
        b=STg72BTfdhwKHK+7TbzhLium1OhfRGVSLIR5vMJYoZ0C1f38YBkWkoie4Sw5rJH3mT
         Y20q4POE1yesGgvwD6Z0RB7KSi7ID5v3oj07Qf6X+15yptzscDYLiHzPOM48J92G7JuK
         uzARv5QMwxn2+xF7aeMq7KxMs0Fo703qLEjoCTOOujTCY9lXJXoI7y3HvWRlSvTCPFZj
         9OcxPYcbuUNaP5PReWS2kn5vs8elzfV3YVPfIXLbUxe7L9LhKBF1areNJ+j5xS/w8891
         LQtKMO5rFKSgMgT15ASlAHmroOOR3E7XdTFxpiqy6gzn26O00ew67BWugqpEGKF2JHbn
         2hNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689837; x=1758294637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ds8gslyRhEA90VqYYB6jUYRwIuKnqG3r9jdtCHu7D4=;
        b=lhB11Wro9cwXaouRe8uEuLLsOW41YOyGRNlqA2mzboybxvouL1WPztIfwkU2Pjo9M+
         Blauhj9GnReJFHe08tXlHuIiWv855rJLjxZLtKzkkGqGaW6EQjC+D8NvxBkqkUmewVHV
         ox6PfQYWIXVxVwTbkKKSVOIMYndkUQFkfmm5lvccMSBXfMwnISAB8H5TD6EfGamOO/36
         E0TBpyX6aFHSmDVOnx/bEvvKx+hU0C2VrMPnGadApGaZFFifZtpMp/LNRtuJMslyOmUF
         w47kJeqhnmgERgaUWOW2spXwyJxfdxknv+7HBM+paB2h4VrohNY3I9blknOEp59NIDy0
         lkPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7LrgiS1f7A8F/er0UvdAlPSERbkbCVeDuNYRLKUEN/T6uSZUPzDwo0uk6HYr7er7b6aZ7ti26ddM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDUlc/at18Dl0a1Rix3ipZb5jvXR+ujbUqLZVFclldLTqFj78P
	BFk5a7JUoAVkpdAvkj00OBzyAR1eF+pPtlkEUb29+uG6Z7XjoQXD9nujQ3rYmVeEM7c=
X-Gm-Gg: ASbGncu75+4NF/09XhVG3AA3xzQNWBI8KaT0jq7EPz9O9KIga2d5hNQajkY110xUiGf
	jRb8N5ncfZvVo0bjxgWP/t+2FmRGfbXRDCcwlV8BAR8eeYdBYC9F75Uqk1HggJbTR+80NMfOuOF
	xCxdnGjzGVXAjucGNnUf54QuienLfQj7C6DBxL3DgXrvhgLHKfTLwHKi6KN9JsRlehQ6Aw1DWBj
	ycO1f1Ok3aFHSlDOxDEHDdhwooVFmM0S9ii0cW4lFKoqrzGLL7THbObUxJp3zftwZm0fCewqkVz
	rKMacxkOixiUHsxC+a3wlS52eNIuAXC8Ic+SA8T4+M1tnKACxBAn3t5PBsw5PVeUN2LletFEArY
	LDZCfE+QaFZFLsOQ8lFjkIsRXg5v67t1kBg==
X-Google-Smtp-Source: AGHT+IGUk5zUSgxh+r2dAU6fmhsNlb1RTWa2J7nuwDb4l4jA+t4jqiomYFBGdZGHaaNJrIZspvEapA==
X-Received: by 2002:a05:690c:7286:b0:725:dc12:3004 with SMTP id 00721157ae682-73063d589abmr33964367b3.22.1757689836260;
        Fri, 12 Sep 2025 08:10:36 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:10:36 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
Date: Fri, 12 Sep 2025 18:08:48 +0300
Message-ID: <20250912150855.2901211-10-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nr_irqs is required for debugging the kernel, and needs to be
accessible for kmemdump into vmcoreinfo.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/irq/irqdesc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index db714d3014b5..6c3c8c4687fd 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -139,7 +139,7 @@ static void desc_set_defaults(unsigned int irq, struct irq_desc *desc, int node,
 	desc_smp_init(desc, node, affinity);
 }
 
-static unsigned int nr_irqs = NR_IRQS;
+unsigned int nr_irqs = NR_IRQS;
 
 /**
  * irq_get_nr_irqs() - Number of interrupts supported by the system.
-- 
2.43.0

