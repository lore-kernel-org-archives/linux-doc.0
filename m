Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3002EBBAF
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 09:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762853788; cv=none; b=sg1OtiP9uSCaEocnC8S9KqDACX7VHcuHhwtRo153MkXLHm3qNxQByRLpJGHYJ9Tt3BZHY5rYpGPFJp7gf1N6i/Dtpy3zYGQFm4Iqrv5xzY3b1QDVshL27BYAr7aqIG4f8no6Zyddt/8K3Nv0fSGjns4Y2vLbohocYbTBSzvFt0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762853788; c=relaxed/simple;
	bh=7d65OtPGmDAqJ9fkTXY85mud3hOL7bBkR2n6ifFMurI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ofz8xlpULJmexroiylR6OFzvcsSgf9HvS/tuT2PP4BCMpUdB/9kacpP42yAiNvvlh+ZpVJM+ZtN2jR2OdBY8z+glhcNaEfjvrAF/5dXrGSXj/8A4LOoOyREWMBocKZ51jzsFMaYcaFA4ix9ddRy+YfYTpSPQvDx4uUnRSZ46exk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLiQMFnO; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLiQMFnO"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b0246b27b2so4268049b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 01:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762853786; x=1763458586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LMjCh17nJEMUiPQdRqWznw5LPa244fsW8N9TEBQf8ws=;
        b=QLiQMFnO7awm+R+wCPg0djmd9gLSzrNL3242zVOE89YhVYyrM0YrvsRC966ady9IEM
         S9EWO/G4NjlYQc8GOfsuU7wZjY/7UGkIGohGQVV9p9RLFIf0L7aLtI+ltpYujvQCxh56
         xGA/cjJaMcFRR9aQ4GESbkIiHHpkgIm6f7BR4UOnh9J63Gn9n/vUa4j8zVOCnj51qLrn
         WpWXm0/Q+eGLn/oSuKBZ6cAxJIH6zy51GmOPsfk3/rPVUdu+UQ1a10M8mY7TOln1dbfk
         UphrRCSsXd+9E5BbDue3drgVBTJoZyArBW2Ij29MDnEvHt33TsXETXaE48Q/IdPhMhl8
         RzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853786; x=1763458586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMjCh17nJEMUiPQdRqWznw5LPa244fsW8N9TEBQf8ws=;
        b=DYxRph+WdxJvAWdeSr1KZ4LtwB0CoJwkqYw83C6jBsA6EiT7dO/TNPYouiLEUc8OOa
         MxFk/qW51H0CNUZSGx+cwhUMUc7ret+DQ8IuK/k06HrMKm9BMFga4Nm8DOL2eAXNCXRZ
         3jkUa0j4anhPxNyDUxfvydVF8nCLuV8/r+KIaPe9OgqXqvUQd7fKHfEjZf92g7wc53Gs
         FecGirwPSHg5xsE4xS9W8IYqm1vSPo4KOiI3mIdCXR3rwn8Qa9j3BvnIxU0Su2Lgp4A4
         5bLAkXBmqxQWSBb6PPGv2ogOxUtujgjsZjeBLpoMMM75f9OT094ST4/tj2hxlNxBdNC5
         aF0w==
X-Forwarded-Encrypted: i=1; AJvYcCXDGXPvihcfI6/F6KDlRceTLOyjcywqlivyRLe5ntykif7ZQQv9a6tTXH9XHiZNdk2TIwP9aaEhLEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK9q4/6eCRGaMnjCjeriYLUi1pYP0cN3b77nNk1zYezLSQ9GpJ
	LcPul5PXRa12ONdG+JySlNJ9MBbBGsVcw4q+eWeSjdLbejD8n78p1Vl9
X-Gm-Gg: ASbGncv0d4/yoiDhYFOSpdqio4PrGZkb51IrmohlNyPlvbfmACz/heh7qAB4vKRbHoO
	9iG4qeSwNcdvOHOptcZ/B6zBBi4hifPqhEEpvgX1AFT123iqb8NFHXAMFmBAW7FCUgxTT8rThNt
	P3+53DG1BYoGCB0xJ/UoG4drl8m09K4VZEK50An5ccC8xEecYme66/uY7Kks0nSloWpPFrB76Ml
	9LL/MSs0RbJSpvcjWSZpBOJ4BME/+2i7nT+H4jiKmC7nWo6lszmmwEa3kXR3YSpeR2+KqG06nU6
	d3m2aCOmzJB5oWb7YsUymQW+cN9QNifXdUATcuN76zLsZ46L7dwEuiNQx5S35MApWBI7KLWczSd
	2hI04oNpcQ9pngZTSGriHz295f0mQL+Wa9l5P6UxL0PjIdI3c52X7lSDRRsclV76wY2M6KTiXgz
	HUuuq/W1K4NiNXIMKca2UuUBPSL6QsvN2R8g==
X-Google-Smtp-Source: AGHT+IFaxvIu0B72oVpTJ+G5KmGzYNh8PKb0s3rDJQSPzD3OrI2kdp2/BP6S4OpVyM6FTbrBYpckyw==
X-Received: by 2002:a17:903:38cd:b0:295:fdf2:d01e with SMTP id d9443c01a7336-297e53e7d10mr153080585ad.2.1762853786374;
        Tue, 11 Nov 2025 01:36:26 -0800 (PST)
Received: from a015921.shanghai.arm.com ([217.140.96.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0ccb5a31esm14603927b3a.63.2025.11.11.01.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:36:25 -0800 (PST)
From: Zenon Xiu <zenonxiu@gmail.com>
X-Google-Original-From: Zenon Xiu <zenxiu01@a015921.shanghai.arm.com>
To: will@kernel.org
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	Zenon Xiu <zenonxiu@outlook.com>
Subject: [PATCH] Documentation/arm64: Fix the typo of register names 
Date: Tue, 11 Nov 2025 17:35:39 +0800
Message-ID: <20251111093539.2760535-1-zenxiu01@a015921.shanghai.arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zenon Xiu <zenonxiu@outlook.com>

The register name 'HWFGWTR_EL2' and 'HWFGRTR_EL2' is wrong, should be 'HFGWTR_EL2' and 'HFGRTR_EL2'.
Find the register description on arm website here,
https://developer.arm.com/documentation/ddi0601/2025-09/AArch64-Registers/HFGWTR-EL2--Hypervisor-Fine-Grained-Write-Trap-Register
https://developer.arm.com/documentation/ddi0601/2025-09/AArch64-Registers/HFGRTR-EL2--Hypervisor-Fine-Grained-Read-Trap-Register?lang=en

Signed-off-by: Zenon Xiu <zenonxiu@outlook.com>
---
 Documentation/arch/arm64/booting.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index e4f953839f71..26efca09aef3 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -391,13 +391,13 @@ Before jumping into the kernel, the following conditions must be met:
     - SMCR_EL2.LEN must be initialised to the same value for all CPUs the
       kernel will execute on.
 
-    - HWFGRTR_EL2.nTPIDR2_EL0 (bit 55) must be initialised to 0b01.
+    - HFGRTR_EL2.nTPIDR2_EL0 (bit 55) must be initialised to 0b01.
 
-    - HWFGWTR_EL2.nTPIDR2_EL0 (bit 55) must be initialised to 0b01.
+    - HFGWTR_EL2.nTPIDR2_EL0 (bit 55) must be initialised to 0b01.
 
-    - HWFGRTR_EL2.nSMPRI_EL1 (bit 54) must be initialised to 0b01.
+    - HFGRTR_EL2.nSMPRI_EL1 (bit 54) must be initialised to 0b01.
 
-    - HWFGWTR_EL2.nSMPRI_EL1 (bit 54) must be initialised to 0b01.
+    - HFGWTR_EL2.nSMPRI_EL1 (bit 54) must be initialised to 0b01.
 
   For CPUs with the Scalable Matrix Extension FA64 feature (FEAT_SME_FA64):
 
-- 
2.43.0

