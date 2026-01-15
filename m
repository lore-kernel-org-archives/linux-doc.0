Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B079C2BEC27
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 04:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768450315; cv=none; b=gLe8DhKBMBCQvW3XRbB5L7ucDpy8SCVsp3ta8mowEBmUvATONub03Y2E3cIo9jDR8DtQr/bDUJADH7YnIhc30HR8PVbayoVnBYxcz2a6+SrQFNplOxHaNx1pcqtyMXh1G2rwvlACqb7Vy13kt/fZo2ubCmI7Z2owal41cD/WdIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768450315; c=relaxed/simple;
	bh=eH05iNFww19kcMZ0contcs3Ur4Aq0Uioewvs0Ol8TEA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RrtmZhBQrWxagh7z4vDMCrSOhyfasahKTut4AEYrroINP5FQj0yZcoSSOcIy/dkdzySko6DZJLeVg/PfAeIO2gSi8azIfpU8jeZlqvpPjRMCcYEsnPH2JGMxrI/Y6fjSFeZ5+c0dsnyb+Pev6WXUNqfJs+QYLsFWsTYdJdNQcK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NjBBA6I8; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjBBA6I8"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-34e90f7b49cso210565a91.3
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 20:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768450314; x=1769055114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bInY6G+fRPU4N4S6clAbFXdycHArb+K858x2QHnaCgU=;
        b=NjBBA6I8zTjR+COaFg4APBqhFb9KxKXmTsf+mmmk029wc0laJtRNRxybaRYW2oeJwU
         EEDTvo/ZzKUloYLMqwLXvGpFDGMPor8ovCmtxWVppkMsEoEsQ/9N+qRnm09k6g1paFko
         XLz4u+PcEav30JWiCrBB9azJm2ktXvDL67a4BP8IyU7+aRfogXPVzZi1pGQ4sK8jk1lI
         iu//9GagC0pDm+FUr4gErOWug8JaQYZAD39sNL9jh2ANJH/7KB8ynKj8mBRyXkCCEVkJ
         eQI4aYYNPuYo2v/DIwalqjG+zEw8GPBu+m9lhQDECfmGqDhIWZOM/dd7U0EpDYdXP6nc
         yLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768450314; x=1769055114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bInY6G+fRPU4N4S6clAbFXdycHArb+K858x2QHnaCgU=;
        b=H+VY9whkq77RHbWnQqNHy9KYzfVspKtof+zTGh1tvcI7Ivnagnsqq51dqSvqslYsw+
         5gXr478AZCRgIfS7ZdrI7DyqV0o5qP13NAMn3vLtYSZBWlXz7Aw9AJrZOGy4jbCl3+Eq
         KfgTklz7WxG0SJNgZIUy20Nh74OAhrBb3Z3DA5hDpOyJawSqp8MaEtTBPIq8uQHZawH+
         gFR5ZLjT/qSNjYqJOFpRFbHJiFpTHjNQAW13LOIl859LKyLPswJeCvh/Pbphy1Cs8aC1
         ghhcOeT3+8u0dEygMpI3wLP2b9q1y6wSkgd8F6ydfUeICbxAU+1gy1Upsuxnso5EvDox
         TUjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyMezYnPRjLNaPXunnAyP2jEKowbO7nyZ4mSTgQbA0bdYOCS0DDdPMf9OxQObZlTBfBjclr2UnRYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2fwOrVpDXzQ5CtL0mtoyagZHcN31jcMTZMRnCRyj7SY9h4HJ2
	xNiWvpYDv0QCXb/pUIkqDRyeAo2mhE/bmAfiNf8X6fpSmf6pBUWD2cYx
X-Gm-Gg: AY/fxX5LGE15gA2oCt8YFPnYgxWTVn+5iYQsJnB+6vQc+w3IDxZV/04He2mrx872okc
	r0W0BTkTa0kgQWY6Uu6pilf+ukz1J23xb+YQLJFOUo0oCS30mKamDMkPhAihMk8K5FUVZnoMANL
	S7aMeBuKxEw2icID+ZlSrIxOzSvcMCcGslxERFxemb1lBsXNqPv/xq0dH8tY7mKTlGwaohwRzoe
	/vRWFBATaXtQByH836ooileLuzb47OsQO/y7hqzVf2nxpAJ+5IXGHQzFsl0H5FMfgJyowfah2D6
	rxfT5t6IWv+F58f6KUmHE/gpa1Th+rZl9yAu+Nt30e4Y6LyF0lFq+htbypo/iAIWdk9bLCFkuwY
	bbWCSM7+duo3nmo59L+rIm/HlNSYwlP+JeklrHrAinHWFLoM/j56LSgs4RUpJTy80ZbVk0xCqFQ
	lTSAx9JLc0palq8x+43FInJ2K0P1I7e+Tk4OWhsChjx7W1/JH1
X-Received: by 2002:a17:90b:3806:b0:34c:635f:f855 with SMTP id 98e67ed59e1d1-351090bde3cmr5297541a91.7.1768450313919;
        Wed, 14 Jan 2026 20:11:53 -0800 (PST)
Received: from fric.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-351099e2fbesm1626399a91.3.2026.01.14.20.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 20:11:53 -0800 (PST)
From: Jiakai Xu <jiakaipeanut@gmail.com>
X-Google-Original-From: Jiakai Xu <jiakaiPeanut@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>
Subject: [PATCH] RISC-V: KVM: Document scounteren and senvcfg in CSRs
Date: Thu, 15 Jan 2026 04:11:46 +0000
Message-Id: <20260115041146.807967-1-jiakaiPeanut@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiakai Xu <xujiakai2025@iscas.ac.cn>

Extend the documentation of guest supervisor-mode CSRs to include
scounteren and senvcfg.

These registers are part of the RISC-V supervisor CSR set but were
previously missing from the documented encoding table. Also adjust
the table formatting to keep column alignment consistent.

Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
---
 Documentation/virt/kvm/api.rst | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 01a3abef8abb..6dab20637c7b 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -2837,19 +2837,21 @@ of a Guest VCPU and it has the following id bit patterns::
 
 Following are the RISC-V csr registers:
 
-======================= ========= =============================================
-    Encoding            Register  Description
-======================= ========= =============================================
-  0x80x0 0000 0300 0000 sstatus   Supervisor status
-  0x80x0 0000 0300 0001 sie       Supervisor interrupt enable
-  0x80x0 0000 0300 0002 stvec     Supervisor trap vector base
-  0x80x0 0000 0300 0003 sscratch  Supervisor scratch register
-  0x80x0 0000 0300 0004 sepc      Supervisor exception program counter
-  0x80x0 0000 0300 0005 scause    Supervisor trap cause
-  0x80x0 0000 0300 0006 stval     Supervisor bad address or instruction
-  0x80x0 0000 0300 0007 sip       Supervisor interrupt pending
-  0x80x0 0000 0300 0008 satp      Supervisor address translation and protection
-======================= ========= =============================================
+======================= ========== =============================================
+    Encoding            Register   Description
+======================= ========== =============================================
+  0x80x0 0000 0300 0000 sstatus    Supervisor status
+  0x80x0 0000 0300 0001 sie        Supervisor interrupt enable
+  0x80x0 0000 0300 0002 stvec      Supervisor trap vector base
+  0x80x0 0000 0300 0003 sscratch   Supervisor scratch register
+  0x80x0 0000 0300 0004 sepc       Supervisor exception program counter
+  0x80x0 0000 0300 0005 scause     Supervisor trap cause
+  0x80x0 0000 0300 0006 stval      Supervisor bad address or instruction
+  0x80x0 0000 0300 0007 sip        Supervisor interrupt pending
+  0x80x0 0000 0300 0008 satp       Supervisor address translation and protection
+  0x80x0 0000 0300 0009 scounteren Supervisor counter-enable
+  0x80x0 0000 0300 000a senvcfg    Supervisor environment configuration
+======================= ========== =============================================
 
 RISC-V timer registers represent the timer state of a Guest VCPU and it has
 the following id bit patterns::
-- 
2.34.1

