Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19AE4A11
	for <linux-doc@vger.kernel.org>; Sat, 26 Jul 2025 06:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753511818; cv=none; b=F96+6ZAIgtQazBibIl/E9gbC5MzqJck7Ztzml40Xb8IKxinUkehK6gfilEicLJy+jQ7r8J6XDFwQ6AH41iJDqIm8HdYrCvfYGAsOWhd2cyei04RqSY3VSxZ50S7gERL9WxvIxgbLMYV9JEn/LiP0EIPZG2TpUXOnRT5a+x2aP+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753511818; c=relaxed/simple;
	bh=/LszcDrP1C23dk/gdKMINzLeRUj1fuBqZVrzXFvNoxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZDoc5aX4eCYObSNwBfzk1n7EnctRkim9IRfyIudb4UeiC+PEIPo5XOAVDvUn2sb43WAcrmHg6fmI6WfkLHu2PNOakudrmuw9N5QgDQxJY725h0X9yVHGRZmyKZ4BpXsfuBJ2Mvd6Vu3WgR/opxa+lfCv2cwZZN6wNIWGeBNtWQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kj+fjFji; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kj+fjFji"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-313bcf6e565so435530a91.0
        for <linux-doc@vger.kernel.org>; Fri, 25 Jul 2025 23:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753511815; x=1754116615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DBwufOwSzVc6j86YKOG8FvZI6qHXIFrKdaLJJRQeREo=;
        b=Kj+fjFji8/Tf3u0aAOwZGD06jgG3S8uC7WotHMaMNyQsFcxTJchRmg+yzf4w7NO10z
         6AB+K06EP/sla0ttJ470ENZTl6UuNVq3F51TImXXAZu6Z2HTjtNDku9RmcV6isjRlUr7
         UFc+jhwDMh6w5HGW/gELorR+wgpQNpfdQRcCFQN3NQsSx6SrGiVzgBq89LzOcvfPQL6h
         VL3ei5DwVepN8ilVPLBWuxTgMs3BCKkGUSLECsUtYb0xLnHZ6dAeYzBH9wBUl3LtYV9r
         dcmig1CsI5kQKcPvvOZWo9AY31jqsKuP1L2O6KVRU5OKxM2crt8MBuku9Kis/fWXFz4e
         Ryug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753511815; x=1754116615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DBwufOwSzVc6j86YKOG8FvZI6qHXIFrKdaLJJRQeREo=;
        b=NGVygf82Mbf9T/n+LsYHeBgSyN1FjYd0b0CiIfxJNum3QF9gmwCw/+tKIPo+QCeZG7
         +DIeA7++F17cKcnB5e5M5rVbLsEIYlnftPfJ/fl5CPWnGDspF2qIQcdaoqgawuqWydbW
         CZCQSDsaYA/+ono1+Co9GxE9vmPgjQ22Vit+gn1mDibAzBnQ9RQ60BHPas+cqAEBUBCQ
         LjH+zwBkOXETK5vmbGsX6ZXr4xc52sgHh6Zb0JXpHPGoNtb5+TwJNdXMb5X0vQtWxfFN
         ngmfm1DLAE8Gi/XgUW4QdtvTVLGz0JnFAIA1xVwMzi9yo5vxCNFnAvVqbIOoBjXR/6XT
         1jIw==
X-Gm-Message-State: AOJu0YyCMwZG7dLZt9tWuq7SqNkfbYzAsCveQ9tDGOsgqbgTm5Hmae98
	5wU15r/ncXnf4UT+/jFaTxUhHxnroHXdF24oUpHnLBsnzZW3BosVNg5fozqcMlGM
X-Gm-Gg: ASbGnctnzFxEgIQQ9g5aPzMImfidOzgeAyj31zsnZBtdT93kqM1NBTfohjJnmumD6gp
	Qa6KOYMcclZ5tJkrxLql4ly3T+tTOVsF1V7UOTnC/IkJmOtJGCl7BRzdXFpY9dk+uRkmuU2ByBg
	sHfqfKOaZWIbHtn+deK5k40xp6OlFLLiQpeHaNwRCtcmsNQF4CkcyO2f4sRzebJQKUbNao34MMD
	QbROWGntsFwFEgOTbftR0Wa2471k+caGRyEjkl5fMO56HemMMViYVe2rQbJmCPJRIamM90BXULq
	PPf9T7VwlHlQXCyusCVuzpxwiSVw2ryiEa+Co65iwGY00dQjNSspUvjRpL429SZo2B6hIDdkTI5
	oGf8aBWyxouWhmjKdG5mzlLQJ+puqOQ==
X-Google-Smtp-Source: AGHT+IFdNBNGOV2ypaJHUchIVpmvcYgzlboJ7img6WTOvidLNitIRBMusleZCwVMTKmjCyWa/N1R+Q==
X-Received: by 2002:a17:90b:38d2:b0:2ff:7970:d2b6 with SMTP id 98e67ed59e1d1-31e77ad2a48mr2651577a91.5.1753511814768;
        Fri, 25 Jul 2025 23:36:54 -0700 (PDT)
Received: from ranganath.. ([2406:7400:98:d071:cefe:47ea:c7a0:b3ee])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e60969c5fsm3398769a91.0.2025.07.25.23.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 23:36:54 -0700 (PDT)
From: Ranganath V N <vnranganath.20@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org,
	Ranganath V N <vnranganath.20@gmail.com>
Subject: [PATCH v2] Documentation: Fix minor typos
Date: Sat, 26 Jul 2025 12:06:44 +0530
Message-ID: <20250726063645.4156-1-vnranganath.20@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrected a few spelling errors and improved the phrasing
changes since v1:
--corrected as per review

Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
---
 Documentation/arch/loongarch/irq-chip-model.rst | 4 ++--
 Documentation/arch/x86/cpuinfo.rst              | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/loongarch/irq-chip-model.rst b/Documentation/arch/loongarch/irq-chip-model.rst
index a7ecce11e445..8f5c3345109e 100644
--- a/Documentation/arch/loongarch/irq-chip-model.rst
+++ b/Documentation/arch/loongarch/irq-chip-model.rst
@@ -139,13 +139,13 @@ Feature EXTIOI_HAS_INT_ENCODE is part of standard EIOINTC. If it is 1, it
 indicates that CPU Interrupt Pin selection can be normal method rather than
 bitmap method, so interrupt can be routed to IP0 - IP15.
 
-Feature EXTIOI_HAS_CPU_ENCODE is entension of V-EIOINTC. If it is 1, it
+Feature EXTIOI_HAS_CPU_ENCODE is extension of V-EIOINTC. If it is 1, it
 indicates that CPU selection can be normal method rather than bitmap method,
 so interrupt can be routed to CPU0 - CPU255.
 
 EXTIOI_VIRT_CONFIG
 ------------------
-This register is read-write register, for compatibility intterupt routed uses
+This register is read-write register, for compatibility interrupt routed uses
 the default method which is the same with standard EIOINTC. If the bit is set
 with 1, it indicated HW to use normal method rather than bitmap method.
 
diff --git a/Documentation/arch/x86/cpuinfo.rst b/Documentation/arch/x86/cpuinfo.rst
index dd8b7806944e..9f2e47c4b1c8 100644
--- a/Documentation/arch/x86/cpuinfo.rst
+++ b/Documentation/arch/x86/cpuinfo.rst
@@ -11,7 +11,7 @@ The list of feature flags in /proc/cpuinfo is not complete and
 represents an ill-fated attempt from long time ago to put feature flags
 in an easy to find place for userspace.
 
-However, the amount of feature flags is growing by the CPU generation,
+However, the number of feature flags is growing with each CPU generation,
 leading to unparseable and unwieldy /proc/cpuinfo.
 
 What is more, those feature flags do not even need to be in that file
-- 
2.43.0

