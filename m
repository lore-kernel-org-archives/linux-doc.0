Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B82F2C21C4
	for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 20:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755032255; cv=none; b=mu4Zyb0XaF30r/yRxBIsUT+ZySr4q3NUzMmmbREwn1Jkr6or4GEOZxpS1e4x78NmnPmPoDXdKeA6ai2zmh4o5HRc+X6FkRn5K4WA0DVvKQ2FreOpoJWJdsXcIlkiqrj5H0wfib1ZfNGh3xwQiqNMBFOC6Zei9xaW014jDUfjtQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755032255; c=relaxed/simple;
	bh=JnOZqfn79GC53E9zM39GFlcenYz3qv5SpG5ZpKA/NzU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OvK7wapfJUTZIbGGRe/NDwmsDgjlz1qpZCEO89p8aXKezs+Dzc7nxeecttKbS6JThCk4nVdt0Mi2hIJPtSo0/NLOlsYc/nr2J6iQE42wTBlLdOL5XsUzqzS0MQ0c0uElw6SgIJbtxJYyXSM8Woxju//26DyCKBW9d48+kh+4vDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRJe/Fco; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRJe/Fco"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-242ff06b130so11407215ad.0
        for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 13:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755032253; x=1755637053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmZthDskyxW8xzonHUEwtNNf/Dt5g4RPoLwfFwhwy9Q=;
        b=JRJe/FcoVFtQ43hrJO3n1LZ1nVmURE77AI3HX3VCDgo4SUuvMIZ8TajY2G2w1dO49N
         dMYGwWmXyusRxIojcMKQ5Y0jj+9230GzInk3S8eOUNubVCQlaGnAixqbCXgbdBY/L1U9
         UStqgeKvDyeOxsm7MZ3GHIRtXLQxsTCt/lvmVczauUxziq0Z0q5/8nadVQeuvRdfA5Qm
         GVzdwGulhIuUTxjMUgi3ba8OAW6DjXvgVq6gw8nAJuRpLrOZq++TnaewGUqK/mrZ+CK2
         LU2wPCFKt0ytpe3kB2EIJR6iByZxl5IrCPAFyrWNoT+hXFqsqOFrzsWkftMkl0pJ4dnf
         CLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755032253; x=1755637053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmZthDskyxW8xzonHUEwtNNf/Dt5g4RPoLwfFwhwy9Q=;
        b=ip+67EfFuaspp2UWkPO7wSBtHcVdrEOiP6VzRCOU01mERgw8doBvVjZIJqq+6/gQiZ
         ryBqzAhna4LZJygOuHco5E5M7EUPxng5rNWjLTI2Tjp05wQqCJL4hpNYgnCKPCufFl0x
         6+y+gG1juOne3rLZgyxsGWhpPCuMoAaXU45loBSKJbGpqVxkN62EZstyAXsyLs9KF7MH
         wih01KxVQDyxKyLynLbkwxDbL9phjUKDFSZycBZw6fOc8lmQT+plRxd03WvD7tHWXx99
         +oMmyzLGI6Dmqx2n+wKUAI1WqOoYTq7ySfEK93kPceitAkUoRUnZl9ajr1QgDoJ5P320
         wFhQ==
X-Gm-Message-State: AOJu0Yw77twUe61lMmgL+4VTBwZm4sSNkd+CjX9+wjVEFAxSnxwK8WGY
	3y4/q3UA+ezmmu+Vehm/s2hLotSRAMNukKxDo7VYhOerOYsU9Kk2KgJayO1LEgg2/h8=
X-Gm-Gg: ASbGncuUPopG03ik7GQXtfO9uxn+8hW6omPK5s5WrXFQsUjh5vi51mnOFIbTwy5OjEz
	yCmXOQO7focP0hl/2dnRdMSlpDXf6mcoQ5eD5rFydFD39cLOuHpY/cxTvePpWSSfe39fYdtxQi5
	x4834gmFRO6Qg3MU8PPk2rxD1bskBbnI3tuRhg4T0AsFiAQlJWrsPNmCpYSn9va1Cn/zkoYRrLE
	kyXoqhk1jh8GedWdbivrb7Qy8uzrQzYAUgtnycVCgymjeb7boEBu3cGjAS+SvFSKZ6BxXqPITOU
	O6iBuBUlPyAX309EPN9oTBh7RrQOsXg85m1GLpQk8b+sG8jf40BSP1Q9NxLKCI6TcLKxqMMGgf/
	Gd5hLt8KCW9kEnX7IZh7R1KAnRQY7u1c=
X-Google-Smtp-Source: AGHT+IGM8HIEu1Us+IhduzFnSKT/JHu5SzuX1gQ8aLIHirIgj5NNt0Xh4sirRZhZrb11MwpstkGpoA==
X-Received: by 2002:a17:902:fc50:b0:242:ff89:d724 with SMTP id d9443c01a7336-2430d2271a2mr9643995ad.47.1755032252911;
        Tue, 12 Aug 2025 13:57:32 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321d1db5cccsm76048a91.18.2025.08.12.13.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:57:32 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Soham Metha <sohammetha01@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 7/9] docs: loongarch: fixed spelling mistake in documentation
Date: Wed, 13 Aug 2025 02:19:50 +0530
Message-Id: <20250812204952.73136-5-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812204952.73136-1-sohammetha01@gmail.com>
References: <20250812201523.69221-1-sohammetha01@gmail.com>
 <20250812204952.73136-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed the following typo

- entension -> extension

in `Documentation/arch/loongarch/irq-chip-model.rst`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 Documentation/arch/loongarch/irq-chip-model.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/loongarch/irq-chip-model.rst b/Documentation/arch/loongarch/irq-chip-model.rst
index a7ecce11e445..94ed2858a570 100644
--- a/Documentation/arch/loongarch/irq-chip-model.rst
+++ b/Documentation/arch/loongarch/irq-chip-model.rst
@@ -139,7 +139,7 @@ Feature EXTIOI_HAS_INT_ENCODE is part of standard EIOINTC. If it is 1, it
 indicates that CPU Interrupt Pin selection can be normal method rather than
 bitmap method, so interrupt can be routed to IP0 - IP15.
 
-Feature EXTIOI_HAS_CPU_ENCODE is entension of V-EIOINTC. If it is 1, it
+Feature EXTIOI_HAS_CPU_ENCODE is extension of V-EIOINTC. If it is 1, it
 indicates that CPU selection can be normal method rather than bitmap method,
 so interrupt can be routed to CPU0 - CPU255.
 
-- 
2.34.1

