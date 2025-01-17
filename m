Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF67B1FECDC;
	Fri, 17 Jan 2025 13:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737119483; cv=none; b=gzoKkKRFQeO8ICnDHQg7nlhu/r6fFtzZ9N3wOEVk1K3Zz0n4xbo1dRGUiIy/TMQTB1DU4RUHHceZb3Fb8aPO9ZIdJmHIgp7eO7xrYdsXgsN+yj91lq/lwW5YRuhJL6etinlkL1Ecd9fjQfcHwGlbF0vJoRcCBPxwFsrUGQsCHaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737119483; c=relaxed/simple;
	bh=ZuNMh81+sSlOWJhG4/4JlLncs7iIh9W/GlKKzu+rlcc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HW3jMDoJd8gh3+cDLuA5CTheReJTSon3NP0vmeAmi9QgvbusU5O52OiVLR0joQ8MKNFFY5TjQW4XGPnjCu628uMm4C7EIMRaRmkhg33t0yX6fvBGn8mlTysTnfC9qn6J/CaAya6cSZscQnoEAJQNS4W1oEUzzc2QDCLt5J2pF3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNJI/Q3U; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNJI/Q3U"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2164b1f05caso39204345ad.3;
        Fri, 17 Jan 2025 05:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737119481; x=1737724281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BVkzKJ0S4ugzVNuCjynUT9GGnBKA3hlfvGBO4cSDi7g=;
        b=FNJI/Q3U09NeK5KR63Ms63RR8Yk1mxK17hPxkmXHFNBEZGrXXVzWIiBNscK5aTSrMw
         evccst0kmPLU7Qr9rJikRg6tGh7PdxPw04gdAYt74vgTbnI74MqQjEOgdk9NCs8pDFZd
         P8atDKG/NxAhhsdnu+zJ1yLf4uMH/xlP7lTkDF6IRo3ggdmMu1SPq4kdnp/kI6daD2Fw
         spt+0nlVfcbnIz6vZVigzKwQuLnze5Z3U5d7wL547+XZqH0q+6Q+dcuIOTcUemmDRf5w
         cBJX3CkgUWkLcbFDXuOxvGsSvxVS1eW40uL0kYEldeaDE1koZISidKDnV32cFMaDLrL0
         bhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737119481; x=1737724281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVkzKJ0S4ugzVNuCjynUT9GGnBKA3hlfvGBO4cSDi7g=;
        b=s9eumZzByMcSepfsWMn50jmInMThQjMKsoBtADG1ECpdmcP7KJRaiV2E8/k8rc+Q8b
         PGiPtuurbog/WYv2cY+Rdd84QbH364oIm4UOOuVxZJB/DDa7kEgSbcuXdGm1AlOuTEGn
         ++zy62b1RVi49LW2KbFGF4V5sIgU+kKP7HfN9tga7pXc72NNfA5EI5KdlymlN5/yGhVX
         AmLx6nR9TkNifvTDfP6LM5bTjSN45IYTky8yyk+7LK19GHuBsD/BmPafS0o/HYE1H05z
         6hc/tiSl6wRtABETLgtYVbarMeGHlOJTlNa+wxyfVuqsUc1ohYglbmszb+QNAx9w+9wI
         UbmA==
X-Forwarded-Encrypted: i=1; AJvYcCVo9Gwr1PsMiYPkLhRPHlY/LRsHfO2OtHMf0lumkhXyhQ7vFGgd6QTuerNlOnD9j+VUBqI9PQPhW+7ElzpR@vger.kernel.org, AJvYcCXRvcGOPiMHVtL+OW9Fe5uSbFHARJA4te5/PeaTsiabWTZ9Tn7HuVlzXbrauHuryL4IZJUoewKrZ8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLYfpzJZyROLr3GqcEf+pLuJWCO0mhHum2AXW+iKTpKnSZQ91i
	CsrnPIcg3wgrDUClWv7l4AhX/p/jV+Yq0ofRXoYTkDx7h0GMwXmj
X-Gm-Gg: ASbGnct3olI/ltK+0vfFpEPlOrsCzdjjc9CnTS1DdzTx+LpCjdLyHJdMaDuT63Mr7eD
	TonXrwvAKdasax9pyUExh4P4MzR4DExFFNw4R44sXOXhwIVHqB//9OvVT1eVvaT49FkySOoyGzA
	MnKYawGgaFjqAm1he1LrElQKLN/JwlYeEknap7Zno6/iKLKf988ma7nj7yPicjani/ZyhDZTfBb
	2MJb1KQKZ15wIjFqiTMfWWfObQdOeAPyLOHMG5zydDYtAMiggfsfdcGQgfcdK78iqC8UfZYLWhK
X-Google-Smtp-Source: AGHT+IGN2HOtIcSzUPeGvuPtdbn/Wz7PPJjCsZSn1WXDE2uCfupFKvcXKAmISW0bAMZKyzAABvLayw==
X-Received: by 2002:a17:902:d583:b0:215:4d90:4caf with SMTP id d9443c01a7336-21c353e700fmr46587525ad.14.1737119481125;
        Fri, 17 Jan 2025 05:11:21 -0800 (PST)
Received: from vaxr-BM6660-BM6360.. ([2001:288:7001:2703:5341:ba8d:225b:c32b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2cea097fsm15672105ad.8.2025.01.17.05.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 05:11:20 -0800 (PST)
From: I Hsin Cheng <richard120310@gmail.com>
To: corbet@lwn.net
Cc: akpm@linux-foundation.org,
	jserv@ccns.ncku.edu.tw,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] docs/mm: Page tables: Fix typos
Date: Fri, 17 Jan 2025 21:11:13 +0800
Message-ID: <20250117131113.14167-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The member "pgd" in "struct mm_struct" is of type "struct pgd_t *"
rather than "struct pgt_t *", fix the typo.

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 Documentation/mm/page_tables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/page_tables.rst b/Documentation/mm/page_tables.rst
index be47b192a..e876c86f6 100644
--- a/Documentation/mm/page_tables.rst
+++ b/Documentation/mm/page_tables.rst
@@ -119,7 +119,7 @@ meaning beginning from the bottom:
   memory context and thus its own *pgd*, found in `struct mm_struct` which
   in turn is referenced to in each `struct task_struct`. So tasks have memory
   context in the form of a `struct mm_struct` and this in turn has a
-  `struct pgt_t *pgd` pointer to the corresponding page global directory.
+  `struct pgd_t *pgd` pointer to the corresponding page global directory.
 
 To repeat: each level in the page table hierarchy is a *array of pointers*, so
 the **pgd** contains `PTRS_PER_PGD` pointers to the next level below, **p4d**
-- 
2.43.0

